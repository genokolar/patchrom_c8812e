.class final Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;
.super Lcom/android/internal/telephony/cdma/CdmaLteServiceStateTracker;
.source "MSimCdmaLteServiceStateTracker.java"


# static fields
.field protected static final EVENT_ALL_DATA_DISCONNECTED:I = 0x3e9

.field static final LOG_TAG:Ljava/lang/String; = "CDMA"


# direct methods
.method public constructor <init>(Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;)V
    .locals 0
    .parameter "phone"

    .prologue
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/cdma/CdmaLteServiceStateTracker;-><init>(Lcom/android/internal/telephony/cdma/CDMALTEPhone;)V

    return-void
.end method


# virtual methods
.method protected getNewCdmaDataConnectionTracker(Lcom/android/internal/telephony/cdma/CDMAPhone;)Lcom/android/internal/telephony/DataConnectionTracker;
    .locals 1
    .parameter "phone"

    .prologue
    new-instance v0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;

    check-cast p1, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

    .end local p1
    invoke-direct {v0, p1}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;-><init>(Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;)V

    return-object v0
.end method

.method protected getNewGsmDataConnectionTracker(Lcom/android/internal/telephony/PhoneBase;)Lcom/android/internal/telephony/DataConnectionTracker;
    .locals 1
    .parameter "phone"

    .prologue
    new-instance v0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;

    invoke-direct {v0, p1}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;-><init>(Lcom/android/internal/telephony/PhoneBase;)V

    return-object v0
.end method

.method protected getSystemProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "property"
    .parameter "defValue"

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->phone:Lcom/android/internal/telephony/cdma/CDMAPhone;

    invoke-virtual {v0}, Lcom/android/internal/telephony/cdma/CDMAPhone;->getSubscription()I

    move-result v0

    invoke-static {p1, v0, p2}, Landroid/telephony/MSimTelephonyManager;->getTelephonyProperty(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getUiccCardApplication()Lcom/android/internal/telephony/uicc/UiccCardApplication;
    .locals 4

    .prologue
    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->phone:Lcom/android/internal/telephony/cdma/CDMAPhone;

    check-cast v1, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

    invoke-virtual {v1}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->getSubscriptionInfo()Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v0

    .local v0, subscriptionData:Lcom/android/internal/telephony/msim/Subscription;
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->mUiccController:Lcom/android/internal/telephony/uicc/UiccController;

    iget v2, v0, Lcom/android/internal/telephony/msim/Subscription;->slotId:I

    const/4 v3, 0x2

    invoke-virtual {v1, v2, v3}, Lcom/android/internal/telephony/uicc/UiccController;->getUiccCardApplication(II)Lcom/android/internal/telephony/uicc/UiccCardApplication;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .parameter "msg"

    .prologue
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    invoke-super {p0, p1}, Lcom/android/internal/telephony/cdma/CdmaLteServiceStateTracker;->handleMessage(Landroid/os/Message;)V

    :goto_0
    return-void

    :pswitch_0
    invoke-static {}, Lcom/android/internal/telephony/msim/MSimPhoneFactory;->getDataSubscription()I

    move-result v0

    .local v0, dds:I
    invoke-static {}, Lcom/android/internal/telephony/msim/MSimProxyManager;->getInstance()Lcom/android/internal/telephony/msim/MSimProxyManager;

    move-result-object v1

    invoke-virtual {v1, v0, p0}, Lcom/android/internal/telephony/msim/MSimProxyManager;->unregisterForAllDataDisconnected(ILandroid/os/Handler;)V

    monitor-enter p0

    :try_start_0
    iget-boolean v1, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->mPendingRadioPowerOffAfterDataOff:Z

    if-eqz v1, :cond_0

    const-string v1, "EVENT_ALL_DATA_DISCONNECTED, turn radio off now."

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->log(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->hangupAndPowerOff()V

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->mPendingRadioPowerOffAfterDataOff:Z

    :goto_1
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_0
    :try_start_1
    const-string v1, "EVENT_ALL_DATA_DISCONNECTED is stale"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->log(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    nop

    :pswitch_data_0
    .packed-switch 0x3e9
        :pswitch_0
    .end packed-switch
.end method

.method protected log(Ljava/lang/String;)V
    .locals 3
    .parameter "s"

    .prologue
    const-string v0, "CDMA"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[MSimCdmaLteSST] [SUB : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->phone:Lcom/android/internal/telephony/cdma/CDMAPhone;

    invoke-virtual {v2}, Lcom/android/internal/telephony/cdma/CDMAPhone;->getSubscription()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method protected loge(Ljava/lang/String;)V
    .locals 3
    .parameter "s"

    .prologue
    const-string v0, "CDMA"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[MSimCdmaLteSST] [SUB : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->phone:Lcom/android/internal/telephony/cdma/CDMAPhone;

    invoke-virtual {v2}, Lcom/android/internal/telephony/cdma/CDMAPhone;->getSubscription()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public powerOffRadioSafely(Lcom/android/internal/telephony/DataConnectionTracker;)V
    .locals 5
    .parameter "dcTracker"

    .prologue
    monitor-enter p0

    :try_start_0
    iget-boolean v2, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->mPendingRadioPowerOffAfterDataOff:Z

    if-nez v2, :cond_1

    invoke-static {}, Lcom/android/internal/telephony/msim/MSimPhoneFactory;->getDataSubscription()I

    move-result v0

    .local v0, dds:I
    invoke-virtual {p1}, Lcom/android/internal/telephony/DataConnectionTracker;->isDisconnected()Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->phone:Lcom/android/internal/telephony/cdma/CDMAPhone;

    invoke-virtual {v2}, Lcom/android/internal/telephony/cdma/CDMAPhone;->getSubscription()I

    move-result v2

    if-eq v0, v2, :cond_0

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->phone:Lcom/android/internal/telephony/cdma/CDMAPhone;

    invoke-virtual {v2}, Lcom/android/internal/telephony/cdma/CDMAPhone;->getSubscription()I

    move-result v2

    if-eq v0, v2, :cond_2

    invoke-static {}, Lcom/android/internal/telephony/msim/MSimProxyManager;->getInstance()Lcom/android/internal/telephony/msim/MSimProxyManager;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/android/internal/telephony/msim/MSimProxyManager;->isDataDisconnected(I)Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_0
    const-string v2, "radioTurnedOff"

    invoke-virtual {p1, v2}, Lcom/android/internal/telephony/DataConnectionTracker;->cleanUpAllConnections(Ljava/lang/String;)V

    const-string v2, "Data disconnected, turn off radio right away."

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->log(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->hangupAndPowerOff()V

    .end local v0           #dds:I
    :cond_1
    :goto_0
    monitor-exit p0

    return-void

    .restart local v0       #dds:I
    :cond_2
    const-string v2, "radioTurnedOff"

    invoke-virtual {p1, v2}, Lcom/android/internal/telephony/DataConnectionTracker;->cleanUpAllConnections(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->phone:Lcom/android/internal/telephony/cdma/CDMAPhone;

    invoke-virtual {v2}, Lcom/android/internal/telephony/cdma/CDMAPhone;->getSubscription()I

    move-result v2

    if-eq v0, v2, :cond_3

    invoke-static {}, Lcom/android/internal/telephony/msim/MSimProxyManager;->getInstance()Lcom/android/internal/telephony/msim/MSimProxyManager;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/android/internal/telephony/msim/MSimProxyManager;->isDataDisconnected(I)Z

    move-result v2

    if-nez v2, :cond_3

    const-string v2, "Data is active on DDS.  Wait for all data disconnect"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->log(Ljava/lang/String;)V

    invoke-static {}, Lcom/android/internal/telephony/msim/MSimProxyManager;->getInstance()Lcom/android/internal/telephony/msim/MSimProxyManager;

    move-result-object v2

    const/16 v3, 0x3e9

    const/4 v4, 0x0

    invoke-virtual {v2, v0, p0, v3, v4}, Lcom/android/internal/telephony/msim/MSimProxyManager;->registerForAllDataDisconnected(ILandroid/os/Handler;ILjava/lang/Object;)V

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->mPendingRadioPowerOffAfterDataOff:Z

    :cond_3
    invoke-static {p0}, Landroid/os/Message;->obtain(Landroid/os/Handler;)Landroid/os/Message;

    move-result-object v1

    .local v1, msg:Landroid/os/Message;
    const/16 v2, 0x26

    iput v2, v1, Landroid/os/Message;->what:I

    iget v2, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->mPendingRadioPowerOffAfterDataOffTag:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->mPendingRadioPowerOffAfterDataOffTag:I

    iput v2, v1, Landroid/os/Message;->arg1:I

    const-wide/16 v2, 0x7530

    invoke-virtual {p0, v1, v2, v3}, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->sendMessageDelayed(Landroid/os/Message;J)Z

    move-result v2

    if-eqz v2, :cond_4

    const-string v2, "Wait upto 30s for data to disconnect, then turn off radio."

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->log(Ljava/lang/String;)V

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->mPendingRadioPowerOffAfterDataOff:Z

    goto :goto_0

    .end local v0           #dds:I
    .end local v1           #msg:Landroid/os/Message;
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .restart local v0       #dds:I
    .restart local v1       #msg:Landroid/os/Message;
    :cond_4
    :try_start_1
    const-string v2, "Cannot send delayed Msg, turn off radio right away."

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->log(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->hangupAndPowerOff()V

    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->mPendingRadioPowerOffAfterDataOff:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method protected updateCdmaSubscription()V
    .locals 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->cm:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v1, 0x22

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/android/internal/telephony/CommandsInterface;->getCDMASubscription(Landroid/os/Message;)V

    return-void
.end method

.method protected updateSpnDisplay()V
    .locals 11

    .prologue
    const/high16 v10, 0x2000

    const/4 v6, 0x1

    const/4 v7, 0x0

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->getplmn()Ljava/lang/String;

    move-result-object v3

    .local v3, plmn:Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "NoServiceDebug: mIsForcedToUpdateSpn is:"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-boolean v8, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->mIsForcedToUpdateSpn:Z

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v8, ",!mIsDelaying is:"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-boolean v5, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->mIsDelaying:Z

    if-nez v5, :cond_4

    move v5, v6

    :goto_0
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->log(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->mCurPlmn:Ljava/lang/String;

    invoke-static {v3, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_0

    iget-boolean v5, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->mIsForcedToUpdateSpn:Z

    if-eqz v5, :cond_3

    :cond_0
    iget-boolean v5, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->mIsForcedToUpdateSpn:Z

    if-eqz v5, :cond_1

    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v5

    const v8, 0x10402f6

    invoke-virtual {v5, v8}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    iput-boolean v7, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->mIsForcedToUpdateSpn:Z

    :cond_1
    if-eqz v3, :cond_5

    move v4, v6

    .local v4, showPlmn:Z
    :goto_1
    const-string v5, "updateSpnDisplay: changed sending intent showPlmn=\'%b\' plmn=\'%s\'"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    aput-object v9, v8, v7

    aput-object v3, v8, v6

    invoke-static {v5, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->log(Ljava/lang/String;)V

    new-instance v0, Landroid/content/Intent;

    const-string v5, "android.provider.Telephony.SPN_STRINGS_UPDATED"

    invoke-direct {v0, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .local v0, intent:Landroid/content/Intent;
    invoke-virtual {v0, v10}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string v5, "showSpn"

    invoke-virtual {v0, v5, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v5, "spn"

    const-string v8, ""

    invoke-virtual {v0, v5, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v5, "showPlmn"

    invoke-virtual {v0, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v5, "plmn"

    invoke-virtual {v0, v5, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v5, "subscription"

    iget-object v8, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->phone:Lcom/android/internal/telephony/cdma/CDMAPhone;

    invoke-virtual {v8}, Lcom/android/internal/telephony/cdma/CDMAPhone;->getSubscription()I

    move-result v8

    invoke-virtual {v0, v5, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-boolean v5, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->mIsDelaying:Z

    if-nez v5, :cond_2

    iget-object v5, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->phone:Lcom/android/internal/telephony/cdma/CDMAPhone;

    invoke-virtual {v5}, Lcom/android/internal/telephony/cdma/CDMAPhone;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5, v0}, Landroid/content/Context;->sendStickyBroadcast(Landroid/content/Intent;)V

    :cond_2
    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v5

    if-eqz v5, :cond_3

    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v5

    invoke-virtual {v5}, Landroid/telephony/MSimTelephonyManager;->isMultiSimEnabled()Z

    move-result v5

    if-eqz v5, :cond_3

    iget-object v5, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->phone:Lcom/android/internal/telephony/cdma/CDMAPhone;

    invoke-virtual {v5}, Lcom/android/internal/telephony/cdma/CDMAPhone;->getSubscription()I

    move-result v5

    if-nez v5, :cond_6

    const-string v5, "Send Intent for SUB 1:android.intent.action.ACTION_DSDS_SUB1_OPERATOR_CHANGED"

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->log(Ljava/lang/String;)V

    new-instance v1, Landroid/content/Intent;

    const-string v5, "android.intent.action.ACTION_DSDS_SUB1_OPERATOR_CHANGED"

    invoke-direct {v1, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .local v1, intent1:Landroid/content/Intent;
    invoke-virtual {v1, v10}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string v5, "showSpn"

    invoke-virtual {v1, v5, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v5, "spn"

    const-string v6, ""

    invoke-virtual {v1, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v5, "showPlmn"

    invoke-virtual {v1, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v5, "plmn"

    invoke-virtual {v1, v5, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v5, "subscription"

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->phone:Lcom/android/internal/telephony/cdma/CDMAPhone;

    invoke-virtual {v6}, Lcom/android/internal/telephony/cdma/CDMAPhone;->getSubscription()I

    move-result v6

    invoke-virtual {v1, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-boolean v5, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->mIsDelaying:Z

    if-nez v5, :cond_3

    iget-object v5, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->phone:Lcom/android/internal/telephony/cdma/CDMAPhone;

    invoke-virtual {v5}, Lcom/android/internal/telephony/cdma/CDMAPhone;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5, v1}, Landroid/content/Context;->sendStickyBroadcast(Landroid/content/Intent;)V

    .end local v0           #intent:Landroid/content/Intent;
    .end local v1           #intent1:Landroid/content/Intent;
    .end local v4           #showPlmn:Z
    :cond_3
    :goto_2
    iput-object v3, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->mCurPlmn:Ljava/lang/String;

    return-void

    :cond_4
    move v5, v7

    goto/16 :goto_0

    :cond_5
    move v4, v7

    goto/16 :goto_1

    .restart local v0       #intent:Landroid/content/Intent;
    .restart local v4       #showPlmn:Z
    :cond_6
    iget-object v5, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->phone:Lcom/android/internal/telephony/cdma/CDMAPhone;

    invoke-virtual {v5}, Lcom/android/internal/telephony/cdma/CDMAPhone;->getSubscription()I

    move-result v5

    if-ne v6, v5, :cond_7

    const-string v5, "Send Intent for SUB 2:android.intent.action.ACTION_DSDS_SUB2_OPERATOR_CHANGED"

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->log(Ljava/lang/String;)V

    new-instance v2, Landroid/content/Intent;

    const-string v5, "android.intent.action.ACTION_DSDS_SUB2_OPERATOR_CHANGED"

    invoke-direct {v2, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .local v2, intent2:Landroid/content/Intent;
    invoke-virtual {v2, v10}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string v5, "showSpn"

    invoke-virtual {v2, v5, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v5, "spn"

    const-string v6, ""

    invoke-virtual {v2, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v5, "showPlmn"

    invoke-virtual {v2, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v5, "plmn"

    invoke-virtual {v2, v5, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v5, "subscription"

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->phone:Lcom/android/internal/telephony/cdma/CDMAPhone;

    invoke-virtual {v6}, Lcom/android/internal/telephony/cdma/CDMAPhone;->getSubscription()I

    move-result v6

    invoke-virtual {v2, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-boolean v5, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->mIsDelaying:Z

    if-nez v5, :cond_3

    iget-object v5, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->phone:Lcom/android/internal/telephony/cdma/CDMAPhone;

    invoke-virtual {v5}, Lcom/android/internal/telephony/cdma/CDMAPhone;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5, v2}, Landroid/content/Context;->sendStickyBroadcast(Landroid/content/Intent;)V

    goto :goto_2

    .end local v2           #intent2:Landroid/content/Intent;
    :cond_7
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "unsupport SUB ID :"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->phone:Lcom/android/internal/telephony/cdma/CDMAPhone;

    invoke-virtual {v6}, Lcom/android/internal/telephony/cdma/CDMAPhone;->getSubscription()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->log(Ljava/lang/String;)V

    goto :goto_2
.end method
