.class final Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;
.super Landroid/os/Handler;
.source "MSimHWGlobalMode.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/msim/MSimHWGlobalMode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "MainHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;


# direct methods
.method constructor <init>(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;Landroid/os/Looper;)V
    .locals 0
    .parameter
    .parameter "looper"

    .prologue
    iput-object p1, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 12
    .parameter "msg"

    .prologue
    const/4 v11, 0x4

    const/4 v10, 0x7

    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    iget v4, p1, Landroid/os/Message;->what:I

    packed-switch v4, :pswitch_data_0

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .local v0, ar:Landroid/os/AsyncResult;
    iget-object v4, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v4, :cond_1

    const/4 v3, -0x1

    .local v3, nType:I
    :goto_1
    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;
    invoke-static {v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$000(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "EVENT_GET_PREFERRED_NETWORK_TYPE, nType = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", mIfTypeToSet = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mIfTypeToSet:I
    invoke-static {v6}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$200(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mIfTypeToSet:I
    invoke-static {v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$200(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)I

    move-result v4

    if-ne v4, v3, :cond_4

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mIfTypeToSet:I
    invoke-static {v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$200(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)I

    move-result v4

    if-ne v10, v4, :cond_2

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    invoke-virtual {v4, v9}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->setDualCardMode(I)V

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    invoke-virtual {v4, v7, v9, v8}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->setSubscriptionExt(IIZ)V

    goto :goto_0

    .end local v3           #nType:I
    :cond_1
    iget-object v4, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .restart local v3       #nType:I
    goto :goto_1

    :cond_2
    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mIfTypeToSet:I
    invoke-static {v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$200(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)I

    move-result v4

    if-ne v11, v4, :cond_3

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    invoke-virtual {v4, v7}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->setDualCardMode(I)V

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    invoke-virtual {v4, v7, v7, v8}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->setSubscriptionExt(IIZ)V

    goto :goto_0

    :cond_3
    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mIfTypeToSet:I
    invoke-static {v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$200(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)I

    move-result v4

    if-ne v8, v4, :cond_0

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    invoke-virtual {v4, v8}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->setDualCardMode(I)V

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    invoke-virtual {v4, v7, v8, v8}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->setSubscriptionExt(IIZ)V

    goto :goto_0

    :cond_4
    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;
    invoke-static {v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$000(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "set prefMode = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mIfTypeToSet:I
    invoke-static {v6}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$200(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;
    invoke-static {v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$400(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Lcom/android/internal/telephony/msim/SubscriptionManager;

    move-result-object v4

    iget-object v5, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mIfTypeToSet:I
    invoke-static {v5}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$200(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)I

    move-result v5

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mMainHandler:Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;
    invoke-static {v6}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$300(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;

    move-result-object v6

    invoke-virtual {v6, v9}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v6

    invoke-virtual {v4, v7, v5, v6}, Lcom/android/internal/telephony/msim/SubscriptionManager;->setPreferredNetworkType(IILandroid/os/Message;)V

    goto/16 :goto_0

    .end local v0           #ar:Landroid/os/AsyncResult;
    .end local v3           #nType:I
    :pswitch_1
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .restart local v0       #ar:Landroid/os/AsyncResult;
    iget-object v4, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v4, :cond_5

    const/4 v1, 0x0

    .local v1, bResult:Z
    :goto_2
    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;
    invoke-static {v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$000(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "EVENT_SET_PREFERRED_NETWORK_TYPE done! bResult = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", mIfTypeToSet="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mIfTypeToSet:I
    invoke-static {v6}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$200(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v1, :cond_0

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mIfTypeToSet:I
    invoke-static {v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$200(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)I

    move-result v4

    if-ne v10, v4, :cond_6

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    invoke-virtual {v4, v9}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->setDualCardMode(I)V

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    invoke-virtual {v4, v7, v9, v8}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->setSubscriptionExt(IIZ)V

    goto/16 :goto_0

    .end local v1           #bResult:Z
    :cond_5
    iget-object v4, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .restart local v1       #bResult:Z
    goto :goto_2

    :cond_6
    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mIfTypeToSet:I
    invoke-static {v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$200(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)I

    move-result v4

    if-ne v11, v4, :cond_7

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    invoke-virtual {v4, v7}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->setDualCardMode(I)V

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    invoke-virtual {v4, v7, v7, v8}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->setSubscriptionExt(IIZ)V

    goto/16 :goto_0

    :cond_7
    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mIfTypeToSet:I
    invoke-static {v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$200(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)I

    move-result v4

    if-ne v8, v4, :cond_0

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    invoke-virtual {v4, v8}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->setDualCardMode(I)V

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    invoke-virtual {v4, v7, v8, v8}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->setSubscriptionExt(IIZ)V

    goto/16 :goto_0

    .end local v0           #ar:Landroid/os/AsyncResult;
    .end local v1           #bResult:Z
    :pswitch_2
    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;
    invoke-static {v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$000(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "EVENT_SUBSCRIPTION_ACT_DONE1, bActSub1Pending = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->bActSub1Pending:Z
    invoke-static {v6}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$500(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Z

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->bActSub1Pending:Z
    invoke-static {v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$500(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Z

    move-result v4

    if-eqz v4, :cond_8

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mIfTypeToSet:I
    invoke-static {v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$200(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)I

    move-result v4

    if-ne v10, v4, :cond_8

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #setter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->bActSub1Pending:Z
    invoke-static {v4, v7}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$502(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;Z)Z

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    invoke-virtual {v4, v9}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->setDualCardMode(I)V

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;
    invoke-static {v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$400(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Lcom/android/internal/telephony/msim/SubscriptionManager;

    move-result-object v4

    iget-object v5, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #calls: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->getAppIndex(II)I
    invoke-static {v5, v7, v8}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$600(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;II)I

    move-result v5

    sget-object v6, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    const/4 v7, 0x0

    invoke-virtual {v4, v5, v6, v7}, Lcom/android/internal/telephony/msim/SubscriptionManager;->setUiccSubscriptionExt(ILcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;Landroid/os/Message;)V

    goto/16 :goto_0

    :cond_8
    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    invoke-virtual {v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->getAutoDeactSub1Flag()Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mIfTypeToSet:I
    invoke-static {v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$200(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)I

    move-result v4

    if-ne v11, v4, :cond_0

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;
    invoke-static {v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$000(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "need auto re-activate card2\'s gsm sub!"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    const/4 v5, -0x1

    invoke-virtual {v4, v7, v5, v8}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->setSubscriptionExt(IIZ)V

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    invoke-virtual {v4, v8, v8, v8}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->setSubscriptionExt(IIZ)V

    goto/16 :goto_0

    :pswitch_3
    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->bDeactSub1Pending:Z
    invoke-static {v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$700(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mIfTypeToSet:I
    invoke-static {v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$200(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)I

    move-result v4

    if-ne v10, v4, :cond_0

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;
    invoke-static {v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$000(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "EVENT_SUBSCRIPTION_DEACT_DONE1"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #setter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->bDeactSub1Pending:Z
    invoke-static {v4, v7}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$702(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;Z)Z

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;
    invoke-static {v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$400(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Lcom/android/internal/telephony/msim/SubscriptionManager;

    move-result-object v4

    iget-object v5, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #calls: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->getAppIndex(II)I
    invoke-static {v5, v7, v8}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$600(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;II)I

    move-result v5

    sget-object v6, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_DEACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    const/4 v7, 0x0

    invoke-virtual {v4, v5, v6, v7}, Lcom/android/internal/telephony/msim/SubscriptionManager;->setUiccSubscriptionExt(ILcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;Landroid/os/Message;)V

    goto/16 :goto_0

    :pswitch_4
    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;
    invoke-static {v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$000(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "EVENT_SUBSCRIPTION_DEACT_DONE2, bDeactSub2Pending = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->bDeactSub2Pending:Z
    invoke-static {v6}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$800(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Z

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->bDeactSub2Pending:Z
    invoke-static {v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$800(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    invoke-virtual {v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->getAutoDeactSub1Flag()Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #setter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->bDeactSub2Pending:Z
    invoke-static {v4, v7}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$802(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;Z)Z

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    const/4 v5, -0x1

    invoke-virtual {v4, v8, v5, v7}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->setSubscriptionExt(IIZ)V

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    invoke-virtual {v4, v7, v9, v8}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->setSubscriptionExt(IIZ)V

    goto/16 :goto_0

    :pswitch_5
    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #setter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mbSetSubscriptionStatus:Z
    invoke-static {v4, v7}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$902(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;Z)Z

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mbPendingIntent:Z
    invoke-static {v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$1000(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;
    invoke-static {v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$000(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "EVENT_SUBSCRIPTION_SET_DONE, there is pending 2nd-sel-net intent need be proceed!"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #setter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mbPendingIntent:Z
    invoke-static {v4, v7}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$1002(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;Z)Z

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #calls: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->process2ndSelNetwork()V
    invoke-static {v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$1100(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)V

    goto/16 :goto_0

    :pswitch_6
    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    invoke-virtual {v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->getAutoDeactSub1Flag()Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    invoke-virtual {v4, v7}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->setAutoDeactSub1Flag(Z)V

    goto/16 :goto_0

    :pswitch_7
    new-instance v2, Landroid/content/IntentFilter;

    invoke-direct {v2}, Landroid/content/IntentFilter;-><init>()V

    .local v2, filter:Landroid/content/IntentFilter;
    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;
    invoke-static {v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$000(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "EVENT_DELAY_RECEIVE_INTENT!"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v4, "android.intent.action.START_SEC_NET_SEL"

    invoke-virtual {v2, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    #getter for: Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mContext:Landroid/content/Context;
    invoke-static {v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->access$100(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Landroid/content/Context;

    move-result-object v4

    iget-object v5, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->this$0:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    iget-object v5, v5, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v4, v5, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method
