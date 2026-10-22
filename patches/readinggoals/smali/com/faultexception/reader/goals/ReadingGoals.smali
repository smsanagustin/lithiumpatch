.class public final Lcom/faultexception/reader/goals/ReadingGoals;
.super Ljava/lang/Object;
.source "ReadingGoals.java"


# static fields
.field public static final DEFAULT_DAILY_MINUTES:I = 0xf

.field public static final DEFAULT_YEARLY_BOOKS:I = 0x3

.field private static final KEY_DAILY_MINUTES:Ljava/lang/String; = "daily_minutes"

.field private static final KEY_NOTIFIED_DAY:Ljava/lang/String; = "notified_day"

.field private static final KEY_YEARLY_BOOKS:Ljava/lang/String; = "yearly_books"

.field private static final PREFS:Ljava/lang/String; = "reading_goals"

.field private static final TAG:Ljava/lang/String; = "ReadingGoals"

.field private static final executor:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 26
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/faultexception/reader/goals/ReadingGoals;->executor:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static addReadMs(Landroid/content/Context;Ljava/time/LocalDate;J)Z
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-gtz v0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 100
    :cond_0
    invoke-static {p0}, Lcom/faultexception/reader/goals/ReadingGoalsDb;->get(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 101
    invoke-virtual {p1}, Ljava/time/LocalDate;->toString()Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "INSERT OR IGNORE INTO days (day) VALUES (?)"

    invoke-virtual {v0, v2, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 102
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {p1}, Ljava/time/LocalDate;->toString()Ljava/lang/String;

    move-result-object p3

    filled-new-array {p2, p3}, [Ljava/lang/Object;

    move-result-object p2

    const-string p3, "UPDATE days SET read_ms = read_ms + ? WHERE day = ?"

    invoke-virtual {v0, p3, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 103
    invoke-static {p0, p1}, Lcom/faultexception/reader/goals/ReadingGoals;->updateGoalMet(Landroid/content/Context;Ljava/time/LocalDate;)Z

    move-result p0

    return p0
.end method

.method public static getDailyGoalMinutes(Landroid/content/Context;)I
    .locals 2

    .line 48
    invoke-static {p0}, Lcom/faultexception/reader/goals/ReadingGoals;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "daily_minutes"

    const/16 v1, 0xf

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public static getDailyGoalMs(Landroid/content/Context;)J
    .locals 4

    .line 52
    invoke-static {p0}, Lcom/faultexception/reader/goals/ReadingGoals;->getDailyGoalMinutes(Landroid/content/Context;)I

    move-result p0

    int-to-long v0, p0

    const-wide/32 v2, 0xea60

    mul-long/2addr v0, v2

    return-wide v0
.end method

.method public static getReadMs(Landroid/content/Context;Ljava/time/LocalDate;)J
    .locals 2

    .line 81
    invoke-static {p0}, Lcom/faultexception/reader/goals/ReadingGoalsDb;->get(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    invoke-virtual {p1}, Ljava/time/LocalDate;->toString()Ljava/lang/String;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    const-string v0, "SELECT read_ms FROM days WHERE day = ?"

    invoke-virtual {p0, v0, p1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    .line 82
    :try_start_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    invoke-interface {p0, p1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x0

    :goto_0
    if-eqz p0, :cond_1

    .line 83
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_1
    return-wide v0

    :catchall_0
    move-exception p1

    if-eqz p0, :cond_2

    .line 81
    :try_start_1
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception p0

    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_2
    :goto_1
    throw p1
.end method

.method public static getYearlyGoalBooks(Landroid/content/Context;)I
    .locals 2

    .line 73
    invoke-static {p0}, Lcom/faultexception/reader/goals/ReadingGoals;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "yearly_books"

    const/4 v1, 0x3

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public static isGoalMet(Landroid/content/Context;Ljava/time/LocalDate;)Z
    .locals 1

    .line 87
    invoke-static {p0}, Lcom/faultexception/reader/goals/ReadingGoalsDb;->get(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    invoke-virtual {p1}, Ljava/time/LocalDate;->toString()Ljava/lang/String;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    const-string v0, "SELECT goal_met FROM days WHERE day = ?"

    invoke-virtual {p0, v0, p1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    .line 88
    :try_start_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    :cond_0
    if-eqz p0, :cond_1

    .line 89
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_1
    return v0

    :catchall_0
    move-exception p1

    if-eqz p0, :cond_2

    .line 87
    :try_start_1
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception p0

    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_2
    :goto_0
    throw p1
.end method

.method static synthetic lambda$onLibraryResume$0(Landroid/content/Context;)V
    .locals 2

    .line 36
    :try_start_0
    invoke-static {p0}, Lcom/faultexception/reader/goals/FinishedBooks;->scan(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string v0, "ReadingGoals"

    const-string v1, "failed to scan for finished books"

    .line 38
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method static markNotified(Landroid/content/Context;Ljava/time/LocalDate;)Z
    .locals 3

    .line 121
    invoke-static {p0}, Lcom/faultexception/reader/goals/ReadingGoals;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 122
    invoke-virtual {p1}, Ljava/time/LocalDate;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const-string v2, "notified_day"

    invoke-interface {p0, v2, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 125
    :cond_0
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-virtual {p1}, Ljava/time/LocalDate;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    const/4 p0, 0x1

    return p0
.end method

.method public static onLibraryResume(Landroid/app/Activity;)V
    .locals 2

    .line 33
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 34
    sget-object v0, Lcom/faultexception/reader/goals/ReadingGoals;->executor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/faultexception/reader/goals/ReadingGoals$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/faultexception/reader/goals/ReadingGoals$$ExternalSyntheticLambda0;-><init>(Landroid/content/Context;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .locals 2

    .line 44
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const-string v0, "reading_goals"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method public static setDailyGoalMinutes(Landroid/content/Context;I)V
    .locals 4

    .line 62
    invoke-static {}, Ljava/time/LocalDate;->now()Ljava/time/LocalDate;

    move-result-object v0

    .line 63
    invoke-static {p0, v0}, Lcom/faultexception/reader/goals/ReadingGoals;->isGoalMet(Landroid/content/Context;Ljava/time/LocalDate;)Z

    move-result v1

    .line 64
    invoke-static {p0}, Lcom/faultexception/reader/goals/ReadingGoals;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v3, "daily_minutes"

    invoke-interface {v2, v3, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 65
    invoke-static {p0, v0}, Lcom/faultexception/reader/goals/ReadingGoals;->updateGoalMet(Landroid/content/Context;Ljava/time/LocalDate;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 66
    invoke-static {p0, v0}, Lcom/faultexception/reader/goals/ReadingGoals;->markNotified(Landroid/content/Context;Ljava/time/LocalDate;)Z

    goto :goto_0

    :cond_0
    if-eqz v1, :cond_1

    .line 67
    invoke-static {p0, v0}, Lcom/faultexception/reader/goals/ReadingGoals;->isGoalMet(Landroid/content/Context;Ljava/time/LocalDate;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 68
    invoke-static {p0}, Lcom/faultexception/reader/goals/ReadingGoals;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p1, "notified_day"

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_1
    :goto_0
    return-void
.end method

.method public static setYearlyGoalBooks(Landroid/content/Context;I)V
    .locals 1

    .line 77
    invoke-static {p0}, Lcom/faultexception/reader/goals/ReadingGoals;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "yearly_books"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method private static updateGoalMet(Landroid/content/Context;Ljava/time/LocalDate;)Z
    .locals 6

    .line 111
    invoke-static {p0, p1}, Lcom/faultexception/reader/goals/ReadingGoals;->isGoalMet(Landroid/content/Context;Ljava/time/LocalDate;)Z

    move-result v0

    .line 112
    invoke-static {p0, p1}, Lcom/faultexception/reader/goals/ReadingGoals;->getReadMs(Landroid/content/Context;Ljava/time/LocalDate;)J

    move-result-wide v1

    invoke-static {p0}, Lcom/faultexception/reader/goals/ReadingGoals;->getDailyGoalMs(Landroid/content/Context;)J

    move-result-wide v3

    cmp-long v1, v1, v3

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ltz v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    move v1, v3

    :goto_0
    if-eq v1, v0, :cond_1

    .line 114
    invoke-static {p0}, Lcom/faultexception/reader/goals/ReadingGoalsDb;->get(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v3

    invoke-virtual {p1}, Ljava/time/LocalDate;->toString()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v4, v2

    const-string p1, "UPDATE days SET goal_met = ? WHERE day = ?"

    invoke-virtual {p0, p1, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_1
    if-eqz v1, :cond_2

    if-nez v0, :cond_2

    goto :goto_1

    :cond_2
    move v2, v3

    :goto_1
    return v2
.end method
