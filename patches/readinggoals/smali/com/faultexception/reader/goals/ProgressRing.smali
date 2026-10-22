.class final Lcom/faultexception/reader/goals/ProgressRing;
.super Landroid/view/View;
.source "ProgressRing.java"


# instance fields
.field private final indicator:Landroid/graphics/Paint;

.field private progress:F

.field private final rect:Landroid/graphics/RectF;

.field private final track:Landroid/graphics/Paint;


# direct methods
.method constructor <init>(Landroid/content/Context;F)V
    .locals 3

    .line 17
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 11
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/faultexception/reader/goals/ProgressRing;->track:Landroid/graphics/Paint;

    .line 12
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v2, p0, Lcom/faultexception/reader/goals/ProgressRing;->indicator:Landroid/graphics/Paint;

    .line 13
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lcom/faultexception/reader/goals/ProgressRing;->rect:Landroid/graphics/RectF;

    .line 18
    invoke-static {p1, p2}, Lcom/faultexception/reader/goals/Ui;->dp(Landroid/content/Context;F)I

    move-result p2

    int-to-float p2, p2

    .line 19
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 20
    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    const v1, 0x3df5c28f    # 0.12f

    .line 21
    invoke-static {p1, v1}, Lcom/faultexception/reader/goals/Ui;->subtle(Landroid/content/Context;F)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 22
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 23
    invoke-virtual {v2, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 24
    sget-object p2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v2, p2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 25
    invoke-static {p1}, Lcom/faultexception/reader/goals/Ui;->primary(Landroid/content/Context;)I

    move-result p1

    invoke-virtual {v2, p1}, Landroid/graphics/Paint;->setColor(I)V

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 10

    .line 36
    iget-object v0, p0, Lcom/faultexception/reader/goals/ProgressRing;->track:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    .line 37
    iget-object v1, p0, Lcom/faultexception/reader/goals/ProgressRing;->rect:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/faultexception/reader/goals/ProgressRing;->getWidth()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v2, v0

    invoke-virtual {p0}, Lcom/faultexception/reader/goals/ProgressRing;->getHeight()I

    move-result v3

    int-to-float v3, v3

    sub-float/2addr v3, v0

    invoke-virtual {v1, v0, v0, v2, v3}, Landroid/graphics/RectF;->set(FFFF)V

    .line 38
    iget-object v5, p0, Lcom/faultexception/reader/goals/ProgressRing;->rect:Landroid/graphics/RectF;

    const/4 v6, 0x0

    const/high16 v7, 0x43b40000    # 360.0f

    const/4 v8, 0x0

    iget-object v9, p0, Lcom/faultexception/reader/goals/ProgressRing;->track:Landroid/graphics/Paint;

    move-object v4, p1

    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 39
    iget v0, p0, Lcom/faultexception/reader/goals/ProgressRing;->progress:F

    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-lez v1, :cond_0

    .line 40
    iget-object v3, p0, Lcom/faultexception/reader/goals/ProgressRing;->rect:Landroid/graphics/RectF;

    const/high16 v4, -0x3d4c0000    # -90.0f

    const/high16 v1, 0x43b40000    # 360.0f

    mul-float v5, v0, v1

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/faultexception/reader/goals/ProgressRing;->indicator:Landroid/graphics/Paint;

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    :cond_0
    return-void
.end method

.method setProgress(F)V
    .locals 1

    const/high16 v0, 0x3f800000    # 1.0f

    .line 30
    invoke-static {v0, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    const/4 v0, 0x0

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    iput p1, p0, Lcom/faultexception/reader/goals/ProgressRing;->progress:F

    .line 31
    invoke-virtual {p0}, Lcom/faultexception/reader/goals/ProgressRing;->invalidate()V

    return-void
.end method
