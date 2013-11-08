.class Lcom/android/internal/telephony/msim/MSimHWGlobalMode$2;
.super Landroid/content/BroadcastReceiver;
.source "MSimHWGlobalMode.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/msim/MSimHWGlobalMode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;


# direct methods
.method constructor <init>(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)V
    .locals 0
    .parameter

    .prologue
    iput-object p1, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$2;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .parameter "context"
    .parameter "intent"

    .prologue
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.START_SEC_NET_SEL"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$2;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;
    invoke-static {v0}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$400(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Lcom/android/internal/telephony/msim/SubscriptionManager;

    move-result-object v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$2;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;
    invoke-static {v0}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$000(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Received ACTION_START_SEC_NET_SEL, but not all card info available, so do nothing!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$2;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mbSetSubscriptionStatus:Z
    invoke-static {v0}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$900(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$2;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    const/4 v1, 0x1

    #setter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mbPendingIntent:Z
    invoke-static {v0, v1}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$1002(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;Z)Z

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$2;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;
    invoke-static {v0}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$000(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Received ACTION_START_SEC_NET_SEL, but Somebody is processing subscription, wait!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$2;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    const/4 v1, 0x0

    #setter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mbPendingIntent:Z
    invoke-static {v0, v1}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$1002(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;Z)Z

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$2;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #calls: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->process2ndSelNetwork()V
    invoke-static {v0}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$1100(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)V

    goto :goto_0
.end method
