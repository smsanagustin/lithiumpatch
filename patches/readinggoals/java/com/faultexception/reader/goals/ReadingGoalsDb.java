package com.faultexception.reader.goals;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

/**
 * Reading goal history, kept separate from the main Lithium database so it
 * isn't touched by Lithium's migrations or sync.
 */
final class ReadingGoalsDb extends SQLiteOpenHelper {
    private static final String NAME = "reading_goals.db";
    private static final int VERSION = 2;

    private static ReadingGoalsDb instance;

    static synchronized SQLiteDatabase get(Context context) {
        if (instance == null) {
            instance = new ReadingGoalsDb(context.getApplicationContext());
        }
        return instance.getWritableDatabase();
    }

    private ReadingGoalsDb(Context context) {
        super(context, NAME, null, VERSION);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        // day is an ISO-8601 local date (yyyy-MM-dd); goal_met is frozen once
        // the day is over so changing the goal later doesn't rewrite streaks
        db.execSQL("CREATE TABLE days (day TEXT PRIMARY KEY, read_ms INTEGER NOT NULL DEFAULT 0, goal_met INTEGER NOT NULL DEFAULT 0)");
        // title/creator are kept in case the book is later removed from the library
        db.execSQL("CREATE TABLE finished (book_id INTEGER PRIMARY KEY, finished_date INTEGER NOT NULL, title TEXT, creator TEXT)");
        onUpgrade(db, 1, VERSION);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        if (oldVersion < 2) {
            // last seen progress of each book, to detect when it crosses the finished threshold
            db.execSQL("CREATE TABLE progress (book_id INTEGER PRIMARY KEY, percent INTEGER NOT NULL)");
        }
    }
}
