.class public final Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;
.super Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;
.source "MSimGsmServiceStateTracker.java"


# static fields
.field static final DBG:Z = true

.field protected static final EVENT_ALL_DATA_DISCONNECTED:I = 0x3e9

.field static final LOG_TAG:Ljava/lang/String; = "GSM"


# direct methods
.method public constructor <init>(Lcom/android/internal/telephony/gsm/GSMPhone;)V
    .locals 0
    .parameter "phone"

    .prologue
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;-><init>(Lcom/android/internal/telephony/gsm/GSMPhone;)V

    return-void
.end method


# virtual methods
.method public getSystemProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "property"
    .parameter "defValue"

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->phone:Lcom/android/internal/telephony/gsm/GSMPhone;

    invoke-virtual {v0}, Lcom/android/internal/telephony/gsm/GSMPhone;->getSubscription()I

    move-result v0

    invoke-static {p1, v0, p2}, Landroid/telephony/MSimTelephonyManager;->getTelephonyProperty(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getUiccCardApplication()Lcom/android/internal/telephony/uicc/UiccCardApplication;
    .locals 4

    .prologue
    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->phone:Lcom/android/internal/telephony/gsm/GSMPhone;

    check-cast v1, Lcom/android/internal/telephony/msim/MSimGSMPhone;

    invoke-virtual {v1}, Lcom/android/internal/telephony/msim/MSimGSMPhone;->getSubscriptionInfo()Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v0

    .local v0, subscriptionData:Lcom/android/internal/telephony/msim/Subscription;
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->mUiccController:Lcom/android/internal/telephony/uicc/UiccController;

    iget v2, v0, Lcom/android/internal/telephony/msim/Subscription;->slotId:I

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Lcom/android/internal/telephony/uicc/UiccController;->getUiccCardApplication(II)Lcom/android/internal/telephony/uicc/UiccCardApplication;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 5
    .parameter "msg"

    .prologue
    const/4 v4, 0x0

    iget v2, p1, Landroid/os/Message;->what:I

    sparse-switch v2, :sswitch_data_0

    invoke-super {p0, p1}, Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;->handleMessage(Landroid/os/Message;)V

    :cond_0
    :goto_0
    return-void

    :sswitch_0
    invoke-static {}, Lcom/android/internal/telephony/msim/MSimPhoneFactory;->getDataSubscription()I

    move-result v0

    .local v0, dds:I
    invoke-static {}, Lcom/android/internal/telephony/msim/MSimProxyManager;->getInstance()Lcom/android/internal/telephony/msim/MSimProxyManager;

    move-result-object v2

    invoke-virtual {v2, v0, p0}, Lcom/android/internal/telephony/msim/MSimProxyManager;->unregisterForAllDataDisconnected(ILandroid/os/Handler;)V

    monitor-enter p0

    :try_start_0
    iget-boolean v2, p0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->mPendingRadioPowerOffAfterDataOff:Z

    if-eqz v2, :cond_1

    const-string v2, "EVENT_ALL_DATA_DISCONNECTED, turn radio off now."

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->log(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->hangupAndPowerOff()V

    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->mPendingRadioPowerOffAfterDataOff:Z

    :goto_1
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    :cond_1
    :try_start_1
    const-string v2, "EVENT_ALL_DATA_DISCONNECTED is stale"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->log(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .end local v0           #dds:I
    :sswitch_1
    const-string v2, "persist.timed.enable"

    invoke-static {v2, v4}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_2

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getInstance()Lcom/android/internal/telephony/msim/SubscriptionManager;

    move-result-object v1

    .local v1, subMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "EVENT_NITZ_TIME received phone type ::"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v3

    invoke-virtual {v3, v4}, Landroid/telephony/MSimTelephonyManager;->getCurrentPhoneType(I)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "is cdma sub active ::"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1, v4}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isSubActive(I)Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->log(Ljava/lang/String;)V

    const/4 v2, 0x2

    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v3

    invoke-virtual {v3, v4}, Landroid/telephony/MSimTelephonyManager;->getCurrentPhoneType(I)I

    move-result v3

    if-ne v2, v3, :cond_0

    invoke-virtual {v1, v4}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isSubActive(I)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "EVENT_NITZ_TIME received in c + g ignore updating time"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->log(Ljava/lang/String;)V

    goto :goto_0

    .end local v1           #subMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;
    :cond_2
    invoke-super {p0, p1}, Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;->handleMessage(Landroid/os/Message;)V

    goto :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        0xb -> :sswitch_1
        0x3e9 -> :sswitch_0
    .end sparse-switch
.end method

.method protected log(Ljava/lang/String;)V
    .locals 3
    .parameter "s"

    .prologue
    const-string v0, "GSM"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[MSimGsmSST] [SUB : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->phone:Lcom/android/internal/telephony/gsm/GSMPhone;

    invoke-virtual {v2}, Lcom/android/internal/telephony/gsm/GSMPhone;->getSubscription()I

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
    const-string v0, "GSM"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[MSimGsmSST] [SUB : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->phone:Lcom/android/internal/telephony/gsm/GSMPhone;

    invoke-virtual {v2}, Lcom/android/internal/telephony/gsm/GSMPhone;->getSubscription()I

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
    iget-boolean v2, p0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->mPendingRadioPowerOffAfterDataOff:Z

    if-nez v2, :cond_1

    invoke-static {}, Lcom/android/internal/telephony/msim/MSimPhoneFactory;->getDataSubscription()I

    move-result v0

    .local v0, dds:I
    invoke-virtual {p1}, Lcom/android/internal/telephony/DataConnectionTracker;->isDisconnected()Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->phone:Lcom/android/internal/telephony/gsm/GSMPhone;

    invoke-virtual {v2}, Lcom/android/internal/telephony/gsm/GSMPhone;->getSubscription()I

    move-result v2

    if-eq v0, v2, :cond_0

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->phone:Lcom/android/internal/telephony/gsm/GSMPhone;

    invoke-virtual {v2}, Lcom/android/internal/telephony/gsm/GSMPhone;->getSubscription()I

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

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->log(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->hangupAndPowerOff()V

    .end local v0           #dds:I
    :cond_1
    :goto_0
    monitor-exit p0

    return-void

    .restart local v0       #dds:I
    :cond_2
    const-string v2, "radioTurnedOff"

    invoke-virtual {p1, v2}, Lcom/android/internal/telephony/DataConnectionTracker;->cleanUpAllConnections(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->phone:Lcom/android/internal/telephony/gsm/GSMPhone;

    invoke-virtual {v2}, Lcom/android/internal/telephony/gsm/GSMPhone;->getSubscription()I

    move-result v2

    if-eq v0, v2, :cond_3

    invoke-static {}, Lcom/android/internal/telephony/msim/MSimProxyManager;->getInstance()Lcom/android/internal/telephony/msim/MSimProxyManager;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/android/internal/telephony/msim/MSimProxyManager;->isDataDisconnected(I)Z

    move-result v2

    if-nez v2, :cond_3

    const-string v2, "Data is active on DDS.  Wait for all data disconnect"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->log(Ljava/lang/String;)V

    invoke-static {}, Lcom/android/internal/telephony/msim/MSimProxyManager;->getInstance()Lcom/android/internal/telephony/msim/MSimProxyManager;

    move-result-object v2

    const/16 v3, 0x3e9

    const/4 v4, 0x0

    invoke-virtual {v2, v0, p0, v3, v4}, Lcom/android/internal/telephony/msim/MSimProxyManager;->registerForAllDataDisconnected(ILandroid/os/Handler;ILjava/lang/Object;)V

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->mPendingRadioPowerOffAfterDataOff:Z

    :cond_3
    invoke-static {p0}, Landroid/os/Message;->obtain(Landroid/os/Handler;)Landroid/os/Message;

    move-result-object v1

    .local v1, msg:Landroid/os/Message;
    const/16 v2, 0x26

    iput v2, v1, Landroid/os/Message;->what:I

    iget v2, p0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->mPendingRadioPowerOffAfterDataOffTag:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->mPendingRadioPowerOffAfterDataOffTag:I

    iput v2, v1, Landroid/os/Message;->arg1:I

    const-wide/16 v2, 0x7530

    invoke-virtual {p0, v1, v2, v3}, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->sendMessageDelayed(Landroid/os/Message;J)Z

    move-result v2

    if-eqz v2, :cond_4

    const-string v2, "Wait upto 30s for data to disconnect, then turn off radio."

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->log(Ljava/lang/String;)V

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->mPendingRadioPowerOffAfterDataOff:Z

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

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->log(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->hangupAndPowerOff()V

    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->mPendingRadioPowerOffAfterDataOff:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method protected updateSpnDisplay()V
    .locals 26

    .prologue
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->mIccRecords:Lcom/android/internal/telephony/uicc/IccRecords;

    move-object/from16 v22, v0

    if-nez v22, :cond_0

    :goto_0
    return-void

    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->mIccRecords:Lcom/android/internal/telephony/uicc/IccRecords;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->ss:Landroid/telephony/ServiceState;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Landroid/telephony/ServiceState;->getOperatorNumeric()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Lcom/android/internal/telephony/uicc/IccRecords;->getDisplayRule(Ljava/lang/String;)I

    move-result v18

    .local v18, rule:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->mIccRecords:Lcom/android/internal/telephony/uicc/IccRecords;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/android/internal/telephony/uicc/IccRecords;->getServiceProviderName()Ljava/lang/String;

    move-result-object v21

    .local v21, spn:Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->getplmn()Ljava/lang/String;

    move-result-object v15

    .local v15, plmn:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->mEmergencyOnly:Z

    move/from16 v22, v0

    if-eqz v22, :cond_9

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->cm:Lcom/android/internal/telephony/CommandsInterface;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Lcom/android/internal/telephony/CommandsInterface;->getRadioState()Lcom/android/internal/telephony/CommandsInterface$RadioState;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Lcom/android/internal/telephony/CommandsInterface$RadioState;->isOn()Z

    move-result v22

    if-eqz v22, :cond_9

    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v22

    const v23, 0x1040310

    invoke-virtual/range {v22 .. v23}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v15

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "updateSpnDisplay: emergency only and radio is on plmn=\'"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "\'"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->log(Ljava/lang/String;)V

    :cond_1
    :goto_1
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "NoServiceDebug: mIsForcedToUpdateSpn is:"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->mIsForcedToUpdateSpn:Z

    move/from16 v23, v0

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, ",!mIsDelaying is:"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->mIsDelaying:Z

    move/from16 v22, v0

    if-nez v22, :cond_a

    const/16 v22, 0x1

    :goto_2
    move-object/from16 v0, v23

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->log(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->curSpnRule:I

    move/from16 v22, v0

    move/from16 v0, v18

    move/from16 v1, v22

    if-ne v0, v1, :cond_2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->curSpn:Ljava/lang/String;

    move-object/from16 v22, v0

    invoke-static/range {v21 .. v22}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v22

    if-eqz v22, :cond_2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->curPlmn:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-static {v15, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v22

    if-eqz v22, :cond_2

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->mIsForcedToUpdateSpn:Z

    move/from16 v22, v0

    if-eqz v22, :cond_8

    :cond_2
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->mEmergencyOnly:Z

    move/from16 v22, v0

    if-nez v22, :cond_b

    invoke-static/range {v21 .. v21}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v22

    if-nez v22, :cond_b

    and-int/lit8 v22, v18, 0x1

    const/16 v23, 0x1

    move/from16 v0, v22

    move/from16 v1, v23

    if-ne v0, v1, :cond_b

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->ss:Landroid/telephony/ServiceState;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Landroid/telephony/ServiceState;->getState()I

    move-result v22

    if-nez v22, :cond_b

    const/16 v20, 0x1

    .local v20, showSpn:Z
    :goto_3
    invoke-static {v15}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v22

    if-nez v22, :cond_c

    and-int/lit8 v22, v18, 0x2

    const/16 v23, 0x2

    move/from16 v0, v22

    move/from16 v1, v23

    if-ne v0, v1, :cond_c

    const/16 v19, 0x1

    .local v19, showPlmn:Z
    :goto_4
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "updateSpnDisplay: changed sending intent rule="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, " showPlmn=\'%b\' plmn=\'%s\' showSpn=\'%b\' spn=\'%s\'"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    const/16 v23, 0x4

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    invoke-static/range {v19 .. v19}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x1

    aput-object v15, v23, v24

    const/16 v24, 0x2

    invoke-static/range {v20 .. v20}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x3

    aput-object v21, v23, v24

    invoke-static/range {v22 .. v23}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->log(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->phone:Lcom/android/internal/telephony/gsm/GSMPhone;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/android/internal/telephony/gsm/GSMPhone;->mIccRecords:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v22, v0

    if-eqz v22, :cond_3

    invoke-static {}, Lcom/android/internal/telephony/gsm/GsmServiceStateTracker$CustPlmnMember;->getInstance()Lcom/android/internal/telephony/gsm/GsmServiceStateTracker$CustPlmnMember;

    move-result-object v5

    .local v5, cpm:Lcom/android/internal/telephony/gsm/GsmServiceStateTracker$CustPlmnMember;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->phone:Lcom/android/internal/telephony/gsm/GSMPhone;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/android/internal/telephony/gsm/GSMPhone;->mIccRecords:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Lcom/android/internal/telephony/uicc/IccRecords;

    invoke-virtual/range {v22 .. v22}, Lcom/android/internal/telephony/uicc/IccRecords;->getOperatorNumeric()Ljava/lang/String;

    move-result-object v9

    .local v9, hplmn:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->ss:Landroid/telephony/ServiceState;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Landroid/telephony/ServiceState;->getOperatorNumeric()Ljava/lang/String;

    move-result-object v17

    .local v17, regplmn:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->cr:Landroid/content/ContentResolver;

    move-object/from16 v22, v0

    const-string v23, "hw_plmn_spn"

    invoke-static/range {v22 .. v23}, Landroid/provider/SettingsEx$Systemex;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .local v6, custSpn:Ljava/lang/String;
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "hplmn ="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, " regplmn ="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, " custSpn ="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->log(Ljava/lang/String;)V

    move-object/from16 v0, v17

    invoke-virtual {v5, v9, v0, v6}, Lcom/android/internal/telephony/gsm/GsmServiceStateTracker$CustPlmnMember;->acquireFromCust(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_3

    iget-boolean v0, v5, Lcom/android/internal/telephony/gsm/GsmServiceStateTracker$CustPlmnMember;->showSpn:Z

    move/from16 v20, v0

    iget-boolean v0, v5, Lcom/android/internal/telephony/gsm/GsmServiceStateTracker$CustPlmnMember;->showPlmn:Z

    move/from16 v19, v0

    iget v0, v5, Lcom/android/internal/telephony/gsm/GsmServiceStateTracker$CustPlmnMember;->rule:I

    move/from16 v18, v0

    iget-object v15, v5, Lcom/android/internal/telephony/gsm/GsmServiceStateTracker$CustPlmnMember;->plmn:Ljava/lang/String;

    iget-object v0, v5, Lcom/android/internal/telephony/gsm/GsmServiceStateTracker$CustPlmnMember;->spn:Ljava/lang/String;

    move-object/from16 v21, v0

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "showSpn2 ="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, " showPlmn2 ="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, " spn2 ="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, " plmn2 ="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->log(Ljava/lang/String;)V

    .end local v5           #cpm:Lcom/android/internal/telephony/gsm/GsmServiceStateTracker$CustPlmnMember;
    .end local v6           #custSpn:Ljava/lang/String;
    .end local v9           #hplmn:Ljava/lang/String;
    .end local v17           #regplmn:Ljava/lang/String;
    :cond_3
    const-string v22, "ro.config.hw_opta"

    const-string v23, "0"

    invoke-static/range {v22 .. v23}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    const-string v23, "92"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_5

    const-string v22, "ro.config.hw_optb"

    const-string v23, "0"

    invoke-static/range {v22 .. v23}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    const-string v23, "156"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_5

    if-eqz v15, :cond_4

    const-string v22, "GSM"

    const-string v23, "china operator, just show plmn no spn"

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v20, 0x0

    const/16 v19, 0x1

    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->ss:Landroid/telephony/ServiceState;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Landroid/telephony/ServiceState;->getOperatorNumeric()Ljava/lang/String;

    move-result-object v16

    .local v16, re_regplmn:Ljava/lang/String;
    if-eqz v16, :cond_5

    const-string v22, "ro.cfg.hw_cntelcustplmn"

    const-string v23, ""

    invoke-static/range {v22 .. v23}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .local v4, cntelcustplmn:Ljava/lang/String;
    const-string v22, ";"

    move-object/from16 v0, v22

    invoke-virtual {v4, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .local v7, custinfo:[Ljava/lang/String;
    move-object v2, v7

    .local v2, arr$:[Ljava/lang/String;
    array-length v14, v2

    .local v14, len$:I
    const/4 v10, 0x0

    .local v10, i$:I
    :goto_5
    if-ge v10, v14, :cond_5

    aget-object v3, v2, v10

    .local v3, cinfo:Ljava/lang/String;
    const-string v22, ":"

    move-object/from16 v0, v22

    invoke-virtual {v3, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .local v8, custplmn:[Ljava/lang/String;
    const/16 v22, 0x2

    array-length v0, v8

    move/from16 v23, v0

    move/from16 v0, v22

    move/from16 v1, v23

    if-ne v0, v1, :cond_d

    const/16 v22, 0x0

    aget-object v22, v8, v22

    move-object/from16 v0, v16

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_d

    const/16 v22, 0x1

    aget-object v15, v8, v22

    .end local v2           #arr$:[Ljava/lang/String;
    .end local v3           #cinfo:Ljava/lang/String;
    .end local v4           #cntelcustplmn:Ljava/lang/String;
    .end local v7           #custinfo:[Ljava/lang/String;
    .end local v8           #custplmn:[Ljava/lang/String;
    .end local v10           #i$:I
    .end local v14           #len$:I
    .end local v16           #re_regplmn:Ljava/lang/String;
    :cond_5
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->mIsForcedToUpdateSpn:Z

    move/from16 v22, v0

    if-eqz v22, :cond_6

    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v22

    const v23, 0x10402f6

    invoke-virtual/range {v22 .. v23}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v15

    const/16 v22, 0x0

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->mIsForcedToUpdateSpn:Z

    :cond_6
    new-instance v11, Landroid/content/Intent;

    const-string v22, "android.provider.Telephony.SPN_STRINGS_UPDATED"

    move-object/from16 v0, v22

    invoke-direct {v11, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .local v11, intent:Landroid/content/Intent;
    const/high16 v22, 0x2000

    move/from16 v0, v22

    invoke-virtual {v11, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string v22, "showSpn"

    move-object/from16 v0, v22

    move/from16 v1, v20

    invoke-virtual {v11, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v22, "spn"

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    invoke-virtual {v11, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v22, "showPlmn"

    move-object/from16 v0, v22

    move/from16 v1, v19

    invoke-virtual {v11, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v22, "plmn"

    move-object/from16 v0, v22

    invoke-virtual {v11, v0, v15}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v22, "subscription"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->phone:Lcom/android/internal/telephony/gsm/GSMPhone;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/android/internal/telephony/gsm/GSMPhone;->getSubscription()I

    move-result v23

    move-object/from16 v0, v22

    move/from16 v1, v23

    invoke-virtual {v11, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->mIsDelaying:Z

    move/from16 v22, v0

    if-nez v22, :cond_7

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->phone:Lcom/android/internal/telephony/gsm/GSMPhone;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/android/internal/telephony/gsm/GSMPhone;->getContext()Landroid/content/Context;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v11}, Landroid/content/Context;->sendStickyBroadcast(Landroid/content/Intent;)V

    :cond_7
    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v22

    if-eqz v22, :cond_8

    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/telephony/MSimTelephonyManager;->isMultiSimEnabled()Z

    move-result v22

    if-eqz v22, :cond_8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->phone:Lcom/android/internal/telephony/gsm/GSMPhone;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/android/internal/telephony/gsm/GSMPhone;->getSubscription()I

    move-result v22

    if-nez v22, :cond_e

    const-string v22, "Send Intent for SUB 1:android.intent.action.ACTION_DSDS_SUB1_OPERATOR_CHANGED"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->log(Ljava/lang/String;)V

    new-instance v12, Landroid/content/Intent;

    const-string v22, "android.intent.action.ACTION_DSDS_SUB1_OPERATOR_CHANGED"

    move-object/from16 v0, v22

    invoke-direct {v12, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .local v12, intent1:Landroid/content/Intent;
    const/high16 v22, 0x2000

    move/from16 v0, v22

    invoke-virtual {v12, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string v22, "showSpn"

    move-object/from16 v0, v22

    move/from16 v1, v20

    invoke-virtual {v12, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v22, "spn"

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    invoke-virtual {v12, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v22, "showPlmn"

    move-object/from16 v0, v22

    move/from16 v1, v19

    invoke-virtual {v12, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v22, "plmn"

    move-object/from16 v0, v22

    invoke-virtual {v12, v0, v15}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v22, "subscription"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->phone:Lcom/android/internal/telephony/gsm/GSMPhone;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/android/internal/telephony/gsm/GSMPhone;->getSubscription()I

    move-result v23

    move-object/from16 v0, v22

    move/from16 v1, v23

    invoke-virtual {v12, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->mIsDelaying:Z

    move/from16 v22, v0

    if-nez v22, :cond_8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->phone:Lcom/android/internal/telephony/gsm/GSMPhone;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/android/internal/telephony/gsm/GSMPhone;->getContext()Landroid/content/Context;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Landroid/content/Context;->sendStickyBroadcast(Landroid/content/Intent;)V

    .end local v11           #intent:Landroid/content/Intent;
    .end local v12           #intent1:Landroid/content/Intent;
    .end local v19           #showPlmn:Z
    .end local v20           #showSpn:Z
    :cond_8
    :goto_6
    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->curSpnRule:I

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->curSpn:Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->curPlmn:Ljava/lang/String;

    goto/16 :goto_0

    :cond_9
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->mEmergencyOnly:Z

    move/from16 v22, v0

    if-nez v22, :cond_1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->ss:Landroid/telephony/ServiceState;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Landroid/telephony/ServiceState;->getState()I

    move-result v22

    const/16 v23, 0x1

    move/from16 v0, v22

    move/from16 v1, v23

    if-ne v0, v1, :cond_1

    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v22

    const v23, 0x10402f6

    invoke-virtual/range {v22 .. v23}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v15

    goto/16 :goto_1

    :cond_a
    const/16 v22, 0x0

    goto/16 :goto_2

    :cond_b
    const/16 v20, 0x0

    goto/16 :goto_3

    .restart local v20       #showSpn:Z
    :cond_c
    const/16 v19, 0x0

    goto/16 :goto_4

    .restart local v2       #arr$:[Ljava/lang/String;
    .restart local v3       #cinfo:Ljava/lang/String;
    .restart local v4       #cntelcustplmn:Ljava/lang/String;
    .restart local v7       #custinfo:[Ljava/lang/String;
    .restart local v8       #custplmn:[Ljava/lang/String;
    .restart local v10       #i$:I
    .restart local v14       #len$:I
    .restart local v16       #re_regplmn:Ljava/lang/String;
    .restart local v19       #showPlmn:Z
    :cond_d
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_5

    .end local v2           #arr$:[Ljava/lang/String;
    .end local v3           #cinfo:Ljava/lang/String;
    .end local v4           #cntelcustplmn:Ljava/lang/String;
    .end local v7           #custinfo:[Ljava/lang/String;
    .end local v8           #custplmn:[Ljava/lang/String;
    .end local v10           #i$:I
    .end local v14           #len$:I
    .end local v16           #re_regplmn:Ljava/lang/String;
    .restart local v11       #intent:Landroid/content/Intent;
    :cond_e
    const/16 v22, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->phone:Lcom/android/internal/telephony/gsm/GSMPhone;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/android/internal/telephony/gsm/GSMPhone;->getSubscription()I

    move-result v23

    move/from16 v0, v22

    move/from16 v1, v23

    if-ne v0, v1, :cond_f

    const-string v22, "Send Intent for SUB 2:android.intent.action.ACTION_DSDS_SUB2_OPERATOR_CHANGED"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->log(Ljava/lang/String;)V

    new-instance v13, Landroid/content/Intent;

    const-string v22, "android.intent.action.ACTION_DSDS_SUB2_OPERATOR_CHANGED"

    move-object/from16 v0, v22

    invoke-direct {v13, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .local v13, intent2:Landroid/content/Intent;
    const/high16 v22, 0x2000

    move/from16 v0, v22

    invoke-virtual {v13, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string v22, "showSpn"

    move-object/from16 v0, v22

    move/from16 v1, v20

    invoke-virtual {v13, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v22, "spn"

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    invoke-virtual {v13, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v22, "showPlmn"

    move-object/from16 v0, v22

    move/from16 v1, v19

    invoke-virtual {v13, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v22, "plmn"

    move-object/from16 v0, v22

    invoke-virtual {v13, v0, v15}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v22, "subscription"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->phone:Lcom/android/internal/telephony/gsm/GSMPhone;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/android/internal/telephony/gsm/GSMPhone;->getSubscription()I

    move-result v23

    move-object/from16 v0, v22

    move/from16 v1, v23

    invoke-virtual {v13, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->mIsDelaying:Z

    move/from16 v22, v0

    if-nez v22, :cond_8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->phone:Lcom/android/internal/telephony/gsm/GSMPhone;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/android/internal/telephony/gsm/GSMPhone;->getContext()Landroid/content/Context;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v13}, Landroid/content/Context;->sendStickyBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_6

    .end local v13           #intent2:Landroid/content/Intent;
    :cond_f
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "unsupport SUB ID :"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->phone:Lcom/android/internal/telephony/gsm/GSMPhone;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/android/internal/telephony/gsm/GSMPhone;->getSubscription()I

    move-result v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/msim/MSimGsmServiceStateTracker;->log(Ljava/lang/String;)V

    goto/16 :goto_6
.end method
