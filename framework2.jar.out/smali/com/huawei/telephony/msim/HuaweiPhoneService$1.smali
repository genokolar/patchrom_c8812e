.class Lcom/huawei/telephony/msim/HuaweiPhoneService$1;
.super Landroid/content/BroadcastReceiver;
.source "HuaweiPhoneService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/huawei/telephony/msim/HuaweiPhoneService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/huawei/telephony/msim/HuaweiPhoneService;


# direct methods
.method constructor <init>(Lcom/huawei/telephony/msim/HuaweiPhoneService;)V
    .locals 0
    .parameter

    .prologue
    iput-object p1, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService$1;->this$0:Lcom/huawei/telephony/msim/HuaweiPhoneService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .parameter "context"
    .parameter "intent"

    .prologue
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.ACTION_RILD_START"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService$1;->this$0:Lcom/huawei/telephony/msim/HuaweiPhoneService;

    #getter for: Lcom/huawei/telephony/msim/HuaweiPhoneService;->mLock:Ljava/lang/Object;
    invoke-static {v0}, Lcom/huawei/telephony/msim/HuaweiPhoneService;->access$000(Lcom/huawei/telephony/msim/HuaweiPhoneService;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService$1;->this$0:Lcom/huawei/telephony/msim/HuaweiPhoneService;

    #getter for: Lcom/huawei/telephony/msim/HuaweiPhoneService;->timeOutCount:I
    invoke-static {v0}, Lcom/huawei/telephony/msim/HuaweiPhoneService;->access$100(Lcom/huawei/telephony/msim/HuaweiPhoneService;)I

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "HuaweiPhoneService"

    const-string v2, "The rild was restarted"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService$1;->this$0:Lcom/huawei/telephony/msim/HuaweiPhoneService;

    const/4 v2, 0x0

    #setter for: Lcom/huawei/telephony/msim/HuaweiPhoneService;->timeOutCount:I
    invoke-static {v0, v2}, Lcom/huawei/telephony/msim/HuaweiPhoneService;->access$102(Lcom/huawei/telephony/msim/HuaweiPhoneService;I)I

    iget-object v0, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService$1;->this$0:Lcom/huawei/telephony/msim/HuaweiPhoneService;

    const/4 v2, 0x1

    #setter for: Lcom/huawei/telephony/msim/HuaweiPhoneService;->mbATReady:Z
    invoke-static {v0, v2}, Lcom/huawei/telephony/msim/HuaweiPhoneService;->access$202(Lcom/huawei/telephony/msim/HuaweiPhoneService;Z)Z

    iget-object v0, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService$1;->this$0:Lcom/huawei/telephony/msim/HuaweiPhoneService;

    #getter for: Lcom/huawei/telephony/msim/HuaweiPhoneService;->mLock:Ljava/lang/Object;
    invoke-static {v0}, Lcom/huawei/telephony/msim/HuaweiPhoneService;->access$000(Lcom/huawei/telephony/msim/HuaweiPhoneService;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    :cond_0
    monitor-exit v1

    :cond_1
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
