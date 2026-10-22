package com.google.android.material.bottomsheet;

import android.app.Dialog;
import android.content.Context;
import android.view.View;
import android.widget.FrameLayout;

public class BottomSheetDialog extends Dialog {
    public BottomSheetDialog(Context context) {
        super(context);
    }

    @Override
    public void setContentView(View view) {
    }

    public BottomSheetBehavior<FrameLayout> getBehavior() {
        throw new RuntimeException("stub");
    }
}
