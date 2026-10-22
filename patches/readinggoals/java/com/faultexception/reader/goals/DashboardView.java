package com.faultexception.reader.goals;

import android.app.Activity;
import android.content.Context;
import android.content.res.ColorStateList;
import android.database.Cursor;
import android.graphics.Typeface;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.style.StyleSpan;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.faultexception.reader.BooksFragment;
import com.faultexception.reader.R;
import com.faultexception.reader.db.DatabaseProvider;

import java.time.LocalDate;
import java.util.List;
import java.util.TreeSet;

/** The reading goals shown above the library. */
final class DashboardView extends LinearLayout {
    private static final int SLOTS = 3;

    private final BooksFragment fragment;

    private final ProgressRing ring;
    private final TextView time, timeGoal;

    private final View continueRow;
    private final CoverView continueCover;
    private final TextView continueTitle;
    private long continueBookId = -1;

    private final WeekStreakView week;
    private final TextView streakText, recordText;

    private final TextView yearCount;
    private final CoverView[] slots = new CoverView[SLOTS];
    private final TextView yearText, yearSubtext;

    DashboardView(Context context, BooksFragment fragment) {
        super(context);
        this.fragment = fragment;
        setOrientation(VERTICAL);

        // today's reading
        LinearLayout today = section(context, 20, 8);
        today.addView(Ui.title(context, "Today's reading"));
        TextView intro = Ui.text(context, 14, Ui.textSecondary(context), null);
        intro.setText("Read every day, see your stats soar, and finish more books.");
        today.addView(intro, margins(4, 0));

        FrameLayout ringFrame = new FrameLayout(context);
        LayoutParams ringLp = new LayoutParams(Ui.dp(context, 200), Ui.dp(context, 200));
        ringLp.gravity = Gravity.CENTER_HORIZONTAL;
        ringLp.topMargin = Ui.dp(context, 24);
        today.addView(ringFrame, ringLp);
        ring = new ProgressRing(context, 10);
        ringFrame.addView(ring, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        LinearLayout ringText = new LinearLayout(context);
        ringText.setOrientation(VERTICAL);
        ringText.setGravity(Gravity.CENTER_HORIZONTAL);
        time = Ui.text(context, 52, Ui.textPrimary(context), Ui.LIGHT);
        time.setGravity(Gravity.CENTER_HORIZONTAL);
        timeGoal = Ui.text(context, 15, Ui.textSecondary(context), null);
        timeGoal.setGravity(Gravity.CENTER_HORIZONTAL);
        ringText.addView(time);
        ringText.addView(timeGoal);
        ringFrame.addView(ringText, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER));

        TextView changeDaily = Ui.textButton(context, "Change daily goal", R.drawable.goals_ic_edit);
        changeDaily.setOnClickListener(v -> editDailyGoal());
        today.addView(changeDaily, centered(16));
        addView(today);

        // continue reading
        LinearLayout row = new LinearLayout(context);
        continueRow = row;
        row.setOrientation(HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(Ui.dp(context, 16), Ui.dp(context, 12), Ui.dp(context, 16), Ui.dp(context, 12));
        row.setBackground(Ui.ripple(context, null, new android.graphics.drawable.ColorDrawable(0xFFFFFFFF)));
        row.setOnClickListener(v -> openBook(v, continueBookId));
        continueCover = new CoverView(context, 4, false);
        row.addView(continueCover, new LayoutParams(Ui.dp(context, 44), Ui.dp(context, 64)));
        LinearLayout continueText = new LinearLayout(context);
        continueText.setOrientation(VERTICAL);
        TextView continueLabel = Ui.text(context, 13, Ui.textSecondary(context), Ui.MEDIUM);
        continueLabel.setText("Continue reading");
        continueText.addView(continueLabel);
        continueTitle = Ui.text(context, 18, Ui.textPrimary(context), null);
        continueTitle.setSingleLine(true);
        continueTitle.setEllipsize(TextUtils.TruncateAt.END);
        continueText.addView(continueTitle);
        LayoutParams continueTextLp = new LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1);
        continueTextLp.setMarginStart(Ui.dp(context, 16));
        continueTextLp.setMarginEnd(Ui.dp(context, 16));
        row.addView(continueText, continueTextLp);
        ImageView open = new ImageView(context);
        open.setImageResource(R.drawable.goals_ic_book);
        open.setImageTintList(ColorStateList.valueOf(Ui.onPrimary(context)));
        open.setScaleType(ImageView.ScaleType.CENTER);
        open.setBackground(Ui.ripple(context, Ui.circle(Ui.primary(context), 0, 0), null));
        open.setContentDescription("Open book");
        open.setOnClickListener(v -> openBook(v, continueBookId));
        row.addView(open, new LayoutParams(Ui.dp(context, 56), Ui.dp(context, 56)));
        addView(row);

        // reading streak
        addView(divider(context));
        LinearLayout streak = section(context, 20, 20);
        streak.addView(Ui.title(context, "Reading streak"));
        week = new WeekStreakView(context);
        streak.addView(week, margins(16, 0));
        streakText = Ui.text(context, 18, Ui.textPrimary(context), null);
        streak.addView(streakText, margins(16, 0));
        recordText = Ui.text(context, 14, Ui.textSecondary(context), null);
        streak.addView(recordText, margins(4, 0));
        addView(streak);

        // books read this year
        addView(divider(context));
        LinearLayout year = section(context, 20, 12);
        LinearLayout yearHeader = new LinearLayout(context);
        yearHeader.setOrientation(HORIZONTAL);
        yearHeader.setGravity(Gravity.CENTER_VERTICAL);
        yearHeader.addView(Ui.title(context, "Books read this year"), new LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        yearCount = Ui.text(context, 15, Ui.textSecondary(context), Ui.MEDIUM);
        yearHeader.addView(yearCount);
        year.addView(yearHeader);
        LinearLayout slotRow = new LinearLayout(context);
        slotRow.setOrientation(HORIZONTAL);
        slotRow.setClipChildren(false);
        year.setClipChildren(false);
        for (int i = 0; i < SLOTS; i++) {
            slots[i] = new CoverView(context, 12, true);
            LayoutParams lp = new LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1);
            if (i != 0) {
                lp.setMarginStart(Ui.dp(context, 16));
            }
            slotRow.addView(slots[i], lp);
        }
        year.addView(slotRow, margins(16, 0));
        yearText = Ui.text(context, 18, Ui.textPrimary(context), null);
        yearText.setGravity(Gravity.CENTER_HORIZONTAL);
        year.addView(yearText, margins(24, 0));
        yearSubtext = Ui.text(context, 14, Ui.textSecondary(context), null);
        yearSubtext.setGravity(Gravity.CENTER_HORIZONTAL);
        year.addView(yearSubtext, margins(4, 0));
        TextView changeYearly = Ui.textButton(context, "Change yearly goal", R.drawable.goals_ic_edit);
        changeYearly.setOnClickListener(v -> editYearlyGoal());
        year.addView(changeYearly, centered(12));
        addView(year);

        // the library follows
        addView(divider(context));
        LinearLayout all = section(context, 20, 4);
        all.addView(Ui.title(context, "All books"));
        addView(all);
    }

    void bind() {
        Context context = getContext();
        Activity activity = fragment.getActivity();
        LocalDate today = LocalDate.now();

        long readMs = ReadingGoals.getReadMs(context, today);
        int goalMinutes = ReadingGoals.getDailyGoalMinutes(context);
        float progress = readMs / (goalMinutes * 60_000f);
        ring.setProgress(progress);
        time.setText(formatDuration(readMs));
        timeGoal.setText("of " + goalMinutes + " min");
        ring.setContentDescription("Read " + (readMs / 60_000) + " of " + goalMinutes + " minutes today");

        continueBookId = -1;
        try (Cursor c = DatabaseProvider.getDatabase(context).rawQuery("SELECT _id, title, cover FROM books WHERE last_open_date > 0 AND hidden = 0 ORDER BY last_open_date DESC LIMIT 1", null)) {
            if (c.moveToFirst()) {
                continueBookId = c.getLong(0);
                continueTitle.setText(c.getString(1));
                continueCover.showBook(activity, c.getString(2), c.getString(1), false);
            }
        }
        continueRow.setVisibility(continueBookId != -1 ? VISIBLE : GONE);

        TreeSet<LocalDate> metDays = ReadingGoals.getMetDays(context);
        int streak = ReadingGoals.getCurrentStreak(metDays, today);
        int record = ReadingGoals.getRecordStreak(metDays);
        week.bind(today, metDays, progress);
        if (streak == 0) {
            streakText.setText("Start a new reading streak");
        } else if (metDays.contains(today)) {
            streakText.setText(bold("You're on a ", streak + "-day", " reading streak"));
        } else {
            streakText.setText(bold("Extend your ", streak + "-day", " reading streak"));
        }
        recordText.setText("Record: " + Ui.plural(record, "day", "days"));
        recordText.setVisibility(record != 0 ? VISIBLE : GONE);

        int goal = ReadingGoals.getYearlyGoalBooks(context);
        List<FinishedBooks.Book> finished = FinishedBooks.list(context, today.getYear());
        int count = finished.size();
        yearCount.setText(count + " of " + goal);
        int shown = Math.min(SLOTS, Math.max(goal, count));
        for (int i = 0; i < SLOTS; i++) {
            CoverView slot = slots[i];
            slot.setVisibility(i < shown ? VISIBLE : INVISIBLE);
            if (i < count) {
                FinishedBooks.Book book = finished.get(i);
                slot.showBook(activity, coverPath(context, book.id), book.title, true);
                slot.setOnClickListener(v -> openBook(v, book.id));
            } else {
                slot.showPlaceholder(activity, i + 1);
                slot.setOnClickListener(v -> editYearlyGoal());
            }
        }
        if (count < goal) {
            int remaining = goal - count;
            yearText.setText(bold("", Ui.plural(remaining, "more book", "more books"), " to reach your goal"));
            yearSubtext.setText("Keep reading!");
        } else {
            yearText.setText(bold("", "You reached your goal!", ""));
            yearSubtext.setText("You've finished " + Ui.plural(count, "book", "books") + " this year.");
        }
    }

    private void editDailyGoal() {
        GoalSheet.show(getContext(), "Daily reading goal", "Choose how many minutes you want to read each day.", "minute a day", "minutes a day", ReadingGoals.getDailyGoalMinutes(getContext()), 1, 720, minutes -> {
            ReadingGoals.setDailyGoalMinutes(getContext(), minutes);
            bind();
        });
    }

    private void editYearlyGoal() {
        GoalSheet.show(getContext(), "Yearly reading goal", "Choose how many books you want to finish this year.", "book a year", "books a year", ReadingGoals.getYearlyGoalBooks(getContext()), 1, 365, books -> {
            ReadingGoals.setYearlyGoalBooks(getContext(), books);
            bind();
        });
    }

    private void openBook(View view, long id) {
        if (id == -1 || !fragment.isAdded()) {
            return;
        }
        if (!bookExists(getContext(), id)) {
            return; // removed from the library
        }
        fragment.onItemClick(view, id);
    }

    private static String coverPath(Context context, long id) {
        try (Cursor c = DatabaseProvider.getDatabase(context).rawQuery("SELECT cover FROM books WHERE _id = ?", new String[]{Long.toString(id)})) {
            return c.moveToFirst() ? c.getString(0) : null;
        }
    }

    private static boolean bookExists(Context context, long id) {
        try (Cursor c = DatabaseProvider.getDatabase(context).rawQuery("SELECT 1 FROM books WHERE _id = ?", new String[]{Long.toString(id)})) {
            return c.moveToFirst();
        }
    }

    /** Formats a duration as m:ss, or h:mm:ss if it's at least an hour. */
    static String formatDuration(long ms) {
        long s = ms / 1000;
        if (s >= 3600) {
            return String.format("%d:%02d:%02d", s / 3600, (s / 60) % 60, s % 60);
        }
        return String.format("%d:%02d", s / 60, s % 60);
    }

    private static CharSequence bold(String before, String bold, String after) {
        SpannableStringBuilder sb = new SpannableStringBuilder(before);
        int start = sb.length();
        sb.append(bold);
        sb.setSpan(new StyleSpan(Typeface.BOLD), start, sb.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        sb.append(after);
        return sb;
    }

    private LinearLayout section(Context context, int top, int bottom) {
        LinearLayout section = new LinearLayout(context);
        section.setOrientation(VERTICAL);
        section.setPadding(Ui.dp(context, 16), Ui.dp(context, top), Ui.dp(context, 16), Ui.dp(context, bottom));
        return section;
    }

    private View divider(Context context) {
        View divider = new View(context);
        divider.setBackgroundColor(Ui.subtle(context, 0.12f));
        divider.setLayoutParams(new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, Ui.dp(context, 1))));
        return divider;
    }

    private LayoutParams margins(int top, int bottom) {
        LayoutParams lp = new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = Ui.dp(getContext(), top);
        lp.bottomMargin = Ui.dp(getContext(), bottom);
        return lp;
    }

    private LayoutParams centered(int top) {
        LayoutParams lp = new LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.gravity = Gravity.CENTER_HORIZONTAL;
        lp.topMargin = Ui.dp(getContext(), top);
        return lp;
    }
}
