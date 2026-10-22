package com.faultexception.reader.goals;

import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.util.Log;

import com.faultexception.reader.book.EPubPageMap;
import com.faultexception.reader.db.DatabaseProvider;

import org.json.JSONObject;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;

/**
 * Books finished (read to at least {@link #THRESHOLD_PERCENT}), detected by
 * comparing each book's progress against the last time it was seen.
 */
public final class FinishedBooks {
    private static final String TAG = "ReadingGoals";
    public static final int THRESHOLD_PERCENT = 95;

    private static final String KEY_SCAN_TS = "finished_scan_ts";

    public static final class Book {
        public final long id;
        public final long finishedDate;
        public final String title;
        public final String creator;

        Book(long id, long finishedDate, String title, String creator) {
            this.id = id;
            this.finishedDate = finishedDate;
            this.title = title;
            this.creator = creator;
        }
    }

    private FinishedBooks() {
    }

    /**
     * Checks books opened since the last scan (current_position_timestamp
     * isn't always updated when the position changes). The first scan
     * only records a baseline, so books already past the threshold before
     * reading goals existed aren't counted.
     */
    public static synchronized void scan(Context context) {
        SharedPreferences prefs = ReadingGoals.prefs(context);
        long since = prefs.getLong(KEY_SCAN_TS, -1);
        SQLiteDatabase lib = DatabaseProvider.getDatabase(context);
        SQLiteDatabase db = ReadingGoalsDb.get(context);

        long last = since;
        try (Cursor c = lib.rawQuery("SELECT _id, title, creator, current_position, last_open_date FROM books WHERE last_open_date > ?", new String[]{Long.toString(since)})) {
            while (c.moveToNext()) {
                long id = c.getLong(0);
                last = Math.max(last, c.getLong(4));

                int percent = percent(lib, id, c.getString(3));
                if (percent < 0) {
                    continue;
                }
                int previous = 0;
                try (Cursor p = db.rawQuery("SELECT percent FROM progress WHERE book_id = ?", new String[]{Long.toString(id)})) {
                    if (p.moveToFirst()) {
                        previous = p.getInt(0);
                    } else if (since == -1) {
                        previous = percent; // baseline
                    }
                }
                if (previous < THRESHOLD_PERCENT && percent >= THRESHOLD_PERCENT) {
                    Log.d(TAG, "finished book " + id + " (" + previous + "% -> " + percent + "%)");
                    db.execSQL("INSERT OR REPLACE INTO finished (book_id, finished_date, title, creator) VALUES (?, ?, ?, ?)", new Object[]{id, System.currentTimeMillis(), c.getString(1), c.getString(2)});
                }
                db.execSQL("INSERT OR REPLACE INTO progress (book_id, percent) VALUES (?, ?)", new Object[]{id, percent});
            }
        }
        prefs.edit().putLong(KEY_SCAN_TS, Math.max(last, 0)).apply();
    }

    /** Returns the books finished in a year, most recent first. */
    public static List<Book> list(Context context, int year) {
        ZoneId zone = ZoneId.systemDefault();
        long start = LocalDate.of(year, 1, 1).atStartOfDay(zone).toInstant().toEpochMilli();
        long end = LocalDate.of(year + 1, 1, 1).atStartOfDay(zone).toInstant().toEpochMilli();

        List<Book> books = new ArrayList<>();
        try (Cursor c = ReadingGoalsDb.get(context).rawQuery("SELECT book_id, finished_date, title, creator FROM finished WHERE finished_date >= ? AND finished_date < ? ORDER BY finished_date DESC", new String[]{Long.toString(start), Long.toString(end)})) {
            while (c.moveToNext()) {
                books.add(new Book(c.getLong(0), c.getLong(1), c.getString(2), c.getString(3)));
            }
        }
        return books;
    }

    /**
     * Computes the progress through a book the same way as the library
     * progress badge, from the current_position JSON and the page map.
     * Returns -1 if unknown.
     */
    static int percent(SQLiteDatabase lib, long bookId, String position) {
        if (position == null || position.isEmpty()) {
            return -1;
        }
        try {
            JSONObject obj = new JSONObject(position);
            if (!obj.has("url") || !obj.has("position")) {
                return -1;
            }
            EPubPageMap map = EPubPageMap.readFromCache(bookId, lib);
            if (map == null || map.items == null || map.totalPageCount <= 0) {
                return -1;
            }
            EPubPageMap.Item item = map.items.get(obj.getString("url"));
            if (item == null || item.pageCount <= 0) {
                return -1;
            }
            int page = item.pageStart + Math.round((item.pageCount - 1) * (float) obj.getDouble("position")) + 1;
            return Math.round(page * 100f / map.totalPageCount);
        } catch (Exception ex) {
            Log.w(TAG, "failed to compute progress for book " + bookId, ex);
            return -1;
        }
    }
}
