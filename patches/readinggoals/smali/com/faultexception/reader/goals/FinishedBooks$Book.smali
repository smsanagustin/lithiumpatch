.class public final Lcom/faultexception/reader/goals/FinishedBooks$Book;
.super Ljava/lang/Object;
.source "FinishedBooks.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/faultexception/reader/goals/FinishedBooks;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Book"
.end annotation


# instance fields
.field public final creator:Ljava/lang/String;

.field public final finishedDate:J

.field public final id:J

.field public final title:Ljava/lang/String;


# direct methods
.method constructor <init>(JJLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-wide p1, p0, Lcom/faultexception/reader/goals/FinishedBooks$Book;->id:J

    .line 37
    iput-wide p3, p0, Lcom/faultexception/reader/goals/FinishedBooks$Book;->finishedDate:J

    .line 38
    iput-object p5, p0, Lcom/faultexception/reader/goals/FinishedBooks$Book;->title:Ljava/lang/String;

    .line 39
    iput-object p6, p0, Lcom/faultexception/reader/goals/FinishedBooks$Book;->creator:Ljava/lang/String;

    return-void
.end method
