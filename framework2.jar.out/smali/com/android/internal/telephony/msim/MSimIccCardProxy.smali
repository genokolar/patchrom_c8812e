.class public Lcom/android/internal/telephony/msim/MSimIccCardProxy;
.super Lcom/android/internal/telephony/uicc/IccCardProxy;
.source "MSimIccCardProxy.java"


# static fields
.field private static final DBG:Z = true

.field private static final EVENT_ICC_RECORD_EVENTS:I = 0x1f4

.field private static final EVENT_SUBSCRIPTION_ACTIVATED:I = 0x1f5

.field private static final EVENT_SUBSCRIPTION_DEACTIVATED:I = 0x1f6

.field private static final LOG_TAG:Ljava/lang/String; = "RIL_MSimIccCardProxy"


# instance fields
.field private bHuaweiDSDA:Z

.field private mCardIndex:Ljava/lang/Integer;

.field private mSubscriptionData:Lcom/android/internal/telephony/msim/Subscription;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/internal/telephony/CommandsInterface;I)V
    .locals 5
    .parameter "context"
    .parameter "ci"
    .parameter "cardIndex"

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    invoke-direct {p0, p1, p2}, Lcom/android/internal/telephony/uicc/IccCardProxy;-><init>(Landroid/content/Context;Lcom/android/internal/telephony/CommandsInterface;)V

    iput-object v3, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCardIndex:Ljava/lang/Integer;

    iput-object v3, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mSubscriptionData:Lcom/android/internal/telephony/msim/Subscription;

    const-string v1, "ro.config.hw_dsda"

    invoke-static {v1, v4}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->bHuaweiDSDA:Z

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCardIndex:Ljava/lang/Integer;

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getInstance()Lcom/android/internal/telephony/msim/SubscriptionManager;

    move-result-object v0

    .local v0, subMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;
    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCardIndex:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/16 v2, 0x1f5

    invoke-virtual {v0, v1, p0, v2, v3}, Lcom/android/internal/telephony/msim/SubscriptionManager;->registerForSubscriptionActivatedOnSlot(ILandroid/os/Handler;ILjava/lang/Object;)V

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCardIndex:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/16 v2, 0x1f6

    invoke-virtual {v0, v1, p0, v2, v3}, Lcom/android/internal/telephony/msim/SubscriptionManager;->registerForSubscriptionDeactivatedOnSlot(ILandroid/os/Handler;ILjava/lang/Object;)V

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->resetProperties()V

    sget-object v1, Lcom/android/internal/telephony/IccCard$State;->NOT_READY:Lcom/android/internal/telephony/IccCard$State;

    invoke-virtual {p0, v1, v4}, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->setExternalState(Lcom/android/internal/telephony/IccCard$State;Z)V

    return-void
.end method

.method private onSubscriptionActivated()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getInstance()Lcom/android/internal/telephony/msim/SubscriptionManager;

    move-result-object v0

    .local v0, subMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;
    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCardIndex:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscriptionOnSlot(I)Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v1

    iput-object v1, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mSubscriptionData:Lcom/android/internal/telephony/msim/Subscription;

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mSubscriptionData:Lcom/android/internal/telephony/msim/Subscription;

    iget-object v1, v1, Lcom/android/internal/telephony/msim/Subscription;->appType:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mSubscriptionData:Lcom/android/internal/telephony/msim/Subscription;

    iget-object v1, v1, Lcom/android/internal/telephony/msim/Subscription;->appType:Ljava/lang/String;

    const-string v2, "SIM"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mSubscriptionData:Lcom/android/internal/telephony/msim/Subscription;

    iget-object v1, v1, Lcom/android/internal/telephony/msim/Subscription;->appType:Ljava/lang/String;

    const-string v2, "USIM"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_0
    iget v1, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCurrentAppType:I

    if-eq v1, v3, :cond_2

    const-string v1, "update App Family to 3GPP"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->log(Ljava/lang/String;)V

    iput v3, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCurrentAppType:I

    :cond_1
    :goto_0
    iget-boolean v1, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->bHuaweiDSDA:Z

    if-eqz v1, :cond_4

    const-string v1, "DSDA!, we didn\'t reset properities, because this event may be later after EVENT_RECORDS_LOADED"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->log(Ljava/lang/String;)V

    :goto_1
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->updateIccAvailability()V

    invoke-direct {p0}, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->updateStateProperty()V

    return-void

    :cond_2
    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mSubscriptionData:Lcom/android/internal/telephony/msim/Subscription;

    iget-object v1, v1, Lcom/android/internal/telephony/msim/Subscription;->appType:Ljava/lang/String;

    const-string v2, "RUIM"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mSubscriptionData:Lcom/android/internal/telephony/msim/Subscription;

    iget-object v1, v1, Lcom/android/internal/telephony/msim/Subscription;->appType:Ljava/lang/String;

    const-string v2, "CSIM"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_3
    iget v1, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCurrentAppType:I

    if-eq v1, v4, :cond_1

    const-string v1, "update App Family to 3GPP"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->log(Ljava/lang/String;)V

    iput v4, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCurrentAppType:I

    goto :goto_0

    :cond_4
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->resetProperties()V

    goto :goto_1
.end method

.method private onSubscriptionDeactivated()V
    .locals 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCdmaSSM:Lcom/android/internal/telephony/cdma/CdmaSubscriptionSourceManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCdmaSSM:Lcom/android/internal/telephony/cdma/CdmaSubscriptionSourceManager;

    invoke-virtual {v0}, Lcom/android/internal/telephony/cdma/CdmaSubscriptionSourceManager;->getCdmaSubscriptionSource()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mIccRecords:Lcom/android/internal/telephony/uicc/IccRecords;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mIccRecords:Lcom/android/internal/telephony/uicc/IccRecords;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/android/internal/telephony/uicc/IccRecords;->recordsRequested:Z

    :cond_0
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->resetProperties()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mSubscriptionData:Lcom/android/internal/telephony/msim/Subscription;

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->updateIccAvailability()V

    invoke-direct {p0}, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->updateStateProperty()V

    return-void
.end method

.method private updateStateProperty()V
    .locals 3

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mSubscriptionData:Lcom/android/internal/telephony/msim/Subscription;

    if-eqz v0, :cond_0

    const-string v0, "gsm.sim.state"

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCardIndex:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->getState()Lcom/android/internal/telephony/IccCard$State;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/IccCard$State;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Landroid/telephony/MSimTelephonyManager;->setTelephonyProperty(Ljava/lang/String;ILjava/lang/String;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public broadcastIccStateChangedIntent(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .parameter "value"
    .parameter "reason"

    .prologue
    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCardIndex:Ljava/lang/Integer;

    if-nez v2, :cond_0

    const-string v2, "broadcastIccStateChangedIntent: Card Index is not set; Return!!"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->loge(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCardIndex:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .local v1, subId:I
    iget-boolean v2, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mQuietMode:Z

    if-eqz v2, :cond_1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "QuietMode: NOT Broadcasting intent ACTION_SIM_STATE_CHANGED "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " reason "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->log(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.SIM_STATE_CHANGED"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .local v0, intent:Landroid/content/Intent;
    const-string v2, "phoneName"

    const-string v3, "Phone"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "ss"

    invoke-virtual {v0, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "reason"

    invoke-virtual {v0, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "subscription"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Broadcasting intent ACTION_SIM_STATE_CHANGED "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " reason "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " for subscription : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->log(Ljava/lang/String;)V

    const-string v2, "android.permission.READ_PHONE_STATE"

    invoke-static {v0, v2}, Landroid/app/ActivityManagerNative;->broadcastStickyIntent(Landroid/content/Intent;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public dispose()V
    .locals 0

    .prologue
    invoke-super {p0}, Lcom/android/internal/telephony/uicc/IccCardProxy;->dispose()V

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->resetProperties()V

    return-void
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 8
    .parameter "msg"

    .prologue
    const/4 v6, 0x2

    const/4 v7, 0x1

    const/4 v4, 0x0

    iget v5, p1, Landroid/os/Message;->what:I

    sparse-switch v5, :sswitch_data_0

    invoke-super {p0, p1}, Lcom/android/internal/telephony/uicc/IccCardProxy;->handleMessage(Landroid/os/Message;)V

    :cond_0
    :goto_0
    return-void

    :sswitch_0
    const-string v5, "EVENT_SUBSCRIPTION_ACTIVATED"

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->log(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->onSubscriptionActivated()V

    goto :goto_0

    :sswitch_1
    const-string v5, "EVENT_SUBSCRIPTION_DEACTIVATED"

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->log(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->onSubscriptionDeactivated()V

    goto :goto_0

    :sswitch_2
    iget-object v5, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mIccRecords:Lcom/android/internal/telephony/uicc/IccRecords;

    if-eqz v5, :cond_1

    iget-object v5, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mIccRecords:Lcom/android/internal/telephony/uicc/IccRecords;

    invoke-virtual {v5}, Lcom/android/internal/telephony/uicc/IccRecords;->getOperatorNumeric()Ljava/lang/String;

    move-result-object v3

    .local v3, operator:Ljava/lang/String;
    if-eqz v3, :cond_3

    const-string v5, "gsm.sim.operator.numeric"

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCardIndex:Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-static {v5, v6, v3}, Landroid/telephony/MSimTelephonyManager;->setTelephonyProperty(Ljava/lang/String;ILjava/lang/String;)V

    iget v5, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCurrentAppType:I

    if-ne v5, v7, :cond_1

    const-string v5, "gsm.apn.sim.operator.numeric"

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCardIndex:Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-static {v5, v6, v3}, Landroid/telephony/MSimTelephonyManager;->setTelephonyProperty(Ljava/lang/String;ILjava/lang/String;)V

    const/4 v5, 0x3

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .local v1, countryCode:Ljava/lang/String;
    if-eqz v1, :cond_2

    const-string v5, "gsm.sim.operator.iso-country"

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCardIndex:Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    invoke-static {v7}, Lcom/android/internal/telephony/MccTable;->countryCodeForMcc(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Landroid/telephony/MSimTelephonyManager;->setTelephonyProperty(Ljava/lang/String;ILjava/lang/String;)V

    .end local v1           #countryCode:Ljava/lang/String;
    .end local v3           #operator:Ljava/lang/String;
    :cond_1
    :goto_1
    const-string v5, "LOADED"

    const/4 v6, 0x0

    invoke-virtual {p0, v5, v6}, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->broadcastIccStateChangedIntent(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .restart local v1       #countryCode:Ljava/lang/String;
    .restart local v3       #operator:Ljava/lang/String;
    :cond_2
    const-string v5, "RIL_MSimIccCardProxy"

    const-string v6, "EVENT_RECORDS_LOADED Country code is null"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .end local v1           #countryCode:Ljava/lang/String;
    :cond_3
    const-string v5, "EVENT_RECORDS_LOADED Operator name is null"

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->loge(Ljava/lang/String;)V

    goto :goto_1

    .end local v3           #operator:Ljava/lang/String;
    :sswitch_3
    iget v5, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCurrentAppType:I

    if-eq v5, v7, :cond_4

    iget v5, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCurrentAppType:I

    if-ne v5, v6, :cond_0

    :cond_4
    iget-object v5, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mIccRecords:Lcom/android/internal/telephony/uicc/IccRecords;

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mSubscriptionData:Lcom/android/internal/telephony/msim/Subscription;

    if-eqz v5, :cond_5

    iget-object v5, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mSubscriptionData:Lcom/android/internal/telephony/msim/Subscription;

    iget v4, v5, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    .local v4, sub:I
    :cond_5
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .local v0, ar:Landroid/os/AsyncResult;
    iget-object v5, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .local v2, eventCode:I
    if-ne v2, v6, :cond_0

    const-string v5, "gsm.sim.operator.alpha"

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCardIndex:Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    iget-object v7, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mIccRecords:Lcom/android/internal/telephony/uicc/IccRecords;

    invoke-virtual {v7}, Lcom/android/internal/telephony/uicc/IccRecords;->getServiceProviderName()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Landroid/telephony/MSimTelephonyManager;->setTelephonyProperty(Ljava/lang/String;ILjava/lang/String;)V

    goto/16 :goto_0

    :sswitch_data_0
    .sparse-switch
        0x7 -> :sswitch_2
        0x1f4 -> :sswitch_3
        0x1f5 -> :sswitch_0
        0x1f6 -> :sswitch_1
    .end sparse-switch
.end method

.method protected log(Ljava/lang/String;)V
    .locals 3
    .parameter "msg"

    .prologue
    const-string v0, "RIL_MSimIccCardProxy"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[CardIndex:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCardIndex:Ljava/lang/Integer;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

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
    .parameter "msg"

    .prologue
    const-string v0, "RIL_MSimIccCardProxy"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[CardIndex:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCardIndex:Ljava/lang/Integer;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method protected registerUiccCardEvents()V
    .locals 3

    .prologue
    invoke-super {p0}, Lcom/android/internal/telephony/uicc/IccCardProxy;->registerUiccCardEvents()V

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mIccRecords:Lcom/android/internal/telephony/uicc/IccRecords;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mIccRecords:Lcom/android/internal/telephony/uicc/IccRecords;

    const/16 v1, 0x1f4

    const/4 v2, 0x0

    invoke-virtual {v0, p0, v1, v2}, Lcom/android/internal/telephony/uicc/IccRecords;->registerForRecordsEvents(Landroid/os/Handler;ILjava/lang/Object;)V

    :cond_0
    return-void
.end method

.method resetProperties()V
    .locals 3

    .prologue
    iget v0, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCurrentAppType:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const-string v0, "gsm.apn.sim.operator.numeric"

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCardIndex:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const-string v2, ""

    invoke-static {v0, v1, v2}, Landroid/telephony/MSimTelephonyManager;->setTelephonyProperty(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "gsm.sim.operator.numeric"

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCardIndex:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const-string v2, ""

    invoke-static {v0, v1, v2}, Landroid/telephony/MSimTelephonyManager;->setTelephonyProperty(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "gsm.sim.operator.iso-country"

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCardIndex:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const-string v2, ""

    invoke-static {v0, v1, v2}, Landroid/telephony/MSimTelephonyManager;->setTelephonyProperty(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "gsm.sim.operator.alpha"

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCardIndex:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const-string v2, ""

    invoke-static {v0, v1, v2}, Landroid/telephony/MSimTelephonyManager;->setTelephonyProperty(Ljava/lang/String;ILjava/lang/String;)V

    :cond_0
    return-void
.end method

.method protected setExternalState(Lcom/android/internal/telephony/IccCard$State;Z)V
    .locals 4
    .parameter "newState"
    .parameter "override"

    .prologue
    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCardIndex:Ljava/lang/Integer;

    if-nez v1, :cond_1

    const-string v1, "setExternalState: Card Index is not set; Return!!"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->loge(Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    if-nez p2, :cond_2

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mExternalState:Lcom/android/internal/telephony/IccCard$State;

    if-eq p1, v1, :cond_0

    :cond_2
    iput-object p1, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mExternalState:Lcom/android/internal/telephony/IccCard$State;

    const-string v1, "gsm.sim.state"

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCardIndex:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->getState()Lcom/android/internal/telephony/IccCard$State;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/IccCard$State;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Landroid/telephony/MSimTelephonyManager;->setTelephonyProperty(Ljava/lang/String;ILjava/lang/String;)V

    const/4 v0, 0x0

    .local v0, notBroadcast:Z
    sget-object v1, Lcom/android/internal/telephony/IccCard$State;->DEACTIVED:Lcom/android/internal/telephony/IccCard$State;

    if-ne v1, p1, :cond_3

    const/4 v1, 0x1

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getInstance()Lcom/android/internal/telephony/msim/SubscriptionManager;

    move-result-object v2

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCardIndex:Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getUserPrefSubStatus(I)Z

    move-result v2

    if-ne v1, v2, :cond_3

    const/4 v0, 0x1

    :cond_3
    if-nez v0, :cond_0

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mExternalState:Lcom/android/internal/telephony/IccCard$State;

    invoke-virtual {v1}, Lcom/android/internal/telephony/IccCard$State;->getIntentString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mExternalState:Lcom/android/internal/telephony/IccCard$State;

    invoke-virtual {v2}, Lcom/android/internal/telephony/IccCard$State;->getReason()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->broadcastIccStateChangedIntent(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/android/internal/telephony/IccCard$State;->ABSENT:Lcom/android/internal/telephony/IccCard$State;

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mExternalState:Lcom/android/internal/telephony/IccCard$State;

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mAbsentRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v1}, Landroid/os/RegistrantList;->notifyRegistrants()V

    goto :goto_0
.end method

.method protected unregisterUiccCardEvents()V
    .locals 1

    .prologue
    invoke-super {p0}, Lcom/android/internal/telephony/uicc/IccCardProxy;->unregisterUiccCardEvents()V

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mIccRecords:Lcom/android/internal/telephony/uicc/IccRecords;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mIccRecords:Lcom/android/internal/telephony/uicc/IccRecords;

    invoke-virtual {v0, p0}, Lcom/android/internal/telephony/uicc/IccRecords;->unregisterForRecordsEvents(Landroid/os/Handler;)V

    :cond_0
    return-void
.end method

.method protected updateIccAvailability()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mUiccController:Lcom/android/internal/telephony/uicc/UiccController;

    iget-object v5, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCardIndex:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/android/internal/telephony/uicc/UiccController;->getUiccCard(I)Lcom/android/internal/telephony/uicc/UiccCard;

    move-result-object v1

    .local v1, newCard:Lcom/android/internal/telephony/uicc/UiccCard;
    sget-object v3, Lcom/android/internal/telephony/uicc/IccCardStatus$CardState;->CARDSTATE_ABSENT:Lcom/android/internal/telephony/uicc/IccCardStatus$CardState;

    .local v3, state:Lcom/android/internal/telephony/uicc/IccCardStatus$CardState;
    const/4 v0, 0x0

    .local v0, newApp:Lcom/android/internal/telephony/uicc/UiccCardApplication;
    const/4 v2, 0x0

    .local v2, newRecords:Lcom/android/internal/telephony/uicc/IccRecords;
    if-eqz v1, :cond_4

    invoke-virtual {v1}, Lcom/android/internal/telephony/uicc/UiccCard;->getCardState()Lcom/android/internal/telephony/uicc/IccCardStatus$CardState;

    move-result-object v3

    const-string v4, "RIL_MSimIccCardProxy"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Card State = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean v4, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->IS_CHINA_TELECOM:Z

    if-ne v7, v4, :cond_0

    const/4 v4, 0x2

    iget v5, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCurrentAppType:I

    if-ne v4, v5, :cond_0

    invoke-virtual {v1}, Lcom/android/internal/telephony/uicc/UiccCard;->getCdmaSubscriptionAppIndex()I

    move-result v4

    if-gez v4, :cond_0

    invoke-virtual {v1}, Lcom/android/internal/telephony/uicc/UiccCard;->getGsmUmtsSubscriptionAppIndex()I

    move-result v4

    if-ltz v4, :cond_0

    iput v7, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCurrentAppType:I

    :cond_0
    iget v4, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mCurrentAppType:I

    invoke-virtual {v1, v4}, Lcom/android/internal/telephony/uicc/UiccCard;->getApplication(I)Lcom/android/internal/telephony/uicc/UiccCardApplication;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/android/internal/telephony/uicc/UiccCardApplication;->getIccRecords()Lcom/android/internal/telephony/uicc/IccRecords;

    move-result-object v2

    :cond_1
    :goto_0
    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mIccRecords:Lcom/android/internal/telephony/uicc/IccRecords;

    if-ne v4, v2, :cond_2

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mUiccApplication:Lcom/android/internal/telephony/uicc/UiccCardApplication;

    if-ne v4, v0, :cond_2

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mUiccCard:Lcom/android/internal/telephony/uicc/UiccCard;

    if-eq v4, v1, :cond_3

    :cond_2
    const-string v4, "Icc changed. Reregestering."

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->log(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->unregisterUiccCardEvents()V

    iput-object v1, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mUiccCard:Lcom/android/internal/telephony/uicc/UiccCard;

    iput-object v0, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mUiccApplication:Lcom/android/internal/telephony/uicc/UiccCardApplication;

    iput-object v2, p0, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->mIccRecords:Lcom/android/internal/telephony/uicc/IccRecords;

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->registerUiccCardEvents()V

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->updateActiveRecord()V

    :cond_3
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->updateExternalState()V

    return-void

    :cond_4
    const-string v4, "No card available"

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/msim/MSimIccCardProxy;->log(Ljava/lang/String;)V

    goto :goto_0
.end method
