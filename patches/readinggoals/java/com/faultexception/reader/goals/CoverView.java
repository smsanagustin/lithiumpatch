package com.faultexception.reader.goals;

import android.app.Activity;
import android.content.Context;
import android.content.res.ColorStateList;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.fragment.app.FragmentActivity;

import com.bumptech.glide.Glide;
import com.faultexception.reader.R;

/**
 * A book cover with rounded corners, falling back to the title if there's no
 * cover image. If the height isn't fixed, it is 1.5 times the width.
 */
final class CoverView extends FrameLayout {
    private final FrameLayout card;
    private final ImageView image;
    private final TextView label;
    private final ImageView badge;

    CoverView(Context context, float radiusDp, boolean large) {
        super(context);
        setClipChildren(false);
        setClipToPadding(false);

        card = new FrameLayout(context);
        Ui.clipRound(card, Ui.dp(context, radiusDp));
        card.setDuplicateParentStateEnabled(true); // for the ripple
        addView(card, new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        label = Ui.text(context, large ? 40 : 11, Ui.textSecondary(context), large ? Ui.LIGHT : Ui.MEDIUM);
        label.setGravity(Gravity.CENTER);
        label.setEllipsize(TextUtils.TruncateAt.END);
        int pad = Ui.dp(context, large ? 8 : 2);
        label.setPadding(pad, pad, pad, pad);
        card.addView(label, new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        image = new ImageView(context);
        image.setScaleType(ImageView.ScaleType.CENTER_CROP);
        card.addView(image, new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        badge = new ImageView(context);
        badge.setImageResource(R.drawable.goals_ic_check);
        badge.setImageTintList(ColorStateList.valueOf(Ui.onPrimary(context)));
        badge.setBackground(Ui.circle(Ui.primary(context), Ui.themeColor(context, R.attr.colorSurface, 0xFFFFFFFF), Ui.dp(context, 2)));
        int bpad = Ui.dp(context, 5);
        badge.setPadding(bpad, bpad, bpad, bpad);
        badge.setTranslationX(Ui.dp(context, 6));
        badge.setTranslationY(Ui.dp(context, 6));
        badge.setVisibility(GONE);
        addView(badge, new LayoutParams(Ui.dp(context, 28), Ui.dp(context, 28), Gravity.BOTTOM | Gravity.END));
    }

    /** Shows a book's cover (or its title if it has none). */
    void showBook(Activity activity, String cover, String title, boolean finished) {
        card.setBackground(Ui.roundRect(Ui.subtle(getContext(), 0.08f), 0));
        label.setText(title);
        label.setMaxLines(4);
        if (cover != null && activity instanceof FragmentActivity) {
            Glide.with((FragmentActivity) activity).load(cover).into(image);
            image.setVisibility(VISIBLE);
        } else {
            if (activity instanceof FragmentActivity) {
                Glide.with((FragmentActivity) activity).clear(image);
            }
            image.setImageDrawable(null);
            image.setVisibility(GONE);
        }
        badge.setVisibility(finished ? VISIBLE : GONE);
        setContentDescription(finished ? title + ", finished" : title);
    }

    /** Shows an empty slot with a number. */
    void showPlaceholder(Activity activity, int number) {
        if (activity instanceof FragmentActivity) {
            Glide.with((FragmentActivity) activity).clear(image);
        }
        card.setBackground(Ui.roundRect(Ui.subtle(getContext(), 0.08f), 0));
        image.setImageDrawable(null);
        image.setVisibility(GONE);
        label.setText(String.valueOf(number));
        label.setMaxLines(1);
        badge.setVisibility(GONE);
        setContentDescription("Book " + number + " of your goal");
    }

    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        if (MeasureSpec.getMode(heightMeasureSpec) != MeasureSpec.EXACTLY) {
            int width = MeasureSpec.getSize(widthMeasureSpec);
            heightMeasureSpec = MeasureSpec.makeMeasureSpec(Math.round(width * 1.5f), MeasureSpec.EXACTLY);
        }
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
    }

    @Override
    public void setOnClickListener(View.OnClickListener l) {
        super.setOnClickListener(l);
        card.setForeground(l != null ? Ui.ripple(getContext(), null, Ui.roundRect(0xFFFFFFFF, 0)) : null);
    }
}
