package com.faultexception.reader.goals;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.faultexception.reader.R;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.google.android.material.bottomsheet.BottomSheetDialog;

import java.util.function.IntConsumer;

/** A bottom sheet for choosing a goal with a -/+ counter. */
final class GoalSheet {
    private static final long REPEAT_DELAY_MS = 400;
    private static final long REPEAT_INTERVAL_MS = 60;

    private GoalSheet() {
    }

    static void show(Context context, String title, String description, String unitOne, String unitOther, int initial, int min, int max, IntConsumer onSave) {
        BottomSheetDialog dialog = new BottomSheetDialog(context);
        int[] value = {Math.max(min, Math.min(max, initial))};

        LinearLayout root = new LinearLayout(context);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(Ui.dp(context, 24), 0, Ui.dp(context, 24), Ui.dp(context, 16));

        View handle = new View(context);
        handle.setBackground(Ui.roundRect(Ui.subtle(context, 0.4f), Ui.dp(context, 2)));
        LinearLayout.LayoutParams handleLp = new LinearLayout.LayoutParams(Ui.dp(context, 32), Ui.dp(context, 4));
        handleLp.gravity = Gravity.CENTER_HORIZONTAL;
        handleLp.topMargin = Ui.dp(context, 12);
        root.addView(handle, handleLp);

        TextView titleView = Ui.text(context, 24, Ui.textPrimary(context), null);
        titleView.setText(title);
        root.addView(titleView, margins(context, 20, 0));

        TextView descriptionView = Ui.text(context, 14, Ui.textSecondary(context), null);
        descriptionView.setText(description);
        root.addView(descriptionView, margins(context, 8, 0));

        LinearLayout counter = new LinearLayout(context);
        counter.setOrientation(LinearLayout.HORIZONTAL);
        counter.setGravity(Gravity.CENTER_VERTICAL);
        root.addView(counter, margins(context, 24, 0));

        LinearLayout center = new LinearLayout(context);
        center.setOrientation(LinearLayout.VERTICAL);
        center.setGravity(Gravity.CENTER_HORIZONTAL);
        TextView valueView = Ui.text(context, 56, Ui.textPrimary(context), Ui.LIGHT);
        valueView.setGravity(Gravity.CENTER_HORIZONTAL);
        TextView unitView = Ui.text(context, 14, Ui.textSecondary(context), null);
        unitView.setGravity(Gravity.CENTER_HORIZONTAL);
        center.addView(valueView);
        center.addView(unitView);

        ImageView minus = roundButton(context, R.drawable.goals_ic_remove, "Decrease");
        ImageView plus = roundButton(context, R.drawable.goals_ic_add, "Increase");
        counter.addView(minus, new LinearLayout.LayoutParams(Ui.dp(context, 48), Ui.dp(context, 48)));
        counter.addView(center, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        counter.addView(plus, new LinearLayout.LayoutParams(Ui.dp(context, 48), Ui.dp(context, 48)));

        Runnable update = () -> {
            valueView.setText(String.valueOf(value[0]));
            unitView.setText(value[0] == 1 ? unitOne : unitOther);
            minus.setEnabled(value[0] > min);
            minus.setAlpha(value[0] > min ? 1 : 0.38f);
            plus.setEnabled(value[0] < max);
            plus.setAlpha(value[0] < max ? 1 : 0.38f);
        };
        update.run();
        repeating(minus, () -> {
            if (value[0] > min) {
                value[0]--;
                update.run();
            }
        });
        repeating(plus, () -> {
            if (value[0] < max) {
                value[0]++;
                update.run();
            }
        });

        LinearLayout buttons = new LinearLayout(context);
        buttons.setOrientation(LinearLayout.HORIZONTAL);
        buttons.setGravity(Gravity.END | Gravity.CENTER_VERTICAL);
        root.addView(buttons, margins(context, 24, 0));

        TextView cancel = Ui.textButton(context, "Cancel", 0);
        cancel.setOnClickListener(v -> dialog.cancel());
        buttons.addView(cancel);

        TextView save = Ui.text(context, 14, Ui.onPrimary(context), Ui.MEDIUM);
        save.setText("Save");
        save.setGravity(Gravity.CENTER);
        save.setMinHeight(Ui.dp(context, 40));
        save.setPadding(Ui.dp(context, 24), 0, Ui.dp(context, 24), 0);
        GradientDrawable pill = Ui.roundRect(Ui.primary(context), Ui.dp(context, 20));
        save.setBackground(Ui.ripple(context, pill, null));
        save.setOnClickListener(v -> {
            onSave.accept(value[0]);
            dialog.dismiss();
        });
        LinearLayout.LayoutParams saveLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        saveLp.setMarginStart(Ui.dp(context, 8));
        buttons.addView(save, saveLp);

        dialog.setContentView(root);

        // rounded top corners (the behavior replaces the background on its
        // first layout, so keep putting ours back)
        float radius = Ui.dp(context, 28);
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(Ui.themeColor(context, R.attr.colorSurface, Color.WHITE));
        bg.setCornerRadii(new float[]{radius, radius, radius, radius, 0, 0, 0, 0});
        View container = (View) root.getParent();
        container.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> {
            if (v.getBackground() != bg) {
                v.setBackground(bg);
            }
        });

        BottomSheetBehavior<?> behavior = dialog.getBehavior();
        behavior.setSkipCollapsed(true);
        behavior.setState(BottomSheetBehavior.STATE_EXPANDED);
        dialog.show();
    }

    private static LinearLayout.LayoutParams margins(Context context, int top, int bottom) {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = Ui.dp(context, top);
        lp.bottomMargin = Ui.dp(context, bottom);
        return lp;
    }

    private static ImageView roundButton(Context context, int icon, String description) {
        ImageView button = new ImageView(context);
        button.setImageResource(icon);
        button.setImageTintList(ColorStateList.valueOf(Ui.textPrimary(context)));
        button.setScaleType(ImageView.ScaleType.CENTER);
        button.setBackground(Ui.ripple(context, Ui.circle(Color.TRANSPARENT, Ui.subtle(context, 0.3f), Ui.dp(context, 1)), Ui.circle(Color.WHITE, 0, 0)));
        button.setContentDescription(description);
        button.setClickable(true);
        button.setFocusable(true);
        return button;
    }

    /** Runs step on click, and repeatedly while held. */
    @SuppressLint("ClickableViewAccessibility")
    private static void repeating(View view, Runnable step) {
        Runnable[] repeat = new Runnable[1];
        repeat[0] = () -> {
            view.setTag(Boolean.TRUE); // repeating, so the release shouldn't also click
            step.run();
            view.postDelayed(repeat[0], REPEAT_INTERVAL_MS);
        };
        view.setOnClickListener(v -> step.run());
        view.setOnTouchListener((v, ev) -> {
            switch (ev.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    v.postDelayed(repeat[0], REPEAT_DELAY_MS);
                    break;
                case MotionEvent.ACTION_UP:
                case MotionEvent.ACTION_CANCEL:
                    boolean repeated = v.getTag() != null;
                    v.removeCallbacks(repeat[0]);
                    v.setTag(null);
                    if (repeated) {
                        v.setPressed(false);
                        return true; // don't also click
                    }
                    break;
            }
            return false;
        });
    }
}
