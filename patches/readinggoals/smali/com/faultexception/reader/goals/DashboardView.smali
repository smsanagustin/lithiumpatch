.class final Lcom/faultexception/reader/goals/DashboardView;
.super Landroid/widget/LinearLayout;
.source "DashboardView.java"


# static fields
.field private static final SLOTS:I = 0x3


# instance fields
.field private continueBookId:J

.field private final continueCover:Lcom/faultexception/reader/goals/CoverView;

.field private final continueRow:Landroid/view/View;

.field private final continueTitle:Landroid/widget/TextView;

.field private final fragment:Lcom/faultexception/reader/BooksFragment;

.field private final recordText:Landroid/widget/TextView;

.field private final ring:Lcom/faultexception/reader/goals/ProgressRing;

.field private final slots:[Lcom/faultexception/reader/goals/CoverView;

.field private final streakText:Landroid/widget/TextView;

.field private final time:Landroid/widget/TextView;

.field private final timeGoal:Landroid/widget/TextView;

.field private final week:Lcom/faultexception/reader/goals/WeekStreakView;

.field private final yearCount:Landroid/widget/TextView;

.field private final yearSubtext:Landroid/widget/TextView;

.field private final yearText:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/faultexception/reader/BooksFragment;)V
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 50
    invoke-direct/range {p0 .. p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const-wide/16 v2, -0x1

    .line 40
    iput-wide v2, v0, Lcom/faultexception/reader/goals/DashboardView;->continueBookId:J

    const/4 v2, 0x3

    new-array v3, v2, [Lcom/faultexception/reader/goals/CoverView;

    .line 46
    iput-object v3, v0, Lcom/faultexception/reader/goals/DashboardView;->slots:[Lcom/faultexception/reader/goals/CoverView;

    move-object/from16 v3, p2

    .line 51
    iput-object v3, v0, Lcom/faultexception/reader/goals/DashboardView;->fragment:Lcom/faultexception/reader/BooksFragment;

    const/4 v3, 0x1

    .line 52
    invoke-virtual {v0, v3}, Lcom/faultexception/reader/goals/DashboardView;->setOrientation(I)V

    const/16 v4, 0x8

    const/16 v5, 0x14

    .line 55
    invoke-direct {v0, v1, v5, v4}, Lcom/faultexception/reader/goals/DashboardView;->section(Landroid/content/Context;II)Landroid/widget/LinearLayout;

    move-result-object v4

    const-string v6, "Today\'s reading"

    .line 56
    invoke-static {v1, v6}, Lcom/faultexception/reader/goals/Ui;->title(Landroid/content/Context;Ljava/lang/CharSequence;)Landroid/widget/TextView;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 57
    invoke-static/range {p1 .. p1}, Lcom/faultexception/reader/goals/Ui;->textSecondary(Landroid/content/Context;)I

    move-result v6

    const/high16 v7, 0x41600000    # 14.0f

    const/4 v8, 0x0

    invoke-static {v1, v7, v6, v8}, Lcom/faultexception/reader/goals/Ui;->text(Landroid/content/Context;FILandroid/graphics/Typeface;)Landroid/widget/TextView;

    move-result-object v6

    const-string v9, "Read every day, see your stats soar, and finish more books."

    .line 58
    invoke-virtual {v6, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v9, 0x4

    const/4 v10, 0x0

    .line 59
    invoke-direct {v0, v9, v10}, Lcom/faultexception/reader/goals/DashboardView;->margins(II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v11

    invoke-virtual {v4, v6, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 61
    new-instance v6, Landroid/widget/FrameLayout;

    invoke-direct {v6, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 62
    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v12, 0x43480000    # 200.0f

    invoke-static {v1, v12}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v13

    invoke-static {v1, v12}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v12

    invoke-direct {v11, v13, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 63
    iput v3, v11, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    const/high16 v12, 0x41c00000    # 24.0f

    .line 64
    invoke-static {v1, v12}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v12

    iput v12, v11, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 65
    invoke-virtual {v4, v6, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 66
    new-instance v11, Lcom/faultexception/reader/goals/ProgressRing;

    const/high16 v12, 0x41200000    # 10.0f

    invoke-direct {v11, v1, v12}, Lcom/faultexception/reader/goals/ProgressRing;-><init>(Landroid/content/Context;F)V

    iput-object v11, v0, Lcom/faultexception/reader/goals/DashboardView;->ring:Lcom/faultexception/reader/goals/ProgressRing;

    .line 67
    new-instance v12, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v13, -0x1

    invoke-direct {v12, v13, v13}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v11, v12}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 68
    new-instance v11, Landroid/widget/LinearLayout;

    invoke-direct {v11, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 69
    invoke-virtual {v11, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 70
    invoke-virtual {v11, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 71
    invoke-static/range {p1 .. p1}, Lcom/faultexception/reader/goals/Ui;->textPrimary(Landroid/content/Context;)I

    move-result v12

    sget-object v14, Lcom/faultexception/reader/goals/Ui;->LIGHT:Landroid/graphics/Typeface;

    const/high16 v15, 0x42500000    # 52.0f

    invoke-static {v1, v15, v12, v14}, Lcom/faultexception/reader/goals/Ui;->text(Landroid/content/Context;FILandroid/graphics/Typeface;)Landroid/widget/TextView;

    move-result-object v12

    iput-object v12, v0, Lcom/faultexception/reader/goals/DashboardView;->time:Landroid/widget/TextView;

    .line 72
    invoke-virtual {v12, v3}, Landroid/widget/TextView;->setGravity(I)V

    .line 73
    invoke-static/range {p1 .. p1}, Lcom/faultexception/reader/goals/Ui;->textSecondary(Landroid/content/Context;)I

    move-result v14

    const/high16 v15, 0x41700000    # 15.0f

    invoke-static {v1, v15, v14, v8}, Lcom/faultexception/reader/goals/Ui;->text(Landroid/content/Context;FILandroid/graphics/Typeface;)Landroid/widget/TextView;

    move-result-object v14

    iput-object v14, v0, Lcom/faultexception/reader/goals/DashboardView;->timeGoal:Landroid/widget/TextView;

    .line 74
    invoke-virtual {v14, v3}, Landroid/widget/TextView;->setGravity(I)V

    .line 75
    invoke-virtual {v11, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 76
    invoke-virtual {v11, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 77
    new-instance v12, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v14, 0x11

    const/4 v2, -0x2

    invoke-direct {v12, v2, v2, v14}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v6, v11, v12}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v6, "Change daily goal"

    .line 79
    sget v11, Lcom/faultexception/reader/R$drawable;->goals_ic_edit:I

    invoke-static {v1, v6, v11}, Lcom/faultexception/reader/goals/Ui;->textButton(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/TextView;

    move-result-object v6

    .line 80
    new-instance v11, Lcom/faultexception/reader/goals/DashboardView$$ExternalSyntheticLambda4;

    invoke-direct {v11, v0}, Lcom/faultexception/reader/goals/DashboardView$$ExternalSyntheticLambda4;-><init>(Lcom/faultexception/reader/goals/DashboardView;)V

    invoke-virtual {v6, v11}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/16 v11, 0x10

    .line 81
    invoke-direct {v0, v11}, Lcom/faultexception/reader/goals/DashboardView;->centered(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v12

    invoke-virtual {v4, v6, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 82
    invoke-virtual {v0, v4}, Lcom/faultexception/reader/goals/DashboardView;->addView(Landroid/view/View;)V

    .line 85
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 86
    iput-object v4, v0, Lcom/faultexception/reader/goals/DashboardView;->continueRow:Landroid/view/View;

    .line 87
    invoke-virtual {v4, v10}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 88
    invoke-virtual {v4, v11}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/high16 v6, 0x41800000    # 16.0f

    .line 89
    invoke-static {v1, v6}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v12

    const/high16 v14, 0x41400000    # 12.0f

    invoke-static {v1, v14}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v15

    invoke-static {v1, v6}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v9

    invoke-static {v1, v14}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v7

    invoke-virtual {v4, v12, v15, v9, v7}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 90
    new-instance v7, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v7, v13}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-static {v1, v8, v7}, Lcom/faultexception/reader/goals/Ui;->ripple(Landroid/content/Context;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/RippleDrawable;

    move-result-object v7

    invoke-virtual {v4, v7}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 91
    new-instance v7, Lcom/faultexception/reader/goals/DashboardView$$ExternalSyntheticLambda5;

    invoke-direct {v7, v0}, Lcom/faultexception/reader/goals/DashboardView$$ExternalSyntheticLambda5;-><init>(Lcom/faultexception/reader/goals/DashboardView;)V

    invoke-virtual {v4, v7}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 92
    new-instance v7, Lcom/faultexception/reader/goals/CoverView;

    const/high16 v9, 0x40800000    # 4.0f

    invoke-direct {v7, v1, v9, v10}, Lcom/faultexception/reader/goals/CoverView;-><init>(Landroid/content/Context;FZ)V

    iput-object v7, v0, Lcom/faultexception/reader/goals/DashboardView;->continueCover:Lcom/faultexception/reader/goals/CoverView;

    .line 93
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v12, 0x42300000    # 44.0f

    invoke-static {v1, v12}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v12

    const/high16 v13, 0x42800000    # 64.0f

    invoke-static {v1, v13}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v13

    invoke-direct {v9, v12, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v7, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 94
    new-instance v7, Landroid/widget/LinearLayout;

    invoke-direct {v7, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 95
    invoke-virtual {v7, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 96
    invoke-static/range {p1 .. p1}, Lcom/faultexception/reader/goals/Ui;->textSecondary(Landroid/content/Context;)I

    move-result v9

    sget-object v12, Lcom/faultexception/reader/goals/Ui;->MEDIUM:Landroid/graphics/Typeface;

    const/high16 v13, 0x41500000    # 13.0f

    invoke-static {v1, v13, v9, v12}, Lcom/faultexception/reader/goals/Ui;->text(Landroid/content/Context;FILandroid/graphics/Typeface;)Landroid/widget/TextView;

    move-result-object v9

    const-string v12, "Continue reading"

    .line 97
    invoke-virtual {v9, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    invoke-virtual {v7, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 99
    invoke-static/range {p1 .. p1}, Lcom/faultexception/reader/goals/Ui;->textPrimary(Landroid/content/Context;)I

    move-result v9

    const/high16 v12, 0x41900000    # 18.0f

    invoke-static {v1, v12, v9, v8}, Lcom/faultexception/reader/goals/Ui;->text(Landroid/content/Context;FILandroid/graphics/Typeface;)Landroid/widget/TextView;

    move-result-object v9

    iput-object v9, v0, Lcom/faultexception/reader/goals/DashboardView;->continueTitle:Landroid/widget/TextView;

    .line 100
    invoke-virtual {v9, v3}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 101
    sget-object v13, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v9, v13}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 102
    invoke-virtual {v7, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 103
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v13, 0x3f800000    # 1.0f

    invoke-direct {v9, v10, v2, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 104
    invoke-static {v1, v6}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v15

    invoke-virtual {v9, v15}, Landroid/widget/LinearLayout$LayoutParams;->setMarginStart(I)V

    .line 105
    invoke-static {v1, v6}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v15

    invoke-virtual {v9, v15}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 106
    invoke-virtual {v4, v7, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 107
    new-instance v7, Landroid/widget/ImageView;

    invoke-direct {v7, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 108
    sget v9, Lcom/faultexception/reader/R$drawable;->goals_ic_book:I

    invoke-virtual {v7, v9}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 109
    invoke-static/range {p1 .. p1}, Lcom/faultexception/reader/goals/Ui;->onPrimary(Landroid/content/Context;)I

    move-result v9

    invoke-static {v9}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v9

    invoke-virtual {v7, v9}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    .line 110
    sget-object v9, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v7, v9}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 111
    invoke-static/range {p1 .. p1}, Lcom/faultexception/reader/goals/Ui;->primary(Landroid/content/Context;)I

    move-result v9

    invoke-static {v9, v10, v10}, Lcom/faultexception/reader/goals/Ui;->circle(III)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v9

    invoke-static {v1, v9, v8}, Lcom/faultexception/reader/goals/Ui;->ripple(Landroid/content/Context;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/RippleDrawable;

    move-result-object v9

    invoke-virtual {v7, v9}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const-string v9, "Open book"

    .line 112
    invoke-virtual {v7, v9}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 113
    new-instance v9, Lcom/faultexception/reader/goals/DashboardView$$ExternalSyntheticLambda6;

    invoke-direct {v9, v0}, Lcom/faultexception/reader/goals/DashboardView$$ExternalSyntheticLambda6;-><init>(Lcom/faultexception/reader/goals/DashboardView;)V

    invoke-virtual {v7, v9}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 114
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v15, 0x42600000    # 56.0f

    invoke-static {v1, v15}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v6

    invoke-static {v1, v15}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v15

    invoke-direct {v9, v6, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v7, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 115
    invoke-virtual {v0, v4}, Lcom/faultexception/reader/goals/DashboardView;->addView(Landroid/view/View;)V

    .line 118
    invoke-direct/range {p0 .. p1}, Lcom/faultexception/reader/goals/DashboardView;->divider(Landroid/content/Context;)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/faultexception/reader/goals/DashboardView;->addView(Landroid/view/View;)V

    .line 119
    invoke-direct {v0, v1, v5, v5}, Lcom/faultexception/reader/goals/DashboardView;->section(Landroid/content/Context;II)Landroid/widget/LinearLayout;

    move-result-object v4

    const-string v6, "Reading streak"

    .line 120
    invoke-static {v1, v6}, Lcom/faultexception/reader/goals/Ui;->title(Landroid/content/Context;Ljava/lang/CharSequence;)Landroid/widget/TextView;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 121
    new-instance v6, Lcom/faultexception/reader/goals/WeekStreakView;

    invoke-direct {v6, v1}, Lcom/faultexception/reader/goals/WeekStreakView;-><init>(Landroid/content/Context;)V

    iput-object v6, v0, Lcom/faultexception/reader/goals/DashboardView;->week:Lcom/faultexception/reader/goals/WeekStreakView;

    .line 122
    invoke-direct {v0, v11, v10}, Lcom/faultexception/reader/goals/DashboardView;->margins(II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 123
    invoke-static/range {p1 .. p1}, Lcom/faultexception/reader/goals/Ui;->textPrimary(Landroid/content/Context;)I

    move-result v6

    invoke-static {v1, v12, v6, v8}, Lcom/faultexception/reader/goals/Ui;->text(Landroid/content/Context;FILandroid/graphics/Typeface;)Landroid/widget/TextView;

    move-result-object v6

    iput-object v6, v0, Lcom/faultexception/reader/goals/DashboardView;->streakText:Landroid/widget/TextView;

    .line 124
    invoke-direct {v0, v11, v10}, Lcom/faultexception/reader/goals/DashboardView;->margins(II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 125
    invoke-static/range {p1 .. p1}, Lcom/faultexception/reader/goals/Ui;->textSecondary(Landroid/content/Context;)I

    move-result v6

    const/high16 v7, 0x41600000    # 14.0f

    invoke-static {v1, v7, v6, v8}, Lcom/faultexception/reader/goals/Ui;->text(Landroid/content/Context;FILandroid/graphics/Typeface;)Landroid/widget/TextView;

    move-result-object v6

    iput-object v6, v0, Lcom/faultexception/reader/goals/DashboardView;->recordText:Landroid/widget/TextView;

    const/4 v7, 0x4

    .line 126
    invoke-direct {v0, v7, v10}, Lcom/faultexception/reader/goals/DashboardView;->margins(II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v9

    invoke-virtual {v4, v6, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 127
    invoke-virtual {v0, v4}, Lcom/faultexception/reader/goals/DashboardView;->addView(Landroid/view/View;)V

    .line 130
    invoke-direct/range {p0 .. p1}, Lcom/faultexception/reader/goals/DashboardView;->divider(Landroid/content/Context;)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/faultexception/reader/goals/DashboardView;->addView(Landroid/view/View;)V

    const/16 v4, 0xc

    .line 131
    invoke-direct {v0, v1, v5, v4}, Lcom/faultexception/reader/goals/DashboardView;->section(Landroid/content/Context;II)Landroid/widget/LinearLayout;

    move-result-object v6

    .line 132
    new-instance v7, Landroid/widget/LinearLayout;

    invoke-direct {v7, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 133
    invoke-virtual {v7, v10}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 134
    invoke-virtual {v7, v11}, Landroid/widget/LinearLayout;->setGravity(I)V

    const-string v9, "Books read this year"

    .line 135
    invoke-static {v1, v9}, Lcom/faultexception/reader/goals/Ui;->title(Landroid/content/Context;Ljava/lang/CharSequence;)Landroid/widget/TextView;

    move-result-object v9

    new-instance v15, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v15, v10, v2, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v7, v9, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 136
    invoke-static/range {p1 .. p1}, Lcom/faultexception/reader/goals/Ui;->textSecondary(Landroid/content/Context;)I

    move-result v9

    sget-object v15, Lcom/faultexception/reader/goals/Ui;->MEDIUM:Landroid/graphics/Typeface;

    const/high16 v5, 0x41700000    # 15.0f

    invoke-static {v1, v5, v9, v15}, Lcom/faultexception/reader/goals/Ui;->text(Landroid/content/Context;FILandroid/graphics/Typeface;)Landroid/widget/TextView;

    move-result-object v5

    iput-object v5, v0, Lcom/faultexception/reader/goals/DashboardView;->yearCount:Landroid/widget/TextView;

    .line 137
    invoke-virtual {v7, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 138
    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 139
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 140
    invoke-virtual {v5, v10}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 141
    invoke-virtual {v5, v10}, Landroid/widget/LinearLayout;->setClipChildren(Z)V

    .line 142
    invoke-virtual {v6, v10}, Landroid/widget/LinearLayout;->setClipChildren(Z)V

    move v7, v10

    :goto_0
    const/4 v9, 0x3

    if-ge v7, v9, :cond_1

    .line 144
    iget-object v15, v0, Lcom/faultexception/reader/goals/DashboardView;->slots:[Lcom/faultexception/reader/goals/CoverView;

    new-instance v9, Lcom/faultexception/reader/goals/CoverView;

    invoke-direct {v9, v1, v14, v3}, Lcom/faultexception/reader/goals/CoverView;-><init>(Landroid/content/Context;FZ)V

    aput-object v9, v15, v7

    .line 145
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v9, v10, v2, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    const/high16 v15, 0x41800000    # 16.0f

    if-eqz v7, :cond_0

    .line 147
    invoke-static {v1, v15}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v2

    invoke-virtual {v9, v2}, Landroid/widget/LinearLayout$LayoutParams;->setMarginStart(I)V

    .line 149
    :cond_0
    iget-object v2, v0, Lcom/faultexception/reader/goals/DashboardView;->slots:[Lcom/faultexception/reader/goals/CoverView;

    aget-object v2, v2, v7

    invoke-virtual {v5, v2, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v7, v7, 0x1

    const/4 v2, -0x2

    goto :goto_0

    .line 151
    :cond_1
    invoke-direct {v0, v11, v10}, Lcom/faultexception/reader/goals/DashboardView;->margins(II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v6, v5, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 152
    invoke-static/range {p1 .. p1}, Lcom/faultexception/reader/goals/Ui;->textPrimary(Landroid/content/Context;)I

    move-result v2

    invoke-static {v1, v12, v2, v8}, Lcom/faultexception/reader/goals/Ui;->text(Landroid/content/Context;FILandroid/graphics/Typeface;)Landroid/widget/TextView;

    move-result-object v2

    iput-object v2, v0, Lcom/faultexception/reader/goals/DashboardView;->yearText:Landroid/widget/TextView;

    .line 153
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setGravity(I)V

    const/16 v5, 0x18

    .line 154
    invoke-direct {v0, v5, v10}, Lcom/faultexception/reader/goals/DashboardView;->margins(II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v5

    invoke-virtual {v6, v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 155
    invoke-static/range {p1 .. p1}, Lcom/faultexception/reader/goals/Ui;->textSecondary(Landroid/content/Context;)I

    move-result v2

    const/high16 v5, 0x41600000    # 14.0f

    invoke-static {v1, v5, v2, v8}, Lcom/faultexception/reader/goals/Ui;->text(Landroid/content/Context;FILandroid/graphics/Typeface;)Landroid/widget/TextView;

    move-result-object v2

    iput-object v2, v0, Lcom/faultexception/reader/goals/DashboardView;->yearSubtext:Landroid/widget/TextView;

    .line 156
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setGravity(I)V

    const/4 v3, 0x4

    .line 157
    invoke-direct {v0, v3, v10}, Lcom/faultexception/reader/goals/DashboardView;->margins(II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v5

    invoke-virtual {v6, v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v2, "Change yearly goal"

    .line 158
    sget v3, Lcom/faultexception/reader/R$drawable;->goals_ic_edit:I

    invoke-static {v1, v2, v3}, Lcom/faultexception/reader/goals/Ui;->textButton(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/TextView;

    move-result-object v2

    .line 159
    new-instance v3, Lcom/faultexception/reader/goals/DashboardView$$ExternalSyntheticLambda7;

    invoke-direct {v3, v0}, Lcom/faultexception/reader/goals/DashboardView$$ExternalSyntheticLambda7;-><init>(Lcom/faultexception/reader/goals/DashboardView;)V

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 160
    invoke-direct {v0, v4}, Lcom/faultexception/reader/goals/DashboardView;->centered(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v3

    invoke-virtual {v6, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 161
    invoke-virtual {v0, v6}, Lcom/faultexception/reader/goals/DashboardView;->addView(Landroid/view/View;)V

    .line 164
    invoke-direct/range {p0 .. p1}, Lcom/faultexception/reader/goals/DashboardView;->divider(Landroid/content/Context;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/faultexception/reader/goals/DashboardView;->addView(Landroid/view/View;)V

    const/16 v2, 0x14

    const/4 v3, 0x4

    .line 165
    invoke-direct {v0, v1, v2, v3}, Lcom/faultexception/reader/goals/DashboardView;->section(Landroid/content/Context;II)Landroid/widget/LinearLayout;

    move-result-object v2

    const-string v3, "All books"

    .line 166
    invoke-static {v1, v3}, Lcom/faultexception/reader/goals/Ui;->title(Landroid/content/Context;Ljava/lang/CharSequence;)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 167
    invoke-virtual {v0, v2}, Lcom/faultexception/reader/goals/DashboardView;->addView(Landroid/view/View;)V

    return-void
.end method

.method private static bold(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 3

    .line 280
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0, p0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 281
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p0

    .line 282
    invoke-virtual {v0, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 283
    new-instance p1, Landroid/text/style/StyleSpan;

    const/4 v1, 0x1

    invoke-direct {p1, v1}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v1

    const/16 v2, 0x21

    invoke-virtual {v0, p1, p0, v1, v2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 284
    invoke-virtual {v0, p2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    return-object v0
.end method

.method private static bookExists(Landroid/content/Context;J)Z
    .locals 0

    .line 265
    invoke-static {p0}, Lcom/faultexception/reader/db/DatabaseProvider;->getDatabase(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    const-string p2, "SELECT 1 FROM books WHERE _id = ?"

    invoke-virtual {p0, p2, p1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    .line 266
    :try_start_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p0, :cond_0

    .line 267
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_0
    return p1

    :catchall_0
    move-exception p1

    if-eqz p0, :cond_1

    .line 265
    :try_start_1
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception p0

    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    throw p1
.end method

.method private centered(I)Landroid/widget/LinearLayout$LayoutParams;
    .locals 2

    .line 310
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v1, 0x1

    .line 311
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 312
    invoke-virtual {p0}, Lcom/faultexception/reader/goals/DashboardView;->getContext()Landroid/content/Context;

    move-result-object v1

    int-to-float p1, p1

    invoke-static {v1, p1}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result p1

    iput p1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    return-object v0
.end method

.method private static coverPath(Landroid/content/Context;J)Ljava/lang/String;
    .locals 0

    .line 259
    invoke-static {p0}, Lcom/faultexception/reader/db/DatabaseProvider;->getDatabase(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    const-string p2, "SELECT cover FROM books WHERE _id = ?"

    invoke-virtual {p0, p2, p1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    .line 260
    :try_start_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    invoke-interface {p0, p1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    if-eqz p0, :cond_1

    .line 261
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_1
    return-object p1

    :catchall_0
    move-exception p1

    if-eqz p0, :cond_2

    .line 259
    :try_start_1
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception p0

    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_2
    :goto_1
    throw p1
.end method

.method private divider(Landroid/content/Context;)Landroid/view/View;
    .locals 3

    .line 296
    new-instance v0, Landroid/view/View;

    invoke-direct {v0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const v1, 0x3df5c28f    # 0.12f

    .line 297
    invoke-static {p1, v1}, Lcom/faultexception/reader/goals/Ui;->subtle(Landroid/content/Context;F)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 298
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {p1, v2}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result p1

    const/4 v2, 0x1

    invoke-static {v2, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    const/4 v2, -0x1

    invoke-direct {v1, v2, p1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method private editDailyGoal()V
    .locals 9

    .line 235
    invoke-virtual {p0}, Lcom/faultexception/reader/goals/DashboardView;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Daily reading goal"

    const-string v2, "Choose how many minutes you want to read each day."

    const-string v3, "minute a day"

    const-string v4, "minutes a day"

    invoke-virtual {p0}, Lcom/faultexception/reader/goals/DashboardView;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/faultexception/reader/goals/ReadingGoals;->getDailyGoalMinutes(Landroid/content/Context;)I

    move-result v5

    const/4 v6, 0x1

    const/16 v7, 0x2d0

    new-instance v8, Lcom/faultexception/reader/goals/DashboardView$$ExternalSyntheticLambda2;

    invoke-direct {v8, p0}, Lcom/faultexception/reader/goals/DashboardView$$ExternalSyntheticLambda2;-><init>(Lcom/faultexception/reader/goals/DashboardView;)V

    invoke-static/range {v0 .. v8}, Lcom/faultexception/reader/goals/GoalSheet;->show(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIILjava/util/function/IntConsumer;)V

    return-void
.end method

.method private editYearlyGoal()V
    .locals 9

    .line 242
    invoke-virtual {p0}, Lcom/faultexception/reader/goals/DashboardView;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Yearly reading goal"

    const-string v2, "Choose how many books you want to finish this year."

    const-string v3, "book a year"

    const-string v4, "books a year"

    invoke-virtual {p0}, Lcom/faultexception/reader/goals/DashboardView;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/faultexception/reader/goals/ReadingGoals;->getYearlyGoalBooks(Landroid/content/Context;)I

    move-result v5

    const/4 v6, 0x1

    const/16 v7, 0x16d

    new-instance v8, Lcom/faultexception/reader/goals/DashboardView$$ExternalSyntheticLambda3;

    invoke-direct {v8, p0}, Lcom/faultexception/reader/goals/DashboardView$$ExternalSyntheticLambda3;-><init>(Lcom/faultexception/reader/goals/DashboardView;)V

    invoke-static/range {v0 .. v8}, Lcom/faultexception/reader/goals/GoalSheet;->show(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIILjava/util/function/IntConsumer;)V

    return-void
.end method

.method static formatDuration(J)Ljava/lang/String;
    .locals 5

    const-wide/16 v0, 0x3e8

    .line 272
    div-long/2addr p0, v0

    const-wide/16 v0, 0xe10

    cmp-long v2, p0, v0

    const-wide/16 v3, 0x3c

    if-ltz v2, :cond_0

    .line 274
    div-long v0, p0, v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    div-long v1, p0, v3

    rem-long/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    rem-long/2addr p0, v3

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    filled-new-array {v0, v1, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "%d:%02d:%02d"

    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 276
    :cond_0
    div-long v0, p0, v3

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    rem-long/2addr p0, v3

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    filled-new-array {v0, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "%d:%02d"

    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private margins(II)Landroid/widget/LinearLayout$LayoutParams;
    .locals 3

    .line 303
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 304
    invoke-virtual {p0}, Lcom/faultexception/reader/goals/DashboardView;->getContext()Landroid/content/Context;

    move-result-object v1

    int-to-float p1, p1

    invoke-static {v1, p1}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result p1

    iput p1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 305
    invoke-virtual {p0}, Lcom/faultexception/reader/goals/DashboardView;->getContext()Landroid/content/Context;

    move-result-object p1

    int-to-float p2, p2

    invoke-static {p1, p2}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result p1

    iput p1, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    return-object v0
.end method

.method private openBook(Landroid/view/View;J)V
    .locals 2

    const-wide/16 v0, -0x1

    cmp-long v0, p2, v0

    if-eqz v0, :cond_2

    .line 249
    iget-object v0, p0, Lcom/faultexception/reader/goals/DashboardView;->fragment:Lcom/faultexception/reader/BooksFragment;

    invoke-virtual {v0}, Lcom/faultexception/reader/BooksFragment;->isAdded()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 252
    :cond_0
    invoke-virtual {p0}, Lcom/faultexception/reader/goals/DashboardView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p2, p3}, Lcom/faultexception/reader/goals/DashboardView;->bookExists(Landroid/content/Context;J)Z

    move-result v0

    if-nez v0, :cond_1

    return-void

    .line 255
    :cond_1
    iget-object v0, p0, Lcom/faultexception/reader/goals/DashboardView;->fragment:Lcom/faultexception/reader/BooksFragment;

    invoke-virtual {v0, p1, p2, p3}, Lcom/faultexception/reader/BooksFragment;->onItemClick(Landroid/view/View;J)V

    :cond_2
    :goto_0
    return-void
.end method

.method private section(Landroid/content/Context;II)Landroid/widget/LinearLayout;
    .locals 3

    .line 289
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    .line 290
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v1, 0x41800000    # 16.0f

    .line 291
    invoke-static {p1, v1}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v2

    int-to-float p2, p2

    invoke-static {p1, p2}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result p2

    invoke-static {p1, v1}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v1

    int-to-float p3, p3

    invoke-static {p1, p3}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result p1

    invoke-virtual {v0, v2, p2, v1, p1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    return-object v0
.end method


# virtual methods
.method bind()V
    .locals 14

    .line 171
    invoke-virtual {p0}, Lcom/faultexception/reader/goals/DashboardView;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 172
    iget-object v1, p0, Lcom/faultexception/reader/goals/DashboardView;->fragment:Lcom/faultexception/reader/BooksFragment;

    invoke-virtual {v1}, Lcom/faultexception/reader/BooksFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    .line 173
    invoke-static {}, Ljava/time/LocalDate;->now()Ljava/time/LocalDate;

    move-result-object v2

    .line 175
    invoke-static {v0, v2}, Lcom/faultexception/reader/goals/ReadingGoals;->getReadMs(Landroid/content/Context;Ljava/time/LocalDate;)J

    move-result-wide v3

    .line 176
    invoke-static {v0}, Lcom/faultexception/reader/goals/ReadingGoals;->getDailyGoalMinutes(Landroid/content/Context;)I

    move-result v5

    long-to-float v6, v3

    int-to-float v7, v5

    const v8, 0x476a6000    # 60000.0f

    mul-float/2addr v7, v8

    div-float/2addr v6, v7

    .line 178
    iget-object v7, p0, Lcom/faultexception/reader/goals/DashboardView;->ring:Lcom/faultexception/reader/goals/ProgressRing;

    invoke-virtual {v7, v6}, Lcom/faultexception/reader/goals/ProgressRing;->setProgress(F)V

    .line 179
    iget-object v7, p0, Lcom/faultexception/reader/goals/DashboardView;->time:Landroid/widget/TextView;

    invoke-static {v3, v4}, Lcom/faultexception/reader/goals/DashboardView;->formatDuration(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 180
    iget-object v7, p0, Lcom/faultexception/reader/goals/DashboardView;->timeGoal:Landroid/widget/TextView;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "of "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, " min"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 181
    iget-object v7, p0, Lcom/faultexception/reader/goals/DashboardView;->ring:Lcom/faultexception/reader/goals/ProgressRing;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Read "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-wide/32 v9, 0xea60

    div-long/2addr v3, v9

    invoke-virtual {v8, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, " of "

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " minutes today"

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v7, v4}, Lcom/faultexception/reader/goals/ProgressRing;->setContentDescription(Ljava/lang/CharSequence;)V

    const-wide/16 v4, -0x1

    .line 183
    iput-wide v4, p0, Lcom/faultexception/reader/goals/DashboardView;->continueBookId:J

    .line 184
    invoke-static {v0}, Lcom/faultexception/reader/db/DatabaseProvider;->getDatabase(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v7

    const-string v8, "SELECT _id, title, cover FROM books WHERE last_open_date > 0 AND hidden = 0 ORDER BY last_open_date DESC LIMIT 1"

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 185
    :try_start_0
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v8

    const/4 v9, 0x1

    const/4 v10, 0x0

    if-eqz v8, :cond_0

    .line 186
    invoke-interface {v7, v10}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v11

    iput-wide v11, p0, Lcom/faultexception/reader/goals/DashboardView;->continueBookId:J

    .line 187
    iget-object v8, p0, Lcom/faultexception/reader/goals/DashboardView;->continueTitle:Landroid/widget/TextView;

    invoke-interface {v7, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 188
    iget-object v8, p0, Lcom/faultexception/reader/goals/DashboardView;->continueCover:Lcom/faultexception/reader/goals/CoverView;

    const/4 v11, 0x2

    invoke-interface {v7, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-interface {v7, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v8, v1, v11, v12, v10}, Lcom/faultexception/reader/goals/CoverView;->showBook(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    if-eqz v7, :cond_1

    .line 190
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 191
    :cond_1
    iget-object v7, p0, Lcom/faultexception/reader/goals/DashboardView;->continueRow:Landroid/view/View;

    iget-wide v11, p0, Lcom/faultexception/reader/goals/DashboardView;->continueBookId:J

    cmp-long v4, v11, v4

    const/16 v5, 0x8

    if-eqz v4, :cond_2

    move v4, v10

    goto :goto_0

    :cond_2
    move v4, v5

    :goto_0
    invoke-virtual {v7, v4}, Landroid/view/View;->setVisibility(I)V

    .line 193
    invoke-static {v0}, Lcom/faultexception/reader/goals/ReadingGoals;->getMetDays(Landroid/content/Context;)Ljava/util/TreeSet;

    move-result-object v4

    .line 194
    invoke-static {v4, v2}, Lcom/faultexception/reader/goals/ReadingGoals;->getCurrentStreak(Ljava/util/Set;Ljava/time/LocalDate;)I

    move-result v7

    .line 195
    invoke-static {v4}, Lcom/faultexception/reader/goals/ReadingGoals;->getRecordStreak(Ljava/util/TreeSet;)I

    move-result v8

    .line 196
    iget-object v11, p0, Lcom/faultexception/reader/goals/DashboardView;->week:Lcom/faultexception/reader/goals/WeekStreakView;

    invoke-virtual {v11, v2, v4, v6}, Lcom/faultexception/reader/goals/WeekStreakView;->bind(Ljava/time/LocalDate;Ljava/util/Set;F)V

    if-nez v7, :cond_3

    .line 198
    iget-object v4, p0, Lcom/faultexception/reader/goals/DashboardView;->streakText:Landroid/widget/TextView;

    const-string v6, "Start a new reading streak"

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 199
    :cond_3
    invoke-virtual {v4, v2}, Ljava/util/TreeSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    const-string v6, " reading streak"

    const-string v11, "-day"

    if-eqz v4, :cond_4

    .line 200
    iget-object v4, p0, Lcom/faultexception/reader/goals/DashboardView;->streakText:Landroid/widget/TextView;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v11, "You\'re on a "

    invoke-static {v11, v7, v6}, Lcom/faultexception/reader/goals/DashboardView;->bold(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 202
    :cond_4
    iget-object v4, p0, Lcom/faultexception/reader/goals/DashboardView;->streakText:Landroid/widget/TextView;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v11, "Extend your "

    invoke-static {v11, v7, v6}, Lcom/faultexception/reader/goals/DashboardView;->bold(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 204
    :goto_1
    iget-object v4, p0, Lcom/faultexception/reader/goals/DashboardView;->recordText:Landroid/widget/TextView;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Record: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "day"

    const-string v11, "days"

    invoke-static {v8, v7, v11}, Lcom/faultexception/reader/goals/Ui;->plural(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 205
    iget-object v4, p0, Lcom/faultexception/reader/goals/DashboardView;->recordText:Landroid/widget/TextView;

    if-eqz v8, :cond_5

    move v5, v10

    :cond_5
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 207
    invoke-static {v0}, Lcom/faultexception/reader/goals/ReadingGoals;->getYearlyGoalBooks(Landroid/content/Context;)I

    move-result v4

    .line 208
    invoke-virtual {v2}, Ljava/time/LocalDate;->getYear()I

    move-result v2

    invoke-static {v0, v2}, Lcom/faultexception/reader/goals/FinishedBooks;->list(Landroid/content/Context;I)Ljava/util/List;

    move-result-object v2

    .line 209
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    .line 210
    iget-object v6, p0, Lcom/faultexception/reader/goals/DashboardView;->yearCount:Landroid/widget/TextView;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 211
    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v3

    const/4 v6, 0x3

    invoke-static {v6, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    move v7, v10

    :goto_2
    if-ge v7, v6, :cond_8

    .line 213
    iget-object v8, p0, Lcom/faultexception/reader/goals/DashboardView;->slots:[Lcom/faultexception/reader/goals/CoverView;

    aget-object v8, v8, v7

    if-ge v7, v3, :cond_6

    move v11, v10

    goto :goto_3

    :cond_6
    const/4 v11, 0x4

    .line 214
    :goto_3
    invoke-virtual {v8, v11}, Lcom/faultexception/reader/goals/CoverView;->setVisibility(I)V

    if-ge v7, v5, :cond_7

    .line 216
    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/faultexception/reader/goals/FinishedBooks$Book;

    .line 217
    iget-wide v12, v11, Lcom/faultexception/reader/goals/FinishedBooks$Book;->id:J

    invoke-static {v0, v12, v13}, Lcom/faultexception/reader/goals/DashboardView;->coverPath(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v12

    iget-object v13, v11, Lcom/faultexception/reader/goals/FinishedBooks$Book;->title:Ljava/lang/String;

    invoke-virtual {v8, v1, v12, v13, v9}, Lcom/faultexception/reader/goals/CoverView;->showBook(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 218
    new-instance v12, Lcom/faultexception/reader/goals/DashboardView$$ExternalSyntheticLambda0;

    invoke-direct {v12, p0, v11}, Lcom/faultexception/reader/goals/DashboardView$$ExternalSyntheticLambda0;-><init>(Lcom/faultexception/reader/goals/DashboardView;Lcom/faultexception/reader/goals/FinishedBooks$Book;)V

    invoke-virtual {v8, v12}, Lcom/faultexception/reader/goals/CoverView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_4

    :cond_7
    add-int/lit8 v11, v7, 0x1

    .line 220
    invoke-virtual {v8, v1, v11}, Lcom/faultexception/reader/goals/CoverView;->showPlaceholder(Landroid/app/Activity;I)V

    .line 221
    new-instance v11, Lcom/faultexception/reader/goals/DashboardView$$ExternalSyntheticLambda1;

    invoke-direct {v11, p0}, Lcom/faultexception/reader/goals/DashboardView$$ExternalSyntheticLambda1;-><init>(Lcom/faultexception/reader/goals/DashboardView;)V

    invoke-virtual {v8, v11}, Lcom/faultexception/reader/goals/CoverView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :goto_4
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    :cond_8
    const-string v0, ""

    if-ge v5, v4, :cond_9

    sub-int/2addr v4, v5

    .line 226
    iget-object v1, p0, Lcom/faultexception/reader/goals/DashboardView;->yearText:Landroid/widget/TextView;

    const-string v2, "more book"

    const-string v3, "more books"

    invoke-static {v4, v2, v3}, Lcom/faultexception/reader/goals/Ui;->plural(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, " to reach your goal"

    invoke-static {v0, v2, v3}, Lcom/faultexception/reader/goals/DashboardView;->bold(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 227
    iget-object v0, p0, Lcom/faultexception/reader/goals/DashboardView;->yearSubtext:Landroid/widget/TextView;

    const-string v1, "Keep reading!"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_5

    .line 229
    :cond_9
    iget-object v1, p0, Lcom/faultexception/reader/goals/DashboardView;->yearText:Landroid/widget/TextView;

    const-string v2, "You reached your goal!"

    invoke-static {v0, v2, v0}, Lcom/faultexception/reader/goals/DashboardView;->bold(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 230
    iget-object v0, p0, Lcom/faultexception/reader/goals/DashboardView;->yearSubtext:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "You\'ve finished "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "book"

    const-string v3, "books"

    invoke-static {v5, v2, v3}, Lcom/faultexception/reader/goals/Ui;->plural(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " this year."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_5
    return-void

    :catchall_0
    move-exception v0

    if-eqz v7, :cond_a

    .line 184
    :try_start_1
    invoke-interface {v7}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_6

    :catchall_1
    move-exception v1

    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_a
    :goto_6
    throw v0
.end method

.method synthetic lambda$bind$4$com-faultexception-reader-goals-DashboardView(Lcom/faultexception/reader/goals/FinishedBooks$Book;Landroid/view/View;)V
    .locals 2

    .line 218
    iget-wide v0, p1, Lcom/faultexception/reader/goals/FinishedBooks$Book;->id:J

    invoke-direct {p0, p2, v0, v1}, Lcom/faultexception/reader/goals/DashboardView;->openBook(Landroid/view/View;J)V

    return-void
.end method

.method synthetic lambda$bind$5$com-faultexception-reader-goals-DashboardView(Landroid/view/View;)V
    .locals 0

    .line 221
    invoke-direct {p0}, Lcom/faultexception/reader/goals/DashboardView;->editYearlyGoal()V

    return-void
.end method

.method synthetic lambda$editDailyGoal$6$com-faultexception-reader-goals-DashboardView(I)V
    .locals 1

    .line 236
    invoke-virtual {p0}, Lcom/faultexception/reader/goals/DashboardView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/faultexception/reader/goals/ReadingGoals;->setDailyGoalMinutes(Landroid/content/Context;I)V

    .line 237
    invoke-virtual {p0}, Lcom/faultexception/reader/goals/DashboardView;->bind()V

    return-void
.end method

.method synthetic lambda$editYearlyGoal$7$com-faultexception-reader-goals-DashboardView(I)V
    .locals 1

    .line 243
    invoke-virtual {p0}, Lcom/faultexception/reader/goals/DashboardView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/faultexception/reader/goals/ReadingGoals;->setYearlyGoalBooks(Landroid/content/Context;I)V

    .line 244
    invoke-virtual {p0}, Lcom/faultexception/reader/goals/DashboardView;->bind()V

    return-void
.end method

.method synthetic lambda$new$0$com-faultexception-reader-goals-DashboardView(Landroid/view/View;)V
    .locals 0

    .line 80
    invoke-direct {p0}, Lcom/faultexception/reader/goals/DashboardView;->editDailyGoal()V

    return-void
.end method

.method synthetic lambda$new$1$com-faultexception-reader-goals-DashboardView(Landroid/view/View;)V
    .locals 2

    .line 91
    iget-wide v0, p0, Lcom/faultexception/reader/goals/DashboardView;->continueBookId:J

    invoke-direct {p0, p1, v0, v1}, Lcom/faultexception/reader/goals/DashboardView;->openBook(Landroid/view/View;J)V

    return-void
.end method

.method synthetic lambda$new$2$com-faultexception-reader-goals-DashboardView(Landroid/view/View;)V
    .locals 2

    .line 113
    iget-wide v0, p0, Lcom/faultexception/reader/goals/DashboardView;->continueBookId:J

    invoke-direct {p0, p1, v0, v1}, Lcom/faultexception/reader/goals/DashboardView;->openBook(Landroid/view/View;J)V

    return-void
.end method

.method synthetic lambda$new$3$com-faultexception-reader-goals-DashboardView(Landroid/view/View;)V
    .locals 0

    .line 159
    invoke-direct {p0}, Lcom/faultexception/reader/goals/DashboardView;->editYearlyGoal()V

    return-void
.end method
