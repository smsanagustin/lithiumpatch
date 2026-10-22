package com.faultexception.reader.goals;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.view.View;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.Locale;
import java.util.Set;

/**
 * The days of the current week (Sunday to Saturday). Days the goal was met
 * are filled and joined, and today shows its progress as a ring.
 */
final class WeekStreakView extends View {
    private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint stroke = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint text = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF rect = new RectF();

    private final int primary, onPrimary, textPrimary, textSecondary, outline, track;
    private final float radius, outlineWidth, ringWidth, joinHeight;

    private final LocalDate[] days = new LocalDate[7];
    private final boolean[] met = new boolean[7];
    private int todayIndex = -1;
    private float todayProgress;

    WeekStreakView(Context context) {
        super(context);
        primary = Ui.primary(context);
        onPrimary = Ui.onPrimary(context);
        textPrimary = Ui.textPrimary(context);
        textSecondary = Ui.textSecondary(context);
        outline = Ui.subtle(context, 0.3f);
        track = Ui.subtle(context, 0.12f);
        radius = Ui.dp(context, 18);
        outlineWidth = Ui.dp(context, 1);
        ringWidth = Ui.dp(context, 3);
        joinHeight = Ui.dp(context, 8);
        text.setTextAlign(Paint.Align.CENTER);
        text.setTextSize(Ui.dp(context, 13));
        stroke.setStyle(Paint.Style.STROKE);
        stroke.setStrokeCap(Paint.Cap.ROUND);
    }

    void bind(LocalDate today, Set<LocalDate> metDays, float todayProgress) {
        LocalDate sunday = today.minusDays(today.getDayOfWeek().getValue() % 7);
        for (int i = 0; i < 7; i++) {
            days[i] = sunday.plusDays(i);
            met[i] = metDays.contains(days[i]);
        }
        this.todayIndex = (int) (today.toEpochDay() - sunday.toEpochDay());
        this.todayProgress = todayProgress;

        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 7; i++) {
            if (i != 0) {
                sb.append(", ");
            }
            sb.append(days[i].getDayOfWeek().getDisplayName(TextStyle.FULL, Locale.getDefault()));
            sb.append(met[i] ? ": goal met" : i == todayIndex ? ": today" : "");
        }
        setContentDescription(sb);
        invalidate();
    }

    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int height = Math.round(radius * 2 + outlineWidth * 2);
        setMeasuredDimension(getDefaultSize(getSuggestedMinimumWidth(), widthMeasureSpec), resolveSize(height, heightMeasureSpec));
    }

    @Override
    protected void onDraw(Canvas canvas) {
        if (days[0] == null) {
            return;
        }
        float slot = getWidth() / 7f;
        float r = Math.min(radius, slot / 2 - outlineWidth);
        float cy = getHeight() / 2f;

        // join consecutive met days
        fill.setColor(primary);
        for (int i = 0; i < 6; i++) {
            if (met[i] && met[i + 1]) {
                float x = slot * (i + 0.5f);
                canvas.drawRect(x, cy - joinHeight / 2, x + slot, cy + joinHeight / 2, fill);
            }
        }

        for (int i = 0; i < 7; i++) {
            float cx = slot * (i + 0.5f);
            boolean today = i == todayIndex;
            int letterColor;
            if (met[i]) {
                fill.setColor(primary);
                canvas.drawCircle(cx, cy, r, fill);
                letterColor = onPrimary;
            } else if (today) {
                rect.set(cx - r + ringWidth / 2, cy - r + ringWidth / 2, cx + r - ringWidth / 2, cy + r - ringWidth / 2);
                stroke.setStrokeWidth(ringWidth);
                stroke.setColor(track);
                canvas.drawArc(rect, 0, 360, false, stroke);
                if (todayProgress > 0) {
                    stroke.setColor(primary);
                    canvas.drawArc(rect, -90, 360 * todayProgress, false, stroke);
                }
                letterColor = textPrimary;
            } else {
                stroke.setStrokeWidth(outlineWidth);
                stroke.setColor(outline);
                canvas.drawCircle(cx, cy, r - outlineWidth / 2, stroke);
                letterColor = textSecondary;
            }
            text.setColor(letterColor);
            text.setTypeface(met[i] || today ? Ui.MEDIUM : null);
            String letter = letter(days[i].getDayOfWeek());
            canvas.drawText(letter, cx, cy - (text.descent() + text.ascent()) / 2, text);
        }
    }

    private static String letter(DayOfWeek day) {
        return day.getDisplayName(TextStyle.NARROW, Locale.getDefault());
    }
}
