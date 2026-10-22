.class final Lcom/faultexception/reader/goals/ReadingGoalsDb;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "ReadingGoalsDb.java"


# static fields
.field private static final NAME:Ljava/lang/String; = "reading_goals.db"

.field private static final VERSION:I = 0x1

.field private static instance:Lcom/faultexception/reader/goals/ReadingGoalsDb;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x1

    const-string v2, "reading_goals.db"

    .line 25
    invoke-direct {p0, p1, v2, v0, v1}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    return-void
.end method

.method static declared-synchronized get(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;
    .locals 2

    const-class v0, Lcom/faultexception/reader/goals/ReadingGoalsDb;

    monitor-enter v0

    .line 18
    :try_start_0
    sget-object v1, Lcom/faultexception/reader/goals/ReadingGoalsDb;->instance:Lcom/faultexception/reader/goals/ReadingGoalsDb;

    if-nez v1, :cond_0

    .line 19
    new-instance v1, Lcom/faultexception/reader/goals/ReadingGoalsDb;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v1, p0}, Lcom/faultexception/reader/goals/ReadingGoalsDb;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/faultexception/reader/goals/ReadingGoalsDb;->instance:Lcom/faultexception/reader/goals/ReadingGoalsDb;

    .line 21
    :cond_0
    sget-object p0, Lcom/faultexception/reader/goals/ReadingGoalsDb;->instance:Lcom/faultexception/reader/goals/ReadingGoalsDb;

    invoke-virtual {p0}, Lcom/faultexception/reader/goals/ReadingGoalsDb;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method


# virtual methods
.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1

    const-string v0, "CREATE TABLE days (day TEXT PRIMARY KEY, read_ms INTEGER NOT NULL DEFAULT 0, goal_met INTEGER NOT NULL DEFAULT 0)"

    .line 32
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE finished (book_id INTEGER PRIMARY KEY, finished_date INTEGER NOT NULL, title TEXT, creator TEXT)"

    .line 34
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 0

    return-void
.end method
