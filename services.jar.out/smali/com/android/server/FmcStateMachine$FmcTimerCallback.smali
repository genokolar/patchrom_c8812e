.class public Lcom/android/server/FmcStateMachine$FmcTimerCallback;
.super Ljava/util/TimerTask;
.source "FmcStateMachine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/FmcStateMachine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "FmcTimerCallback"
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String; = "FmcTimerCallback"


# instance fields
.field final synthetic this$0:Lcom/android/server/FmcStateMachine;


# direct methods
.method constructor <init>(Lcom/android/server/FmcStateMachine;)V
    .locals 2
    .parameter

    .prologue
    iput-object p1, p0, Lcom/android/server/FmcStateMachine$FmcTimerCallback;->this$0:Lcom/android/server/FmcStateMachine;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    const-string v0, "FmcTimerCallback"

    const-string v1, "constructor"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    const-string v0, "FmcTimerCallback"

    const-string v1, "run"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/android/server/FmcStateMachine;->fmcTimer:Lcom/android/server/FmcTimer;

    invoke-virtual {v0}, Lcom/android/server/FmcTimer;->clearTimer()Z

    iget-object v0, p0, Lcom/android/server/FmcStateMachine$FmcTimerCallback;->this$0:Lcom/android/server/FmcStateMachine;

    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Lcom/android/server/FmcStateMachine;->sendMessage(I)V

    return-void
.end method
