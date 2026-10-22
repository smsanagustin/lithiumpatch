package com.faultexception.reader.goals;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.view.View;

/** A circular progress track. */
final class ProgressRing extends View {
    private final Paint track = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint indicator = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF rect = new RectF();
    private float progress;

    ProgressRing(Context context, float strokeDp) {
        super(context);
        float stroke = Ui.dp(context, strokeDp);
        track.setStyle(Paint.Style.STROKE);
        track.setStrokeWidth(stroke);
        track.setColor(Ui.subtle(context, 0.12f));
        indicator.setStyle(Paint.Style.STROKE);
        indicator.setStrokeWidth(stroke);
        indicator.setStrokeCap(Paint.Cap.ROUND);
        indicator.setColor(Ui.primary(context));
    }

    /** Sets the progress, from 0 to 1. */
    void setProgress(float progress) {
        this.progress = Math.max(0, Math.min(1, progress));
        invalidate();
    }

    @Override
    protected void onDraw(Canvas canvas) {
        float inset = track.getStrokeWidth() / 2;
        rect.set(inset, inset, getWidth() - inset, getHeight() - inset);
        canvas.drawArc(rect, 0, 360, false, track);
        if (progress > 0) {
            canvas.drawArc(rect, -90, 360 * progress, false, indicator);
        }
    }
}
