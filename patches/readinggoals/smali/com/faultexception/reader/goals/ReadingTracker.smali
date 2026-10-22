.class public final Lcom/faultexception/reader/goals/ReadingTracker;
.super Ljava/lang/Object;
.source "ReadingTracker.java"


# static fields
.field private static final FLUSH_INTERVAL_MS:J = 0x7530L

.field private static final TAG:Ljava/lang/String; = "ReadingGoals"

.field private static final handler:Landroid/os/Handler;

.field private static reader:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private static sessionDay:Ljava/time/LocalDate;

.field private static sessionStart:J

.field private static final tick:Ljava/lang/Runnable;


# direct methods
.method public static synthetic $r8$lambda$hs44vInDnmkDFxGa7hvN9ZgxOUA()V
    .locals 0

    invoke-static {}, Lcom/faultexception/reader/goals/ReadingTracker;->tick()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    .line 24
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/faultexception/reader/goals/ReadingTracker;->handler:Landroid/os/Handler;

    .line 25
    new-instance v0, Lcom/faultexception/reader/goals/ReadingTracker$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lcom/faultexception/reader/goals/ReadingTracker$$ExternalSyntheticLambda0;-><init>()V

    sput-object v0, Lcom/faultexception/reader/goals/ReadingTracker;->tick:Ljava/lang/Runnable;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static flush()V
    .locals 7

    .line 80
    sget-object v0, Lcom/faultexception/reader/goals/ReadingTracker;->reader:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_3

    .line 81
    sget-wide v1, Lcom/faultexception/reader/goals/ReadingTracker;->sessionStart:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_1

    goto :goto_1

    .line 84
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    .line 85
    sget-wide v3, Lcom/faultexception/reader/goals/ReadingTracker;->sessionStart:J

    sub-long v3, v1, v3

    .line 86
    sput-wide v1, Lcom/faultexception/reader/goals/ReadingTracker;->sessionStart:J

    .line 89
    invoke-static {}, Ljava/time/LocalDate;->now()Ljava/time/LocalDate;

    move-result-object v1

    .line 90
    sget-object v2, Lcom/faultexception/reader/goals/ReadingTracker;->sessionDay:Ljava/time/LocalDate;

    invoke-virtual {v1, v2}, Ljava/time/LocalDate;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 91
    invoke-static {}, Lcom/faultexception/reader/goals/ReadingTracker;->msSinceMidnight()J

    move-result-wide v5

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    .line 92
    sget-object v2, Lcom/faultexception/reader/goals/ReadingTracker;->sessionDay:Ljava/time/LocalDate;

    sub-long/2addr v3, v5

    invoke-static {v0, v2, v3, v4}, Lcom/faultexception/reader/goals/ReadingGoals;->addReadMs(Landroid/content/Context;Ljava/time/LocalDate;J)Z

    .line 94
    sput-object v1, Lcom/faultexception/reader/goals/ReadingTracker;->sessionDay:Ljava/time/LocalDate;

    move-wide v3, v5

    .line 96
    :cond_2
    invoke-static {v0, v1, v3, v4}, Lcom/faultexception/reader/goals/ReadingGoals;->addReadMs(Landroid/content/Context;Ljava/time/LocalDate;J)Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-static {v0, v1}, Lcom/faultexception/reader/goals/ReadingGoals;->markNotified(Landroid/content/Context;Ljava/time/LocalDate;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v1, "ReadingGoals"

    const-string v2, "daily goal reached"

    .line 97
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    invoke-static {v0}, Lcom/faultexception/reader/goals/GoalReachedToast;->show(Landroid/app/Activity;)V

    :cond_3
    :goto_1
    return-void
.end method

.method private static msSinceMidnight()J
    .locals 5

    .line 103
    invoke-static {}, Ljava/time/ZonedDateTime;->now()Ljava/time/ZonedDateTime;

    move-result-object v0

    .line 104
    invoke-virtual {v0}, Ljava/time/ZonedDateTime;->toInstant()Ljava/time/Instant;

    move-result-object v1

    invoke-virtual {v1}, Ljava/time/Instant;->toEpochMilli()J

    move-result-wide v1

    invoke-virtual {v0}, Ljava/time/ZonedDateTime;->toLocalDate()Ljava/time/LocalDate;

    move-result-object v3

    invoke-virtual {v0}, Ljava/time/ZonedDateTime;->getZone()Ljava/time/ZoneId;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/time/LocalDate;->atStartOfDay(Ljava/time/ZoneId;)Ljava/time/ZonedDateTime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/time/ZonedDateTime;->toInstant()Ljava/time/Instant;

    move-result-object v0

    invoke-virtual {v0}, Ljava/time/Instant;->toEpochMilli()J

    move-result-wide v3

    sub-long/2addr v1, v3

    return-wide v1
.end method

.method private static msUntilMidnight()J
    .locals 5

    .line 108
    invoke-static {}, Ljava/time/ZonedDateTime;->now()Ljava/time/ZonedDateTime;

    move-result-object v0

    .line 109
    invoke-virtual {v0}, Ljava/time/ZonedDateTime;->toLocalDate()Ljava/time/LocalDate;

    move-result-object v1

    const-wide/16 v2, 0x1

    invoke-virtual {v1, v2, v3}, Ljava/time/LocalDate;->plusDays(J)Ljava/time/LocalDate;

    move-result-object v1

    invoke-virtual {v0}, Ljava/time/ZonedDateTime;->getZone()Ljava/time/ZoneId;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/time/LocalDate;->atStartOfDay(Ljava/time/ZoneId;)Ljava/time/ZonedDateTime;

    move-result-object v1

    invoke-virtual {v1}, Ljava/time/ZonedDateTime;->toInstant()Ljava/time/Instant;

    move-result-object v1

    invoke-virtual {v1}, Ljava/time/Instant;->toEpochMilli()J

    move-result-wide v1

    invoke-virtual {v0}, Ljava/time/ZonedDateTime;->toInstant()Ljava/time/Instant;

    move-result-object v0

    invoke-virtual {v0}, Ljava/time/Instant;->toEpochMilli()J

    move-result-wide v3

    sub-long/2addr v1, v3

    return-wide v1
.end method

.method public static onReaderPause(Landroid/app/Activity;)V
    .locals 4

    .line 46
    sget-wide v0, Lcom/faultexception/reader/goals/ReadingTracker;->sessionStart:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    sget-object v0, Lcom/faultexception/reader/goals/ReadingTracker;->reader:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eq v0, p0, :cond_0

    goto :goto_0

    .line 49
    :cond_0
    sget-object v0, Lcom/faultexception/reader/goals/ReadingTracker;->handler:Landroid/os/Handler;

    sget-object v1, Lcom/faultexception/reader/goals/ReadingTracker;->tick:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 50
    invoke-static {}, Lcom/faultexception/reader/goals/ReadingTracker;->flush()V

    .line 51
    sput-wide v2, Lcom/faultexception/reader/goals/ReadingTracker;->sessionStart:J

    const/4 v0, 0x0

    .line 52
    sput-object v0, Lcom/faultexception/reader/goals/ReadingTracker;->reader:Ljava/lang/ref/WeakReference;

    .line 53
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "paused (today: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/time/LocalDate;->now()Ljava/time/LocalDate;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/faultexception/reader/goals/ReadingGoals;->getReadMs(Landroid/content/Context;Ljava/time/LocalDate;)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p0, " ms)"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "ReadingGoals"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    :goto_0
    return-void
.end method

.method public static onReaderResume(Landroid/app/Activity;)V
    .locals 4

    .line 35
    sget-wide v0, Lcom/faultexception/reader/goals/ReadingTracker;->sessionStart:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 36
    invoke-static {}, Lcom/faultexception/reader/goals/ReadingTracker;->flush()V

    .line 38
    :cond_0
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/faultexception/reader/goals/ReadingTracker;->reader:Ljava/lang/ref/WeakReference;

    .line 39
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    sput-wide v0, Lcom/faultexception/reader/goals/ReadingTracker;->sessionStart:J

    .line 40
    invoke-static {}, Ljava/time/LocalDate;->now()Ljava/time/LocalDate;

    move-result-object v0

    sput-object v0, Lcom/faultexception/reader/goals/ReadingTracker;->sessionDay:Ljava/time/LocalDate;

    .line 41
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "resumed (today: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/faultexception/reader/goals/ReadingTracker;->sessionDay:Ljava/time/LocalDate;

    invoke-static {p0, v1}, Lcom/faultexception/reader/goals/ReadingGoals;->getReadMs(Landroid/content/Context;Ljava/time/LocalDate;)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p0, " ms)"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "ReadingGoals"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    invoke-static {}, Lcom/faultexception/reader/goals/ReadingTracker;->schedule()V

    return-void
.end method

.method private static schedule()V
    .locals 8

    .line 63
    sget-object v0, Lcom/faultexception/reader/goals/ReadingTracker;->reader:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    return-void

    .line 67
    :cond_1
    invoke-static {}, Ljava/time/LocalDate;->now()Ljava/time/LocalDate;

    move-result-object v1

    .line 68
    invoke-static {}, Lcom/faultexception/reader/goals/ReadingTracker;->msUntilMidnight()J

    move-result-wide v2

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    const-wide/16 v4, 0x7530

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    .line 69
    invoke-static {v0, v1}, Lcom/faultexception/reader/goals/ReadingGoals;->isGoalMet(Landroid/content/Context;Ljava/time/LocalDate;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 70
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    sget-wide v6, Lcom/faultexception/reader/goals/ReadingTracker;->sessionStart:J

    sub-long/2addr v4, v6

    .line 71
    invoke-static {v0}, Lcom/faultexception/reader/goals/ReadingGoals;->getDailyGoalMs(Landroid/content/Context;)J

    move-result-wide v6

    invoke-static {v0, v1}, Lcom/faultexception/reader/goals/ReadingGoals;->getReadMs(Landroid/content/Context;Ljava/time/LocalDate;)J

    move-result-wide v0

    sub-long/2addr v6, v0

    sub-long/2addr v6, v4

    const-wide/16 v0, 0x0

    .line 72
    invoke-static {v6, v7, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    const-wide/16 v4, 0x64

    add-long/2addr v0, v4

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    .line 74
    :cond_2
    sget-object v0, Lcom/faultexception/reader/goals/ReadingTracker;->handler:Landroid/os/Handler;

    sget-object v1, Lcom/faultexception/reader/goals/ReadingTracker;->tick:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 75
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private static tick()V
    .locals 0

    .line 57
    invoke-static {}, Lcom/faultexception/reader/goals/ReadingTracker;->flush()V

    .line 58
    invoke-static {}, Lcom/faultexception/reader/goals/ReadingTracker;->schedule()V

    return-void
.end method
