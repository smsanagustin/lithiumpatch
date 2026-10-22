.class public final Lcom/faultexception/reader/goals/FinishedBooks;
.super Ljava/lang/Object;
.source "FinishedBooks.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/faultexception/reader/goals/FinishedBooks$Book;
    }
.end annotation


# static fields
.field private static final KEY_SCAN_TS:Ljava/lang/String; = "finished_scan_ts"

.field private static final TAG:Ljava/lang/String; = "ReadingGoals"

.field public static final THRESHOLD_PERCENT:I = 0x5f


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static list(Landroid/content/Context;I)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I)",
            "Ljava/util/List<",
            "Lcom/faultexception/reader/goals/FinishedBooks$Book;",
            ">;"
        }
    .end annotation

    .line 88
    invoke-static {}, Ljava/time/ZoneId;->systemDefault()Ljava/time/ZoneId;

    move-result-object v0

    const/4 v1, 0x1

    .line 89
    invoke-static {p1, v1, v1}, Ljava/time/LocalDate;->of(III)Ljava/time/LocalDate;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/time/LocalDate;->atStartOfDay(Ljava/time/ZoneId;)Ljava/time/ZonedDateTime;

    move-result-object v2

    invoke-virtual {v2}, Ljava/time/ZonedDateTime;->toInstant()Ljava/time/Instant;

    move-result-object v2

    invoke-virtual {v2}, Ljava/time/Instant;->toEpochMilli()J

    move-result-wide v2

    add-int/2addr p1, v1

    .line 90
    invoke-static {p1, v1, v1}, Ljava/time/LocalDate;->of(III)Ljava/time/LocalDate;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/time/LocalDate;->atStartOfDay(Ljava/time/ZoneId;)Ljava/time/ZonedDateTime;

    move-result-object p1

    invoke-virtual {p1}, Ljava/time/ZonedDateTime;->toInstant()Ljava/time/Instant;

    move-result-object p1

    invoke-virtual {p1}, Ljava/time/Instant;->toEpochMilli()J

    move-result-wide v4

    .line 92
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 93
    invoke-static {p0}, Lcom/faultexception/reader/goals/ReadingGoalsDb;->get(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v0, v2}, [Ljava/lang/String;

    move-result-object v0

    const-string v2, "SELECT book_id, finished_date, title, creator FROM finished WHERE finished_date >= ? AND finished_date < ? ORDER BY finished_date DESC"

    invoke-virtual {p0, v2, v0}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    .line 94
    :goto_0
    :try_start_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 95
    new-instance v0, Lcom/faultexception/reader/goals/FinishedBooks$Book;

    const/4 v2, 0x0

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    const/4 v2, 0x2

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    const/4 v2, 0x3

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object v2, v0

    invoke-direct/range {v2 .. v8}, Lcom/faultexception/reader/goals/FinishedBooks$Book;-><init>(JJLjava/lang/String;Ljava/lang/String;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_0
    if-eqz p0, :cond_1

    .line 97
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_1
    return-object p1

    :catchall_0
    move-exception p1

    if-eqz p0, :cond_2

    .line 93
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

.method static percent(Landroid/database/sqlite/SQLiteDatabase;JLjava/lang/String;)I
    .locals 5

    const-string v0, "position"

    const-string v1, "url"

    const/4 v2, -0x1

    if-eqz p3, :cond_5

    .line 107
    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_1

    .line 111
    :cond_0
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, p3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 112
    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_4

    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p3

    if-nez p3, :cond_1

    goto :goto_0

    .line 115
    :cond_1
    invoke-static {p1, p2, p0}, Lcom/faultexception/reader/book/EPubPageMap;->readFromCache(JLandroid/database/sqlite/SQLiteDatabase;)Lcom/faultexception/reader/book/EPubPageMap;

    move-result-object p0

    if-eqz p0, :cond_4

    .line 116
    iget-object p3, p0, Lcom/faultexception/reader/book/EPubPageMap;->items:Ljava/util/Map;

    if-eqz p3, :cond_4

    iget p3, p0, Lcom/faultexception/reader/book/EPubPageMap;->totalPageCount:I

    if-gtz p3, :cond_2

    goto :goto_0

    .line 119
    :cond_2
    iget-object p3, p0, Lcom/faultexception/reader/book/EPubPageMap;->items:Ljava/util/Map;

    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/faultexception/reader/book/EPubPageMap$Item;

    if-eqz p3, :cond_4

    .line 120
    iget v1, p3, Lcom/faultexception/reader/book/EPubPageMap$Item;->pageCount:I

    if-gtz v1, :cond_3

    goto :goto_0

    .line 123
    :cond_3
    iget v1, p3, Lcom/faultexception/reader/book/EPubPageMap$Item;->pageStart:I

    iget p3, p3, Lcom/faultexception/reader/book/EPubPageMap$Item;->pageCount:I

    add-int/lit8 p3, p3, -0x1

    int-to-float p3, p3

    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v3

    double-to-float v0, v3

    mul-float/2addr p3, v0

    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    move-result p3

    add-int/2addr v1, p3

    add-int/lit8 v1, v1, 0x1

    int-to-float p3, v1

    const/high16 v0, 0x42c80000    # 100.0f

    mul-float/2addr p3, v0

    .line 124
    iget p0, p0, Lcom/faultexception/reader/book/EPubPageMap;->totalPageCount:I

    int-to-float p0, p0

    div-float/2addr p3, p0

    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :cond_4
    :goto_0
    return v2

    :catch_0
    move-exception p0

    .line 126
    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "failed to compute progress for book "

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "ReadingGoals"

    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_5
    :goto_1
    return v2
.end method

.method public static declared-synchronized scan(Landroid/content/Context;)V
    .locals 21

    const-class v1, Lcom/faultexception/reader/goals/FinishedBooks;

    monitor-enter v1

    .line 53
    :try_start_0
    invoke-static/range {p0 .. p0}, Lcom/faultexception/reader/goals/ReadingGoals;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v2, "finished_scan_ts"

    const-wide/16 v3, -0x1

    .line 54
    invoke-interface {v0, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v5

    .line 55
    invoke-static/range {p0 .. p0}, Lcom/faultexception/reader/db/DatabaseProvider;->getDatabase(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 56
    invoke-static/range {p0 .. p0}, Lcom/faultexception/reader/goals/ReadingGoalsDb;->get(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v7

    const-string v8, "SELECT _id, title, creator, current_position, last_open_date FROM books WHERE last_open_date > ?"

    const/4 v9, 0x1

    new-array v10, v9, [Ljava/lang/String;

    .line 59
    invoke-static {v5, v6}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    aput-object v11, v10, v12

    invoke-virtual {v2, v8, v10}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    move-wide v10, v5

    .line 60
    :goto_0
    :try_start_1
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v13

    if-eqz v13, :cond_6

    .line 61
    invoke-interface {v8, v12}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v13

    const/4 v15, 0x4

    .line 62
    invoke-interface {v8, v15}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    invoke-static {v10, v11, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v10

    const/4 v3, 0x3

    .line 64
    invoke-interface {v8, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v13, v14, v4}, Lcom/faultexception/reader/goals/FinishedBooks;->percent(Landroid/database/sqlite/SQLiteDatabase;JLjava/lang/String;)I

    move-result v4

    if-gez v4, :cond_0

    move v13, v12

    move v12, v9

    goto/16 :goto_2

    :cond_0
    const-string v3, "SELECT percent FROM progress WHERE book_id = ?"

    new-array v15, v9, [Ljava/lang/String;

    .line 69
    invoke-static {v13, v14}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v18

    aput-object v18, v15, v12

    invoke-virtual {v7, v3, v15}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 70
    :try_start_2
    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v15

    if-eqz v15, :cond_1

    .line 71
    invoke-interface {v3, v12}, Landroid/database/Cursor;->getInt(I)I

    move-result v15
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    :cond_1
    const-wide/16 v15, -0x1

    cmp-long v17, v5, v15

    if-nez v17, :cond_2

    move v15, v4

    goto :goto_1

    :cond_2
    move v15, v12

    :goto_1
    if-eqz v3, :cond_3

    .line 75
    :try_start_3
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    :cond_3
    const/16 v3, 0x5f

    if-ge v15, v3, :cond_4

    if-lt v4, v3, :cond_4

    const-string v3, "ReadingGoals"

    .line 77
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "finished book "

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v12, " ("

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v12, "% -> "

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v12, "%)"

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v3, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v3, "INSERT OR REPLACE INTO finished (book_id, finished_date, title, creator) VALUES (?, ?, ?, ?)"

    const/4 v9, 0x4

    new-array v9, v9, [Ljava/lang/Object;

    .line 78
    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    const/4 v15, 0x0

    aput-object v12, v9, v15

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v19

    invoke-static/range {v19 .. v20}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    const/4 v15, 0x1

    aput-object v12, v9, v15

    invoke-interface {v8, v15}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    const/4 v15, 0x2

    aput-object v12, v9, v15

    invoke-interface {v8, v15}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    const/4 v15, 0x3

    aput-object v12, v9, v15

    invoke-virtual {v7, v3, v9}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_4
    const-string v3, "INSERT OR REPLACE INTO progress (book_id, percent) VALUES (?, ?)"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    .line 80
    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    const/4 v13, 0x0

    aput-object v12, v9, v13

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v12, 0x1

    aput-object v4, v9, v12

    invoke-virtual {v7, v3, v9}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    :goto_2
    move v9, v12

    move v12, v13

    const-wide/16 v3, -0x1

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    move-object v2, v0

    if-eqz v3, :cond_5

    .line 69
    :try_start_4
    invoke-interface {v3}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_3

    :catchall_1
    move-exception v0

    move-object v3, v0

    :try_start_5
    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_5
    :goto_3
    throw v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :cond_6
    if-eqz v8, :cond_7

    .line 82
    :try_start_6
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 83
    :cond_7
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "finished_scan_ts"

    const-wide/16 v3, 0x0

    invoke-static {v10, v11, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    invoke-interface {v0, v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 84
    monitor-exit v1

    return-void

    :catchall_2
    move-exception v0

    move-object v2, v0

    if-eqz v8, :cond_8

    .line 59
    :try_start_7
    invoke-interface {v8}, Landroid/database/Cursor;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    goto :goto_4

    :catchall_3
    move-exception v0

    move-object v3, v0

    :try_start_8
    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_8
    :goto_4
    throw v2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    :catchall_4
    move-exception v0

    monitor-exit v1

    throw v0
.end method
