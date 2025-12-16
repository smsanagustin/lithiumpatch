// # Reading timer
//
// Start a 10-minute timer when the reader webview attaches, show a toast
// when elapsed, and cancel when detached.
package patches

import (
	. "github.com/pgaskin/lithiumpatch/patches/patchdef"
)

func init() {
	inst := []Instruction{
		WriteFileString("smali/com/faultexception/reader/ReadingTimer.smali", `
.class public Lcom/faultexception/reader/ReadingTimer;
.super Ljava/lang/Object;

.field private static handler:Landroid/os/Handler;
.field private static runnable:Ljava/lang/Runnable;
.field private static started:Z

.method public constructor <init>()V
	.locals 0
	invoke-direct {p0}, Ljava/lang/Object;-><init>()V
	return-void
.end method

.method public static start(Landroid/content/Context;)V
	.locals 4
	sget-boolean v0, Lcom/faultexception/reader/ReadingTimer;->started:Z
	if-nez v0, :done

	const/4 v0, 0x1
	sput-boolean v0, Lcom/faultexception/reader/ReadingTimer;->started:Z

	new-instance v0, Landroid/os/Handler;
	invoke-direct {v0}, Landroid/os/Handler;-><init>()V
	sput-object v0, Lcom/faultexception/reader/ReadingTimer;->handler:Landroid/os/Handler;

	new-instance v0, Lcom/faultexception/reader/ReadingTimer$1;
	invoke-direct {v0, p0}, Lcom/faultexception/reader/ReadingTimer$1;-><init>(Landroid/content/Context;)V
	sput-object v0, Lcom/faultexception/reader/ReadingTimer;->runnable:Ljava/lang/Runnable;

	sget-object v0, Lcom/faultexception/reader/ReadingTimer;->handler:Landroid/os/Handler;
	sget-object v1, Lcom/faultexception/reader/ReadingTimer;->runnable:Ljava/lang/Runnable;
	const-wide/32 v2, 600000
	invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
	move-result v0

	:done
	return-void
.end method

.method public static stop()V
	.locals 2
	sget-object v0, Lcom/faultexception/reader/ReadingTimer;->handler:Landroid/os/Handler;
	if-eqz v0, :done
	sget-object v1, Lcom/faultexception/reader/ReadingTimer;->runnable:Ljava/lang/Runnable;
	invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

	const/4 v0, 0x0
	sput-object v0, Lcom/faultexception/reader/ReadingTimer;->handler:Landroid/os/Handler;
	sput-object v0, Lcom/faultexception/reader/ReadingTimer;->runnable:Ljava/lang/Runnable;
	sput-boolean v0, Lcom/faultexception/reader/ReadingTimer;->started:Z

	:done
	return-void
.end method
`),

		// Also write into smali_classes2 for multi-dex APKs
		WriteFileString("smali_classes2/com/faultexception/reader/ReadingTimer.smali", `
.class public Lcom/faultexception/reader/ReadingTimer;
.super Ljava/lang/Object;

.field private static handler:Landroid/os/Handler;
.field private static runnable:Ljava/lang/Runnable;
.field private static started:Z

.method public constructor <init>()V
	.locals 0
	invoke-direct {p0}, Ljava/lang/Object;-><init>()V
	return-void
.end method

.method public static start(Landroid/content/Context;)V
	.locals 4
	sget-boolean v0, Lcom/faultexception/reader/ReadingTimer;->started:Z
	if-nez v0, :done

	const/4 v0, 0x1
	sput-boolean v0, Lcom/faultexception/reader/ReadingTimer;->started:Z

	new-instance v0, Landroid/os/Handler;
	invoke-direct {v0}, Landroid/os/Handler;-><init>()V
	sput-object v0, Lcom/faultexception/reader/ReadingTimer;->handler:Landroid/os/Handler;

	new-instance v0, Lcom/faultexception/reader/ReadingTimer$1;
	invoke-direct {v0, p0}, Lcom/faultexception/reader/ReadingTimer$1;-><init>(Landroid/content/Context;)V
	sput-object v0, Lcom/faultexception/reader/ReadingTimer;->runnable:Ljava/lang/Runnable;

	sget-object v0, Lcom/faultexception/reader/ReadingTimer;->handler:Landroid/os/Handler;
	sget-object v1, Lcom/faultexception/reader/ReadingTimer;->runnable:Ljava/lang/Runnable;
	const-wide/32 v2, 600000
	invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
	move-result v0

	:done
	return-void
.end method

.method public static stop()V
	.locals 2
	sget-object v0, Lcom/faultexception/reader/ReadingTimer;->handler:Landroid/os/Handler;
	if-eqz v0, :done
	sget-object v1, Lcom/faultexception/reader/ReadingTimer;->runnable:Ljava/lang/Runnable;
	invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

	const/4 v0, 0x0
	sput-object v0, Lcom/faultexception/reader/ReadingTimer;->handler:Landroid/os/Handler;
	sput-object v0, Lcom/faultexception/reader/ReadingTimer;->runnable:Ljava/lang/Runnable;
	sput-boolean v0, Lcom/faultexception/reader/ReadingTimer;->started:Z

	:done
	return-void
.end method
`),

		WriteFileString("smali/com/faultexception/reader/ReadingTimer$1.smali", `
.class final Lcom/faultexception/reader/ReadingTimer$1;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

.field private final val$context:Landroid/content/Context;

.method public constructor <init>(Landroid/content/Context;)V
	.locals 0
	invoke-direct {p0}, Ljava/lang/Object;-><init>()V
	iput-object p1, p0, Lcom/faultexception/reader/ReadingTimer$1;->val$context:Landroid/content/Context;
	return-void
.end method

.method public run()V
	.locals 3
	iget-object v0, p0, Lcom/faultexception/reader/ReadingTimer$1;->val$context:Landroid/content/Context;
	const-string v1, "You have reached your reading goal for today!"
	const/4 v2, 0x1
	invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
	move-result-object v0
	invoke-virtual {v0}, Landroid/widget/Toast;->show()V
	return-void
.end method
`),

	}

	// append lifecycle methods to the reader webview so the timer starts/stops
	inst = append(inst, PatchFile("smali/com/faultexception/reader/content/HtmlContentWebView.smali", AppendString("\n.method protected onAttachedToWindow()V\n    .locals 1\n    invoke-super {p0}, Landroid/webkit/WebView;->onAttachedToWindow()V\n    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;\n    move-result-object v0\n    invoke-static {v0}, Lcom/faultexception/reader/ReadingTimer;->start(Landroid/content/Context;)V\n    return-void\n.end method\n\n.method protected onDetachedFromWindow()V\n    .locals 1\n    invoke-super {p0}, Landroid/webkit/WebView;->onDetachedFromWindow()V\n    invoke-static {}, Lcom/faultexception/reader/ReadingTimer;->stop()V\n    return-void\n.end method\n")))

	Register("reading_timer", inst...)
}
