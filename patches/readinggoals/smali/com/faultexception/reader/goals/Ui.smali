.class final Lcom/faultexception/reader/goals/Ui;
.super Ljava/lang/Object;
.source "Ui.java"


# static fields
.field static final LIGHT:Landroid/graphics/Typeface;

.field static final MEDIUM:Landroid/graphics/Typeface;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "sans-serif-medium"

    const/4 v1, 0x0

    .line 20
    invoke-static {v0, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v0

    sput-object v0, Lcom/faultexception/reader/goals/Ui;->MEDIUM:Landroid/graphics/Typeface;

    const-string v0, "sans-serif-light"

    .line 21
    invoke-static {v0, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v0

    sput-object v0, Lcom/faultexception/reader/goals/Ui;->LIGHT:Landroid/graphics/Typeface;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static circle(III)Landroid/graphics/drawable/GradientDrawable;
    .locals 2

    .line 100
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const/4 v1, 0x1

    .line 101
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 102
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    if-lez p2, :cond_0

    .line 104
    invoke-virtual {v0, p2, p1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    :cond_0
    return-object v0
.end method

.method static clipRound(Landroid/view/View;F)V
    .locals 1

    .line 137
    new-instance v0, Lcom/faultexception/reader/goals/Ui$1;

    invoke-direct {v0, p1}, Lcom/faultexception/reader/goals/Ui$1;-><init>(F)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    const/4 p1, 0x1

    .line 143
    invoke-virtual {p0, p1}, Landroid/view/View;->setClipToOutline(Z)V

    return-void
.end method

.method static dp(Landroid/content/Context;F)I
    .locals 0

    .line 27
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr p1, p0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method static onPrimary(Landroid/content/Context;)I
    .locals 2

    .line 55
    sget v0, Lcom/faultexception/reader/R$attr;->colorOnPrimary:I

    const/4 v1, -0x1

    invoke-static {p0, v0, v1}, Lcom/faultexception/reader/goals/Ui;->themeColor(Landroid/content/Context;II)I

    move-result p0

    return p0
.end method

.method static plural(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 147
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x1

    if-ne p0, v1, :cond_0

    goto :goto_0

    :cond_0
    move-object p1, p2

    :goto_0
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static primary(Landroid/content/Context;)I
    .locals 2

    .line 51
    sget v0, Lcom/faultexception/reader/R$attr;->colorPrimary:I

    const v1, -0xe6892e

    invoke-static {p0, v0, v1}, Lcom/faultexception/reader/goals/Ui;->themeColor(Landroid/content/Context;II)I

    move-result p0

    return p0
.end method

.method static ripple(Landroid/content/Context;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/RippleDrawable;
    .locals 2

    const v0, 0x101042c

    const/high16 v1, 0x1f000000

    .line 111
    invoke-static {p0, v0, v1}, Lcom/faultexception/reader/goals/Ui;->themeColor(Landroid/content/Context;II)I

    move-result p0

    .line 112
    new-instance v0, Landroid/graphics/drawable/RippleDrawable;

    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-direct {v0, p0, p1, p2}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    return-object v0
.end method

.method static roundRect(IF)Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    .line 93
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 94
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 95
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    return-object v0
.end method

.method static subtle(Landroid/content/Context;F)I
    .locals 0

    .line 68
    invoke-static {p0}, Lcom/faultexception/reader/goals/Ui;->textPrimary(Landroid/content/Context;)I

    move-result p0

    invoke-static {p0, p1}, Lcom/faultexception/reader/goals/Ui;->withAlpha(IF)I

    move-result p0

    return p0
.end method

.method static text(Landroid/content/Context;FILandroid/graphics/Typeface;)Landroid/widget/TextView;
    .locals 1

    .line 76
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/4 p0, 0x2

    .line 77
    invoke-virtual {v0, p0, p1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 78
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    if-eqz p3, :cond_0

    .line 80
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    :cond_0
    return-object v0
.end method

.method static textButton(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/TextView;
    .locals 3

    .line 117
    invoke-static {p0}, Lcom/faultexception/reader/goals/Ui;->primary(Landroid/content/Context;)I

    move-result v0

    sget-object v1, Lcom/faultexception/reader/goals/Ui;->MEDIUM:Landroid/graphics/Typeface;

    const/high16 v2, 0x41600000    # 14.0f

    invoke-static {p0, v2, v0, v1}, Lcom/faultexception/reader/goals/Ui;->text(Landroid/content/Context;FILandroid/graphics/Typeface;)Landroid/widget/TextView;

    move-result-object v0

    .line 118
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/16 p1, 0x11

    .line 119
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setGravity(I)V

    const/high16 p1, 0x42200000    # 40.0f

    .line 120
    invoke-static {p0, p1}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setMinHeight(I)V

    const/high16 p1, 0x41400000    # 12.0f

    .line 121
    invoke-static {p0, p1}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v1

    invoke-static {p0, p1}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result p1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p1, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    const/high16 p1, 0x41a00000    # 20.0f

    .line 122
    invoke-static {p0, p1}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result p1

    int-to-float p1, p1

    const/4 v1, -0x1

    invoke-static {v1, p1}, Lcom/faultexception/reader/goals/Ui;->roundRect(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    const/4 v1, 0x0

    invoke-static {p0, v1, p1}, Lcom/faultexception/reader/goals/Ui;->ripple(Landroid/content/Context;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/RippleDrawable;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/4 p1, 0x1

    .line 123
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setClickable(Z)V

    if-eqz p2, :cond_0

    .line 125
    invoke-virtual {p0, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    const/high16 p2, 0x41900000    # 18.0f

    .line 126
    invoke-static {p0, p2}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result p2

    .line 127
    invoke-virtual {p1, v2, v2, p2, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 128
    invoke-static {p0}, Lcom/faultexception/reader/goals/Ui;->primary(Landroid/content/Context;)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 129
    invoke-virtual {v0, p1, v1, v1, v1}, Landroid/widget/TextView;->setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    const/high16 p1, 0x41000000    # 8.0f

    .line 130
    invoke-static {p0, p1}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result p0

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    :cond_0
    return-object v0
.end method

.method static textPrimary(Landroid/content/Context;)I
    .locals 2

    const v0, 0x1010036

    const/high16 v1, -0x1000000

    .line 59
    invoke-static {p0, v0, v1}, Lcom/faultexception/reader/goals/Ui;->themeColor(Landroid/content/Context;II)I

    move-result p0

    return p0
.end method

.method static textSecondary(Landroid/content/Context;)I
    .locals 2

    const v0, 0x1010038

    const v1, -0x777778

    .line 63
    invoke-static {p0, v0, v1}, Lcom/faultexception/reader/goals/Ui;->themeColor(Landroid/content/Context;II)I

    move-result p0

    return p0
.end method

.method static themeColor(Landroid/content/Context;II)I
    .locals 3

    .line 31
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 32
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result p1

    if-nez p1, :cond_0

    return p2

    .line 35
    :cond_0
    iget p1, v0, Landroid/util/TypedValue;->type:I

    const/16 v1, 0x1c

    if-lt p1, v1, :cond_1

    iget p1, v0, Landroid/util/TypedValue;->type:I

    const/16 v1, 0x1f

    if-gt p1, v1, :cond_1

    .line 36
    iget p0, v0, Landroid/util/TypedValue;->data:I

    return p0

    .line 38
    :cond_1
    iget p1, v0, Landroid/util/TypedValue;->resourceId:I

    if-eqz p1, :cond_2

    .line 40
    iget p1, v0, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {p0, p1}, Landroid/content/Context;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p0

    return p0

    :cond_2
    return p2
.end method

.method static themeResource(Landroid/content/Context;I)I
    .locals 2

    .line 46
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 47
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p0

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result p0

    if-eqz p0, :cond_0

    iget p0, v0, Landroid/util/TypedValue;->resourceId:I

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static title(Landroid/content/Context;Ljava/lang/CharSequence;)Landroid/widget/TextView;
    .locals 3

    .line 87
    invoke-static {p0}, Lcom/faultexception/reader/goals/Ui;->primary(Landroid/content/Context;)I

    move-result v0

    sget-object v1, Lcom/faultexception/reader/goals/Ui;->MEDIUM:Landroid/graphics/Typeface;

    const/high16 v2, 0x41700000    # 15.0f

    invoke-static {p0, v2, v0, v1}, Lcom/faultexception/reader/goals/Ui;->text(Landroid/content/Context;FILandroid/graphics/Typeface;)Landroid/widget/TextView;

    move-result-object p0

    .line 88
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-object p0
.end method

.method static withAlpha(IF)I
    .locals 2

    .line 72
    invoke-static {p0}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result p1

    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v0

    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v1

    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result p0

    invoke-static {p1, v0, v1, p0}, Landroid/graphics/Color;->argb(IIII)I

    move-result p0

    return p0
.end method
