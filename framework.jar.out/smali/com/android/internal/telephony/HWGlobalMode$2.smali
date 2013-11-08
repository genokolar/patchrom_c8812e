.class Lcom/android/internal/telephony/HWGlobalMode$2;
.super Landroid/content/BroadcastReceiver;
.source "HWGlobalMode.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/HWGlobalMode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/telephony/HWGlobalMode;


# direct methods
.method constructor <init>(Lcom/android/internal/telephony/HWGlobalMode;)V
    .locals 0
    .parameter

    .prologue
    iput-object p1, p0, Lcom/android/internal/telephony/HWGlobalMode$2;->this$0:Lcom/android/internal/telephony/HWGlobalMode;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v4, 0x0

    const-string v2, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/android/internal/telephony/HWGlobalMode$2;->this$0:Lcom/android/internal/telephony/HWGlobalMode;

    #getter for: Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;
    invoke-static {v2}, Lcom/android/internal/telephony/HWGlobalMode;->access$000(Lcom/android/internal/telephony/HWGlobalMode;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "receive broadcast ACTION_AIRPLANE_MODE_CHANGED"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v2, "state"

    invoke-virtual {p2, v2, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    .local v0, enabled:Z
    iget-object v2, p0, Lcom/android/internal/telephony/HWGlobalMode$2;->this$0:Lcom/android/internal/telephony/HWGlobalMode;

    #getter for: Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;
    invoke-static {v2}, Lcom/android/internal/telephony/HWGlobalMode;->access$000(Lcom/android/internal/telephony/HWGlobalMode;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "plane mode "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", IsSecNetSelReceiverRegistered = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/internal/telephony/HWGlobalMode$2;->this$0:Lcom/android/internal/telephony/HWGlobalMode;

    #getter for: Lcom/android/internal/telephony/HWGlobalMode;->mIsSecNetSelReceiverRegistered:Z
    invoke-static {v4}, Lcom/android/internal/telephony/HWGlobalMode;->access$200(Lcom/android/internal/telephony/HWGlobalMode;)Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-nez v0, :cond_0

    iget-object v2, p0, Lcom/android/internal/telephony/HWGlobalMode$2;->this$0:Lcom/android/internal/telephony/HWGlobalMode;

    #getter for: Lcom/android/internal/telephony/HWGlobalMode;->mIsSecNetSelReceiverRegistered:Z
    invoke-static {v2}, Lcom/android/internal/telephony/HWGlobalMode;->access$200(Lcom/android/internal/telephony/HWGlobalMode;)Z

    move-result v2

    if-eqz v2, :cond_1

    :try_start_0
    iget-object v2, p0, Lcom/android/internal/telephony/HWGlobalMode$2;->this$0:Lcom/android/internal/telephony/HWGlobalMode;

    #getter for: Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;
    invoke-static {v2}, Lcom/android/internal/telephony/HWGlobalMode;->access$000(Lcom/android/internal/telephony/HWGlobalMode;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "stop receive ACTION_START_SEC_NET_SEL"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, p0, Lcom/android/internal/telephony/HWGlobalMode$2;->this$0:Lcom/android/internal/telephony/HWGlobalMode;

    #getter for: Lcom/android/internal/telephony/HWGlobalMode;->mContext:Landroid/content/Context;
    invoke-static {v2}, Lcom/android/internal/telephony/HWGlobalMode;->access$400(Lcom/android/internal/telephony/HWGlobalMode;)Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/android/internal/telephony/HWGlobalMode$2;->this$0:Lcom/android/internal/telephony/HWGlobalMode;

    #getter for: Lcom/android/internal/telephony/HWGlobalMode;->mSecNetSelIntentReceiver:Landroid/content/BroadcastReceiver;
    invoke-static {v3}, Lcom/android/internal/telephony/HWGlobalMode;->access$300(Lcom/android/internal/telephony/HWGlobalMode;)Landroid/content/BroadcastReceiver;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iget-object v2, p0, Lcom/android/internal/telephony/HWGlobalMode$2;->this$0:Lcom/android/internal/telephony/HWGlobalMode;

    const/4 v3, 0x0

    #setter for: Lcom/android/internal/telephony/HWGlobalMode;->mIsSecNetSelReceiverRegistered:Z
    invoke-static {v2, v3}, Lcom/android/internal/telephony/HWGlobalMode;->access$202(Lcom/android/internal/telephony/HWGlobalMode;Z)Z

    iget-object v2, p0, Lcom/android/internal/telephony/HWGlobalMode$2;->this$0:Lcom/android/internal/telephony/HWGlobalMode;

    iget-object v3, p0, Lcom/android/internal/telephony/HWGlobalMode$2;->this$0:Lcom/android/internal/telephony/HWGlobalMode;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lcom/android/internal/telephony/HWGlobalMode;->obtainMessage(I)Landroid/os/Message;

    move-result-object v3

    invoke-static {}, Lcom/android/internal/telephony/HWGlobalMode;->access$500()I

    move-result v4

    int-to-long v4, v4

    invoke-virtual {v2, v3, v4, v5}, Lcom/android/internal/telephony/HWGlobalMode;->sendMessageDelayed(Landroid/os/Message;J)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v0           #enabled:Z
    :cond_0
    :goto_0
    return-void

    .restart local v0       #enabled:Z
    :catch_0
    move-exception v1

    .local v1, ex:Ljava/lang/Exception;
    iget-object v2, p0, Lcom/android/internal/telephony/HWGlobalMode$2;->this$0:Lcom/android/internal/telephony/HWGlobalMode;

    #getter for: Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;
    invoke-static {v2}, Lcom/android/internal/telephony/HWGlobalMode;->access$000(Lcom/android/internal/telephony/HWGlobalMode;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception happen, exception = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .end local v1           #ex:Ljava/lang/Exception;
    :cond_1
    iget-object v2, p0, Lcom/android/internal/telephony/HWGlobalMode$2;->this$0:Lcom/android/internal/telephony/HWGlobalMode;

    #getter for: Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;
    invoke-static {v2}, Lcom/android/internal/telephony/HWGlobalMode;->access$000(Lcom/android/internal/telephony/HWGlobalMode;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "SecNetSelIntentReceiver unregister"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
