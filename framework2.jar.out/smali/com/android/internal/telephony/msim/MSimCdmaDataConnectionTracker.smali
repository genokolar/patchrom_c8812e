.class public final Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;
.super Lcom/android/internal/telephony/cdma/CdmaDataConnectionTracker;
.source "MSimCdmaDataConnectionTracker.java"


# static fields
.field public static final EVENT_GSM_VOICE_CALL_ENDED:I = 0x420c9

.field public static final EVENT_GSM_VOICE_CALL_STARTED:I = 0x420c8


# instance fields
.field private mAllDataDisconnectedRegistrants:Landroid/os/RegistrantList;

.field private mDisconnectAllCompleteMsgList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/os/Message;",
            ">;"
        }
    .end annotation
.end field

.field protected mDisconnectPendingCount:I

.field protected mPhone:Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

.field protected mSubscription:Ljava/lang/Integer;


# direct methods
.method constructor <init>(Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;)V
    .locals 2
    .parameter "p"

    .prologue
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/cdma/CdmaDataConnectionTracker;-><init>(Lcom/android/internal/telephony/cdma/CDMAPhone;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mDisconnectAllCompleteMsgList:Ljava/util/ArrayList;

    new-instance v0, Landroid/os/RegistrantList;

    invoke-direct {v0}, Landroid/os/RegistrantList;-><init>()V

    iput-object v0, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mAllDataDisconnectedRegistrants:Landroid/os/RegistrantList;

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mDisconnectPendingCount:I

    iput-object p1, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

    invoke-virtual {v0}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->getSubscription()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mSubscription:Ljava/lang/Integer;

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->isActiveDataSubscription()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mInternalDataEnabled:Z

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mInternalDataEnabled (is data sub?) = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mInternalDataEnabled:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->log(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->broadcastMessenger()V

    return-void
.end method


# virtual methods
.method protected broadcastMessenger()V
    .locals 1

    .prologue
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->isActiveDataSubscription()Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-super {p0}, Lcom/android/internal/telephony/cdma/CdmaDataConnectionTracker;->broadcastMessenger()V

    goto :goto_0
.end method

.method public cleanUpAllConnections(Ljava/lang/String;)V
    .locals 1
    .parameter "cause"

    .prologue
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->cleanUpAllConnections(Ljava/lang/String;Landroid/os/Message;)V

    return-void
.end method

.method public cleanUpAllConnections(Ljava/lang/String;Landroid/os/Message;)V
    .locals 2
    .parameter "cause"
    .parameter "disconnectAllCompleteMsg"

    .prologue
    const-string v1, "cleanUpAllConnections"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->log(Ljava/lang/String;)V

    if-eqz p2, :cond_0

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mDisconnectAllCompleteMsgList:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    const v1, 0x4201e

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .local v0, msg:Landroid/os/Message;
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method protected cleanUpConnection(ZLjava/lang/String;Z)V
    .locals 9
    .parameter "tearDown"
    .parameter "reason"
    .parameter "doAll"

    .prologue
    const v8, 0x4200f

    const/4 v7, 0x0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "cleanUpConnection: reason: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->log(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mReconnectIntent:Landroid/app/PendingIntent;

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

    invoke-virtual {v5}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->getContext()Landroid/content/Context;

    move-result-object v5

    const-string v6, "alarm"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .local v0, am:Landroid/app/AlarmManager;
    iget-object v5, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mReconnectIntent:Landroid/app/PendingIntent;

    invoke-virtual {v0, v5}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    const/4 v5, 0x0

    iput-object v5, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mReconnectIntent:Landroid/app/PendingIntent;

    .end local v0           #am:Landroid/app/AlarmManager;
    :cond_0
    sget-object v5, Lcom/android/internal/telephony/DataConnectionTracker$State;->DISCONNECTING:Lcom/android/internal/telephony/DataConnectionTracker$State;

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->setState(Lcom/android/internal/telephony/DataConnectionTracker$State;)V

    invoke-virtual {p0, p2}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->notifyOffApnsOfAvailability(Ljava/lang/String;)V

    const/4 v4, 0x0

    .local v4, notificationDeferred:Z
    iget-object v5, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mDataConnections:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/DataConnection;

    .local v1, conn:Lcom/android/internal/telephony/DataConnection;
    if-eqz v1, :cond_1

    iget-object v5, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mDataConnectionAsyncChannels:Ljava/util/HashMap;

    invoke-virtual {v1}, Lcom/android/internal/telephony/DataConnection;->getDataConnectionId()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/internal/telephony/DataConnectionAc;

    .local v2, dcac:Lcom/android/internal/telephony/DataConnectionAc;
    if-eqz p1, :cond_3

    if-eqz p3, :cond_2

    const-string v5, "cleanUpConnection: teardown, conn.tearDownAll"

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->log(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/android/internal/telephony/DataConnection;->getDataConnectionId()I

    move-result v5

    invoke-virtual {p0, v8, v5, v7, p2}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v5

    invoke-virtual {v1, p2, v5}, Lcom/android/internal/telephony/DataConnection;->tearDownAll(Ljava/lang/String;Landroid/os/Message;)V

    :goto_1
    const/4 v4, 0x1

    iget v5, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mDisconnectPendingCount:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mDisconnectPendingCount:I

    goto :goto_0

    :cond_2
    const-string v5, "cleanUpConnection: teardown, conn.tearDown"

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->log(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/android/internal/telephony/DataConnection;->getDataConnectionId()I

    move-result v5

    invoke-virtual {p0, v8, v5, v7, p2}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v5

    invoke-virtual {v1, p2, v5}, Lcom/android/internal/telephony/DataConnection;->tearDown(Ljava/lang/String;Landroid/os/Message;)V

    goto :goto_1

    :cond_3
    const-string v5, "cleanUpConnection: !tearDown, call conn.resetSynchronously"

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->log(Ljava/lang/String;)V

    if-eqz v2, :cond_4

    invoke-virtual {v2}, Lcom/android/internal/telephony/DataConnectionAc;->resetSync()V

    :cond_4
    const/4 v4, 0x0

    goto :goto_0

    .end local v1           #conn:Lcom/android/internal/telephony/DataConnection;
    .end local v2           #dcac:Lcom/android/internal/telephony/DataConnectionAc;
    :cond_5
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->stopNetStatPoll()V

    if-nez v4, :cond_6

    const-string v5, "cleanupConnection: !notificationDeferred"

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->log(Ljava/lang/String;)V

    invoke-virtual {p0, p2}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->gotoIdleAndNotifyDataConnection(Ljava/lang/String;)V

    :cond_6
    if-eqz p1, :cond_7

    iget v5, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mDisconnectPendingCount:I

    if-nez v5, :cond_7

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->notifyDataDisconnectComplete()V

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->notifyAllDataDisconnected()V

    :cond_7
    return-void
.end method

.method public declared-synchronized disableApnType(Ljava/lang/String;)I
    .locals 3
    .parameter "type"

    .prologue
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->isActiveDataSubscription()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-super {p0, p1}, Lcom/android/internal/telephony/cdma/CdmaDataConnectionTracker;->disableApnType(Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    :goto_0
    monitor-exit p0

    return v1

    :cond_0
    :try_start_1
    const-string v1, "default"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "disableApnType(): NOT active DDS, dataEnabled as false for default"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->log(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->apnTypeToId(Ljava/lang/String;)I

    move-result v0

    .local v0, apnId:I
    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->dataEnabled:[Z

    const/4 v2, 0x0

    aput-boolean v2, v1, v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local v0           #apnId:I
    :cond_1
    const/4 v1, 0x3

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized enableApnType(Ljava/lang/String;)I
    .locals 3
    .parameter "apnType"

    .prologue
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->isActiveDataSubscription()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-super {p0, p1}, Lcom/android/internal/telephony/cdma/CdmaDataConnectionTracker;->enableApnType(Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    :goto_0
    monitor-exit p0

    return v1

    :cond_0
    :try_start_1
    const-string v1, "default"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "enableApnType(): NOT active DDS, dataEnabled as true for default"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->log(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->apnTypeToId(Ljava/lang/String;)I

    move-result v0

    .local v0, apnId:I
    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->dataEnabled:[Z

    const/4 v2, 0x1

    aput-boolean v2, v1, v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local v0           #apnId:I
    :cond_1
    const/4 v1, 0x3

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method protected getUiccCardApplication()Lcom/android/internal/telephony/uicc/IccRecords;
    .locals 4

    .prologue
    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

    invoke-virtual {v1}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->getSubscriptionInfo()Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v0

    .local v0, subscriptionData:Lcom/android/internal/telephony/msim/Subscription;
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mUiccController:Lcom/android/internal/telephony/uicc/UiccController;

    iget v2, v0, Lcom/android/internal/telephony/msim/Subscription;->slotId:I

    const/4 v3, 0x2

    invoke-virtual {v1, v2, v3}, Lcom/android/internal/telephony/uicc/UiccController;->getIccRecords(II)Lcom/android/internal/telephony/uicc/IccRecords;

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
    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->isActiveDataSubscription()Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "Ignore CDMA msgs since CDMA phone is not the current DDS"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->loge(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    iget v1, p1, Landroid/os/Message;->what:I

    sparse-switch v1, :sswitch_data_0

    invoke-super {p0, p1}, Lcom/android/internal/telephony/cdma/CdmaDataConnectionTracker;->handleMessage(Landroid/os/Message;)V

    goto :goto_0

    :sswitch_0
    iget v1, p1, Landroid/os/Message;->arg1:I

    if-ne v1, v0, :cond_1

    .local v0, enabled:Z
    :goto_1
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Landroid/os/Message;

    invoke-virtual {p0, v0, v1}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->onSetInternalDataEnabled(ZLandroid/os/Message;)V

    goto :goto_0

    .end local v0           #enabled:Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    :sswitch_1
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->onGsmVoiceCallStarted()V

    goto :goto_0

    :sswitch_2
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->onGsmVoiceCallEnded()V

    goto :goto_0

    :sswitch_data_0
    .sparse-switch
        0x4201b -> :sswitch_0
        0x420c8 -> :sswitch_1
        0x420c9 -> :sswitch_2
    .end sparse-switch
.end method

.method protected isActiveDataSubscription()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mSubscription:Ljava/lang/Integer;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mSubscription:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {}, Lcom/android/internal/telephony/msim/MSimPhoneFactory;->getDataSubscription()I

    move-result v2

    if-ne v1, v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method protected log(Ljava/lang/String;)V
    .locals 3
    .parameter "s"

    .prologue
    const-string v0, "CDMA"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[MSimCdmaDCT:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mSubscription:Ljava/lang/Integer;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

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

    const-string v2, "[MSimCdmaDCT:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mSubscription:Ljava/lang/Integer;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

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

.method public notifyAllDataDisconnected()V
    .locals 1

    .prologue
    const-string v0, "notifyAllDataDisconnected"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->log(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mAllDataDisconnectedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v0}, Landroid/os/RegistrantList;->notifyRegistrants()V

    return-void
.end method

.method protected notifyDataDisconnectComplete()V
    .locals 3

    .prologue
    const-string v2, "notifyDataDisconnectComplete"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->log(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mDisconnectAllCompleteMsgList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Message;

    .local v1, m:Landroid/os/Message;
    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    goto :goto_0

    .end local v1           #m:Landroid/os/Message;
    :cond_0
    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mDisconnectAllCompleteMsgList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method protected onDataSetupComplete(Landroid/os/AsyncResult;)V
    .locals 1
    .parameter "ar"

    .prologue
    invoke-super {p0, p1}, Lcom/android/internal/telephony/cdma/CdmaDataConnectionTracker;->onDataSetupComplete(Landroid/os/AsyncResult;)V

    iget-boolean v0, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mInternalDataEnabled:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->cleanUpAllConnections(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method protected onDataStateChanged(Landroid/os/AsyncResult;)V
    .locals 2
    .parameter "ar"

    .prologue
    invoke-super {p0, p1}, Lcom/android/internal/telephony/cdma/CdmaDataConnectionTracker;->onDataStateChanged(Landroid/os/AsyncResult;)V

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mState:Lcom/android/internal/telephony/DataConnectionTracker$State;

    sget-object v1, Lcom/android/internal/telephony/DataConnectionTracker$State;->IDLE:Lcom/android/internal/telephony/DataConnectionTracker$State;

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->notifyAllDataDisconnected()V

    :cond_0
    return-void
.end method

.method protected onDisconnectDone(ILandroid/os/AsyncResult;)V
    .locals 1
    .parameter "connId"
    .parameter "ar"

    .prologue
    invoke-super {p0, p1, p2}, Lcom/android/internal/telephony/cdma/CdmaDataConnectionTracker;->onDisconnectDone(ILandroid/os/AsyncResult;)V

    iget v0, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mDisconnectPendingCount:I

    if-lez v0, :cond_0

    iget v0, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mDisconnectPendingCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mDisconnectPendingCount:I

    :cond_0
    iget v0, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mDisconnectPendingCount:I

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->notifyDataDisconnectComplete()V

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->notifyAllDataDisconnected()V

    :cond_1
    return-void
.end method

.method onGsmVoiceCallEnded()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mIsGsmInCall:Z

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->onVoiceCallEnded()V

    return-void
.end method

.method onGsmVoiceCallStarted()V
    .locals 1

    .prologue
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mIsGsmInCall:Z

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->onVoiceCallStarted()V

    return-void
.end method

.method protected onSetInternalDataEnabled(Z)V
    .locals 1
    .parameter "enable"

    .prologue
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->onSetInternalDataEnabled(ZLandroid/os/Message;)V

    return-void
.end method

.method protected onSetInternalDataEnabled(ZLandroid/os/Message;)V
    .locals 3
    .parameter "enabled"
    .parameter "onCompleteMsg"

    .prologue
    const/4 v0, 0x1

    .local v0, sendOnComplete:Z
    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mDataEnabledLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iput-boolean p1, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mInternalDataEnabled:Z

    if-eqz p1, :cond_1

    const-string v1, "onSetInternalDataEnabled: changed to enabled, try to setup data call"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->log(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->resetAllRetryCounts()V

    const-string v1, "dataEnabled"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->onTrySetupData(Ljava/lang/String;)Z

    :goto_0
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Landroid/os/Message;->sendToTarget()V

    :cond_0
    return-void

    :cond_1
    const/4 v0, 0x0

    :try_start_1
    const-string v1, "onSetInternalDataEnabled: changed to disabled, cleanUpAllConnections"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->log(Ljava/lang/String;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v1, p2}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->cleanUpAllConnections(Ljava/lang/String;Landroid/os/Message;)V

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public registerForAllDataDisconnected(Landroid/os/Handler;ILjava/lang/Object;)V
    .locals 1
    .parameter "h"
    .parameter "what"
    .parameter "obj"

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mAllDataDisconnectedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v0, p1, p2, p3}, Landroid/os/RegistrantList;->addUnique(Landroid/os/Handler;ILjava/lang/Object;)V

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->isDisconnected()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "notify All Data Disconnected"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->log(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mAllDataDisconnectedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v0}, Landroid/os/RegistrantList;->notifyRegistrants()V

    :cond_0
    return-void
.end method

.method protected registerForAllEvents()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

    iget-object v1, v1, Lcom/android/internal/telephony/PhoneBase;->mCM:Lcom/android/internal/telephony/CommandsInterface;

    const v2, 0x42001

    invoke-interface {v1, p0, v2, v3}, Lcom/android/internal/telephony/CommandsInterface;->registerForAvailable(Landroid/os/Handler;ILjava/lang/Object;)V

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

    iget-object v1, v1, Lcom/android/internal/telephony/PhoneBase;->mCM:Lcom/android/internal/telephony/CommandsInterface;

    const v2, 0x42006

    invoke-interface {v1, p0, v2, v3}, Lcom/android/internal/telephony/CommandsInterface;->registerForOffOrNotAvailable(Landroid/os/Handler;ILjava/lang/Object;)V

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

    iget-object v1, v1, Lcom/android/internal/telephony/PhoneBase;->mCM:Lcom/android/internal/telephony/CommandsInterface;

    const v2, 0x42004

    invoke-interface {v1, p0, v2, v3}, Lcom/android/internal/telephony/CommandsInterface;->registerForDataNetworkStateChanged(Landroid/os/Handler;ILjava/lang/Object;)V

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

    invoke-virtual {v1}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->getCallTracker()Lcom/android/internal/telephony/CallTracker;

    move-result-object v1

    const v2, 0x42008

    invoke-virtual {v1, p0, v2, v3}, Lcom/android/internal/telephony/CallTracker;->registerForVoiceCallEnded(Landroid/os/Handler;ILjava/lang/Object;)V

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

    invoke-virtual {v1}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->getCallTracker()Lcom/android/internal/telephony/CallTracker;

    move-result-object v1

    const v2, 0x42007

    invoke-virtual {v1, p0, v2, v3}, Lcom/android/internal/telephony/CallTracker;->registerForVoiceCallStarted(Landroid/os/Handler;ILjava/lang/Object;)V

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

    invoke-virtual {v1}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v1

    const v2, 0x42003

    invoke-virtual {v1, p0, v2, v3}, Lcom/android/internal/telephony/ServiceStateTracker;->registerForDataConnectionAttached(Landroid/os/Handler;ILjava/lang/Object;)V

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

    invoke-virtual {v1}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v1

    const v2, 0x42014

    invoke-virtual {v1, p0, v2, v3}, Lcom/android/internal/telephony/ServiceStateTracker;->registerForDataConnectionDetached(Landroid/os/Handler;ILjava/lang/Object;)V

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

    invoke-virtual {v1}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v1

    const v2, 0x4200b

    invoke-virtual {v1, p0, v2, v3}, Lcom/android/internal/telephony/ServiceStateTracker;->registerForRoamingOn(Landroid/os/Handler;ILjava/lang/Object;)V

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

    invoke-virtual {v1}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v1

    const v2, 0x4200c

    invoke-virtual {v1, p0, v2, v3}, Lcom/android/internal/telephony/ServiceStateTracker;->registerForRoamingOff(Landroid/os/Handler;ILjava/lang/Object;)V

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

    iget-object v1, v1, Lcom/android/internal/telephony/PhoneBase;->mCM:Lcom/android/internal/telephony/CommandsInterface;

    const v2, 0x42019

    invoke-interface {v1, p0, v2, v3}, Lcom/android/internal/telephony/CommandsInterface;->registerForCdmaOtaProvision(Landroid/os/Handler;ILjava/lang/Object;)V

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mDpt:Lcom/android/internal/telephony/cdma/CdmaDataProfileTracker;

    const v2, 0x42025

    invoke-virtual {v1, p0, v2, v3}, Lcom/android/internal/telephony/cdma/CdmaDataProfileTracker;->registerForModemProfileReady(Landroid/os/Handler;ILjava/lang/Object;)V

    const-string v1, "ro.config.hw_dsda"

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mSubscription:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    rem-int/lit8 v1, v1, 0x2

    invoke-static {v1}, Lcom/android/internal/telephony/msim/MSimPhoneFactory;->getPhone(I)Lcom/android/internal/telephony/Phone;

    move-result-object v0

    .local v0, otherPhone:Lcom/android/internal/telephony/Phone;
    if-eqz v0, :cond_0

    move-object v1, v0

    check-cast v1, Lcom/android/internal/telephony/msim/MSimPhoneProxy;

    const v2, 0x420c9

    invoke-virtual {v1, p0, v2, v3}, Lcom/android/internal/telephony/msim/MSimPhoneProxy;->registerForTheOtherPhoneVoiceCallEnded(Landroid/os/Handler;ILjava/lang/Object;)V

    check-cast v0, Lcom/android/internal/telephony/msim/MSimPhoneProxy;

    .end local v0           #otherPhone:Lcom/android/internal/telephony/Phone;
    const v1, 0x420c8

    invoke-virtual {v0, p0, v1, v3}, Lcom/android/internal/telephony/msim/MSimPhoneProxy;->registerForTheOtherPhoneVoiceCallStarted(Landroid/os/Handler;ILjava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public setInternalDataEnabled(Z)Z
    .locals 1
    .parameter "enable"

    .prologue
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->setInternalDataEnabled(ZLandroid/os/Message;)Z

    move-result v0

    return v0
.end method

.method public setInternalDataEnabled(ZLandroid/os/Message;)Z
    .locals 4
    .parameter "enable"
    .parameter "onCompleteMsg"

    .prologue
    const/4 v2, 0x1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setInternalDataEnabled("

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ")"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->log(Ljava/lang/String;)V

    const v1, 0x4201b

    invoke-virtual {p0, v1, p2}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .local v0, msg:Landroid/os/Message;
    if-eqz p1, :cond_0

    move v1, v2

    :goto_0
    iput v1, v0, Landroid/os/Message;->arg1:I

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->sendMessage(Landroid/os/Message;)Z

    return v2

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public setInternalDataEnabledFlag(Z)Z
    .locals 2
    .parameter "enable"

    .prologue
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setInternalDataEnabled("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->log(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mInternalDataEnabled:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mInternalDataEnabled:Z

    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public unregisterForAllDataDisconnected(Landroid/os/Handler;)V
    .locals 1
    .parameter "h"

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mAllDataDisconnectedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v0, p1}, Landroid/os/RegistrantList;->remove(Landroid/os/Handler;)V

    return-void
.end method

.method protected unregisterForAllEvents()V
    .locals 4

    .prologue
    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

    iget-object v2, v2, Lcom/android/internal/telephony/PhoneBase;->mCM:Lcom/android/internal/telephony/CommandsInterface;

    invoke-interface {v2, p0}, Lcom/android/internal/telephony/CommandsInterface;->unregisterForAvailable(Landroid/os/Handler;)V

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

    iget-object v2, v2, Lcom/android/internal/telephony/PhoneBase;->mCM:Lcom/android/internal/telephony/CommandsInterface;

    invoke-interface {v2, p0}, Lcom/android/internal/telephony/CommandsInterface;->unregisterForOffOrNotAvailable(Landroid/os/Handler;)V

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mIccRecords:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/uicc/IccRecords;

    .local v1, r:Lcom/android/internal/telephony/uicc/IccRecords;
    if-eqz v1, :cond_0

    const-string v2, "set mIccRecords to null while unregisterForRecordsLoaded"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->log(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Lcom/android/internal/telephony/uicc/IccRecords;->unregisterForRecordsLoaded(Landroid/os/Handler;)V

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mIccRecords:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    :cond_0
    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

    iget-object v2, v2, Lcom/android/internal/telephony/PhoneBase;->mCM:Lcom/android/internal/telephony/CommandsInterface;

    invoke-interface {v2, p0}, Lcom/android/internal/telephony/CommandsInterface;->unregisterForDataNetworkStateChanged(Landroid/os/Handler;)V

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

    invoke-virtual {v2}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->getCallTracker()Lcom/android/internal/telephony/CallTracker;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/android/internal/telephony/CallTracker;->unregisterForVoiceCallEnded(Landroid/os/Handler;)V

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

    invoke-virtual {v2}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->getCallTracker()Lcom/android/internal/telephony/CallTracker;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/android/internal/telephony/CallTracker;->unregisterForVoiceCallStarted(Landroid/os/Handler;)V

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

    invoke-virtual {v2}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/android/internal/telephony/ServiceStateTracker;->unregisterForDataConnectionAttached(Landroid/os/Handler;)V

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

    invoke-virtual {v2}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/android/internal/telephony/ServiceStateTracker;->unregisterForDataConnectionDetached(Landroid/os/Handler;)V

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

    invoke-virtual {v2}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/android/internal/telephony/ServiceStateTracker;->unregisterForRoamingOn(Landroid/os/Handler;)V

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

    invoke-virtual {v2}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/android/internal/telephony/ServiceStateTracker;->unregisterForRoamingOff(Landroid/os/Handler;)V

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

    iget-object v2, v2, Lcom/android/internal/telephony/PhoneBase;->mCM:Lcom/android/internal/telephony/CommandsInterface;

    invoke-interface {v2, p0}, Lcom/android/internal/telephony/CommandsInterface;->unregisterForCdmaOtaProvision(Landroid/os/Handler;)V

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mDpt:Lcom/android/internal/telephony/cdma/CdmaDataProfileTracker;

    invoke-virtual {v2, p0}, Lcom/android/internal/telephony/cdma/CdmaDataProfileTracker;->unregisterForModemProfileReady(Landroid/os/Handler;)V

    const-string v2, "ro.config.hw_dsda"

    const/4 v3, 0x0

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mSubscription:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    rem-int/lit8 v2, v2, 0x2

    invoke-static {v2}, Lcom/android/internal/telephony/msim/MSimPhoneFactory;->getPhone(I)Lcom/android/internal/telephony/Phone;

    move-result-object v0

    .local v0, otherPhone:Lcom/android/internal/telephony/Phone;
    if-eqz v0, :cond_1

    move-object v2, v0

    check-cast v2, Lcom/android/internal/telephony/msim/MSimPhoneProxy;

    invoke-virtual {v2, p0}, Lcom/android/internal/telephony/msim/MSimPhoneProxy;->unregisterForTheOtherPhoneVoiceCallEnded(Landroid/os/Handler;)V

    check-cast v0, Lcom/android/internal/telephony/msim/MSimPhoneProxy;

    .end local v0           #otherPhone:Lcom/android/internal/telephony/Phone;
    invoke-virtual {v0, p0}, Lcom/android/internal/telephony/msim/MSimPhoneProxy;->unregisterForTheOtherPhoneVoiceCallStarted(Landroid/os/Handler;)V

    :cond_1
    return-void
.end method

.method protected update()V
    .locals 3

    .prologue
    const/4 v0, 0x1

    const-string v1, "update"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->log(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->isActiveDataSubscription()Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "update(): Active DDS, register for all events now!"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->log(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->registerForAllEvents()V

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->onUpdateIcc()V

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

    invoke-virtual {v1}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "mobile_data"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-ne v1, v0, :cond_0

    :goto_0
    iput-boolean v0, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mUserDataEnabled:Z

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

    invoke-virtual {v0}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->updateCurrentCarrierInProvider()Z

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->broadcastMessenger()V

    :goto_1
    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->unregisterForAllEvents()V

    const-string v0, "update(): NOT the active DDS, unregister for all events!"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->log(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public updateRecords()V
    .locals 1

    .prologue
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->isActiveDataSubscription()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->onUpdateIcc()V

    :cond_0
    return-void
.end method
