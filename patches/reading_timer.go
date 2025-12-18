// # Reading timer
//
// Track reading time with persistence and show accumulated time in settings.
// Shows a toast when the user has read for 10 minutes in a day, and provides
// a UI in settings to see today's reading time and reading streak.
// Reading streak tracks consecutive days of completing the 10-minute goal.
package patches

import (
	. "github.com/pgaskin/lithiumpatch/patches/patchdef"
)

func init() {
	// Main ReadingTimer class that tracks accumulated time
	readingTimerSmali := `
.class public Lcom/faultexception/reader/ReadingTimer;
.super Ljava/lang/Object;

.field private static handler:Landroid/os/Handler;
.field private static tickRunnable:Ljava/lang/Runnable;
.field private static started:Z
.field private static contextRef:Landroid/content/Context;
.field private static goalShown:Z

.method public constructor <init>()V
	.locals 0
	invoke-direct {p0}, Ljava/lang/Object;-><init>()V
	return-void
.end method

# Get today's date as a string key (YYYY-MM-DD)
.method private static getTodayKey()Ljava/lang/String;
	.locals 3
	new-instance v0, Ljava/text/SimpleDateFormat;
	const-string v1, "yyyy-MM-dd"
	invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;
	move-result-object v2
	invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V
	new-instance v1, Ljava/util/Date;
	invoke-direct {v1}, Ljava/util/Date;-><init>()V
	invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
	move-result-object v0
	return-object v0
.end method

# Get SharedPreferences for reading time storage
.method private static getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
	.locals 2
	const-string v0, "reading_timer_prefs"
	const/4 v1, 0x0
	invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
	move-result-object v0
	return-object v0
.end method

# Get today's reading time in seconds
.method public static getTodayReadingTime(Landroid/content/Context;)I
	.locals 4
	invoke-static {p0}, Lcom/faultexception/reader/ReadingTimer;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
	move-result-object v0
	invoke-static {}, Lcom/faultexception/reader/ReadingTimer;->getTodayKey()Ljava/lang/String;
	move-result-object v1
	const/4 v2, 0x0
	invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I
	move-result v3
	return v3
.end method

# Save today's reading time in seconds
.method private static saveTodayReadingTime(Landroid/content/Context;I)V
	.locals 3
	invoke-static {p0}, Lcom/faultexception/reader/ReadingTimer;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
	move-result-object v0
	invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
	move-result-object v0
	invoke-static {}, Lcom/faultexception/reader/ReadingTimer;->getTodayKey()Ljava/lang/String;
	move-result-object v1
	invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;
	invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
	return-void
.end method

# Format seconds as "X min" or "X hr Y min"
.method public static formatReadingTime(I)Ljava/lang/String;
	.locals 4
	div-int/lit8 v0, p0, 0x3c
	if-ltz v0, :zero
	const/16 v1, 0x3c
	if-lt v0, v1, :minutes_only
	# hours and minutes
	div-int/lit8 v1, v0, 0x3c
	rem-int/lit8 v2, v0, 0x3c
	new-instance v3, Ljava/lang/StringBuilder;
	invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V
	invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
	const-string v1, " hr "
	invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
	invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
	const-string v1, " min"
	invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
	invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
	move-result-object v0
	return-object v0
	:minutes_only
	new-instance v1, Ljava/lang/StringBuilder;
	invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V
	invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
	const-string v2, " min"
	invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
	invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
	move-result-object v0
	return-object v0
	:zero
	const-string v0, "0 min"
	return-object v0
.end method

# Get current reading streak
.method public static getStreak(Landroid/content/Context;)I
	.locals 4
	invoke-static {p0}, Lcom/faultexception/reader/ReadingTimer;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
	move-result-object v0
	const-string v1, "reading_streak"
	const/4 v2, 0x0
	invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I
	move-result v3
	return v3
.end method

# Format streak as "X days" or "X day"
.method public static formatStreak(I)Ljava/lang/String;
	.locals 3
	const/4 v1, 0x1
	if-ne p0, v1, :multiple
	new-instance v0, Ljava/lang/StringBuilder;
	invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
	invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
	const-string v1, " day"
	invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
	invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
	move-result-object v0
	return-object v0
	:multiple
	new-instance v0, Ljava/lang/StringBuilder;
	invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
	invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
	const-string v1, " days"
	invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
	invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
	move-result-object v0
	return-object v0
.end method

# Check if dates are consecutive (YYYY-MM-DD format)
.method private static isConsecutiveDays(Ljava/lang/String;Ljava/lang/String;)Z
	.locals 8
	:try_start
	new-instance v0, Ljava/text/SimpleDateFormat;
	const-string v1, "yyyy-MM-dd"
	invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;
	move-result-object v2
	invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

	invoke-virtual {v0, p0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
	move-result-object v1
	invoke-virtual {v0, p1}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
	move-result-object v2

	invoke-virtual {v1}, Ljava/util/Date;->getTime()J
	move-result-wide v3
	invoke-virtual {v2}, Ljava/util/Date;->getTime()J
	move-result-wide v5

	sub-long/2addr v5, v3
	const-wide/32 v3, 0x5265c00
	div-long/2addr v5, v3

	const-wide/16 v3, 0x1
	cmp-long v0, v5, v3
	if-nez v0, :not_consecutive
	const/4 v0, 0x1
	return v0
	:not_consecutive
	const/4 v0, 0x0
	return v0
	:try_end
	.catch Ljava/lang/Exception; {:try_start .. :try_end} :catch
	:catch
	const/4 v0, 0x0
	return v0
.end method

# Update reading streak when goal is reached
.method public static updateStreak(Landroid/content/Context;)V
	.locals 7
	invoke-static {p0}, Lcom/faultexception/reader/ReadingTimer;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
	move-result-object v0

	const-string v1, "last_completed_date"
	const-string v2, ""
	invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
	move-result-object v3

	const-string v4, "reading_streak"
	const/4 v5, 0x0
	invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I
	move-result v6

	invoke-static {}, Lcom/faultexception/reader/ReadingTimer;->getTodayKey()Ljava/lang/String;
	move-result-object v2

	# Check if already completed today
	invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
	move-result v5
	if-eqz v5, :check_streak
	return-void

	:check_streak
	# Check if streak should continue or reset
	invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z
	move-result v5
	if-eqz v5, :check_consecutive
	# First time completing goal
	const/4 v6, 0x1
	goto :save_streak

	:check_consecutive
	invoke-static {v3, v2}, Lcom/faultexception/reader/ReadingTimer;->isConsecutiveDays(Ljava/lang/String;Ljava/lang/String;)Z
	move-result v5
	if-eqz v5, :reset_streak
	# Consecutive day - increment streak
	add-int/lit8 v6, v6, 0x1
	goto :save_streak

	:reset_streak
	# Missed a day - reset to 1
	const/4 v6, 0x1

	:save_streak
	invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
	move-result-object v0
	invoke-interface {v0, v4, v6}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;
	invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
	invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
	return-void
.end method

# Start tracking reading time
.method public static start(Landroid/content/Context;)V
	.locals 4
	sget-boolean v0, Lcom/faultexception/reader/ReadingTimer;->started:Z
	if-nez v0, :done

	const/4 v0, 0x1
	sput-boolean v0, Lcom/faultexception/reader/ReadingTimer;->started:Z
	sput-object p0, Lcom/faultexception/reader/ReadingTimer;->contextRef:Landroid/content/Context;

	# Check if we already showed the goal toast today
	invoke-static {p0}, Lcom/faultexception/reader/ReadingTimer;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
	move-result-object v0
	new-instance v1, Ljava/lang/StringBuilder;
	invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V
	const-string v2, "goal_shown_"
	invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
	invoke-static {}, Lcom/faultexception/reader/ReadingTimer;->getTodayKey()Ljava/lang/String;
	move-result-object v2
	invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
	invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
	move-result-object v1
	const/4 v2, 0x0
	invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
	move-result v0
	sput-boolean v0, Lcom/faultexception/reader/ReadingTimer;->goalShown:Z

	new-instance v0, Landroid/os/Handler;
	invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
	move-result-object v1
	invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
	sput-object v0, Lcom/faultexception/reader/ReadingTimer;->handler:Landroid/os/Handler;

	new-instance v0, Lcom/faultexception/reader/ReadingTimer$TickRunnable;
	invoke-direct {v0, p0}, Lcom/faultexception/reader/ReadingTimer$TickRunnable;-><init>(Landroid/content/Context;)V
	sput-object v0, Lcom/faultexception/reader/ReadingTimer;->tickRunnable:Ljava/lang/Runnable;

	# Post first tick after 1 second
	sget-object v0, Lcom/faultexception/reader/ReadingTimer;->handler:Landroid/os/Handler;
	sget-object v1, Lcom/faultexception/reader/ReadingTimer;->tickRunnable:Ljava/lang/Runnable;
	const-wide/16 v2, 0x3e8
	invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

	:done
	return-void
.end method

# Stop tracking and save time
.method public static stop()V
	.locals 2
	sget-object v0, Lcom/faultexception/reader/ReadingTimer;->handler:Landroid/os/Handler;
	if-eqz v0, :done
	sget-object v1, Lcom/faultexception/reader/ReadingTimer;->tickRunnable:Ljava/lang/Runnable;
	invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

	const/4 v0, 0x0
	sput-object v0, Lcom/faultexception/reader/ReadingTimer;->handler:Landroid/os/Handler;
	sput-object v0, Lcom/faultexception/reader/ReadingTimer;->tickRunnable:Ljava/lang/Runnable;
	sput-object v0, Lcom/faultexception/reader/ReadingTimer;->contextRef:Landroid/content/Context;
	sput-boolean v0, Lcom/faultexception/reader/ReadingTimer;->started:Z

	:done
	return-void
.end method

# Called every second to increment the counter
.method public static onTick(Landroid/content/Context;)V
	.locals 6
	# Get current time and increment
	invoke-static {p0}, Lcom/faultexception/reader/ReadingTimer;->getTodayReadingTime(Landroid/content/Context;)I
	move-result v0
	add-int/lit8 v0, v0, 0x1
	invoke-static {p0, v0}, Lcom/faultexception/reader/ReadingTimer;->saveTodayReadingTime(Landroid/content/Context;I)V

	# Check if we hit 10 minutes (600 seconds) and haven't shown toast yet
	sget-boolean v1, Lcom/faultexception/reader/ReadingTimer;->goalShown:Z
	if-nez v1, :schedule_next
	const/16 v2, 0x258
	if-lt v0, v2, :schedule_next

	# Show toast and mark as shown
	const/4 v1, 0x1
	sput-boolean v1, Lcom/faultexception/reader/ReadingTimer;->goalShown:Z

	# Save that we showed the goal today
	invoke-static {p0}, Lcom/faultexception/reader/ReadingTimer;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
	move-result-object v2
	invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
	move-result-object v2
	new-instance v3, Ljava/lang/StringBuilder;
	invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V
	const-string v4, "goal_shown_"
	invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
	invoke-static {}, Lcom/faultexception/reader/ReadingTimer;->getTodayKey()Ljava/lang/String;
	move-result-object v4
	invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
	invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
	move-result-object v3
	invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;
	invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

	# Update reading streak
	invoke-static {p0}, Lcom/faultexception/reader/ReadingTimer;->updateStreak(Landroid/content/Context;)V

	const-string v2, "You have reached your reading goal for today!"
	const/4 v3, 0x1
	invoke-static {p0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
	move-result-object v2
	invoke-virtual {v2}, Landroid/widget/Toast;->show()V

	:schedule_next
	# Schedule next tick
	sget-object v0, Lcom/faultexception/reader/ReadingTimer;->handler:Landroid/os/Handler;
	if-eqz v0, :done
	sget-object v1, Lcom/faultexception/reader/ReadingTimer;->tickRunnable:Ljava/lang/Runnable;
	const-wide/16 v2, 0x3e8
	invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

	:done
	return-void
.end method
`

	// Tick runnable inner class
	tickRunnableSmali := `
.class final Lcom/faultexception/reader/ReadingTimer$TickRunnable;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

.field private final val$context:Landroid/content/Context;

.method public constructor <init>(Landroid/content/Context;)V
	.locals 0
	invoke-direct {p0}, Ljava/lang/Object;-><init>()V
	iput-object p1, p0, Lcom/faultexception/reader/ReadingTimer$TickRunnable;->val$context:Landroid/content/Context;
	return-void
.end method

.method public run()V
	.locals 1
	iget-object v0, p0, Lcom/faultexception/reader/ReadingTimer$TickRunnable;->val$context:Landroid/content/Context;
	invoke-static {v0}, Lcom/faultexception/reader/ReadingTimer;->onTick(Landroid/content/Context;)V
	return-void
.end method
`

	// Custom Preference class to display reading time
	readingTimePreferenceSmali := `
.class public Lcom/faultexception/reader/ReadingTimePreference;
.super Landroidx/preference/Preference;

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
	.locals 0
	invoke-direct {p0, p1, p2}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
	invoke-virtual {p0}, Lcom/faultexception/reader/ReadingTimePreference;->updateSummary()V
	return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
	.locals 0
	invoke-direct {p0, p1, p2, p3}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
	invoke-virtual {p0}, Lcom/faultexception/reader/ReadingTimePreference;->updateSummary()V
	return-void
.end method

.method public updateSummary()V
	.locals 3
	invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;
	move-result-object v0
	invoke-static {v0}, Lcom/faultexception/reader/ReadingTimer;->getTodayReadingTime(Landroid/content/Context;)I
	move-result v1
	invoke-static {v1}, Lcom/faultexception/reader/ReadingTimer;->formatReadingTime(I)Ljava/lang/String;
	move-result-object v2
	invoke-virtual {p0, v2}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V
	return-void
.end method

.method public onAttached()V
	.locals 0
	invoke-super {p0}, Landroidx/preference/Preference;->onAttached()V
	invoke-virtual {p0}, Lcom/faultexception/reader/ReadingTimePreference;->updateSummary()V
	return-void
.end method
`

	// Custom Preference class to display reading streak
	readingStreakPreferenceSmali := `
.class public Lcom/faultexception/reader/ReadingStreakPreference;
.super Landroidx/preference/Preference;

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
	.locals 0
	invoke-direct {p0, p1, p2}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
	invoke-virtual {p0}, Lcom/faultexception/reader/ReadingStreakPreference;->updateSummary()V
	return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
	.locals 0
	invoke-direct {p0, p1, p2, p3}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
	invoke-virtual {p0}, Lcom/faultexception/reader/ReadingStreakPreference;->updateSummary()V
	return-void
.end method

.method public updateSummary()V
	.locals 3
	invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;
	move-result-object v0
	invoke-static {v0}, Lcom/faultexception/reader/ReadingTimer;->getStreak(Landroid/content/Context;)I
	move-result v1
	invoke-static {v1}, Lcom/faultexception/reader/ReadingTimer;->formatStreak(I)Ljava/lang/String;
	move-result-object v2
	invoke-virtual {p0, v2}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V
	return-void
.end method

.method public onAttached()V
	.locals 0
	invoke-super {p0}, Landroidx/preference/Preference;->onAttached()V
	invoke-virtual {p0}, Lcom/faultexception/reader/ReadingStreakPreference;->updateSummary()V
	return-void
.end method
`

	inst := []Instruction{
		// Write to smali_classes2 to avoid exceeding primary DEX method limit
		WriteFileString("smali_classes2/com/faultexception/reader/ReadingTimer.smali", readingTimerSmali),
		WriteFileString("smali_classes2/com/faultexception/reader/ReadingTimer$TickRunnable.smali", tickRunnableSmali),
		WriteFileString("smali_classes2/com/faultexception/reader/ReadingTimePreference.smali", readingTimePreferenceSmali),
		WriteFileString("smali_classes2/com/faultexception/reader/ReadingStreakPreference.smali", readingStreakPreferenceSmali),
	}

	// Add reading time and streak preferences to settings
	inst = append(inst, PatchFile("res/xml/preferences.xml",
		ReplaceStringAppend(
			"\n"+`    <PreferenceCategory android:title="@string/pref_category_advanced">`,
			"\n"+`        <com.faultexception.reader.ReadingTimePreference android:title="Today&apos;s reading time" android:key="reading_time_display" android:selectable="false" />`+
			"\n"+`        <com.faultexception.reader.ReadingStreakPreference android:title="Reading streak" android:key="reading_streak_display" android:selectable="false" />`,
		),
	))

	// append lifecycle methods to the reader webview so the timer starts/stops
	inst = append(inst, PatchFile("smali/com/faultexception/reader/content/HtmlContentWebView.smali", AppendString("\n.method protected onAttachedToWindow()V\n    .locals 1\n    invoke-super {p0}, Landroid/webkit/WebView;->onAttachedToWindow()V\n    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;\n    move-result-object v0\n    invoke-static {v0}, Lcom/faultexception/reader/ReadingTimer;->start(Landroid/content/Context;)V\n    return-void\n.end method\n\n.method protected onDetachedFromWindow()V\n    .locals 1\n    invoke-super {p0}, Landroid/webkit/WebView;->onDetachedFromWindow()V\n    invoke-static {}, Lcom/faultexception/reader/ReadingTimer;->stop()V\n    return-void\n.end method\n")))

	Register("reading_timer", inst...)
}
