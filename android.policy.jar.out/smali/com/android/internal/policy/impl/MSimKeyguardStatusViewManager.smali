.class Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;
.super Lcom/android/internal/policy/impl/KeyguardStatusViewManager;
.source "MSimKeyguardStatusViewManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$3;,
        Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "MSimKeyguardStatusView"


# instance fields
.field private mCarrierTextSub:[Ljava/lang/CharSequence;

.field private mIccText:Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;

.field protected mMSimInfoCallback:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$InfoCallbackImpl;

.field private mMSimPlmn:[Ljava/lang/CharSequence;

.field private mMSimSpn:[Ljava/lang/CharSequence;

.field private mMSimState:[Lcom/android/internal/telephony/IccCard$State;

.field private mMSimStatus:[Lcom/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode;

.field private mNumPhones:I

.field private mSimStateCallback:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimStateCallback;

.field private mSimText:Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;

.field private mUimText:Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;


# direct methods
.method public constructor <init>(Landroid/view/View;Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;Lcom/android/internal/widget/LockPatternUtils;Lcom/android/internal/policy/impl/KeyguardScreenCallback;Z)V
    .locals 6
    .parameter "view"
    .parameter "updateMonitor"
    .parameter "lockPatternUtils"
    .parameter "callback"
    .parameter "emergencyButtonEnabledInScreen"

    .prologue
    const/4 v5, 0x0

    invoke-direct/range {p0 .. p5}, Lcom/android/internal/policy/impl/KeyguardStatusViewManager;-><init>(Landroid/view/View;Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;Lcom/android/internal/widget/LockPatternUtils;Lcom/android/internal/policy/impl/KeyguardScreenCallback;Z)V

    const/4 v2, 0x1

    new-array v2, v2, [Lcom/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode;

    const/4 v3, 0x0

    sget-object v4, Lcom/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode;->Normal:Lcom/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode;

    aput-object v4, v2, v3

    iput-object v2, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimStatus:[Lcom/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode;

    iput-object v5, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mSimText:Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;

    iput-object v5, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mUimText:Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;

    iput-object v5, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mIccText:Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;

    new-instance v2, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$1;

    invoke-direct {v2, p0}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$1;-><init>(Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;)V

    iput-object v2, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimInfoCallback:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$InfoCallbackImpl;

    new-instance v2, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$2;

    invoke-direct {v2, p0}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$2;-><init>(Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;)V

    iput-object v2, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mSimStateCallback:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimStateCallback;

    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/telephony/MSimTelephonyManager;->getPhoneCount()I

    move-result v2

    iput v2, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mNumPhones:I

    iget v2, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mNumPhones:I

    new-array v2, v2, [Ljava/lang/CharSequence;

    iput-object v2, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mCarrierTextSub:[Ljava/lang/CharSequence;

    iget v2, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mNumPhones:I

    new-array v2, v2, [Ljava/lang/CharSequence;

    iput-object v2, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimPlmn:[Ljava/lang/CharSequence;

    iget v2, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mNumPhones:I

    new-array v2, v2, [Ljava/lang/CharSequence;

    iput-object v2, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimSpn:[Ljava/lang/CharSequence;

    iget v2, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mNumPhones:I

    new-array v2, v2, [Lcom/android/internal/telephony/IccCard$State;

    iput-object v2, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimState:[Lcom/android/internal/telephony/IccCard$State;

    iget v2, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mNumPhones:I

    new-array v2, v2, [Lcom/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode;

    iput-object v2, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimStatus:[Lcom/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode;

    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget v2, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mNumPhones:I

    if-ge v1, v2, :cond_0

    iget-object v2, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimStatus:[Lcom/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode;

    sget-object v3, Lcom/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode;->Normal:Lcom/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode;

    aput-object v3, v2, v1

    iget-object v2, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mCarrierTextSub:[Ljava/lang/CharSequence;

    aput-object v5, v2, v1

    iget-object v2, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimPlmn:[Ljava/lang/CharSequence;

    aput-object v5, v2, v1

    iget-object v2, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimSpn:[Ljava/lang/CharSequence;

    aput-object v5, v2, v1

    iget-object v2, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimState:[Lcom/android/internal/telephony/IccCard$State;

    sget-object v3, Lcom/android/internal/telephony/IccCard$State;->READY:Lcom/android/internal/telephony/IccCard$State;

    aput-object v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/android/internal/policy/impl/KeyguardStatusViewManager;->mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

    iget-object v3, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimInfoCallback:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$InfoCallbackImpl;

    invoke-virtual {v2, v3}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->registerInfoCallback(Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$InfoCallback;)V

    iget-object v2, p0, Lcom/android/internal/policy/impl/KeyguardStatusViewManager;->mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

    iget-object v3, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mSimStateCallback:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimStateCallback;

    invoke-virtual {v2, v3}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->registerSimStateCallback(Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimStateCallback;)V

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->resetStatusInfo()V

    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/telephony/MSimTelephonyManager;->getDefaultSubscription()I

    move-result v0

    .local v0, defaultSubscription:I
    iget-object v2, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimStatus:[Lcom/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode;

    aget-object v2, v2, v0

    iput-object v2, p0, Lcom/android/internal/policy/impl/KeyguardStatusViewManager;->mStatus:Lcom/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode;

    iget-object v2, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimPlmn:[Ljava/lang/CharSequence;

    aget-object v2, v2, v0

    iput-object v2, p0, Lcom/android/internal/policy/impl/KeyguardStatusViewManager;->mPlmn:Ljava/lang/CharSequence;

    iget-object v2, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimSpn:[Ljava/lang/CharSequence;

    aget-object v2, v2, v0

    iput-object v2, p0, Lcom/android/internal/policy/impl/KeyguardStatusViewManager;->mSpn:Ljava/lang/CharSequence;

    iget-object v2, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimState:[Lcom/android/internal/telephony/IccCard$State;

    aget-object v2, v2, v0

    iput-object v2, p0, Lcom/android/internal/policy/impl/KeyguardStatusViewManager;->mSimState:Lcom/android/internal/telephony/IccCard$State;

    return-void
.end method

.method static synthetic access$000(Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;)[Ljava/lang/CharSequence;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimPlmn:[Ljava/lang/CharSequence;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;)[Ljava/lang/CharSequence;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimSpn:[Ljava/lang/CharSequence;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;)[Lcom/android/internal/telephony/IccCard$State;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimState:[Lcom/android/internal/telephony/IccCard$State;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;Lcom/android/internal/telephony/IccCard$State;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->updateCarrierStateWithSimStatus(Lcom/android/internal/telephony/IccCard$State;I)V

    return-void
.end method

.method private createSimText()Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;
    .locals 2

    .prologue
    new-instance v0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;-><init>(Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$1;)V

    .local v0, simText:Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;
    const v1, 0x1040305

    iput v1, v0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;->iccMissingMessageShort:I

    const v1, 0x1040307

    iput v1, v0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;->iccMissingInstructions:I

    const v1, 0x1040314

    iput v1, v0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;->iccPinLockedMessage:I

    const v1, 0x1040312

    iput v1, v0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;->iccPukLockedMessage:I

    return-object v0
.end method

.method private createUimText()Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;
    .locals 2

    .prologue
    new-instance v0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;-><init>(Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$1;)V

    .local v0, uimText:Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;
    const v1, 0x2020006

    iput v1, v0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;->iccMissingMessageShort:I

    const v1, 0x2020007

    iput v1, v0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;->iccMissingInstructions:I

    const v1, 0x2020008

    iput v1, v0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;->iccPinLockedMessage:I

    const v1, 0x2020009

    iput v1, v0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;->iccPukLockedMessage:I

    return-object v0
.end method

.method private getMSimCurrentText(I)Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;
    .locals 5
    .parameter "subscription"

    .prologue
    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v3

    invoke-virtual {v3, p1}, Landroid/telephony/MSimTelephonyManager;->getCurrentPhoneType(I)I

    move-result v0

    .local v0, activePhoneType:I
    const/4 v3, 0x2

    if-ne v3, v0, :cond_2

    const/4 v2, 0x1

    .local v2, isCdma:Z
    :goto_0
    const-string v3, "ro.config.dsds_mode"

    const-string v4, ""

    invoke-static {v3, v4}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .local v1, dsdsModeProp:Ljava/lang/String;
    if-nez v2, :cond_0

    if-nez p1, :cond_3

    const-string v3, "cdma_gsm"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    :cond_0
    iget-object v3, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mUimText:Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;

    if-nez v3, :cond_1

    invoke-direct {p0}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->createUimText()Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;

    move-result-object v3

    iput-object v3, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mUimText:Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;

    :cond_1
    iget-object v3, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mUimText:Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;

    :goto_1
    return-object v3

    .end local v1           #dsdsModeProp:Ljava/lang/String;
    .end local v2           #isCdma:Z
    :cond_2
    const/4 v2, 0x0

    goto :goto_0

    .restart local v1       #dsdsModeProp:Ljava/lang/String;
    .restart local v2       #isCdma:Z
    :cond_3
    iget-object v3, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mSimText:Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;

    if-nez v3, :cond_4

    invoke-direct {p0}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->createSimText()Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;

    move-result-object v3

    iput-object v3, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mSimText:Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;

    :cond_4
    iget-object v3, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mSimText:Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;

    goto :goto_1
.end method

.method private updateCarrierStateWithSimStatus(Lcom/android/internal/telephony/IccCard$State;I)V
    .locals 6
    .parameter "simState"
    .parameter "subscription"

    .prologue
    const/4 v5, 0x1

    const/4 v0, 0x0

    .local v0, carrierHelpTextId:I
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/internal/policy/impl/KeyguardStatusViewManager;->mEmergencyButtonEnabledBecauseSimLocked:Z

    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimStatus:[Lcom/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode;

    invoke-virtual {p0, p1}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->getStatusForIccState(Lcom/android/internal/telephony/IccCard$State;)Lcom/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode;

    move-result-object v2

    aput-object v2, v1, p2

    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimState:[Lcom/android/internal/telephony/IccCard$State;

    aput-object p1, v1, p2

    invoke-direct {p0, p2}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->getMSimCurrentText(I)Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;

    move-result-object v1

    iput-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mIccText:Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;

    sget-object v1, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$3;->$SwitchMap$com$android$internal$policy$impl$KeyguardStatusViewManager$StatusMode:[I

    iget-object v2, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimStatus:[Lcom/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode;

    aget-object v2, v2, p2

    invoke-virtual {v2}, Lcom/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    :cond_0
    :goto_0
    const-string v1, "MSimKeyguardStatusView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updateCarrierStateWithSimStatus(): mCarrierTextSub = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mCarrierTextSub:[Ljava/lang/CharSequence;

    aget-object v3, v3, p2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", subscription = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->setCarrierText()V

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->setCarrierHelpText(I)V

    iget v1, p0, Lcom/android/internal/policy/impl/KeyguardStatusViewManager;->mPhoneState:I

    invoke-virtual {p0, v1}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->updateEmergencyCallButtonState(I)V

    return-void

    :pswitch_0
    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mCarrierTextSub:[Ljava/lang/CharSequence;

    iget-object v2, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimPlmn:[Ljava/lang/CharSequence;

    aget-object v2, v2, p2

    iget-object v3, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimSpn:[Ljava/lang/CharSequence;

    aget-object v3, v3, p2

    invoke-static {v2, v3}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->makeCarierString(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    aput-object v2, v1, p2

    goto :goto_0

    :pswitch_1
    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mCarrierTextSub:[Ljava/lang/CharSequence;

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x1040311

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    iget-object v3, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimPlmn:[Ljava/lang/CharSequence;

    aget-object v3, v3, p2

    invoke-virtual {p0, v2, v3}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->makeCarrierStringOnEmergencyCapable(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    aput-object v2, v1, p2

    const v0, 0x10402f9

    goto :goto_0

    :pswitch_2
    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mCarrierTextSub:[Ljava/lang/CharSequence;

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mIccText:Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;

    iget v3, v3, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;->iccMissingMessageShort:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    iget-object v3, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimPlmn:[Ljava/lang/CharSequence;

    aget-object v3, v3, p2

    invoke-virtual {p0, v2, v3}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->makeCarrierStringOnEmergencyCapable(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    aput-object v2, v1, p2

    const v0, 0x1040308

    goto :goto_0

    :pswitch_3
    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mCarrierTextSub:[Ljava/lang/CharSequence;

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mIccText:Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;

    iget v3, v3, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;->iccMissingMessageShort:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    aput-object v2, v1, p2

    const v0, 0x104030a

    iput-boolean v5, p0, Lcom/android/internal/policy/impl/KeyguardStatusViewManager;->mEmergencyButtonEnabledBecauseSimLocked:Z

    goto/16 :goto_0

    :pswitch_4
    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mCarrierTextSub:[Ljava/lang/CharSequence;

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mIccText:Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;

    iget v3, v3, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;->iccMissingMessageShort:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    iget-object v3, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimPlmn:[Ljava/lang/CharSequence;

    aget-object v3, v3, p2

    invoke-virtual {p0, v2, v3}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->makeCarrierStringOnEmergencyCapable(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    aput-object v2, v1, p2

    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mIccText:Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;

    iget v0, v1, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;->iccMissingInstructions:I

    iput-boolean v5, p0, Lcom/android/internal/policy/impl/KeyguardStatusViewManager;->mEmergencyButtonEnabledBecauseSimLocked:Z

    goto/16 :goto_0

    :pswitch_5
    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mCarrierTextSub:[Ljava/lang/CharSequence;

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mIccText:Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;

    iget v3, v3, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;->iccPinLockedMessage:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    iget-object v3, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimPlmn:[Ljava/lang/CharSequence;

    aget-object v3, v3, p2

    invoke-virtual {p0, v2, v3}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->makeCarrierStringOnEmergencyCapable(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    aput-object v2, v1, p2

    iput-boolean v5, p0, Lcom/android/internal/policy/impl/KeyguardStatusViewManager;->mEmergencyButtonEnabledBecauseSimLocked:Z

    goto/16 :goto_0

    :pswitch_6
    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mCarrierTextSub:[Ljava/lang/CharSequence;

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mIccText:Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;

    iget v3, v3, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;->iccPukLockedMessage:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    iget-object v3, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimPlmn:[Ljava/lang/CharSequence;

    aget-object v3, v3, p2

    invoke-virtual {p0, v2, v3}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->makeCarrierStringOnEmergencyCapable(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    aput-object v2, v1, p2

    iget-object v1, p0, Lcom/android/internal/policy/impl/KeyguardStatusViewManager;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    invoke-virtual {v1}, Lcom/android/internal/widget/LockPatternUtils;->isPukUnlockScreenEnable()Z

    move-result v1

    if-nez v1, :cond_0

    iput-boolean v5, p0, Lcom/android/internal/policy/impl/KeyguardStatusViewManager;->mEmergencyButtonEnabledBecauseSimLocked:Z

    goto/16 :goto_0

    :pswitch_7
    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mCarrierTextSub:[Ljava/lang/CharSequence;

    iget-object v2, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimPlmn:[Ljava/lang/CharSequence;

    aget-object v2, v2, p2

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x1040531

    invoke-virtual {v3, v4}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->makeCarierString(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    aput-object v2, v1, p2

    iput-boolean v5, p0, Lcom/android/internal/policy/impl/KeyguardStatusViewManager;->mEmergencyButtonEnabledBecauseSimLocked:Z

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


# virtual methods
.method public onPause()V
    .locals 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/KeyguardStatusViewManager;->mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimInfoCallback:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$InfoCallbackImpl;

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->removeCallback(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/KeyguardStatusViewManager;->mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mSimStateCallback:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimStateCallback;

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->removeCallback(Ljava/lang/Object;)V

    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/KeyguardStatusViewManager;->mDigitalClock:Lcom/android/internal/widget/DigitalClock;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/policy/impl/KeyguardStatusViewManager;->mDigitalClock:Lcom/android/internal/widget/DigitalClock;

    invoke-virtual {v0}, Lcom/android/internal/widget/DigitalClock;->updateTime()V

    :cond_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/KeyguardStatusViewManager;->mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mMSimInfoCallback:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$InfoCallbackImpl;

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->registerInfoCallback(Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$InfoCallback;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/KeyguardStatusViewManager;->mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mSimStateCallback:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimStateCallback;

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->registerSimStateCallback(Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimStateCallback;)V

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->resetStatusInfo()V

    iget-object v0, p0, Lcom/android/internal/policy/impl/KeyguardStatusViewManager;->mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->getMaxBiometricUnlockAttemptsReached()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x1040300

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->setInstructionText(Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method protected registerInfoCallback()V
    .locals 0

    .prologue
    return-void
.end method

.method setCarrierText()V
    .locals 3

    .prologue
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mCarrierTextSub:[Ljava/lang/CharSequence;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " , "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->mCarrierTextSub:[Ljava/lang/CharSequence;

    const/4 v2, 0x1

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/policy/impl/KeyguardStatusViewManager;->mCarrierText:Ljava/lang/CharSequence;

    const/16 v0, 0xb

    iget-object v1, p0, Lcom/android/internal/policy/impl/KeyguardStatusViewManager;->mCarrierText:Ljava/lang/CharSequence;

    invoke-virtual {p0, v0, v1}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;->update(ILjava/lang/CharSequence;)V

    return-void
.end method
