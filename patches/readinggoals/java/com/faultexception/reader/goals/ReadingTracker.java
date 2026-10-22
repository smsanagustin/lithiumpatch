package com.faultexception.reader.goals;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;

import java.lang.ref.WeakReference;
import java.time.LocalDate;
import java.time.ZonedDateTime;

/**
 * Counts time spent with the reader in the foreground. Called from
 * ReaderActivity.onResume/onPause, so it pauses whenever the reader is left
 * (including when the screen turns off).
 */
public final class ReadingTracker {
    private static final String TAG = "ReadingGoals";

    /** Maximum time between flushes to the database. */
    private static final long FLUSH_INTERVAL_MS = 30_000;

    private static final Handler handler = new Handler(Looper.getMainLooper());
    private static final Runnable tick = ReadingTracker::tick;

    private static WeakReference<Activity> reader;
    private static long sessionStart; // elapsedRealtime, 0 if paused
    private static LocalDate sessionDay;

    private ReadingTracker() {
    }

    public static void onReaderResume(Activity activity) {
        if (sessionStart != 0) {
            flush();
        }
        reader = new WeakReference<>(activity);
        sessionStart = SystemClock.elapsedRealtime();
        sessionDay = LocalDate.now();
        Log.d(TAG, "resumed (today: " + ReadingGoals.getReadMs(activity, sessionDay) + " ms)");
        schedule();
    }

    public static void onReaderPause(Activity activity) {
        if (sessionStart == 0 || reader == null || reader.get() != activity) {
            return; // not tracking, or another reader has resumed since
        }
        handler.removeCallbacks(tick);
        flush();
        sessionStart = 0;
        reader = null;
        Log.d(TAG, "paused (today: " + ReadingGoals.getReadMs(activity, LocalDate.now()) + " ms)");
    }

    private static void tick() {
        flush();
        schedule();
    }

    /** Schedules the next tick at the next flush, goal, or midnight. */
    private static void schedule() {
        Activity activity = reader != null ? reader.get() : null;
        if (activity == null) {
            return;
        }
        LocalDate today = LocalDate.now();
        long delay = Math.min(FLUSH_INTERVAL_MS, msUntilMidnight() + 1);
        if (!ReadingGoals.isGoalMet(activity, today)) {
            long unflushed = SystemClock.elapsedRealtime() - sessionStart;
            long remaining = ReadingGoals.getDailyGoalMs(activity) - ReadingGoals.getReadMs(activity, today) - unflushed;
            delay = Math.min(delay, Math.max(remaining, 0) + 100);
        }
        handler.removeCallbacks(tick);
        handler.postDelayed(tick, delay);
    }

    /** Saves time read since the last flush. */
    private static void flush() {
        Activity activity = reader != null ? reader.get() : null;
        if (activity == null || sessionStart == 0) {
            return;
        }
        long now = SystemClock.elapsedRealtime();
        long elapsed = now - sessionStart;
        sessionStart = now;

        // if we crossed midnight, the time after it belongs to the new day
        LocalDate today = LocalDate.now();
        if (!today.equals(sessionDay)) {
            long sinceMidnight = Math.min(elapsed, msSinceMidnight());
            ReadingGoals.addReadMs(activity, sessionDay, elapsed - sinceMidnight);
            elapsed = sinceMidnight;
            sessionDay = today;
        }
        if (ReadingGoals.addReadMs(activity, today, elapsed) && ReadingGoals.markNotified(activity, today)) {
            Log.d(TAG, "daily goal reached");
        }
    }

    private static long msSinceMidnight() {
        ZonedDateTime now = ZonedDateTime.now();
        return now.toInstant().toEpochMilli() - now.toLocalDate().atStartOfDay(now.getZone()).toInstant().toEpochMilli();
    }

    private static long msUntilMidnight() {
        ZonedDateTime now = ZonedDateTime.now();
        return now.toLocalDate().plusDays(1).atStartOfDay(now.getZone()).toInstant().toEpochMilli() - now.toInstant().toEpochMilli();
    }
}
