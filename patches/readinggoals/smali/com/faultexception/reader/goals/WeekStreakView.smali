.class final Lcom/faultexception/reader/goals/WeekStreakView;
.super Landroid/view/View;
.source "WeekStreakView.java"


# instance fields
.field private final days:[Ljava/time/LocalDate;

.field private final fill:Landroid/graphics/Paint;

.field private final joinHeight:F

.field private final met:[Z

.field private final onPrimary:I

.field private final outline:I

.field private final outlineWidth:F

.field private final primary:I

.field private final radius:F

.field private final rect:Landroid/graphics/RectF;

.field private final ringWidth:F

.field private final stroke:Landroid/graphics/Paint;

.field private final text:Landroid/graphics/Paint;

.field private final textPrimary:I

.field private final textSecondary:I

.field private todayIndex:I

.field private todayProgress:F

.field private final track:I


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 4

    .line 34
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 20
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/faultexception/reader/goals/WeekStreakView;->fill:Landroid/graphics/Paint;

    .line 21
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/faultexception/reader/goals/WeekStreakView;->stroke:Landroid/graphics/Paint;

    .line 22
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v2, p0, Lcom/faultexception/reader/goals/WeekStreakView;->text:Landroid/graphics/Paint;

    .line 23
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lcom/faultexception/reader/goals/WeekStreakView;->rect:Landroid/graphics/RectF;

    const/4 v1, 0x7

    new-array v3, v1, [Ljava/time/LocalDate;

    .line 28
    iput-object v3, p0, Lcom/faultexception/reader/goals/WeekStreakView;->days:[Ljava/time/LocalDate;

    new-array v1, v1, [Z

    .line 29
    iput-object v1, p0, Lcom/faultexception/reader/goals/WeekStreakView;->met:[Z

    const/4 v1, -0x1

    .line 30
    iput v1, p0, Lcom/faultexception/reader/goals/WeekStreakView;->todayIndex:I

    .line 35
    invoke-static {p1}, Lcom/faultexception/reader/goals/Ui;->primary(Landroid/content/Context;)I

    move-result v1

    iput v1, p0, Lcom/faultexception/reader/goals/WeekStreakView;->primary:I

    .line 36
    invoke-static {p1}, Lcom/faultexception/reader/goals/Ui;->onPrimary(Landroid/content/Context;)I

    move-result v1

    iput v1, p0, Lcom/faultexception/reader/goals/WeekStreakView;->onPrimary:I

    .line 37
    invoke-static {p1}, Lcom/faultexception/reader/goals/Ui;->textPrimary(Landroid/content/Context;)I

    move-result v1

    iput v1, p0, Lcom/faultexception/reader/goals/WeekStreakView;->textPrimary:I

    .line 38
    invoke-static {p1}, Lcom/faultexception/reader/goals/Ui;->textSecondary(Landroid/content/Context;)I

    move-result v1

    iput v1, p0, Lcom/faultexception/reader/goals/WeekStreakView;->textSecondary:I

    const v1, 0x3e99999a    # 0.3f

    .line 39
    invoke-static {p1, v1}, Lcom/faultexception/reader/goals/Ui;->subtle(Landroid/content/Context;F)I

    move-result v1

    iput v1, p0, Lcom/faultexception/reader/goals/WeekStreakView;->outline:I

    const v1, 0x3df5c28f    # 0.12f

    .line 40
    invoke-static {p1, v1}, Lcom/faultexception/reader/goals/Ui;->subtle(Landroid/content/Context;F)I

    move-result v1

    iput v1, p0, Lcom/faultexception/reader/goals/WeekStreakView;->track:I

    const/high16 v1, 0x41900000    # 18.0f

    .line 41
    invoke-static {p1, v1}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v1

    int-to-float v1, v1

    iput v1, p0, Lcom/faultexception/reader/goals/WeekStreakView;->radius:F

    const/high16 v1, 0x3f800000    # 1.0f

    .line 42
    invoke-static {p1, v1}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v1

    int-to-float v1, v1

    iput v1, p0, Lcom/faultexception/reader/goals/WeekStreakView;->outlineWidth:F

    const/high16 v1, 0x40400000    # 3.0f

    .line 43
    invoke-static {p1, v1}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v1

    int-to-float v1, v1

    iput v1, p0, Lcom/faultexception/reader/goals/WeekStreakView;->ringWidth:F

    const/high16 v1, 0x41000000    # 8.0f

    .line 44
    invoke-static {p1, v1}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result v1

    int-to-float v1, v1

    iput v1, p0, Lcom/faultexception/reader/goals/WeekStreakView;->joinHeight:F

    .line 45
    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    const/high16 v1, 0x41500000    # 13.0f

    .line 46
    invoke-static {p1, v1}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {v2, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 47
    sget-object p1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 48
    sget-object p1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    return-void
.end method

.method private static letter(Ljava/time/DayOfWeek;)Ljava/lang/String;
    .locals 2

    .line 128
    sget-object v0, Ljava/time/format/TextStyle;->NARROW:Ljava/time/format/TextStyle;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/time/DayOfWeek;->getDisplayName(Ljava/time/format/TextStyle;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method bind(Ljava/time/LocalDate;Ljava/util/Set;F)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/time/LocalDate;",
            "Ljava/util/Set<",
            "Ljava/time/LocalDate;",
            ">;F)V"
        }
    .end annotation

    .line 52
    invoke-virtual {p1}, Ljava/time/LocalDate;->getDayOfWeek()Ljava/time/DayOfWeek;

    move-result-object v0

    invoke-virtual {v0}, Ljava/time/DayOfWeek;->getValue()I

    move-result v0

    const/4 v1, 0x7

    rem-int/2addr v0, v1

    int-to-long v2, v0

    invoke-virtual {p1, v2, v3}, Ljava/time/LocalDate;->minusDays(J)Ljava/time/LocalDate;

    move-result-object v0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_0

    .line 54
    iget-object v4, p0, Lcom/faultexception/reader/goals/WeekStreakView;->days:[Ljava/time/LocalDate;

    int-to-long v5, v3

    invoke-virtual {v0, v5, v6}, Ljava/time/LocalDate;->plusDays(J)Ljava/time/LocalDate;

    move-result-object v5

    aput-object v5, v4, v3

    .line 55
    iget-object v4, p0, Lcom/faultexception/reader/goals/WeekStreakView;->met:[Z

    iget-object v5, p0, Lcom/faultexception/reader/goals/WeekStreakView;->days:[Ljava/time/LocalDate;

    aget-object v5, v5, v3

    invoke-interface {p2, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    aput-boolean v5, v4, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 57
    :cond_0
    invoke-virtual {p1}, Ljava/time/LocalDate;->toEpochDay()J

    move-result-wide p1

    invoke-virtual {v0}, Ljava/time/LocalDate;->toEpochDay()J

    move-result-wide v3

    sub-long/2addr p1, v3

    long-to-int p1, p1

    iput p1, p0, Lcom/faultexception/reader/goals/WeekStreakView;->todayIndex:I

    .line 58
    iput p3, p0, Lcom/faultexception/reader/goals/WeekStreakView;->todayProgress:F

    .line 60
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    :goto_1
    if-ge v2, v1, :cond_4

    if-eqz v2, :cond_1

    const-string p2, ", "

    .line 63
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    :cond_1
    iget-object p2, p0, Lcom/faultexception/reader/goals/WeekStreakView;->days:[Ljava/time/LocalDate;

    aget-object p2, p2, v2

    invoke-virtual {p2}, Ljava/time/LocalDate;->getDayOfWeek()Ljava/time/DayOfWeek;

    move-result-object p2

    sget-object p3, Ljava/time/format/TextStyle;->FULL:Ljava/time/format/TextStyle;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {p2, p3, v0}, Ljava/time/DayOfWeek;->getDisplayName(Ljava/time/format/TextStyle;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    iget-object p2, p0, Lcom/faultexception/reader/goals/WeekStreakView;->met:[Z

    aget-boolean p2, p2, v2

    if-eqz p2, :cond_2

    const-string p2, ": goal met"

    goto :goto_2

    :cond_2
    iget p2, p0, Lcom/faultexception/reader/goals/WeekStreakView;->todayIndex:I

    if-ne v2, p2, :cond_3

    const-string p2, ": today"

    goto :goto_2

    :cond_3
    const-string p2, ""

    :goto_2
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 68
    :cond_4
    invoke-virtual {p0, p1}, Lcom/faultexception/reader/goals/WeekStreakView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 69
    invoke-virtual {p0}, Lcom/faultexception/reader/goals/WeekStreakView;->invalidate()V

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v7, p1

    .line 80
    iget-object v1, v0, Lcom/faultexception/reader/goals/WeekStreakView;->days:[Ljava/time/LocalDate;

    const/4 v8, 0x0

    aget-object v1, v1, v8

    if-nez v1, :cond_0

    return-void

    .line 83
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/faultexception/reader/goals/WeekStreakView;->getWidth()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x40e00000    # 7.0f

    div-float v9, v1, v2

    .line 84
    iget v1, v0, Lcom/faultexception/reader/goals/WeekStreakView;->radius:F

    const/high16 v10, 0x40000000    # 2.0f

    div-float v2, v9, v10

    iget v3, v0, Lcom/faultexception/reader/goals/WeekStreakView;->outlineWidth:F

    sub-float/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v11

    .line 85
    invoke-virtual/range {p0 .. p0}, Lcom/faultexception/reader/goals/WeekStreakView;->getHeight()I

    move-result v1

    int-to-float v1, v1

    div-float v12, v1, v10

    .line 88
    iget-object v1, v0, Lcom/faultexception/reader/goals/WeekStreakView;->fill:Landroid/graphics/Paint;

    iget v2, v0, Lcom/faultexception/reader/goals/WeekStreakView;->primary:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    move v13, v8

    :goto_0
    const/4 v1, 0x6

    const/high16 v14, 0x3f000000    # 0.5f

    if-ge v13, v1, :cond_2

    .line 90
    iget-object v1, v0, Lcom/faultexception/reader/goals/WeekStreakView;->met:[Z

    aget-boolean v2, v1, v13

    if-eqz v2, :cond_1

    add-int/lit8 v2, v13, 0x1

    aget-boolean v1, v1, v2

    if-eqz v1, :cond_1

    int-to-float v1, v13

    add-float/2addr v1, v14

    mul-float v2, v9, v1

    .line 92
    iget v1, v0, Lcom/faultexception/reader/goals/WeekStreakView;->joinHeight:F

    div-float v3, v1, v10

    sub-float v3, v12, v3

    add-float v4, v2, v9

    div-float/2addr v1, v10

    add-float v5, v12, v1

    iget-object v6, v0, Lcom/faultexception/reader/goals/WeekStreakView;->fill:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    :cond_1
    add-int/lit8 v13, v13, 0x1

    goto :goto_0

    :cond_2
    move v13, v8

    :goto_1
    const/4 v1, 0x7

    if-ge v13, v1, :cond_9

    int-to-float v1, v13

    add-float/2addr v1, v14

    mul-float v15, v9, v1

    .line 98
    iget v1, v0, Lcom/faultexception/reader/goals/WeekStreakView;->todayIndex:I

    if-ne v13, v1, :cond_3

    const/4 v1, 0x1

    move/from16 v16, v1

    goto :goto_2

    :cond_3
    move/from16 v16, v8

    .line 100
    :goto_2
    iget-object v1, v0, Lcom/faultexception/reader/goals/WeekStreakView;->met:[Z

    aget-boolean v1, v1, v13

    if-eqz v1, :cond_4

    .line 101
    iget-object v1, v0, Lcom/faultexception/reader/goals/WeekStreakView;->fill:Landroid/graphics/Paint;

    iget v2, v0, Lcom/faultexception/reader/goals/WeekStreakView;->primary:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 102
    iget-object v1, v0, Lcom/faultexception/reader/goals/WeekStreakView;->fill:Landroid/graphics/Paint;

    invoke-virtual {v7, v15, v12, v11, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 103
    iget v1, v0, Lcom/faultexception/reader/goals/WeekStreakView;->onPrimary:I

    goto :goto_3

    :cond_4
    if-eqz v16, :cond_6

    .line 105
    iget-object v1, v0, Lcom/faultexception/reader/goals/WeekStreakView;->rect:Landroid/graphics/RectF;

    sub-float v2, v15, v11

    iget v3, v0, Lcom/faultexception/reader/goals/WeekStreakView;->ringWidth:F

    div-float v4, v3, v10

    add-float/2addr v2, v4

    sub-float v4, v12, v11

    div-float v5, v3, v10

    add-float/2addr v4, v5

    add-float v5, v15, v11

    div-float v6, v3, v10

    sub-float/2addr v5, v6

    add-float v6, v12, v11

    div-float/2addr v3, v10

    sub-float/2addr v6, v3

    invoke-virtual {v1, v2, v4, v5, v6}, Landroid/graphics/RectF;->set(FFFF)V

    .line 106
    iget-object v1, v0, Lcom/faultexception/reader/goals/WeekStreakView;->stroke:Landroid/graphics/Paint;

    iget v2, v0, Lcom/faultexception/reader/goals/WeekStreakView;->ringWidth:F

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 107
    iget-object v1, v0, Lcom/faultexception/reader/goals/WeekStreakView;->stroke:Landroid/graphics/Paint;

    iget v2, v0, Lcom/faultexception/reader/goals/WeekStreakView;->track:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 108
    iget-object v2, v0, Lcom/faultexception/reader/goals/WeekStreakView;->rect:Landroid/graphics/RectF;

    const/4 v3, 0x0

    const/high16 v4, 0x43b40000    # 360.0f

    const/4 v5, 0x0

    iget-object v6, v0, Lcom/faultexception/reader/goals/WeekStreakView;->stroke:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 109
    iget v1, v0, Lcom/faultexception/reader/goals/WeekStreakView;->todayProgress:F

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-lez v1, :cond_5

    .line 110
    iget-object v1, v0, Lcom/faultexception/reader/goals/WeekStreakView;->stroke:Landroid/graphics/Paint;

    iget v2, v0, Lcom/faultexception/reader/goals/WeekStreakView;->primary:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 111
    iget-object v2, v0, Lcom/faultexception/reader/goals/WeekStreakView;->rect:Landroid/graphics/RectF;

    const/high16 v3, -0x3d4c0000    # -90.0f

    const/high16 v1, 0x43b40000    # 360.0f

    iget v4, v0, Lcom/faultexception/reader/goals/WeekStreakView;->todayProgress:F

    mul-float/2addr v4, v1

    const/4 v5, 0x0

    iget-object v6, v0, Lcom/faultexception/reader/goals/WeekStreakView;->stroke:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 113
    :cond_5
    iget v1, v0, Lcom/faultexception/reader/goals/WeekStreakView;->textPrimary:I

    goto :goto_3

    .line 115
    :cond_6
    iget-object v1, v0, Lcom/faultexception/reader/goals/WeekStreakView;->stroke:Landroid/graphics/Paint;

    iget v2, v0, Lcom/faultexception/reader/goals/WeekStreakView;->outlineWidth:F

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 116
    iget-object v1, v0, Lcom/faultexception/reader/goals/WeekStreakView;->stroke:Landroid/graphics/Paint;

    iget v2, v0, Lcom/faultexception/reader/goals/WeekStreakView;->outline:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 117
    iget v1, v0, Lcom/faultexception/reader/goals/WeekStreakView;->outlineWidth:F

    div-float/2addr v1, v10

    sub-float v1, v11, v1

    iget-object v2, v0, Lcom/faultexception/reader/goals/WeekStreakView;->stroke:Landroid/graphics/Paint;

    invoke-virtual {v7, v15, v12, v1, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 118
    iget v1, v0, Lcom/faultexception/reader/goals/WeekStreakView;->textSecondary:I

    .line 120
    :goto_3
    iget-object v2, v0, Lcom/faultexception/reader/goals/WeekStreakView;->text:Landroid/graphics/Paint;

    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 121
    iget-object v1, v0, Lcom/faultexception/reader/goals/WeekStreakView;->text:Landroid/graphics/Paint;

    iget-object v2, v0, Lcom/faultexception/reader/goals/WeekStreakView;->met:[Z

    aget-boolean v2, v2, v13

    if-nez v2, :cond_8

    if-eqz v16, :cond_7

    goto :goto_4

    :cond_7
    const/4 v2, 0x0

    goto :goto_5

    :cond_8
    :goto_4
    sget-object v2, Lcom/faultexception/reader/goals/Ui;->MEDIUM:Landroid/graphics/Typeface;

    :goto_5
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 122
    iget-object v1, v0, Lcom/faultexception/reader/goals/WeekStreakView;->days:[Ljava/time/LocalDate;

    aget-object v1, v1, v13

    invoke-virtual {v1}, Ljava/time/LocalDate;->getDayOfWeek()Ljava/time/DayOfWeek;

    move-result-object v1

    invoke-static {v1}, Lcom/faultexception/reader/goals/WeekStreakView;->letter(Ljava/time/DayOfWeek;)Ljava/lang/String;

    move-result-object v1

    .line 123
    iget-object v2, v0, Lcom/faultexception/reader/goals/WeekStreakView;->text:Landroid/graphics/Paint;

    invoke-virtual {v2}, Landroid/graphics/Paint;->descent()F

    move-result v2

    iget-object v3, v0, Lcom/faultexception/reader/goals/WeekStreakView;->text:Landroid/graphics/Paint;

    invoke-virtual {v3}, Landroid/graphics/Paint;->ascent()F

    move-result v3

    add-float/2addr v2, v3

    div-float/2addr v2, v10

    sub-float v2, v12, v2

    iget-object v3, v0, Lcom/faultexception/reader/goals/WeekStreakView;->text:Landroid/graphics/Paint;

    invoke-virtual {v7, v1, v15, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_1

    :cond_9
    return-void
.end method

.method protected onMeasure(II)V
    .locals 3

    .line 74
    iget v0, p0, Lcom/faultexception/reader/goals/WeekStreakView;->radius:F

    const/high16 v1, 0x40000000    # 2.0f

    mul-float/2addr v0, v1

    iget v2, p0, Lcom/faultexception/reader/goals/WeekStreakView;->outlineWidth:F

    mul-float/2addr v2, v1

    add-float/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 75
    invoke-virtual {p0}, Lcom/faultexception/reader/goals/WeekStreakView;->getSuggestedMinimumWidth()I

    move-result v1

    invoke-static {v1, p1}, Lcom/faultexception/reader/goals/WeekStreakView;->getDefaultSize(II)I

    move-result p1

    invoke-static {v0, p2}, Lcom/faultexception/reader/goals/WeekStreakView;->resolveSize(II)I

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/faultexception/reader/goals/WeekStreakView;->setMeasuredDimension(II)V

    return-void
.end method
