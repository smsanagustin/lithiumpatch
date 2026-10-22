package com.faultexception.reader.goals;

import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;

import java.time.LocalDate;

/** Reading goal settings and history. */
public final class ReadingGoals {
    public static final int DEFAULT_DAILY_MINUTES = 15;
    public static final int DEFAULT_YEARLY_BOOKS = 3;

    private static final String PREFS = "reading_goals";
    private static final String KEY_DAILY_MINUTES = "daily_minutes";
    private static final String KEY_YEARLY_BOOKS = "yearly_books";
    private static final String KEY_NOTIFIED_DAY = "notified_day";

    private ReadingGoals() {
    }

    private static SharedPreferences prefs(Context context) {
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
