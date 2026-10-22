.class final Lcom/faultexception/reader/goals/CoverView;
.super Landroid/widget/FrameLayout;
.source "CoverView.java"


# instance fields
.field private final badge:Landroid/widget/ImageView;

.field private final card:Landroid/widget/FrameLayout;

.field private final image:Landroid/widget/ImageView;

.field private final label:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/content/Context;FZ)V
    .locals 4

    .line 30
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    .line 31
    invoke-virtual {p0, v0}, Lcom/faultexception/reader/goals/CoverView;->setClipChildren(Z)V

    .line 32
    invoke-virtual {p0, v0}, Lcom/faultexception/reader/goals/CoverView;->setClipToPadding(Z)V

    .line 34
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/faultexception/reader/goals/CoverView;->card:Landroid/widget/FrameLayout;

    .line 35
    invoke-static {p1, p2}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result p2

    int-to-float p2, p2

    invoke-static {v0, p2}, Lcom/faultexception/reader/goals/Ui;->clipRound(Landroid/view/View;F)V

    const/4 p2, 0x1

    .line 36
    invoke-virtual {v0, p2}, Landroid/widget/FrameLayout;->setDuplicateParentStateEnabled(Z)V

    .line 37
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {p2, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0, p2}, Lcom/faultexception/reader/goals/CoverView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    if-eqz p3, :cond_0

    const/high16 p2, 0x42200000    # 40.0f

    goto :goto_0

    :cond_0
    const/high16 p2, 0x41300000    # 11.0f

    .line 39
    :goto_0
    invoke-static {p1}, Lcom/faultexception/reader/goals/Ui;->textSecondary(Landroid/content/Context;)I

    move-result v2

    if-eqz p3, :cond_1

    sget-object v3, Lcom/faultexception/reader/goals/Ui;->LIGHT:Landroid/graphics/Typeface;

    goto :goto_1

    :cond_1
    sget-object v3, Lcom/faultexception/reader/goals/Ui;->MEDIUM:Landroid/graphics/Typeface;

    :goto_1
    invoke-static {p1, p2, v2, v3}, Lcom/faultexception/reader/goals/Ui;->text(Landroid/content/Context;FILandroid/graphics/Typeface;)Landroid/widget/TextView;

    move-result-object p2

    iput-object p2, p0, Lcom/faultexception/reader/goals/CoverView;->label:Landroid/widget/TextView;

    const/16 v2, 0x11

    .line 40
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setGravity(I)V

    .line 41
    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    const/high16 v2, 0x40000000    # 2.0f

    if-eqz p3, :cond_2

    const/high16 p3, 0x41000000    # 8.0f

    goto :goto_2

    :cond_2
    move p3, v2

    .line 42
    :goto_2
    invoke-static {p1, p3}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result p3

    .line 43
    invoke-virtual {p2, p3, p3, p3, p3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 44
    new-instance p3, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {p3, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, p2, p3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 46
    new-instance p2, Landroid/widget/ImageView;

    invoke-direct {p2, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/faultexception/reader/goals/CoverView;->image:Landroid/widget/ImageView;

    .line 47
    sget-object p3, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 48
    new-instance p3, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {p3, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, p2, p3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 50
    new-instance p2, Landroid/widget/ImageView;

    invoke-direct {p2, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/faultexception/reader/goals/CoverView;->badge:Landroid/widget/ImageView;

    .line 51
    sget p3, Lcom/faultexception/reader/R$drawable;->goals_ic_check:I

    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 52
    invoke-static {p1}, Lcom/faultexception/reader/goals/Ui;->onPrimary(Landroid/content/Context;)I

    move-result p3

    invoke-static {p3}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    .line 53
    invoke-static {p1}, Lcom/faultexception/reader/goals/Ui;->primary(Landroid/content/Context;)I

    move-result p3

    sget v0, Lcom/faultexception/reader/R$attr;->colorSurface:I

    invoke-static {p1, v0, v1}, Lcom/faultexception/reader/goals/Ui;->themeColor(Landroid/content/Context;II)I

    move-result v0

    invoke-static {p1, v2}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v1

    invoke-static {p3, v0, v1}, Lcom/faultexception/reader/goals/Ui;->circle(III)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/high16 p3, 0x40a00000    # 5.0f

    .line 54
    invoke-static {p1, p3}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result p3

    .line 55
    invoke-virtual {p2, p3, p3, p3, p3}, Landroid/widget/ImageView;->setPadding(IIII)V

    const/high16 p3, 0x40c00000    # 6.0f

    .line 56
    invoke-static {p1, p3}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setTranslationX(F)V

    .line 57
    invoke-static {p1, p3}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result p3

    int-to-float p3, p3

    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setTranslationY(F)V

    const/16 p3, 0x8

    .line 58
    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 59
    new-instance p3, Landroid/widget/FrameLayout$LayoutParams;

    const/high16 v0, 0x41e00000    # 28.0f

    invoke-static {p1, v0}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v1

    invoke-static {p1, v0}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result p1

    const v0, 0x800055

    invoke-direct {p3, v1, p1, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {p0, p2, p3}, Lcom/faultexception/reader/goals/CoverView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .locals 2

    .line 97
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    if-eq v0, v1, :cond_0

    .line 98
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    int-to-float p2, p2

    const/high16 v0, 0x3fc00000    # 1.5f

    mul-float/2addr p2, v0

    .line 99
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    invoke-static {p2, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    .line 101
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    return-void
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 4

    .line 106
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 107
    iget-object v0, p0, Lcom/faultexception/reader/goals/CoverView;->card:Landroid/widget/FrameLayout;

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/faultexception/reader/goals/CoverView;->getContext()Landroid/content/Context;

    move-result-object p1

    const/4 v2, -0x1

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/faultexception/reader/goals/Ui;->roundRect(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-static {p1, v1, v2}, Lcom/faultexception/reader/goals/Ui;->ripple(Landroid/content/Context;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/RippleDrawable;

    move-result-object v1

    :cond_0
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setForeground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method showBook(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 3

    .line 64
    iget-object v0, p0, Lcom/faultexception/reader/goals/CoverView;->card:Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/faultexception/reader/goals/CoverView;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x3da3d70a    # 0.08f

    invoke-static {v1, v2}, Lcom/faultexception/reader/goals/Ui;->subtle(Landroid/content/Context;F)I

    move-result v1

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/faultexception/reader/goals/Ui;->roundRect(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 65
    iget-object v0, p0, Lcom/faultexception/reader/goals/CoverView;->label:Landroid/widget/TextView;

    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    iget-object v0, p0, Lcom/faultexception/reader/goals/CoverView;->label:Landroid/widget/TextView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    const/4 v0, 0x0

    const/16 v1, 0x8

    if-eqz p2, :cond_0

    .line 67
    instance-of v2, p1, Landroidx/fragment/app/FragmentActivity;

    if-eqz v2, :cond_0

    .line 68
    check-cast p1, Landroidx/fragment/app/FragmentActivity;

    invoke-static {p1}, Lcom/bumptech/glide/Glide;->with(Landroidx/fragment/app/FragmentActivity;)Lcom/bumptech/glide/RequestManager;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/bumptech/glide/RequestManager;->load(Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p1

    iget-object p2, p0, Lcom/faultexception/reader/goals/CoverView;->image:Landroid/widget/ImageView;

    invoke-virtual {p1, p2}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    .line 69
    iget-object p1, p0, Lcom/faultexception/reader/goals/CoverView;->image:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0

    .line 71
    :cond_0
    instance-of p2, p1, Landroidx/fragment/app/FragmentActivity;

    if-eqz p2, :cond_1

    .line 72
    check-cast p1, Landroidx/fragment/app/FragmentActivity;

    invoke-static {p1}, Lcom/bumptech/glide/Glide;->with(Landroidx/fragment/app/FragmentActivity;)Lcom/bumptech/glide/RequestManager;

    move-result-object p1

    iget-object p2, p0, Lcom/faultexception/reader/goals/CoverView;->image:Landroid/widget/ImageView;

    invoke-virtual {p1, p2}, Lcom/bumptech/glide/RequestManager;->clear(Landroid/view/View;)V

    .line 74
    :cond_1
    iget-object p1, p0, Lcom/faultexception/reader/goals/CoverView;->image:Landroid/widget/ImageView;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 75
    iget-object p1, p0, Lcom/faultexception/reader/goals/CoverView;->image:Landroid/widget/ImageView;

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 77
    :goto_0
    iget-object p1, p0, Lcom/faultexception/reader/goals/CoverView;->badge:Landroid/widget/ImageView;

    if-eqz p4, :cond_2

    goto :goto_1

    :cond_2
    move v0, v1

    :goto_1
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    if-eqz p4, :cond_3

    .line 78
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ", finished"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    :cond_3
    invoke-virtual {p0, p3}, Lcom/faultexception/reader/goals/CoverView;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method showPlaceholder(Landroid/app/Activity;I)V
    .locals 2

    .line 83
    instance-of v0, p1, Landroidx/fragment/app/FragmentActivity;

    if-eqz v0, :cond_0

    .line 84
    check-cast p1, Landroidx/fragment/app/FragmentActivity;

    invoke-static {p1}, Lcom/bumptech/glide/Glide;->with(Landroidx/fragment/app/FragmentActivity;)Lcom/bumptech/glide/RequestManager;

    move-result-object p1

    iget-object v0, p0, Lcom/faultexception/reader/goals/CoverView;->image:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Lcom/bumptech/glide/RequestManager;->clear(Landroid/view/View;)V

    .line 86
    :cond_0
    iget-object p1, p0, Lcom/faultexception/reader/goals/CoverView;->card:Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/faultexception/reader/goals/CoverView;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x3da3d70a    # 0.08f

    invoke-static {v0, v1}, Lcom/faultexception/reader/goals/Ui;->subtle(Landroid/content/Context;F)I

    move-result v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/faultexception/reader/goals/Ui;->roundRect(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 87
    iget-object p1, p0, Lcom/faultexception/reader/goals/CoverView;->image:Landroid/widget/ImageView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 88
    iget-object p1, p0, Lcom/faultexception/reader/goals/CoverView;->image:Landroid/widget/ImageView;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 89
    iget-object p1, p0, Lcom/faultexception/reader/goals/CoverView;->label:Landroid/widget/TextView;

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    iget-object p1, p0, Lcom/faultexception/reader/goals/CoverView;->label:Landroid/widget/TextView;

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 91
    iget-object p1, p0, Lcom/faultexception/reader/goals/CoverView;->badge:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 92
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Book "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " of your goal"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/faultexception/reader/goals/CoverView;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method
