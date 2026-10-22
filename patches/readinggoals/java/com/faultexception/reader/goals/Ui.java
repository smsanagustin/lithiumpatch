package com.faultexception.reader.goals;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Outline;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewOutlineProvider;
import android.widget.TextView;

import com.faultexception.reader.R;

/** Helpers for building views in code using the app theme. */
final class Ui {
    static final Typeface MEDIUM = Typeface.create("sans-serif-medium", Typeface.NORMAL);
    static final Typeface LIGHT = Typeface.create("sans-serif-light", Typeface.NORMAL);

    private Ui() {
    }

    static int dp(Context context, float dp) {
        return Math.round(dp * context.getResources().getDisplayMetrics().density);
    }

    static int themeColor(Context context, int attr, int fallback) {
        TypedValue tv = new TypedValue();
        if (!context.getTheme().resolveAttribute(attr, tv, true)) {
            return fallback;
        }
        if (tv.type >= TypedValue.TYPE_FIRST_COLOR_INT && tv.type <= TypedValue.TYPE_LAST_COLOR_INT) {
            return tv.data;
        }
        if (tv.resourceId != 0) {
            // may be a color state list (e.g., textColorPrimary)
            return context.getColorStateList(tv.resourceId).getDefaultColor();
        }
        return fallback;
    }

    static int themeResource(Context context, int attr) {
        TypedValue tv = new TypedValue();
        return context.getTheme().resolveAttribute(attr, tv, true) ? tv.resourceId : 0;
    }

    static int primary(Context context) {
        return themeColor(context, R.attr.colorPrimary, 0xFF1976D2);
    }

    static int onPrimary(Context context) {
        return themeColor(context, R.attr.colorOnPrimary, Color.WHITE);
    }

    static int textPrimary(Context context) {
        return themeColor(context, android.R.attr.textColorPrimary, Color.BLACK);
    }

    static int textSecondary(Context context) {
        return themeColor(context, android.R.attr.textColorSecondary, Color.GRAY);
    }

    /** A subtle fill for tracks, placeholders, and dividers. */
    static int subtle(Context context, float alpha) {
        return withAlpha(textPrimary(context), alpha);
    }

    static int withAlpha(int color, float alpha) {
        return Color.argb(Math.round(Color.alpha(color) * alpha), Color.red(color), Color.green(color), Color.blue(color));
    }

    static TextView text(Context context, float sp, int color, Typeface typeface) {
        TextView tv = new TextView(context);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        tv.setTextColor(color);
        if (typeface != null) {
            tv.setTypeface(typeface);
        }
        return tv;
    }

    /** A section title, like "Today's reading". */
    static TextView title(Context context, CharSequence text) {
        TextView tv = text(context, 15, primary(context), MEDIUM);
        tv.setText(text);
        return tv;
    }

    static GradientDrawable roundRect(int color, float radius) {
        GradientDrawable d = new GradientDrawable();
        d.setColor(color);
        d.setCornerRadius(radius);
        return d;
    }

    static GradientDrawable circle(int fill, int stroke, int strokeWidth) {
        GradientDrawable d = new GradientDrawable();
        d.setShape(GradientDrawable.OVAL);
        d.setColor(fill);
        if (strokeWidth > 0) {
            d.setStroke(strokeWidth, stroke);
        }
        return d;
    }

    /** Wraps a background with a ripple bounded by it. */
    static RippleDrawable ripple(Context context, Drawable content, Drawable mask) {
        int color = themeColor(context, android.R.attr.colorControlHighlight, 0x1F000000);
        return new RippleDrawable(ColorStateList.valueOf(color), content, mask);
    }

    /** A borderless text button with an optional leading icon, in the primary color. */
    static TextView textButton(Context context, CharSequence label, int icon) {
        TextView tv = text(context, 14, primary(context), MEDIUM);
        tv.setText(label);
        tv.setGravity(android.view.Gravity.CENTER);
        tv.setMinHeight(dp(context, 40));
        tv.setPadding(dp(context, 12), 0, dp(context, 12), 0);
        tv.setBackground(ripple(context, null, roundRect(Color.WHITE, dp(context, 20))));
        tv.setClickable(true);
        if (icon != 0) {
            Drawable d = context.getDrawable(icon).mutate();
            int size = dp(context, 18);
            d.setBounds(0, 0, size, size);
            d.setTint(primary(context));
            tv.setCompoundDrawablesRelative(d, null, null, null);
            tv.setCompoundDrawablePadding(dp(context, 8));
        }
        return tv;
    }

    /** Clips a view to rounded corners. */
    static void clipRound(View view, float radius) {
        view.setOutlineProvider(new ViewOutlineProvider() {
            @Override
            public void getOutline(View view, Outline outline) {
                outline.setRoundRect(0, 0, view.getWidth(), view.getHeight(), radius);
            }
        });
        view.setClipToOutline(true);
    }

    static String plural(int n, String one, String other) {
        return n + " " + (n == 1 ? one : other);
    }
}
