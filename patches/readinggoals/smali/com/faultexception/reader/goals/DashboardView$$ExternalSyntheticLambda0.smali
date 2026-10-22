.class public final synthetic Lcom/faultexception/reader/goals/DashboardView$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lcom/faultexception/reader/goals/DashboardView;

.field public final synthetic f$1:Lcom/faultexception/reader/goals/FinishedBooks$Book;


# direct methods
.method public synthetic constructor <init>(Lcom/faultexception/reader/goals/DashboardView;Lcom/faultexception/reader/goals/FinishedBooks$Book;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/faultexception/reader/goals/DashboardView$$ExternalSyntheticLambda0;->f$0:Lcom/faultexception/reader/goals/DashboardView;

    iput-object p2, p0, Lcom/faultexception/reader/goals/DashboardView$$ExternalSyntheticLambda0;->f$1:Lcom/faultexception/reader/goals/FinishedBooks$Book;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/faultexception/reader/goals/DashboardView$$ExternalSyntheticLambda0;->f$0:Lcom/faultexception/reader/goals/DashboardView;

    iget-object v1, p0, Lcom/faultexception/reader/goals/DashboardView$$ExternalSyntheticLambda0;->f$1:Lcom/faultexception/reader/goals/FinishedBooks$Book;

    invoke-virtual {v0, v1, p1}, Lcom/faultexception/reader/goals/DashboardView;->lambda$bind$4$com-faultexception-reader-goals-DashboardView(Lcom/faultexception/reader/goals/FinishedBooks$Book;Landroid/view/View;)V

    return-void
.end method
