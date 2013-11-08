.class final Lcom/huawei/telephony/msim/HuaweiPhoneService$MainHandler;
.super Landroid/os/Handler;
.source "HuaweiPhoneService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/huawei/telephony/msim/HuaweiPhoneService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "MainHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/huawei/telephony/msim/HuaweiPhoneService;


# direct methods
.method constructor <init>(Lcom/huawei/telephony/msim/HuaweiPhoneService;Landroid/os/Looper;)V
    .locals 0
    .parameter
    .parameter "looper"

    .prologue
    iput-object p1, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService$MainHandler;->this$0:Lcom/huawei/telephony/msim/HuaweiPhoneService;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 7
    .parameter "msg"

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    iget v2, p1, Landroid/os/Message;->what:I

    packed-switch v2, :pswitch_data_0

    :goto_0
    :pswitch_0
    return-void

    :pswitch_1
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .local v0, ar:Landroid/os/AsyncResult;
    iget-object v2, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService$MainHandler;->this$0:Lcom/huawei/telephony/msim/HuaweiPhoneService;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const-string v4, "0"

    aput-object v4, v3, v5

    const-string v4, "ERROR"

    aput-object v4, v3, v6

    #setter for: Lcom/huawei/telephony/msim/HuaweiPhoneService;->mATResponse:[Ljava/lang/String;
    invoke-static {v2, v3}, Lcom/huawei/telephony/msim/HuaweiPhoneService;->access$302(Lcom/huawei/telephony/msim/HuaweiPhoneService;[Ljava/lang/String;)[Ljava/lang/String;

    iget-object v2, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v2, :cond_0

    iget-object v3, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService$MainHandler;->this$0:Lcom/huawei/telephony/msim/HuaweiPhoneService;

    iget-object v2, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v2, [Ljava/lang/String;

    check-cast v2, [Ljava/lang/String;

    #setter for: Lcom/huawei/telephony/msim/HuaweiPhoneService;->mATResponse:[Ljava/lang/String;
    invoke-static {v3, v2}, Lcom/huawei/telephony/msim/HuaweiPhoneService;->access$302(Lcom/huawei/telephony/msim/HuaweiPhoneService;[Ljava/lang/String;)[Ljava/lang/String;

    :goto_1
    iget-object v2, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService$MainHandler;->this$0:Lcom/huawei/telephony/msim/HuaweiPhoneService;

    #getter for: Lcom/huawei/telephony/msim/HuaweiPhoneService;->mLock:Ljava/lang/Object;
    invoke-static {v2}, Lcom/huawei/telephony/msim/HuaweiPhoneService;->access$000(Lcom/huawei/telephony/msim/HuaweiPhoneService;)Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    :try_start_0
    iget-object v2, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService$MainHandler;->this$0:Lcom/huawei/telephony/msim/HuaweiPhoneService;

    #getter for: Lcom/huawei/telephony/msim/HuaweiPhoneService;->timeOutCount:I
    invoke-static {v2}, Lcom/huawei/telephony/msim/HuaweiPhoneService;->access$100(Lcom/huawei/telephony/msim/HuaweiPhoneService;)I

    move-result v2

    if-gtz v2, :cond_1

    iget-object v2, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService$MainHandler;->this$0:Lcom/huawei/telephony/msim/HuaweiPhoneService;

    const/4 v4, 0x0

    #setter for: Lcom/huawei/telephony/msim/HuaweiPhoneService;->timeOutCount:I
    invoke-static {v2, v4}, Lcom/huawei/telephony/msim/HuaweiPhoneService;->access$102(Lcom/huawei/telephony/msim/HuaweiPhoneService;I)I

    iget-object v2, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService$MainHandler;->this$0:Lcom/huawei/telephony/msim/HuaweiPhoneService;

    const/4 v4, 0x1

    #setter for: Lcom/huawei/telephony/msim/HuaweiPhoneService;->mbATReady:Z
    invoke-static {v2, v4}, Lcom/huawei/telephony/msim/HuaweiPhoneService;->access$202(Lcom/huawei/telephony/msim/HuaweiPhoneService;Z)Z

    iget-object v2, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService$MainHandler;->this$0:Lcom/huawei/telephony/msim/HuaweiPhoneService;

    #getter for: Lcom/huawei/telephony/msim/HuaweiPhoneService;->mLock:Ljava/lang/Object;
    invoke-static {v2}, Lcom/huawei/telephony/msim/HuaweiPhoneService;->access$000(Lcom/huawei/telephony/msim/HuaweiPhoneService;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    :goto_2
    monitor-exit v3

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    :cond_0
    const-string v2, "HuaweiPhoneService"

    const-string v3, "ATDirectChannel RUN failed!"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_1
    :try_start_1
    iget-object v2, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService$MainHandler;->this$0:Lcom/huawei/telephony/msim/HuaweiPhoneService;

    iget-object v4, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService$MainHandler;->this$0:Lcom/huawei/telephony/msim/HuaweiPhoneService;

    #getter for: Lcom/huawei/telephony/msim/HuaweiPhoneService;->timeOutCount:I
    invoke-static {v4}, Lcom/huawei/telephony/msim/HuaweiPhoneService;->access$100(Lcom/huawei/telephony/msim/HuaweiPhoneService;)I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    #setter for: Lcom/huawei/telephony/msim/HuaweiPhoneService;->timeOutCount:I
    invoke-static {v2, v4}, Lcom/huawei/telephony/msim/HuaweiPhoneService;->access$102(Lcom/huawei/telephony/msim/HuaweiPhoneService;I)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    .end local v0           #ar:Landroid/os/AsyncResult;
    :pswitch_2
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .restart local v0       #ar:Landroid/os/AsyncResult;
    iget-object v2, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v2, :cond_3

    iget-object v2, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService$MainHandler;->this$0:Lcom/huawei/telephony/msim/HuaweiPhoneService;

    #getter for: Lcom/huawei/telephony/msim/HuaweiPhoneService;->mContext:Landroid/content/Context;
    invoke-static {v2}, Lcom/huawei/telephony/msim/HuaweiPhoneService;->access$400(Lcom/huawei/telephony/msim/HuaweiPhoneService;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "preferred_network_mode"

    iget-object v4, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService$MainHandler;->this$0:Lcom/huawei/telephony/msim/HuaweiPhoneService;

    #getter for: Lcom/huawei/telephony/msim/HuaweiPhoneService;->mPrefNet:I
    invoke-static {v4}, Lcom/huawei/telephony/msim/HuaweiPhoneService;->access$500(Lcom/huawei/telephony/msim/HuaweiPhoneService;)I

    move-result v4

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    .local v1, nPrefNet:I
    iget-object v2, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService$MainHandler;->this$0:Lcom/huawei/telephony/msim/HuaweiPhoneService;

    #getter for: Lcom/huawei/telephony/msim/HuaweiPhoneService;->mPrefNet:I
    invoke-static {v2}, Lcom/huawei/telephony/msim/HuaweiPhoneService;->access$500(Lcom/huawei/telephony/msim/HuaweiPhoneService;)I

    move-result v2

    if-eq v1, v2, :cond_2

    iget-object v2, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService$MainHandler;->this$0:Lcom/huawei/telephony/msim/HuaweiPhoneService;

    #getter for: Lcom/huawei/telephony/msim/HuaweiPhoneService;->mContext:Landroid/content/Context;
    invoke-static {v2}, Lcom/huawei/telephony/msim/HuaweiPhoneService;->access$400(Lcom/huawei/telephony/msim/HuaweiPhoneService;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "preferred_network_mode"

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    :cond_2
    iget-object v2, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService$MainHandler;->this$0:Lcom/huawei/telephony/msim/HuaweiPhoneService;

    #setter for: Lcom/huawei/telephony/msim/HuaweiPhoneService;->mPrefNet:I
    invoke-static {v2, v1}, Lcom/huawei/telephony/msim/HuaweiPhoneService;->access$502(Lcom/huawei/telephony/msim/HuaweiPhoneService;I)I

    const-string v2, "HuaweiPhoneService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "EVENT_SET_PREF_NETWORKS, OK! mPrefNet="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService$MainHandler;->this$0:Lcom/huawei/telephony/msim/HuaweiPhoneService;

    #getter for: Lcom/huawei/telephony/msim/HuaweiPhoneService;->mPrefNet:I
    invoke-static {v4}, Lcom/huawei/telephony/msim/HuaweiPhoneService;->access$500(Lcom/huawei/telephony/msim/HuaweiPhoneService;)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .end local v1           #nPrefNet:I
    :cond_3
    const-string v2, "HuaweiPhoneService"

    const-string v3, "Fail to set Pref Mode, so recovery the dual card mode to original setting!"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-string v2, "persist.radio.hw.ctmode"

    iget-object v3, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService$MainHandler;->this$0:Lcom/huawei/telephony/msim/HuaweiPhoneService;

    #getter for: Lcom/huawei/telephony/msim/HuaweiPhoneService;->mDualMode:I
    invoke-static {v3}, Lcom/huawei/telephony/msim/HuaweiPhoneService;->access$600(Lcom/huawei/telephony/msim/HuaweiPhoneService;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method
