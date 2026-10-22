.class final Lcom/faultexception/reader/goals/GoalSheet;
.super Ljava/lang/Object;
.source "GoalSheet.java"


# static fields
.field private static final REPEAT_DELAY_MS:J = 0x190L

.field private static final REPEAT_INTERVAL_MS:J = 0x3cL


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$repeating$6(Landroid/view/View;Ljava/lang/Runnable;[Ljava/lang/Runnable;)V
    .locals 2

    .line 165
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 166
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    const/4 p1, 0x0

    .line 167
    aget-object p1, p2, p1

    const-wide/16 v0, 0x3c

    invoke-virtual {p0, p1, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method static synthetic lambda$repeating$7(Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 0

    .line 169
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$repeating$8([Ljava/lang/Runnable;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 3

    .line 171
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p2

    const/4 v0, 0x0

    if-eqz p2, :cond_2

    const/4 v1, 0x1

    if-eq p2, v1, :cond_0

    const/4 v2, 0x3

    if-eq p2, v2, :cond_0

    goto :goto_1

    .line 177
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p2

    if-eqz p2, :cond_1

    move p2, v1

    goto :goto_0

    :cond_1
    move p2, v0

    .line 178
    :goto_0
    aget-object p0, p0, v0

    invoke-virtual {p1, p0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    const/4 p0, 0x0

    .line 179
    invoke-virtual {p1, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    if-eqz p2, :cond_3

    .line 181
    invoke-virtual {p1, v0}, Landroid/view/View;->setPressed(Z)V

    return v1

    .line 173
    :cond_2
    aget-object p0, p0, v0

    const-wide/16 v1, 0x190

    invoke-virtual {p1, p0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_3
    :goto_1
    return v0
.end method

.method static synthetic lambda$show$0(Landroid/widget/TextView;[ILandroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;Landroid/widget/ImageView;ILandroid/widget/ImageView;I)V
    .locals 2

    const/4 v0, 0x0

    .line 75
    aget v1, p1, v0

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    aget p0, p1, v0

    const/4 v1, 0x1

    if-ne p0, v1, :cond_0

    goto :goto_0

    :cond_0
    move-object p3, p4

    :goto_0
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    aget p0, p1, v0

    if-le p0, p6, :cond_1

    move p0, v1

    goto :goto_1

    :cond_1
    move p0, v0

    :goto_1
    invoke-virtual {p5, p0}, Landroid/widget/ImageView;->setEnabled(Z)V

    .line 78
    aget p0, p1, v0

    const/high16 p2, 0x3f800000    # 1.0f

    const p3, 0x3ec28f5c    # 0.38f

    if-le p0, p6, :cond_2

    move p0, p2

    goto :goto_2

    :cond_2
    move p0, p3

    :goto_2
    invoke-virtual {p5, p0}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 79
    aget p0, p1, v0

    if-ge p0, p8, :cond_3

    goto :goto_3

    :cond_3
    move v1, v0

    :goto_3
    invoke-virtual {p7, v1}, Landroid/widget/ImageView;->setEnabled(Z)V

    .line 80
    aget p0, p1, v0

    if-ge p0, p8, :cond_4

    goto :goto_4

    :cond_4
    move p2, p3

    :goto_4
    invoke-virtual {p7, p2}, Landroid/widget/ImageView;->setAlpha(F)V

    return-void
.end method

.method static synthetic lambda$show$1([IILjava/lang/Runnable;)V
    .locals 2

    const/4 v0, 0x0

    .line 84
    aget v1, p0, v0

    if-le v1, p1, :cond_0

    add-int/lit8 v1, v1, -0x1

    .line 85
    aput v1, p0, v0

    .line 86
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    :cond_0
    return-void
.end method

.method static synthetic lambda$show$2([IILjava/lang/Runnable;)V
    .locals 2

    const/4 v0, 0x0

    .line 90
    aget v1, p0, v0

    if-ge v1, p1, :cond_0

    add-int/lit8 v1, v1, 0x1

    .line 91
    aput v1, p0, v0

    .line 92
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    :cond_0
    return-void
.end method

.method static synthetic lambda$show$3(Lcom/google/android/material/bottomsheet/BottomSheetDialog;Landroid/view/View;)V
    .locals 0

    .line 102
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->cancel()V

    return-void
.end method

.method static synthetic lambda$show$4(Ljava/util/function/IntConsumer;[ILcom/google/android/material/bottomsheet/BottomSheetDialog;Landroid/view/View;)V
    .locals 0

    const/4 p3, 0x0

    .line 113
    aget p1, p1, p3

    invoke-interface {p0, p1}, Ljava/util/function/IntConsumer;->accept(I)V

    .line 114
    invoke-virtual {p2}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->dismiss()V

    return-void
.end method

.method static synthetic lambda$show$5(Landroid/graphics/drawable/GradientDrawable;Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 130
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p2

    if-eq p2, p0, :cond_0

    .line 131
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    return-void
.end method

.method private static margins(Landroid/content/Context;II)Landroid/widget/LinearLayout$LayoutParams;
    .locals 3

    .line 142
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    int-to-float p1, p1

    .line 143
    invoke-static {p0, p1}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result p1

    iput p1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    int-to-float p1, p2

    .line 144
    invoke-static {p0, p1}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result p0

    iput p0, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    return-object v0
.end method

.method private static repeating(Landroid/view/View;Ljava/lang/Runnable;)V
    .locals 3

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Runnable;

    .line 164
    new-instance v1, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0, p1, v0}, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda6;-><init>(Landroid/view/View;Ljava/lang/Runnable;[Ljava/lang/Runnable;)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 169
    new-instance v1, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda7;

    invoke-direct {v1, p1}, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda7;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 170
    new-instance p1, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda8;

    invoke-direct {p1, v0}, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda8;-><init>([Ljava/lang/Runnable;)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void
.end method

.method private static roundButton(Landroid/content/Context;ILjava/lang/String;)Landroid/widget/ImageView;
    .locals 3

    .line 149
    new-instance v0, Landroid/widget/ImageView;

    invoke-direct {v0, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 150
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 151
    invoke-static {p0}, Lcom/faultexception/reader/goals/Ui;->textPrimary(Landroid/content/Context;)I

    move-result p1

    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    .line 152
    sget-object p1, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    const p1, 0x3e99999a    # 0.3f

    .line 153
    invoke-static {p0, p1}, Lcom/faultexception/reader/goals/Ui;->subtle(Landroid/content/Context;F)I

    move-result p1

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {p0, v1}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v1

    const/4 v2, 0x0

    invoke-static {v2, p1, v1}, Lcom/faultexception/reader/goals/Ui;->circle(III)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    const/4 v1, -0x1

    invoke-static {v1, v2, v2}, Lcom/faultexception/reader/goals/Ui;->circle(III)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-static {p0, p1, v1}, Lcom/faultexception/reader/goals/Ui;->ripple(Landroid/content/Context;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/RippleDrawable;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 154
    invoke-virtual {v0, p2}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    const/4 p0, 0x1

    .line 155
    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setClickable(Z)V

    .line 156
    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setFocusable(Z)V

    return-object v0
.end method

.method static show(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIILjava/util/function/IntConsumer;)V
    .locals 17

    move-object/from16 v0, p0

    move/from16 v11, p6

    move/from16 v12, p7

    .line 31
    new-instance v13, Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    invoke-direct {v13, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;-><init>(Landroid/content/Context;)V

    move/from16 v1, p5

    .line 32
    invoke-static {v12, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v11, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    filled-new-array {v1}, [I

    move-result-object v14

    .line 34
    new-instance v15, Landroid/widget/LinearLayout;

    invoke-direct {v15, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v10, 0x1

    .line 35
    invoke-virtual {v15, v10}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v9, 0x41c00000    # 24.0f

    .line 36
    invoke-static {v0, v9}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v1

    invoke-static {v0, v9}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v2

    const/high16 v3, 0x41800000    # 16.0f

    invoke-static {v0, v3}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v3

    const/4 v8, 0x0

    invoke-virtual {v15, v1, v8, v2, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 38
    new-instance v1, Landroid/view/View;

    invoke-direct {v1, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const v2, 0x3ecccccd    # 0.4f

    .line 39
    invoke-static {v0, v2}, Lcom/faultexception/reader/goals/Ui;->subtle(Landroid/content/Context;F)I

    move-result v2

    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {v0, v3}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v3

    int-to-float v3, v3

    invoke-static {v2, v3}, Lcom/faultexception/reader/goals/Ui;->roundRect(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 40
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x42000000    # 32.0f

    invoke-static {v0, v3}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v3

    const/high16 v4, 0x40800000    # 4.0f

    invoke-static {v0, v4}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v4

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 41
    iput v10, v2, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    const/high16 v3, 0x41400000    # 12.0f

    .line 42
    invoke-static {v0, v3}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 43
    invoke-virtual {v15, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 45
    invoke-static/range {p0 .. p0}, Lcom/faultexception/reader/goals/Ui;->textPrimary(Landroid/content/Context;)I

    move-result v1

    const/4 v7, 0x0

    invoke-static {v0, v9, v1, v7}, Lcom/faultexception/reader/goals/Ui;->text(Landroid/content/Context;FILandroid/graphics/Typeface;)Landroid/widget/TextView;

    move-result-object v1

    move-object/from16 v2, p1

    .line 46
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/16 v2, 0x14

    .line 47
    invoke-static {v0, v2, v8}, Lcom/faultexception/reader/goals/GoalSheet;->margins(Landroid/content/Context;II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v15, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 49
    invoke-static/range {p0 .. p0}, Lcom/faultexception/reader/goals/Ui;->textSecondary(Landroid/content/Context;)I

    move-result v1

    const/high16 v6, 0x41600000    # 14.0f

    invoke-static {v0, v6, v1, v7}, Lcom/faultexception/reader/goals/Ui;->text(Landroid/content/Context;FILandroid/graphics/Typeface;)Landroid/widget/TextView;

    move-result-object v1

    move-object/from16 v2, p2

    .line 50
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/16 v5, 0x8

    .line 51
    invoke-static {v0, v5, v8}, Lcom/faultexception/reader/goals/GoalSheet;->margins(Landroid/content/Context;II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v15, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 53
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 54
    invoke-virtual {v1, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v2, 0x10

    .line 55
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/16 v4, 0x18

    .line 56
    invoke-static {v0, v4, v8}, Lcom/faultexception/reader/goals/GoalSheet;->margins(Landroid/content/Context;II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v15, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 58
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 59
    invoke-virtual {v2, v10}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 60
    invoke-virtual {v2, v10}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 61
    invoke-static/range {p0 .. p0}, Lcom/faultexception/reader/goals/Ui;->textPrimary(Landroid/content/Context;)I

    move-result v3

    sget-object v4, Lcom/faultexception/reader/goals/Ui;->LIGHT:Landroid/graphics/Typeface;

    const/high16 v5, 0x42600000    # 56.0f

    invoke-static {v0, v5, v3, v4}, Lcom/faultexception/reader/goals/Ui;->text(Landroid/content/Context;FILandroid/graphics/Typeface;)Landroid/widget/TextView;

    move-result-object v3

    .line 62
    invoke-virtual {v3, v10}, Landroid/widget/TextView;->setGravity(I)V

    .line 63
    invoke-static/range {p0 .. p0}, Lcom/faultexception/reader/goals/Ui;->textSecondary(Landroid/content/Context;)I

    move-result v4

    invoke-static {v0, v6, v4, v7}, Lcom/faultexception/reader/goals/Ui;->text(Landroid/content/Context;FILandroid/graphics/Typeface;)Landroid/widget/TextView;

    move-result-object v4

    .line 64
    invoke-virtual {v4, v10}, Landroid/widget/TextView;->setGravity(I)V

    .line 65
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 66
    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 68
    sget v5, Lcom/faultexception/reader/R$drawable;->goals_ic_remove:I

    const-string v6, "Decrease"

    invoke-static {v0, v5, v6}, Lcom/faultexception/reader/goals/GoalSheet;->roundButton(Landroid/content/Context;ILjava/lang/String;)Landroid/widget/ImageView;

    move-result-object v6

    .line 69
    sget v5, Lcom/faultexception/reader/R$drawable;->goals_ic_add:I

    const-string v7, "Increase"

    invoke-static {v0, v5, v7}, Lcom/faultexception/reader/goals/GoalSheet;->roundButton(Landroid/content/Context;ILjava/lang/String;)Landroid/widget/ImageView;

    move-result-object v7

    .line 70
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v9, 0x42400000    # 48.0f

    invoke-static {v0, v9}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v10

    invoke-static {v0, v9}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v8

    invoke-direct {v5, v10, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v6, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 71
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v8, 0x3f800000    # 1.0f

    const/4 v10, -0x2

    const/4 v9, 0x0

    invoke-direct {v5, v9, v10, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 72
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x42400000    # 48.0f

    invoke-static {v0, v5}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v8

    invoke-static {v0, v5}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v5

    invoke-direct {v2, v8, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v7, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 74
    new-instance v8, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda0;

    move-object v1, v8

    move-object v2, v3

    move-object v3, v14

    const/16 v5, 0x18

    move-object/from16 v16, v13

    move v13, v5

    move-object/from16 v5, p3

    move-object/from16 p1, v6

    move-object/from16 v6, p4

    move-object/from16 p2, v7

    move-object/from16 v7, p1

    move v13, v9

    move-object v9, v8

    move/from16 v8, p6

    move-object/from16 p3, v9

    move-object/from16 v9, p2

    move/from16 v10, p7

    invoke-direct/range {v1 .. v10}, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda0;-><init>(Landroid/widget/TextView;[ILandroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;Landroid/widget/ImageView;ILandroid/widget/ImageView;I)V

    .line 82
    invoke-interface/range {p3 .. p3}, Ljava/lang/Runnable;->run()V

    .line 83
    new-instance v1, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda1;

    move-object/from16 v2, p3

    invoke-direct {v1, v14, v11, v2}, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda1;-><init>([IILjava/lang/Runnable;)V

    move-object/from16 v3, p1

    invoke-static {v3, v1}, Lcom/faultexception/reader/goals/GoalSheet;->repeating(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 89
    new-instance v1, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda2;

    invoke-direct {v1, v14, v12, v2}, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda2;-><init>([IILjava/lang/Runnable;)V

    move-object/from16 v2, p2

    invoke-static {v2, v1}, Lcom/faultexception/reader/goals/GoalSheet;->repeating(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 96
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 97
    invoke-virtual {v1, v13}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const v2, 0x800015

    .line 98
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/16 v2, 0x18

    .line 99
    invoke-static {v0, v2, v13}, Lcom/faultexception/reader/goals/GoalSheet;->margins(Landroid/content/Context;II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v15, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v2, "Cancel"

    .line 101
    invoke-static {v0, v2, v13}, Lcom/faultexception/reader/goals/Ui;->textButton(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/TextView;

    move-result-object v2

    .line 102
    new-instance v3, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda3;

    move-object/from16 v4, v16

    invoke-direct {v3, v4}, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda3;-><init>(Lcom/google/android/material/bottomsheet/BottomSheetDialog;)V

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 103
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 105
    invoke-static/range {p0 .. p0}, Lcom/faultexception/reader/goals/Ui;->onPrimary(Landroid/content/Context;)I

    move-result v2

    sget-object v3, Lcom/faultexception/reader/goals/Ui;->MEDIUM:Landroid/graphics/Typeface;

    const/high16 v5, 0x41600000    # 14.0f

    invoke-static {v0, v5, v2, v3}, Lcom/faultexception/reader/goals/Ui;->text(Landroid/content/Context;FILandroid/graphics/Typeface;)Landroid/widget/TextView;

    move-result-object v2

    const-string v3, "Save"

    .line 106
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/16 v3, 0x11

    .line 107
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setGravity(I)V

    const/high16 v3, 0x42200000    # 40.0f

    .line 108
    invoke-static {v0, v3}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setMinHeight(I)V

    const/high16 v3, 0x41c00000    # 24.0f

    .line 109
    invoke-static {v0, v3}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v5

    invoke-static {v0, v3}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v3

    invoke-virtual {v2, v5, v13, v3, v13}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 110
    invoke-static/range {p0 .. p0}, Lcom/faultexception/reader/goals/Ui;->primary(Landroid/content/Context;)I

    move-result v3

    const/high16 v5, 0x41a00000    # 20.0f

    invoke-static {v0, v5}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v5

    int-to-float v5, v5

    invoke-static {v3, v5}, Lcom/faultexception/reader/goals/Ui;->roundRect(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v3

    const/4 v5, 0x0

    .line 111
    invoke-static {v0, v3, v5}, Lcom/faultexception/reader/goals/Ui;->ripple(Landroid/content/Context;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/RippleDrawable;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 112
    new-instance v3, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda4;

    move-object/from16 v5, p8

    invoke-direct {v3, v5, v14, v4}, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda4;-><init>(Ljava/util/function/IntConsumer;[ILcom/google/android/material/bottomsheet/BottomSheetDialog;)V

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 116
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x2

    invoke-direct {v3, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v5, 0x41000000    # 8.0f

    .line 117
    invoke-static {v0, v5}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v5

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout$LayoutParams;->setMarginStart(I)V

    .line 118
    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 120
    invoke-virtual {v4, v15}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    const/high16 v1, 0x41e00000    # 28.0f

    .line 124
    invoke-static {v0, v1}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v1

    int-to-float v1, v1

    .line 125
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 126
    sget v3, Lcom/faultexception/reader/R$attr;->colorSurface:I

    const/4 v5, -0x1

    invoke-static {v0, v3, v5}, Lcom/faultexception/reader/goals/Ui;->themeColor(Landroid/content/Context;II)I

    move-result v0

    invoke-virtual {v2, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/16 v0, 0x8

    new-array v0, v0, [F

    aput v1, v0, v13

    const/4 v3, 0x1

    aput v1, v0, v3

    const/4 v5, 0x2

    aput v1, v0, v5

    const/4 v5, 0x3

    aput v1, v0, v5

    const/4 v1, 0x4

    const/4 v6, 0x0

    aput v6, v0, v1

    const/4 v1, 0x5

    aput v6, v0, v1

    const/4 v1, 0x6

    aput v6, v0, v1

    const/4 v1, 0x7

    aput v6, v0, v1

    .line 127
    invoke-virtual {v2, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    .line 128
    invoke-virtual {v15}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 129
    new-instance v1, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda5;

    invoke-direct {v1, v2}, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda5;-><init>(Landroid/graphics/drawable/GradientDrawable;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 135
    invoke-virtual {v4}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->getBehavior()Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    move-result-object v0

    .line 136
    invoke-virtual {v0, v3}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setSkipCollapsed(Z)V

    .line 137
    invoke-virtual {v0, v5}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 138
    invoke-virtual {v4}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->show()V

    return-void
.end method
