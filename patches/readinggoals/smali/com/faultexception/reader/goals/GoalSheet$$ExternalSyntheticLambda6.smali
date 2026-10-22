.class public final synthetic Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/view/View;

.field public final synthetic f$1:Ljava/lang/Runnable;

.field public final synthetic f$2:[Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Ljava/lang/Runnable;[Ljava/lang/Runnable;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda6;->f$0:Landroid/view/View;

    iput-object p2, p0, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda6;->f$1:Ljava/lang/Runnable;

    iput-object p3, p0, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda6;->f$2:[Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda6;->f$0:Landroid/view/View;

    iget-object v1, p0, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda6;->f$1:Ljava/lang/Runnable;

    iget-object v2, p0, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda6;->f$2:[Ljava/lang/Runnable;

    invoke-static {v0, v1, v2}, Lcom/faultexception/reader/goals/GoalSheet;->lambda$repeating$6(Landroid/view/View;Ljava/lang/Runnable;[Ljava/lang/Runnable;)V

    return-void
.end method
