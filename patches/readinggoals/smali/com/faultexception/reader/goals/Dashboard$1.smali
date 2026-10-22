.class Lcom/faultexception/reader/goals/Dashboard$1;
.super Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;
.source "Dashboard.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/faultexception/reader/goals/Dashboard;->onLayoutApplied(Landroidx/recyclerview/widget/RecyclerView;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$dashboard:Lcom/faultexception/reader/goals/Dashboard;

.field final synthetic val$grid:Landroidx/recyclerview/widget/GridLayoutManager;


# direct methods
.method constructor <init>(Lcom/faultexception/reader/goals/Dashboard;Landroidx/recyclerview/widget/GridLayoutManager;)V
    .locals 0

    .line 66
    iput-object p1, p0, Lcom/faultexception/reader/goals/Dashboard$1;->val$dashboard:Lcom/faultexception/reader/goals/Dashboard;

    iput-object p2, p0, Lcom/faultexception/reader/goals/Dashboard$1;->val$grid:Landroidx/recyclerview/widget/GridLayoutManager;

    invoke-direct {p0}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;-><init>()V

    return-void
.end method


# virtual methods
.method public getSpanSize(I)I
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/faultexception/reader/goals/Dashboard$1;->val$dashboard:Lcom/faultexception/reader/goals/Dashboard;

    invoke-virtual {v0}, Lcom/faultexception/reader/goals/Dashboard;->getItemCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object p1, p0, Lcom/faultexception/reader/goals/Dashboard$1;->val$grid:Landroidx/recyclerview/widget/GridLayoutManager;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/GridLayoutManager;->getSpanCount()I

    move-result p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    :goto_0
    return p1
.end method
