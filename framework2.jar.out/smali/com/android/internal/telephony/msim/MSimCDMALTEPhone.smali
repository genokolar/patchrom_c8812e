.class public Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;
.super Lcom/android/internal/telephony/cdma/CDMALTEPhone;
.source "MSimCDMALTEPhone.java"


# static fields
.field static final LOG_TAG:Ljava/lang/String; = "CDMA"


# instance fields
.field private mSubscription:I

.field private mSubscriptionData:Lcom/android/internal/telephony/msim/Subscription;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/internal/telephony/CommandsInterface;Lcom/android/internal/telephony/PhoneNotifier;I)V
    .locals 6
    .parameter "context"
    .parameter "ci"
    .parameter "notifier"
    .parameter "subscription"

    .prologue
    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;-><init>(Landroid/content/Context;Lcom/android/internal/telephony/CommandsInterface;Lcom/android/internal/telephony/PhoneNotifier;ZI)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/internal/telephony/CommandsInterface;Lcom/android/internal/telephony/PhoneNotifier;ZI)V
    .locals 5
    .parameter "context"
    .parameter "ci"
    .parameter "notifier"
    .parameter "unitTestMode"
    .parameter "subscription"

    .prologue
    const/4 v4, 0x0

    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/telephony/cdma/CDMALTEPhone;-><init>(Landroid/content/Context;Lcom/android/internal/telephony/CommandsInterface;Lcom/android/internal/telephony/PhoneNotifier;)V

    const/4 v1, 0x0

    iput v1, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mSubscription:I

    iput p5, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mSubscription:I

    const-string v1, "CDMA"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "MSimCDMALTEPhone: constructor: sub = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mSubscription:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v1, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;

    invoke-direct {v1, p0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;-><init>(Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;)V

    iput-object v1, p0, Lcom/android/internal/telephony/PhoneBase;->mDataConnectionTracker:Lcom/android/internal/telephony/DataConnectionTracker;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mVmNumCdmaKey:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mSubscription:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mVmNumCdmaKey:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mVmCountKey:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mSubscription:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mVmCountKey:Ljava/lang/String;

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getInstance()Lcom/android/internal/telephony/msim/SubscriptionManager;

    move-result-object v0

    .local v0, subMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;
    iget v1, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mSubscription:I

    const/16 v2, 0x1f4

    invoke-virtual {v0, v1, p0, v2, v4}, Lcom/android/internal/telephony/msim/SubscriptionManager;->registerForSubscriptionActivated(ILandroid/os/Handler;ILjava/lang/Object;)V

    iget v1, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mSubscription:I

    const/16 v2, 0x1f5

    invoke-virtual {v0, v1, p0, v2, v4}, Lcom/android/internal/telephony/msim/SubscriptionManager;->registerForSubscriptionDeactivated(ILandroid/os/Handler;ILjava/lang/Object;)V

    iget v1, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mSubscription:I

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isSubActive(I)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-direct {p0}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->onSubscriptionActivated()V

    :cond_0
    return-void
.end method

.method private onSubscriptionActivated()V
    .locals 4

    .prologue
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getInstance()Lcom/android/internal/telephony/msim/SubscriptionManager;

    move-result-object v0

    .local v0, subMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;
    iget v1, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mSubscription:I

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscription(I)Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v1

    iput-object v1, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mSubscriptionData:Lcom/android/internal/telephony/msim/Subscription;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SUBSCRIPTION ACTIVATED : slotId : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mSubscriptionData:Lcom/android/internal/telephony/msim/Subscription;

    iget v2, v2, Lcom/android/internal/telephony/msim/Subscription;->slotId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " appid : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mSubscriptionData:Lcom/android/internal/telephony/msim/Subscription;

    iget v2, v2, Lcom/android/internal/telephony/msim/Subscription;->m3gpp2Index:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " subId : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mSubscriptionData:Lcom/android/internal/telephony/msim/Subscription;

    iget v2, v2, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " subStatus : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mSubscriptionData:Lcom/android/internal/telephony/msim/Subscription;

    iget-object v2, v2, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->log(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->setProperties()V

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->onUpdateIccAvailability()V

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mSST:Lcom/android/internal/telephony/cdma/CdmaServiceStateTracker;

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mSST:Lcom/android/internal/telephony/cdma/CdmaServiceStateTracker;

    const/16 v3, 0x2a

    invoke-virtual {v2, v3}, Lcom/android/internal/telephony/cdma/CdmaServiceStateTracker;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/internal/telephony/cdma/CdmaServiceStateTracker;->sendMessage(Landroid/os/Message;)Z

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mSST:Lcom/android/internal/telephony/cdma/CdmaServiceStateTracker;

    check-cast v1, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;

    invoke-virtual {v1}, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;->updateCdmaSubscription()V

    iget-object v1, p0, Lcom/android/internal/telephony/PhoneBase;->mDataConnectionTracker:Lcom/android/internal/telephony/DataConnectionTracker;

    check-cast v1, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;

    invoke-virtual {v1}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->updateRecords()V

    iget-object v1, p0, Lcom/android/internal/telephony/PhoneBase;->mCM:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v2, 0x15

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/android/internal/telephony/CommandsInterface;->getDeviceIdentity(Landroid/os/Message;)V

    iget-object v1, p0, Lcom/android/internal/telephony/PhoneBase;->mCM:Lcom/android/internal/telephony/CommandsInterface;

    const/4 v2, 0x6

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/android/internal/telephony/CommandsInterface;->getBasebandVersion(Landroid/os/Message;)V

    return-void
.end method

.method private onSubscriptionDeactivated()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const-string v0, "SUBSCRIPTION DEACTIVATED"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->log(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mImei:Ljava/lang/String;

    iput-object v1, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mImeiSv:Ljava/lang/String;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->setVoiceMessageCount(I)V

    iput-object v1, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mSubscriptionData:Lcom/android/internal/telephony/msim/Subscription;

    return-void
.end method

.method private setProperties()V
    .locals 6

    .prologue
    const-string v2, "gsm.current.phone-type"

    iget v3, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mSubscription:I

    new-instance v4, Ljava/lang/Integer;

    const/4 v5, 0x2

    invoke-direct {v4, v5}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v4}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Landroid/telephony/MSimTelephonyManager;->setTelephonyProperty(Ljava/lang/String;ILjava/lang/String;)V

    const-string v2, "ro.cdma.home.operator.alpha"

    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .local v0, operatorAlpha:Ljava/lang/String;
    const-string v2, "gsm.sim.operator.alpha"

    invoke-virtual {p0, v2, v0}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->setSystemProperty(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->PROPERTY_CDMA_HOME_OPERATOR_NUMERIC:Ljava/lang/String;

    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .local v1, operatorNumeric:Ljava/lang/String;
    const-string v2, "gsm.sim.operator.numeric"

    invoke-virtual {p0, v2, v1}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->setSystemProperty(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->setIsoCountryProperty(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mContext:Landroid/content/Context;

    invoke-static {v2, v1}, Lcom/android/internal/telephony/MccTable;->updateMccMncConfiguration(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->updateCurrentCarrierInProvider()Z

    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 2

    .prologue
    invoke-super {p0}, Lcom/android/internal/telephony/cdma/CDMALTEPhone;->dispose()V

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getInstance()Lcom/android/internal/telephony/msim/SubscriptionManager;

    move-result-object v0

    .local v0, subMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;
    iget v1, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mSubscription:I

    invoke-virtual {v0, v1, p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->unregisterForSubscriptionActivated(ILandroid/os/Handler;)V

    iget v1, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mSubscription:I

    invoke-virtual {v0, v1, p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->unregisterForSubscriptionDeactivated(ILandroid/os/Handler;)V

    return-void
.end method

.method public getAvailableNetworks(Landroid/os/Message;)V
    .locals 3
    .parameter "response"

    .prologue
    const-string v1, "CDMA"

    const-string v2, "getAvailableNetworks: not possible in CDMA"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p1, :cond_0

    new-instance v0, Lcom/android/internal/telephony/CommandException;

    sget-object v1, Lcom/android/internal/telephony/CommandException$Error;->REQUEST_NOT_SUPPORTED:Lcom/android/internal/telephony/CommandException$Error;

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/CommandException;-><init>(Lcom/android/internal/telephony/CommandException$Error;)V

    .local v0, ce:Lcom/android/internal/telephony/CommandException;
    invoke-static {p1}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;)Landroid/os/AsyncResult;

    move-result-object v1

    iput-object v0, v1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .end local v0           #ce:Lcom/android/internal/telephony/CommandException;
    :cond_0
    return-void
.end method

.method public getDeviceSvn()Ljava/lang/String;
    .locals 2

    .prologue
    const-string v0, "CDMA"

    const-string v1, "getDeviceSvn(): return 0"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "0"

    return-object v0
.end method

.method public getImei()Ljava/lang/String;
    .locals 2

    .prologue
    const-string v0, "CDMA"

    const-string v1, "IMEI is not available in CDMA"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    return-object v0
.end method

.method public getIsimRecords()Lcom/android/internal/telephony/uicc/IsimRecords;
    .locals 2

    .prologue
    const-string v0, "CDMA"

    const-string v1, "getIsimRecords() is only supported on LTE devices"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    return-object v0
.end method

.method public getMsisdn()Ljava/lang/String;
    .locals 2

    .prologue
    const-string v0, "CDMA"

    const-string v1, "Error! getMsisdn() in MSimCDMALTEPhone should not be called, GSMPhone inactive."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    return-object v0
.end method

.method public getOperatorNumeric()Ljava/lang/String;
    .locals 4

    .prologue
    const/4 v0, 0x0

    .local v0, operatorNumeric:Ljava/lang/String;
    const-string v1, "ro.cdma.home.operator.numeric"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "CDMA"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getOperatorNumeric: mCdmaSubscriptionSource = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mCdmaSubscriptionSource:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " operatorNumeric = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0
.end method

.method public getSubscriberId()Ljava/lang/String;
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mSST:Lcom/android/internal/telephony/cdma/CdmaServiceStateTracker;

    invoke-virtual {v0}, Lcom/android/internal/telephony/cdma/CdmaServiceStateTracker;->getImsi()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSubscription()I
    .locals 1

    .prologue
    iget v0, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mSubscription:I

    return v0
.end method

.method public getSubscriptionInfo()Lcom/android/internal/telephony/msim/Subscription;
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mSubscriptionData:Lcom/android/internal/telephony/msim/Subscription;

    return-object v0
.end method

.method public getSystemProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "property"
    .parameter "defValue"

    .prologue
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->getUnitTestMode()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget v0, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mSubscription:I

    invoke-static {p1, v0, p2}, Landroid/telephony/MSimTelephonyManager;->getTelephonyProperty(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method protected getUiccCardApplication()Lcom/android/internal/telephony/uicc/UiccCardApplication;
    .locals 3

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mSubscriptionData:Lcom/android/internal/telephony/msim/Subscription;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mUiccController:Lcom/android/internal/telephony/uicc/UiccController;

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mSubscriptionData:Lcom/android/internal/telephony/msim/Subscription;

    iget v1, v1, Lcom/android/internal/telephony/msim/Subscription;->slotId:I

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/telephony/uicc/UiccController;->getUiccCardApplication(II)Lcom/android/internal/telephony/uicc/UiccCardApplication;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .parameter "msg"

    .prologue
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    invoke-super {p0, p1}, Lcom/android/internal/telephony/cdma/CDMALTEPhone;->handleMessage(Landroid/os/Message;)V

    :goto_0
    return-void

    :pswitch_0
    const-string v0, "EVENT_SUBSCRIPTION_ACTIVATED"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->log(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->onSubscriptionActivated()V

    goto :goto_0

    :pswitch_1
    const-string v0, "EVENT_SUBSCRIPTION_DEACTIVATED"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->log(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->onSubscriptionDeactivated()V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1f4
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected init(Landroid/content/Context;Lcom/android/internal/telephony/PhoneNotifier;)V
    .locals 8
    .parameter "context"
    .parameter "notifier"

    .prologue
    const/16 v7, 0x1a

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    iget-object v2, p0, Lcom/android/internal/telephony/PhoneBase;->mCM:Lcom/android/internal/telephony/CommandsInterface;

    invoke-interface {v2, v6}, Lcom/android/internal/telephony/CommandsInterface;->setPhoneType(I)V

    new-instance v2, Lcom/android/internal/telephony/cdma/CdmaCallTracker;

    invoke-direct {v2, p0}, Lcom/android/internal/telephony/cdma/CdmaCallTracker;-><init>(Lcom/android/internal/telephony/cdma/CDMAPhone;)V

    iput-object v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mCT:Lcom/android/internal/telephony/cdma/CdmaCallTracker;

    iget-object v2, p0, Lcom/android/internal/telephony/PhoneBase;->mCM:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v3, 0x1b

    invoke-static {p1, v2, p0, v3, v4}, Lcom/android/internal/telephony/cdma/CdmaSubscriptionSourceManager;->getInstance(Landroid/content/Context;Lcom/android/internal/telephony/CommandsInterface;Landroid/os/Handler;ILjava/lang/Object;)Lcom/android/internal/telephony/cdma/CdmaSubscriptionSourceManager;

    move-result-object v2

    iput-object v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mCdmaSSM:Lcom/android/internal/telephony/cdma/CdmaSubscriptionSourceManager;

    new-instance v2, Lcom/android/internal/telephony/cdma/RuimPhoneBookInterfaceManager;

    invoke-direct {v2, p0}, Lcom/android/internal/telephony/cdma/RuimPhoneBookInterfaceManager;-><init>(Lcom/android/internal/telephony/cdma/CDMAPhone;)V

    iput-object v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mRuimPhoneBookInterfaceManager:Lcom/android/internal/telephony/cdma/RuimPhoneBookInterfaceManager;

    new-instance v2, Lcom/android/internal/telephony/PhoneSubInfo;

    invoke-direct {v2, p0}, Lcom/android/internal/telephony/PhoneSubInfo;-><init>(Lcom/android/internal/telephony/Phone;)V

    iput-object v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mSubInfo:Lcom/android/internal/telephony/PhoneSubInfo;

    new-instance v2, Lcom/android/internal/telephony/cdma/EriManager;

    const/4 v3, 0x0

    invoke-direct {v2, p0, p1, v3}, Lcom/android/internal/telephony/cdma/EriManager;-><init>(Lcom/android/internal/telephony/PhoneBase;Landroid/content/Context;I)V

    iput-object v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mEriManager:Lcom/android/internal/telephony/cdma/EriManager;

    iget-object v2, p0, Lcom/android/internal/telephony/PhoneBase;->mCM:Lcom/android/internal/telephony/CommandsInterface;

    invoke-interface {v2, p0, v5, v4}, Lcom/android/internal/telephony/CommandsInterface;->registerForAvailable(Landroid/os/Handler;ILjava/lang/Object;)V

    iget-object v2, p0, Lcom/android/internal/telephony/PhoneBase;->mCM:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v3, 0x8

    invoke-interface {v2, p0, v3, v4}, Lcom/android/internal/telephony/CommandsInterface;->registerForOffOrNotAvailable(Landroid/os/Handler;ILjava/lang/Object;)V

    iget-object v2, p0, Lcom/android/internal/telephony/PhoneBase;->mCM:Lcom/android/internal/telephony/CommandsInterface;

    const/4 v3, 0x5

    invoke-interface {v2, p0, v3, v4}, Lcom/android/internal/telephony/CommandsInterface;->registerForOn(Landroid/os/Handler;ILjava/lang/Object;)V

    iget-object v2, p0, Lcom/android/internal/telephony/PhoneBase;->mCM:Lcom/android/internal/telephony/CommandsInterface;

    invoke-interface {v2, p0, v6, v4}, Lcom/android/internal/telephony/CommandsInterface;->setOnSuppServiceNotification(Landroid/os/Handler;ILjava/lang/Object;)V

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mSST:Lcom/android/internal/telephony/cdma/CdmaServiceStateTracker;

    const/16 v3, 0x13

    invoke-virtual {v2, p0, v3, v4}, Lcom/android/internal/telephony/cdma/CdmaServiceStateTracker;->registerForNetworkAttached(Landroid/os/Handler;ILjava/lang/Object;)V

    iget-object v2, p0, Lcom/android/internal/telephony/PhoneBase;->mCM:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v3, 0x19

    invoke-interface {v2, p0, v3, v4}, Lcom/android/internal/telephony/CommandsInterface;->setEmergencyCallbackMode(Landroid/os/Handler;ILjava/lang/Object;)V

    iget-object v2, p0, Lcom/android/internal/telephony/PhoneBase;->mCM:Lcom/android/internal/telephony/CommandsInterface;

    invoke-interface {v2, p0, v7, v4}, Lcom/android/internal/telephony/CommandsInterface;->registerForExitEmergencyCallbackMode(Landroid/os/Handler;ILjava/lang/Object;)V

    const-string v2, "power"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/PowerManager;

    .local v1, pm:Landroid/os/PowerManager;
    const-string v2, "CDMA"

    invoke-virtual {v1, v5, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v2

    iput-object v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    const-string v2, "ril.cdma.inecmmode"

    const-string v3, "false"

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .local v0, inEcm:Ljava/lang/String;
    const-string v2, "true"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    iput-boolean v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mIsPhoneInEcmState:Z

    iget-boolean v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mIsPhoneInEcmState:Z

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/android/internal/telephony/PhoneBase;->mCM:Lcom/android/internal/telephony/CommandsInterface;

    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->obtainMessage(I)Landroid/os/Message;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/android/internal/telephony/CommandsInterface;->exitEmergencyCallbackMode(Landroid/os/Message;)V

    :cond_0
    const-string v2, "ro.cdma.otaspnumschema"

    const-string v3, ""

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mCarrierOtaSpNumSchema:Ljava/lang/String;

    invoke-interface {p2, p0}, Lcom/android/internal/telephony/PhoneNotifier;->notifyMessageWaitingChanged(Lcom/android/internal/telephony/Phone;)V

    invoke-direct {p0}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->setProperties()V

    return-void
.end method

.method protected initSstIcc()V
    .locals 1

    .prologue
    new-instance v0, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;

    invoke-direct {v0, p0}, Lcom/android/internal/telephony/msim/MSimCdmaLteServiceStateTracker;-><init>(Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;)V

    iput-object v0, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mSST:Lcom/android/internal/telephony/cdma/CdmaServiceStateTracker;

    return-void
.end method

.method protected log(Ljava/lang/String;)V
    .locals 3
    .parameter "s"

    .prologue
    const-string v0, "CDMA"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[MSimCDMALTEPhone] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method protected onUpdateIccAvailability()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mUiccController:Lcom/android/internal/telephony/uicc/UiccController;

    if-nez v2, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->getUiccCardApplication()Lcom/android/internal/telephony/uicc/UiccCardApplication;

    move-result-object v1

    .local v1, newUiccApplication:Lcom/android/internal/telephony/uicc/UiccCardApplication;
    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mUiccApplication:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/uicc/UiccCardApplication;

    .local v0, app:Lcom/android/internal/telephony/uicc/UiccCardApplication;
    if-eq v0, v1, :cond_0

    if-eqz v0, :cond_3

    const-string v2, "Removing stale icc objects."

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->log(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mIccRecords:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->unregisterForRuimRecordEvents()V

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mRuimPhoneBookInterfaceManager:Lcom/android/internal/telephony/cdma/RuimPhoneBookInterfaceManager;

    invoke-virtual {v2, v3}, Lcom/android/internal/telephony/cdma/RuimPhoneBookInterfaceManager;->updateIccRecords(Lcom/android/internal/telephony/uicc/IccRecords;)V

    :cond_2
    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mIccRecords:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mUiccApplication:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    iput-object v3, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mRuimCard:Lcom/android/internal/telephony/uicc/UiccCard;

    :cond_3
    if-eqz v1, :cond_0

    const-string v2, "New Uicc application found"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->log(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mUiccApplication:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mUiccApplication:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/internal/telephony/uicc/UiccCardApplication;

    invoke-virtual {v2}, Lcom/android/internal/telephony/uicc/UiccCardApplication;->getCard()Lcom/android/internal/telephony/uicc/UiccCard;

    move-result-object v2

    iput-object v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mRuimCard:Lcom/android/internal/telephony/uicc/UiccCard;

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mIccRecords:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Lcom/android/internal/telephony/uicc/UiccCardApplication;->getIccRecords()Lcom/android/internal/telephony/uicc/IccRecords;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->registerForRuimRecordEvents()V

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mRuimPhoneBookInterfaceManager:Lcom/android/internal/telephony/cdma/RuimPhoneBookInterfaceManager;

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mIccRecords:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/internal/telephony/uicc/IccRecords;

    invoke-virtual {v3, v2}, Lcom/android/internal/telephony/cdma/RuimPhoneBookInterfaceManager;->updateIccRecords(Lcom/android/internal/telephony/uicc/IccRecords;)V

    goto :goto_0
.end method

.method public registerForAllDataDisconnected(Landroid/os/Handler;ILjava/lang/Object;)V
    .locals 1
    .parameter "h"
    .parameter "what"
    .parameter "obj"

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/PhoneBase;->mDataConnectionTracker:Lcom/android/internal/telephony/DataConnectionTracker;

    check-cast v0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->registerForAllDataDisconnected(Landroid/os/Handler;ILjava/lang/Object;)V

    return-void
.end method

.method public requestIsimAuthentication(Ljava/lang/String;Landroid/os/Message;)V
    .locals 2
    .parameter "nonce"
    .parameter "result"

    .prologue
    const-string v0, "CDMA"

    const-string v1, "requestIsimAuthentication() is only supported on LTE devices"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public selectNetworkManually(Lcom/android/internal/telephony/OperatorInfo;Landroid/os/Message;)V
    .locals 3
    .parameter "network"
    .parameter "response"

    .prologue
    const-string v1, "CDMA"

    const-string v2, "selectNetworkManually: not possible in CDMA"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p2, :cond_0

    new-instance v0, Lcom/android/internal/telephony/CommandException;

    sget-object v1, Lcom/android/internal/telephony/CommandException$Error;->REQUEST_NOT_SUPPORTED:Lcom/android/internal/telephony/CommandException$Error;

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/CommandException;-><init>(Lcom/android/internal/telephony/CommandException$Error;)V

    .local v0, ce:Lcom/android/internal/telephony/CommandException;
    invoke-static {p2}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;)Landroid/os/AsyncResult;

    move-result-object v1

    iput-object v0, v1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {p2}, Landroid/os/Message;->sendToTarget()V

    .end local v0           #ce:Lcom/android/internal/telephony/CommandException;
    :cond_0
    return-void
.end method

.method protected sendEmergencyCallbackModeChange()V
    .locals 3

    .prologue
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.EMERGENCY_CALLBACK_MODE_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .local v0, intent:Landroid/content/Intent;
    const-string v1, "phoneinECMState"

    iget-boolean v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mIsPhoneInEcmState:Z

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v1, "subscription"

    iget v2, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mSubscription:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/app/ActivityManagerNative;->broadcastStickyIntent(Landroid/content/Intent;Ljava/lang/String;)V

    const-string v1, "sendEmergencyCallbackModeChange"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->log(Ljava/lang/String;)V

    return-void
.end method

.method public setInternalDataEnabled(ZLandroid/os/Message;)V
    .locals 1
    .parameter "enable"
    .parameter "onCompleteMsg"

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/PhoneBase;->mDataConnectionTracker:Lcom/android/internal/telephony/DataConnectionTracker;

    check-cast v0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;

    invoke-virtual {v0, p1, p2}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->setInternalDataEnabled(ZLandroid/os/Message;)Z

    return-void
.end method

.method public setInternalDataEnabledFlag(Z)Z
    .locals 1
    .parameter "enable"

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/PhoneBase;->mDataConnectionTracker:Lcom/android/internal/telephony/DataConnectionTracker;

    check-cast v0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;

    invoke-virtual {v0, p1}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->setInternalDataEnabledFlag(Z)Z

    move-result v0

    return v0
.end method

.method public setSystemProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "property"
    .parameter "value"

    .prologue
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->getUnitTestMode()Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget v0, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mSubscription:I

    invoke-static {p1, v0, p2}, Landroid/telephony/MSimTelephonyManager;->setTelephonyProperty(Ljava/lang/String;ILjava/lang/String;)V

    goto :goto_0
.end method

.method public unregisterForAllDataDisconnected(Landroid/os/Handler;)V
    .locals 1
    .parameter "h"

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/PhoneBase;->mDataConnectionTracker:Lcom/android/internal/telephony/DataConnectionTracker;

    check-cast v0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;

    invoke-virtual {v0, p1}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->unregisterForAllDataDisconnected(Landroid/os/Handler;)V

    return-void
.end method

.method public updateCurrentCarrierInProvider()Z
    .locals 8

    .prologue
    invoke-static {}, Lcom/android/internal/telephony/msim/MSimPhoneFactory;->getDataSubscription()I

    move-result v0

    .local v0, currentDds:I
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->getOperatorNumeric()Ljava/lang/String;

    move-result-object v3

    .local v3, operatorNumeric:Ljava/lang/String;
    const-string v5, "CDMA"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "updateCurrentCarrierInProvider: mSubscription = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->getSubscription()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " currentDds = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " operatorNumeric = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->getSubscription()I

    move-result v5

    if-ne v5, v0, :cond_0

    :try_start_0
    sget-object v5, Landroid/provider/Telephony$Carriers;->CONTENT_URI:Landroid/net/Uri;

    const-string v6, "current"

    invoke-static {v5, v6}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    .local v4, uri:Landroid/net/Uri;
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .local v2, map:Landroid/content/ContentValues;
    const-string v5, "numeric"

    invoke-virtual {v2, v5, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v5, p0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    invoke-virtual {v5, v4, v2}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v5, 0x1

    .end local v2           #map:Landroid/content/ContentValues;
    .end local v4           #uri:Landroid/net/Uri;
    :goto_0
    return v5

    :catch_0
    move-exception v1

    .local v1, e:Landroid/database/SQLException;
    const-string v5, "CDMA"

    const-string v6, "Can\'t store current operator"

    invoke-static {v5, v6, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .end local v1           #e:Landroid/database/SQLException;
    :cond_0
    const/4 v5, 0x0

    goto :goto_0
.end method

.method public updateDataConnectionTracker()V
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/PhoneBase;->mDataConnectionTracker:Lcom/android/internal/telephony/DataConnectionTracker;

    check-cast v0, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;

    invoke-virtual {v0}, Lcom/android/internal/telephony/msim/MSimCdmaDataConnectionTracker;->update()V

    return-void
.end method
