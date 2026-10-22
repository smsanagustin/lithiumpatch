.class final Lcom/faultexception/reader/goals/GoalReachedToast;
.super Ljava/lang/Object;
.source "GoalReachedToast.java"


# static fields
.field private static final ANIMATION_MS:J = 0xfaL

.field private static final DURATION_MS:J = 0x1770L


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static create(Landroid/content/Context;)Landroid/view/View;
    .locals 11

    .line 68
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    .line 69
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v2, 0x10

    .line 70
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/high16 v2, 0x41800000    # 16.0f

    .line 71
    invoke-static {p0, v2}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v3

    const/high16 v4, 0x41600000    # 14.0f

    invoke-static {p0, v4}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v5

    const/high16 v6, 0x41000000    # 8.0f

    invoke-static {p0, v6}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v7

    invoke-static {p0, v4}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v8

    invoke-virtual {v0, v3, v5, v7, v8}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const/high16 v3, 0x40c00000    # 6.0f

    .line 72
    invoke-static {p0, v3}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->setElevation(F)V

    .line 73
    new-instance v5, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v7, -0xcdcdce

    .line 74
    invoke-virtual {v5, v7}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 75
    invoke-static {p0, v6}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {v5, v7}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 76
    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/4 v5, 0x1

    .line 77
    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->setClickable(Z)V

    .line 79
    new-instance v7, Landroid/widget/ImageView;

    invoke-direct {v7, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 80
    new-instance v8, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v8}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 81
    invoke-virtual {v8, v5}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 82
    invoke-static {p0}, Lcom/faultexception/reader/goals/Ui;->primary(Landroid/content/Context;)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 83
    invoke-virtual {v7, v8}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 84
    sget v8, Lcom/faultexception/reader/R$drawable;->goals_ic_check:I

    invoke-virtual {v7, v8}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 85
    invoke-static {p0}, Lcom/faultexception/reader/goals/Ui;->onPrimary(Landroid/content/Context;)I

    move-result v8

    invoke-static {v8}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    .line 86
    invoke-static {p0, v3}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v8

    invoke-static {p0, v3}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v9

    invoke-static {p0, v3}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v10

    invoke-static {p0, v3}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v3

    invoke-virtual {v7, v8, v9, v10, v3}, Landroid/widget/ImageView;->setPadding(IIII)V

    .line 87
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v8, 0x42000000    # 32.0f

    invoke-static {p0, v8}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v9

    invoke-static {p0, v8}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v8

    invoke-direct {v3, v9, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v7, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 89
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 90
    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 91
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x2

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v5, v1, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 92
    invoke-static {p0, v2}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v1

    invoke-virtual {v5, v1}, Landroid/widget/LinearLayout$LayoutParams;->setMarginStart(I)V

    .line 93
    invoke-static {p0, v6}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v1

    invoke-virtual {v5, v1}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 94
    invoke-virtual {v0, v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 96
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v2, "Today\'s reading goal achieved"

    .line 97
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v2, -0x1

    .line 98
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v2, 0x41700000    # 15.0f

    const/4 v5, 0x2

    .line 99
    invoke-virtual {v1, v5, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 100
    sget-object v2, Lcom/faultexception/reader/goals/Ui;->MEDIUM:Landroid/graphics/Typeface;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 101
    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 103
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v2, "Congratulations, you\'ve reached your daily reading goal."

    .line 104
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v2, -0x33000001    # -1.3421772E8f

    .line 105
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 106
    invoke-virtual {v1, v5, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 107
    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 109
    new-instance v1, Landroid/widget/ImageButton;

    invoke-direct {v1, p0}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    .line 110
    sget v2, Lcom/faultexception/reader/R$drawable;->goals_ic_close:I

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setImageResource(I)V

    const v2, -0x4c000001

    .line 111
    invoke-static {v2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setImageTintList(Landroid/content/res/ColorStateList;)V

    const v2, 0x101045c

    .line 112
    invoke-static {p0, v2}, Lcom/faultexception/reader/goals/Ui;->themeResource(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setBackgroundResource(I)V

    const-string v2, "Dismiss"

    .line 113
    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 114
    new-instance v2, Lcom/faultexception/reader/goals/GoalReachedToast$$ExternalSyntheticLambda0;

    invoke-direct {v2, v0}, Lcom/faultexception/reader/goals/GoalReachedToast$$ExternalSyntheticLambda0;-><init>(Landroid/widget/LinearLayout;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 115
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x42200000    # 40.0f

    invoke-static {p0, v3}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v4

    invoke-static {p0, v3}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result p0

    invoke-direct {v2, v4, p0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method private static dismiss(Landroid/view/View;)V
    .locals 3

    .line 56
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 59
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 60
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const/high16 v2, 0x42000000    # 32.0f

    invoke-static {v1, v2}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0xfa

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lcom/faultexception/reader/goals/GoalReachedToast$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/faultexception/reader/goals/GoalReachedToast$$ExternalSyntheticLambda1;-><init>(Landroid/view/View;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    :cond_1
    :goto_0
    return-void
.end method

.method static synthetic lambda$create$2(Landroid/widget/LinearLayout;Landroid/view/View;)V
    .locals 0

    .line 114
    invoke-static {p0}, Lcom/faultexception/reader/goals/GoalReachedToast;->dismiss(Landroid/view/View;)V

    return-void
.end method

.method static synthetic lambda$dismiss$1(Landroid/view/View;)V
    .locals 1

    .line 61
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 62
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method static synthetic lambda$show$0(Landroid/view/View;)V
    .locals 0

    .line 52
    invoke-static {p0}, Lcom/faultexception/reader/goals/GoalReachedToast;->dismiss(Landroid/view/View;)V

    return-void
.end method

.method static show(Landroid/app/Activity;)V
    .locals 6

    .line 33
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 36
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 38
    invoke-static {p0}, Lcom/faultexception/reader/goals/GoalReachedToast;->create(Landroid/content/Context;)Landroid/view/View;

    move-result-object v1

    .line 39
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v3, -0x2

    const/16 v4, 0x50

    const/4 v5, -0x1

    invoke-direct {v2, v5, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    const/high16 v3, 0x41800000    # 16.0f

    .line 40
    invoke-static {p0, v3}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v3

    .line 42
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getRootWindowInsets()Landroid/view/WindowInsets;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 44
    invoke-virtual {v4}, Landroid/view/WindowInsets;->getSystemWindowInsetBottom()I

    move-result v4

    goto :goto_0

    :cond_1
    const/4 v4, 0x0

    :goto_0
    add-int/2addr v4, v3

    .line 46
    invoke-virtual {v2, v3, v3, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 47
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v0, 0x0

    .line 49
    invoke-virtual {v1, v0}, Landroid/view/View;->setAlpha(F)V

    const/high16 v2, 0x42000000    # 32.0f

    .line 50
    invoke-static {p0, v2}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result p0

    int-to-float p0, p0

    invoke-virtual {v1, p0}, Landroid/view/View;->setTranslationY(F)V

    .line 51
    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {p0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const-wide/16 v2, 0xfa

    invoke-virtual {p0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 52
    new-instance p0, Lcom/faultexception/reader/goals/GoalReachedToast$$ExternalSyntheticLambda2;

    invoke-direct {p0, v1}, Lcom/faultexception/reader/goals/GoalReachedToast$$ExternalSyntheticLambda2;-><init>(Landroid/view/View;)V

    const-wide/16 v2, 0x1770

    invoke-virtual {v1, p0, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_2
    :goto_1
    return-void
.end method
