package com.faultexception.reader.goals;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.time.LocalDate;
import java.util.Set;
import java.util.TreeSet;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Reading goal settings and history. */
public final class ReadingGoals {
    private static final String TAG = "ReadingGoals";

    public static final int DEFAULT_DAILY_MINUTES = 15;
    public static final int DEFAULT_YEARLY_BOOKS = 3;

    private static final String PREFS = "reading_goals";
    private static final String KEY_DAILY_MINUTES = "daily_minutes";
    private static final String KEY_YEARLY_BOOKS = "yearly_books";
    private static final String KEY_NOTIFIED_DAY = "notified_day";

    private static final ExecutorService executor = Executors.newSingleThreadExecutor();

    private ReadingGoals() {
    }

    /**
     * Called when the library is shown. Checks for finished books in the
     * background, then updates the dashboard.
     */
    public static void onLibraryResume(Activity activity) {
        Context context = activity.getApplicationContext();
        Dashboard.refreshAll();
        executor.execute(() -> {
            try {
                FinishedBooks.scan(context);
            } catch (Exception ex) {
                Log.e(TAG, "failed to scan for finished books", ex);
            }
            new Handler(Looper.getMainLooper()).post(Dashboard::refreshAll);
        });
    }

    static SharedPreferences prefs(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    public static int getDailyGoalMinutes(Context context) {
        return prefs(context).getInt(KEY_DAILY_MINUTES, DEFAULT_DAILY_MINUTES);
    }

    public static long getDailyGoalMs(Context context) {
        return getDailyGoalMinutes(context) * 60_000L;
    }

    /**
     * Sets the daily goal and re-evaluates today against it. If that alone
     * meets today's goal, the goal-reached toast is suppressed for today since
     * nothing was actually read to reach it. If it un-meets today's goal, the
     * toast will be shown again once the new goal is reached.
     */
    public static void setDailyGoalMinutes(Context context, int minutes) {
        LocalDate today = LocalDate.now();
        boolean wasMet = isGoalMet(context, today);
        prefs(context).edit().putInt(KEY_DAILY_MINUTES, minutes).apply();
        if (updateGoalMet(context, today)) {
            markNotified(context, today);
        } else if (wasMet && !isGoalMet(context, today)) {
            prefs(context).edit().remove(KEY_NOTIFIED_DAY).apply();
        }
    }

    public static int getYearlyGoalBooks(Context context) {
        return prefs(context).getInt(KEY_YEARLY_BOOKS, DEFAULT_YEARLY_BOOKS);
    }

    public static void setYearlyGoalBooks(Context context, int books) {
        prefs(context).edit().putInt(KEY_YEARLY_BOOKS, books).apply();
    }

    public static long getReadMs(Context context, LocalDate day) {
        try (Cursor c = ReadingGoalsDb.get(context).rawQuery("SELECT read_ms FROM days WHERE day = ?", new String[]{day.toString()})) {
            return c.moveToFirst() ? c.getLong(0) : 0;
        }
    }

    public static boolean isGoalMet(Context context, LocalDate day) {
        try (Cursor c = ReadingGoalsDb.get(context).rawQuery("SELECT goal_met FROM days WHERE day = ?", new String[]{day.toString()})) {
            return c.moveToFirst() && c.getInt(0) != 0;
        }
    }

    /**
     * Adds reading time to a day. Returns true if this caused the day's goal
     * to be met.
     */
    static boolean addReadMs(Context context, LocalDate day, long ms) {
        if (ms <= 0) {
            return false;
        }
        SQLiteDatabase db = ReadingGoalsDb.get(context);
        db.execSQL("INSERT OR IGNORE INTO days (day) VALUES (?)", new Object[]{day.toString()});
        db.execSQL("UPDATE days SET read_ms = read_ms + ? WHERE day = ?", new Object[]{ms, day.toString()});
        return updateGoalMet(context, day);
    }

    /**
     * Re-evaluates whether a day's goal is met against the current goal.
     * Returns true if it changed from not met to met.
     */
    private static boolean updateGoalMet(Context context, LocalDate day) {
        boolean wasMet = isGoalMet(context, day);
        boolean met = getReadMs(context, day) >= getDailyGoalMs(context);
        if (met != wasMet) {
            ReadingGoalsDb.get(context).execSQL("UPDATE days SET goal_met = ? WHERE day = ?", new Object[]{met ? 1 : 0, day.toString()});
        }
        return met && !wasMet;
    }

    /** Returns the days the goal was met, in ascending order. */
    static TreeSet<LocalDate> getMetDays(Context context) {
        TreeSet<LocalDate> days = new TreeSet<>();
        try (Cursor c = ReadingGoalsDb.get(context).rawQuery("SELECT day FROM days WHERE goal_met != 0", null)) {
            while (c.moveToNext()) {
                days.add(LocalDate.parse(c.getString(0)));
            }
        }
        return days;
    }

    /**
     * Returns the number of consecutive days up to today that the goal was
     * met. Today doesn't break the streak until it's over.
     */
    static int getCurrentStreak(Set<LocalDate> metDays, LocalDate today) {
        LocalDate day = metDays.contains(today) ? today : today.minusDays(1);
        int streak = 0;
        while (metDays.contains(day)) {
            streak++;
            day = day.minusDays(1);
        }
        return streak;
    }

    /** Returns the longest run of consecutive days the goal was met. */
    static int getRecordStreak(TreeSet<LocalDate> metDays) {
        int record = 0, run = 0;
        LocalDate last = null;
        for (LocalDate day : metDays) {
            run = last != null && last.plusDays(1).equals(day) ? run + 1 : 1;
            record = Math.max(record, run);
            last = day;
        }
        return record;
    }

    /** Returns false if the goal-reached toast was already shown for the day. */
    static boolean markNotified(Context context, LocalDate day) {
        SharedPreferences prefs = prefs(context);
        if (day.toString().equals(prefs.getString(KEY_NOTIFIED_DAY, null))) {
            return false;
        }
        prefs.edit().putString(KEY_NOTIFIED_DAY, day.toString()).apply();
        return true;
    }
}
