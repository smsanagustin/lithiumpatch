.class public final synthetic Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Ljava/util/function/IntConsumer;

.field public final synthetic f$1:[I

.field public final synthetic f$2:Lcom/google/android/material/bottomsheet/BottomSheetDialog;


# direct methods
.method public synthetic constructor <init>(Ljava/util/function/IntConsumer;[ILcom/google/android/material/bottomsheet/BottomSheetDialog;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda4;->f$0:Ljava/util/function/IntConsumer;

    iput-object p2, p0, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda4;->f$1:[I

    iput-object p3, p0, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda4;->f$2:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    iget-object v0, p0, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda4;->f$0:Ljava/util/function/IntConsumer;

    iget-object v1, p0, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda4;->f$1:[I

    iget-object v2, p0, Lcom/faultexception/reader/goals/GoalSheet$$ExternalSyntheticLambda4;->f$2:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    invoke-static {v0, v1, v2, p1}, Lcom/faultexception/reader/goals/GoalSheet;->lambda$show$4(Ljava/util/function/IntConsumer;[ILcom/google/android/material/bottomsheet/BottomSheetDialog;Landroid/view/View;)V

    return-void
.end method
