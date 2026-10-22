.class public final Lcom/faultexception/reader/goals/Dashboard;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "Dashboard.java"


# static fields
.field private static final ITEM_ID:J = -0x7fffffffffff9f5fL

.field private static final VIEW_TYPE:I = 0x60a1

.field private static final attached:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroidx/recyclerview/widget/RecyclerView;",
            "Lcom/faultexception/reader/goals/Dashboard;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final enabled:Z

.field private final fragment:Lcom/faultexception/reader/BooksFragment;

.field private searching:Z

.field private view:Lcom/faultexception/reader/goals/DashboardView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 27
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/faultexception/reader/goals/Dashboard;->attached:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>(Lcom/faultexception/reader/BooksFragment;)V
    .locals 2

    .line 34
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/faultexception/reader/goals/Dashboard;->fragment:Lcom/faultexception/reader/BooksFragment;

    .line 36
    invoke-virtual {p1}, Lcom/faultexception/reader/BooksFragment;->getFilter()I

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 37
    invoke-virtual {p1}, Lcom/faultexception/reader/BooksFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 38
    invoke-virtual {p1}, Lcom/faultexception/reader/BooksFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    const-string v0, "com.faultexception.reader.MainActivity"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    move p1, v1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lcom/faultexception/reader/goals/Dashboard;->enabled:Z

    .line 39
    invoke-virtual {p0, v1}, Lcom/faultexception/reader/goals/Dashboard;->setHasStableIds(Z)V

    return-void
.end method

.method public static attach(Lcom/faultexception/reader/BooksFragment;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/faultexception/reader/BooksFragment;",
            "Landroidx/recyclerview/widget/RecyclerView;",
            "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
            "*>;)V"
        }
    .end annotation

    .line 44
    new-instance v0, Lcom/faultexception/reader/goals/Dashboard;

    invoke-direct {v0, p0}, Lcom/faultexception/reader/goals/Dashboard;-><init>(Lcom/faultexception/reader/BooksFragment;)V

    .line 45
    sget-object p0, Lcom/faultexception/reader/goals/Dashboard;->attached:Ljava/util/Map;

    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    new-instance p0, Landroidx/recyclerview/widget/ConcatAdapter$Config$Builder;

    invoke-direct {p0}, Landroidx/recyclerview/widget/ConcatAdapter$Config$Builder;-><init>()V

    sget-object v1, Landroidx/recyclerview/widget/ConcatAdapter$Config$StableIdMode;->SHARED_STABLE_IDS:Landroidx/recyclerview/widget/ConcatAdapter$Config$StableIdMode;

    .line 47
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/ConcatAdapter$Config$Builder;->setStableIdMode(Landroidx/recyclerview/widget/ConcatAdapter$Config$StableIdMode;)Landroidx/recyclerview/widget/ConcatAdapter$Config$Builder;

    move-result-object p0

    .line 48
    invoke-virtual {p0}, Landroidx/recyclerview/widget/ConcatAdapter$Config$Builder;->build()Landroidx/recyclerview/widget/ConcatAdapter$Config;

    move-result-object p0

    .line 49
    new-instance v1, Landroidx/recyclerview/widget/ConcatAdapter;

    const/4 v2, 0x2

    new-array v2, v2, [Landroidx/recyclerview/widget/RecyclerView$Adapter;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object p2, v2, v0

    invoke-direct {v1, p0, v2}, Landroidx/recyclerview/widget/ConcatAdapter;-><init>(Landroidx/recyclerview/widget/ConcatAdapter$Config;[Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    return-void
.end method

.method public static onLayoutApplied(Landroidx/recyclerview/widget/RecyclerView;Ljava/lang/String;)V
    .locals 2

    .line 54
    sget-object v0, Lcom/faultexception/reader/goals/Dashboard;->attached:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/faultexception/reader/goals/Dashboard;

    if-nez v0, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 59
    :goto_0
    iget-boolean v1, v0, Lcom/faultexception/reader/goals/Dashboard;->searching:Z

    if-eq v1, p1, :cond_2

    .line 60
    iput-boolean p1, v0, Lcom/faultexception/reader/goals/Dashboard;->searching:Z

    .line 61
    invoke-virtual {v0}, Lcom/faultexception/reader/goals/Dashboard;->notifyDataSetChanged()V

    .line 63
    :cond_2
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object p0

    .line 64
    instance-of p1, p0, Landroidx/recyclerview/widget/GridLayoutManager;

    if-eqz p1, :cond_3

    .line 65
    check-cast p0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 66
    new-instance p1, Lcom/faultexception/reader/goals/Dashboard$1;

    invoke-direct {p1, v0, p0}, Lcom/faultexception/reader/goals/Dashboard$1;-><init>(Lcom/faultexception/reader/goals/Dashboard;Landroidx/recyclerview/widget/GridLayoutManager;)V

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/GridLayoutManager;->setSpanSizeLookup(Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;)V

    :cond_3
    return-void
.end method

.method static refreshAll()V
    .locals 3

    .line 77
    sget-object v0, Lcom/faultexception/reader/goals/Dashboard;->attached:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/faultexception/reader/goals/Dashboard;

    .line 78
    iget-object v2, v1, Lcom/faultexception/reader/goals/Dashboard;->view:Lcom/faultexception/reader/goals/DashboardView;

    if-eqz v2, :cond_0

    iget-object v2, v1, Lcom/faultexception/reader/goals/Dashboard;->fragment:Lcom/faultexception/reader/BooksFragment;

    invoke-virtual {v2}, Lcom/faultexception/reader/BooksFragment;->isAdded()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 79
    iget-object v1, v1, Lcom/faultexception/reader/goals/Dashboard;->view:Lcom/faultexception/reader/goals/DashboardView;

    invoke-virtual {v1}, Lcom/faultexception/reader/goals/DashboardView;->bind()V

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 86
    iget-boolean v0, p0, Lcom/faultexception/reader/goals/Dashboard;->enabled:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/faultexception/reader/goals/Dashboard;->searching:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getItemId(I)J
    .locals 2

    const-wide v0, -0x7fffffffffff9f5fL    # -1.22217E-319

    return-wide v0
.end method

.method public getItemViewType(I)I
    .locals 0

    const/16 p1, 0x60a1

    return p1
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 113
    check-cast p1, Lcom/faultexception/reader/goals/DashboardHolder;

    iget-object p1, p1, Lcom/faultexception/reader/goals/DashboardHolder;->view:Lcom/faultexception/reader/goals/DashboardView;

    invoke-virtual {p1}, Lcom/faultexception/reader/goals/DashboardView;->bind()V

    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 2

    .line 101
    new-instance p2, Lcom/faultexception/reader/goals/DashboardView;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/faultexception/reader/goals/Dashboard;->fragment:Lcom/faultexception/reader/BooksFragment;

    invoke-direct {p2, v0, v1}, Lcom/faultexception/reader/goals/DashboardView;-><init>(Landroid/content/Context;Lcom/faultexception/reader/BooksFragment;)V

    iput-object p2, p0, Lcom/faultexception/reader/goals/Dashboard;->view:Lcom/faultexception/reader/goals/DashboardView;

    .line 103
    new-instance p2, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    const/4 v0, -0x1

    const/4 v1, -0x2

    invoke-direct {p2, v0, v1}, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;-><init>(II)V

    .line 104
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v0

    neg-int v0, v0

    iput v0, p2, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;->leftMargin:I

    .line 105
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v0

    neg-int v0, v0

    iput v0, p2, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;->rightMargin:I

    .line 106
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result p1

    neg-int p1, p1

    iput p1, p2, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;->topMargin:I

    .line 107
    iget-object p1, p0, Lcom/faultexception/reader/goals/Dashboard;->view:Lcom/faultexception/reader/goals/DashboardView;

    invoke-virtual {p1, p2}, Lcom/faultexception/reader/goals/DashboardView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 108
    new-instance p1, Lcom/faultexception/reader/goals/DashboardHolder;

    iget-object p2, p0, Lcom/faultexception/reader/goals/Dashboard;->view:Lcom/faultexception/reader/goals/DashboardView;

    invoke-direct {p1, p2}, Lcom/faultexception/reader/goals/DashboardHolder;-><init>(Lcom/faultexception/reader/goals/DashboardView;)V

    return-object p1
.end method
