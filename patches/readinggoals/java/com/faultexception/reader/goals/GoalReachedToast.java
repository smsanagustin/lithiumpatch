package com.faultexception.reader.goals;

import android.app.Activity;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.faultexception.reader.R;

/**
 * A snackbar-style message shown over the current activity (usually the
 * reader) when today's reading goal is reached.
 */
final class GoalReachedToast {
    private static final long DURATION_MS = 6000;
    private static final long ANIMATION_MS = 250;

    private GoalReachedToast() {
    }

    static void show(Activity activity) {
        if (activity.isFinishing() || activity.isDestroyed()) {
            return;
        }
        ViewGroup decor = (ViewGroup) activity.getWindow().getDecorView();

        View toast = create(activity);
        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM);
        int margin = Ui.dp(activity, 16);
        int inset = 0;
        WindowInsets insets = decor.getRootWindowInsets();
        if (insets != null) {
            inset = insets.getSystemWindowInsetBottom();
        }
        lp.setMargins(margin, margin, margin, margin + inset);
        decor.addView(toast, lp);

        toast.setAlpha(0);
        toast.setTranslationY(Ui.dp(activity, 32));
        toast.animate().alpha(1).translationY(0).setDuration(ANIMATION_MS);
        toast.postDelayed(() -> dismiss(toast), DURATION_MS);
    }

    private static void dismiss(View toast) {
        if (toast.getParent() == null || toast.getTag() != null) {
            return;
        }
        toast.setTag(Boolean.TRUE); // dismissing
        toast.animate().alpha(0).translationY(Ui.dp(toast.getContext(), 32)).setDuration(ANIMATION_MS).withEndAction(() -> {
            if (toast.getParent() != null) {
                ((ViewGroup) toast.getParent()).removeView(toast);
            }
        });
    }

    private static View create(Context context) {
        LinearLayout card = new LinearLayout(context);
        card.setOrientation(LinearLayout.HORIZONTAL);
        card.setGravity(Gravity.CENTER_VERTICAL);
        card.setPadding(Ui.dp(context, 16), Ui.dp(context, 14), Ui.dp(context, 8), Ui.dp(context, 14));
        card.setElevation(Ui.dp(context, 6));
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(0xFF323232);
        bg.setCornerRadius(Ui.dp(context, 8));
        card.setBackground(bg);
        card.setClickable(true); // don't pass taps through to the reader

        ImageView check = new ImageView(context);
        GradientDrawable circle = new GradientDrawable();
        circle.setShape(GradientDrawable.OVAL);
        circle.setColor(Ui.primary(context));
        check.setBackground(circle);
        check.setImageResource(R.drawable.goals_ic_check);
        check.setImageTintList(ColorStateList.valueOf(Ui.onPrimary(context)));
        check.setPadding(Ui.dp(context, 6), Ui.dp(context, 6), Ui.dp(context, 6), Ui.dp(context, 6));
        card.addView(check, new LinearLayout.LayoutParams(Ui.dp(context, 32), Ui.dp(context, 32)));

        LinearLayout text = new LinearLayout(context);
        text.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams textLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1);
        textLp.setMarginStart(Ui.dp(context, 16));
        textLp.setMarginEnd(Ui.dp(context, 8));
        card.addView(text, textLp);

        TextView title = new TextView(context);
        title.setText("Today's reading goal achieved");
        title.setTextColor(Color.WHITE);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        title.setTypeface(Ui.MEDIUM);
        text.addView(title);

        TextView message = new TextView(context);
        message.setText("Congratulations, you've reached your daily reading goal.");
        message.setTextColor(0xCCFFFFFF);
        message.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        text.addView(message);

        ImageButton close = new ImageButton(context);
        close.setImageResource(R.drawable.goals_ic_close);
        close.setImageTintList(ColorStateList.valueOf(0xB3FFFFFF));
        close.setBackgroundResource(Ui.themeResource(context, android.R.attr.selectableItemBackgroundBorderless));
        close.setContentDescription("Dismiss");
        close.setOnClickListener(v -> dismiss(card));
        card.addView(close, new LinearLayout.LayoutParams(Ui.dp(context, 40), Ui.dp(context, 40)));

        return card;
    }
}
