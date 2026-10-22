.class public final synthetic Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:[I

.field public final synthetic f$1:I

.field public final synthetic f$2:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>([IILjava/lang/Runnable;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda1;->f$0:[I

    iput p2, p0, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda1;->f$1:I

    iput-object p3, p0, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda1;->f$2:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda1;->f$0:[I

    iget v1, p0, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda1;->f$1:I

    iget-object v2, p0, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda1;->f$2:Ljava/lang/Runnable;

    invoke-static {v0, v1, v2}, Lcom/faultexception/reader/goals/GoalSheet;->lambda$show$1([IILjava/lang/Runnable;)V

    return-void
.end method
