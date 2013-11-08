.class public Lcom/android/internal/telephony/msim/MSimHWGlobalMode;
.super Ljava/lang/Object;
.source "MSimHWGlobalMode.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;
    }
.end annotation


# static fields
.field private static final ALWAYS_SHOW_ROAMING_MODE_SELECTION:Ljava/lang/String; = "always_show_roaming_mode_selection"

.field private static final DEFAULT:Ljava/lang/String; = "default"

.field private static final DSDS_APP_CDMA:I = 0x0

.field private static final DSDS_APP_GLOBAL:I = 0x2

.field private static final DSDS_APP_GSM:I = 0x1

.field private static final DSDS_APP_INVALID:I = -0x1

.field private static final DSDS_SUB1:I = 0x0

.field private static final DSDS_SUB2:I = 0x1

.field private static final DUALCARD_CLASS_TAB:Ljava/lang/String; = "com.huawei.android.dsdscardmanager.HWCardManagerTabActivity"

.field private static final DUALCARD_PACKAGE:Ljava/lang/String; = "com.huawei.android.dsdscardmanager"

.field private static final EVENT_DELAY_RECEIVE_INTENT:I = 0x8

.field private static final EVENT_GET_PREFERRED_NETWORK_TYPE:I = 0x1

.field private static final EVENT_SET_PREFERRED_NETWORK_TYPE:I = 0x2

.field private static final EVENT_SUBSCRIPTION_ACT_DONE1:I = 0x3

.field private static final EVENT_SUBSCRIPTION_ACT_DONE2:I = 0x7

.field private static final EVENT_SUBSCRIPTION_DEACT_DONE1:I = 0x4

.field private static final EVENT_SUBSCRIPTION_DEACT_DONE2:I = 0x5

.field private static final EVENT_SUBSCRIPTION_SET_DONE:I = 0x6

.field private static final INTERVAL_TO_CLOSE_DSDS:I = 0x3e8

#the value of this static final field might be set in the static constructor
.field private static final IS_CHINA_TELECOM_OPTA_OPTB:Z = false

.field private static final NUM_SUBSCRIPTIONS:I = 0x2

.field public static final TIMETOCLOSECARDMANAGER:Ljava/lang/String; = "TIMETOCLOSECARDMANAGER"

#the value of this static final field might be set in the static constructor
.field private static final TIME_DELAY_TO_REC_INTENT:I = 0x0

#the value of this static final field might be set in the static constructor
.field private static final TIME_TO_CLOSE_DSDS:I = 0x0

.field private static final UNINITIAL:Ljava/lang/String; = "uninitialized"

.field private static mMSimHWGlobalMode:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;


# instance fields
.field private LOG_TAG:Ljava/lang/String;

.field private bActSub1Pending:Z

.field private bDeactSub1Pending:Z

.field private bDeactSub2Pending:Z

.field private bInit:Z

.field private bSupport2ndSelNet:Z

.field private countdown:Landroid/os/CountDownTimer;

.field private mCardChanged:Z

.field private mCardStatus:[Z

.field private mCardSubData:[Lcom/android/internal/telephony/msim/SubscriptionData;

.field private mCardSubMgr:Lcom/android/internal/telephony/msim/CardSubscriptionManager;

.field private mContext:Landroid/content/Context;

.field private mHwTelephonyMgr:Lcom/huawei/telephony/HuaweiTelephonyManager;

.field private mIfTypeToSet:I

.field mIntentReceiver:Landroid/content/BroadcastReceiver;

.field private mLastPlmn1:Ljava/lang/String;

.field private mLastPlmn2:Ljava/lang/String;

.field private mMainHandler:Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;

.field private mMessageThread:Landroid/os/HandlerThread;

.field private mSubData:Lcom/android/internal/telephony/msim/SubscriptionData;

.field private mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;

.field private mSubReady:[Z

.field private mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

.field private mbPendingIntent:Z

.field private mbSetSubscriptionStatus:Z

.field private mlastmIccIds:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v0, 0x0

    sput-object v0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mMSimHWGlobalMode:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    const-string v0, "ro.config.cdma.2nd.delay"

    const v1, 0x3a980

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->TIME_DELAY_TO_REC_INTENT:I

    const-string v0, "ro.config.timer2DispDSDS"

    const v1, 0xea60

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->TIME_TO_CLOSE_DSDS:I

    const-string v0, "ro.config.hw_opta"

    const-string v1, "0"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "92"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "ro.config.hw_optb"

    const-string v1, "0"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "156"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->IS_CHINA_TELECOM_OPTA_OPTB:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 5
    .parameter "context"

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x0

    const/4 v2, 0x0

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "SubscriptionManager-MSimHWGlobalMode"

    iput-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    iput-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iput-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardSubData:[Lcom/android/internal/telephony/msim/SubscriptionData;

    iput-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mlastmIccIds:[Ljava/lang/String;

    const-string v0, "uninitialized"

    iput-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mLastPlmn1:Ljava/lang/String;

    const-string v0, "uninitialized"

    iput-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mLastPlmn2:Ljava/lang/String;

    iput-boolean v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->bDeactSub2Pending:Z

    iput-boolean v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->bActSub1Pending:Z

    iput-boolean v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->bDeactSub1Pending:Z

    iput-boolean v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mbSetSubscriptionStatus:Z

    iput-boolean v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mbPendingIntent:Z

    const-string v0, "ro.config.cdma.2ndselnet"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->bSupport2ndSelNet:Z

    const/4 v0, -0x1

    iput v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mIfTypeToSet:I

    new-array v0, v4, [Z

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardStatus:[Z

    iput-boolean v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardChanged:Z

    new-array v0, v4, [Z

    fill-array-data v0, :array_1

    iput-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubReady:[Z

    iput-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubData:Lcom/android/internal/telephony/msim/SubscriptionData;

    iput-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->countdown:Landroid/os/CountDownTimer;

    iput-boolean v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->bInit:Z

    new-instance v0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$2;

    invoke-direct {v0, p0}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$2;-><init>(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)V

    iput-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    iput-object p1, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mContext:Landroid/content/Context;

    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "MSimHWGlobalMode"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mMessageThread:Landroid/os/HandlerThread;

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mMessageThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    new-instance v0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mMessageThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;-><init>(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mMainHandler:Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;

    return-void

    nop

    :array_0
    .array-data 0x1
        0x0t
        0x0t
    .end array-data

    nop

    :array_1
    .array-data 0x1
        0x0t
        0x0t
    .end array-data
.end method

.method static synthetic access$000(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Landroid/content/Context;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Z
    .locals 1
    .parameter "x0"

    .prologue
    iget-boolean v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mbPendingIntent:Z

    return v0
.end method

.method static synthetic access$1002(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput-boolean p1, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mbPendingIntent:Z

    return p1
.end method

.method static synthetic access$1100(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)V
    .locals 0
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->process2ndSelNetwork()V

    return-void
.end method

.method static synthetic access$200(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)I
    .locals 1
    .parameter "x0"

    .prologue
    iget v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mIfTypeToSet:I

    return v0
.end method

.method static synthetic access$300(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mMainHandler:Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Lcom/android/internal/telephony/msim/SubscriptionManager;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;

    return-object v0
.end method

.method static synthetic access$500(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Z
    .locals 1
    .parameter "x0"

    .prologue
    iget-boolean v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->bActSub1Pending:Z

    return v0
.end method

.method static synthetic access$502(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput-boolean p1, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->bActSub1Pending:Z

    return p1
.end method

.method static synthetic access$600(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;II)I
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->getAppIndex(II)I

    move-result v0

    return v0
.end method

.method static synthetic access$700(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Z
    .locals 1
    .parameter "x0"

    .prologue
    iget-boolean v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->bDeactSub1Pending:Z

    return v0
.end method

.method static synthetic access$702(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput-boolean p1, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->bDeactSub1Pending:Z

    return p1
.end method

.method static synthetic access$800(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Z
    .locals 1
    .parameter "x0"

    .prologue
    iget-boolean v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->bDeactSub2Pending:Z

    return v0
.end method

.method static synthetic access$802(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput-boolean p1, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->bDeactSub2Pending:Z

    return p1
.end method

.method static synthetic access$900(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;)Z
    .locals 1
    .parameter "x0"

    .prologue
    iget-boolean v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mbSetSubscriptionStatus:Z

    return v0
.end method

.method static synthetic access$902(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput-boolean p1, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mbSetSubscriptionStatus:Z

    return p1
.end method

.method private activateSub(II)V
    .locals 6
    .parameter "subId"
    .parameter "nAppType"

    .prologue
    const/4 v5, -0x1

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardSubData:[Lcom/android/internal/telephony/msim/SubscriptionData;

    aget-object v2, v2, p1

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "activateSub mCardSubData["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardSubData:[Lcom/android/internal/telephony/msim/SubscriptionData;

    aget-object v4, v4, p1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardSubData:[Lcom/android/internal/telephony/msim/SubscriptionData;

    aget-object v2, v2, p1

    invoke-virtual {v2}, Lcom/android/internal/telephony/msim/SubscriptionData;->getLength()I

    move-result v2

    if-ge v1, v2, :cond_1

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardSubData:[Lcom/android/internal/telephony/msim/SubscriptionData;

    aget-object v2, v2, p1

    iget-object v2, v2, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v2, v2, v1

    iget-object v0, v2, Lcom/android/internal/telephony/msim/Subscription;->appType:Ljava/lang/String;

    .local v0, appType:Ljava/lang/String;
    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubData:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v2, v2, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v2, v2, p1

    iput p1, v2, Lcom/android/internal/telephony/msim/Subscription;->slotId:I

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubData:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v2, v2, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v2, v2, p1

    iput p1, v2, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubData:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v2, v2, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v2, v2, p1

    sget-object v3, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    iput-object v3, v2, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubData:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v2, v2, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v2, v2, p1

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardSubData:[Lcom/android/internal/telephony/msim/SubscriptionData;

    aget-object v3, v3, p1

    iget-object v3, v3, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v3, v3, v1

    iget-object v3, v3, Lcom/android/internal/telephony/msim/Subscription;->appId:Ljava/lang/String;

    iput-object v3, v2, Lcom/android/internal/telephony/msim/Subscription;->appId:Ljava/lang/String;

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubData:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v2, v2, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v2, v2, p1

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardSubData:[Lcom/android/internal/telephony/msim/SubscriptionData;

    aget-object v3, v3, p1

    iget-object v3, v3, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v3, v3, v1

    iget-object v3, v3, Lcom/android/internal/telephony/msim/Subscription;->appLabel:Ljava/lang/String;

    iput-object v3, v2, Lcom/android/internal/telephony/msim/Subscription;->appLabel:Ljava/lang/String;

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubData:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v2, v2, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v2, v2, p1

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardSubData:[Lcom/android/internal/telephony/msim/SubscriptionData;

    aget-object v3, v3, p1

    iget-object v3, v3, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v3, v3, v1

    iget-object v3, v3, Lcom/android/internal/telephony/msim/Subscription;->appType:Ljava/lang/String;

    iput-object v3, v2, Lcom/android/internal/telephony/msim/Subscription;->appType:Ljava/lang/String;

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubData:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v2, v2, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v2, v2, p1

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardSubData:[Lcom/android/internal/telephony/msim/SubscriptionData;

    aget-object v3, v3, p1

    iget-object v3, v3, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v3, v3, v1

    iget-object v3, v3, Lcom/android/internal/telephony/msim/Subscription;->iccId:Ljava/lang/String;

    iput-object v3, v2, Lcom/android/internal/telephony/msim/Subscription;->iccId:Ljava/lang/String;

    if-nez p2, :cond_2

    const-string v2, "RUIM"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "CSIM"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_0
    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubData:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v2, v2, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v2, v2, p1

    iput v5, v2, Lcom/android/internal/telephony/msim/Subscription;->m3gppIndex:I

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubData:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v2, v2, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v2, v2, p1

    iput v1, v2, Lcom/android/internal/telephony/msim/Subscription;->m3gpp2Index:I

    .end local v0           #appType:Ljava/lang/String;
    .end local v1           #i:I
    :cond_1
    :goto_1
    return-void

    .restart local v0       #appType:Ljava/lang/String;
    .restart local v1       #i:I
    :cond_2
    const/4 v2, 0x1

    if-ne v2, p2, :cond_4

    const-string v2, "SIM"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string v2, "USIM"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_3
    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubData:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v2, v2, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v2, v2, p1

    iput v1, v2, Lcom/android/internal/telephony/msim/Subscription;->m3gppIndex:I

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubData:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v2, v2, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v2, v2, p1

    iput v5, v2, Lcom/android/internal/telephony/msim/Subscription;->m3gpp2Index:I

    goto :goto_1

    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0
.end method

.method private checkClearPrefAPNId(IIZ)V
    .locals 7
    .parameter "subId"
    .parameter "nAppType"
    .parameter "bActive"

    .prologue
    const/4 v6, 0x2

    const/4 v5, -0x1

    if-nez p1, :cond_0

    if-eqz p3, :cond_0

    if-ne v5, p2, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    :try_start_0
    const-string v3, "persist.radio.hw.ctmode"

    const/4 v4, -0x1

    invoke-static {v3, v4}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v2

    .local v2, prefMode:I
    if-eq v5, v2, :cond_0

    if-eq v2, p2, :cond_0

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;

    invoke-virtual {v3, p1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isSubActive(I)Z

    move-result v3

    if-eqz v3, :cond_0

    if-ne v6, v2, :cond_2

    if-eqz p2, :cond_0

    :cond_2
    if-nez v2, :cond_3

    if-eq v6, p2, :cond_0

    :cond_3
    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Need clear preferred Apn ID"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getDefault()Lcom/huawei/telephony/HuaweiTelephonyManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/huawei/telephony/HuaweiTelephonyManager;->clearPreferedApnId()V

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .local v0, cr:Landroid/content/ContentResolver;
    const-string v3, "gsm_roming"

    const-string v4, "default"

    invoke-static {v0, v3, v4}, Landroid/provider/SettingsEx$Systemex;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .end local v0           #cr:Landroid/content/ContentResolver;
    .end local v2           #prefMode:I
    :catch_0
    move-exception v1

    .local v1, ex:Ljava/lang/Exception;
    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "fail to  checkClearPrefAPNId, exception="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private deactivateSub(II)V
    .locals 7
    .parameter "subId"
    .parameter "nAppType"

    .prologue
    const/4 v6, 0x0

    const/4 v5, -0x1

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardSubData:[Lcom/android/internal/telephony/msim/SubscriptionData;

    aget-object v2, v2, p1

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "deactivateSub mCardSubData["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardSubData:[Lcom/android/internal/telephony/msim/SubscriptionData;

    aget-object v4, v4, p1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardSubData:[Lcom/android/internal/telephony/msim/SubscriptionData;

    aget-object v2, v2, p1

    invoke-virtual {v2}, Lcom/android/internal/telephony/msim/SubscriptionData;->getLength()I

    move-result v2

    if-ge v1, v2, :cond_2

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardSubData:[Lcom/android/internal/telephony/msim/SubscriptionData;

    aget-object v2, v2, p1

    iget-object v2, v2, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v2, v2, v1

    iget-object v0, v2, Lcom/android/internal/telephony/msim/Subscription;->appType:Ljava/lang/String;

    .local v0, appType:Ljava/lang/String;
    if-nez p2, :cond_0

    const-string v2, "RUIM"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "CSIM"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    :cond_0
    const/4 v2, 0x1

    if-ne v2, p2, :cond_3

    const-string v2, "SIM"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "USIM"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_1
    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubData:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v2, v2, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v2, v2, p1

    iput p1, v2, Lcom/android/internal/telephony/msim/Subscription;->slotId:I

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubData:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v2, v2, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v2, v2, p1

    iput v5, v2, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubData:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v2, v2, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v2, v2, p1

    sget-object v3, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_DEACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    iput-object v3, v2, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubData:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v2, v2, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v2, v2, p1

    iput-object v6, v2, Lcom/android/internal/telephony/msim/Subscription;->appId:Ljava/lang/String;

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubData:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v2, v2, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v2, v2, p1

    iput-object v6, v2, Lcom/android/internal/telephony/msim/Subscription;->appLabel:Ljava/lang/String;

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubData:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v2, v2, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v2, v2, p1

    iput-object v0, v2, Lcom/android/internal/telephony/msim/Subscription;->appType:Ljava/lang/String;

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubData:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v2, v2, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v2, v2, p1

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardSubData:[Lcom/android/internal/telephony/msim/SubscriptionData;

    aget-object v3, v3, p1

    iget-object v3, v3, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v3, v3, v1

    iget-object v3, v3, Lcom/android/internal/telephony/msim/Subscription;->iccId:Ljava/lang/String;

    iput-object v3, v2, Lcom/android/internal/telephony/msim/Subscription;->iccId:Ljava/lang/String;

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubData:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v2, v2, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v2, v2, p1

    iput v5, v2, Lcom/android/internal/telephony/msim/Subscription;->m3gppIndex:I

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubData:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v2, v2, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v2, v2, p1

    iput v5, v2, Lcom/android/internal/telephony/msim/Subscription;->m3gpp2Index:I

    .end local v0           #appType:Ljava/lang/String;
    .end local v1           #i:I
    :cond_2
    return-void

    .restart local v0       #appType:Ljava/lang/String;
    .restart local v1       #i:I
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0
.end method

.method private getAppIndex(II)I
    .locals 3
    .parameter "subId"
    .parameter "nAppType"

    .prologue
    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardSubData:[Lcom/android/internal/telephony/msim/SubscriptionData;

    aget-object v2, v2, p1

    if-eqz v2, :cond_3

    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardSubData:[Lcom/android/internal/telephony/msim/SubscriptionData;

    aget-object v2, v2, p1

    invoke-virtual {v2}, Lcom/android/internal/telephony/msim/SubscriptionData;->getLength()I

    move-result v2

    if-ge v1, v2, :cond_3

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardSubData:[Lcom/android/internal/telephony/msim/SubscriptionData;

    aget-object v2, v2, p1

    iget-object v2, v2, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v2, v2, v1

    iget-object v0, v2, Lcom/android/internal/telephony/msim/Subscription;->appType:Ljava/lang/String;

    .local v0, appType:Ljava/lang/String;
    if-nez p2, :cond_1

    const-string v2, "RUIM"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "CSIM"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .end local v0           #appType:Ljava/lang/String;
    .end local v1           #i:I
    :cond_0
    :goto_1
    return v1

    .restart local v0       #appType:Ljava/lang/String;
    .restart local v1       #i:I
    :cond_1
    const/4 v2, 0x1

    if-ne v2, p2, :cond_2

    const-string v2, "SIM"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "USIM"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .end local v0           #appType:Ljava/lang/String;
    .end local v1           #i:I
    :cond_3
    const/4 v1, -0x1

    goto :goto_1
.end method

.method public static getInstance()Lcom/android/internal/telephony/msim/MSimHWGlobalMode;
    .locals 1

    .prologue
    sget-object v0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mMSimHWGlobalMode:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    return-object v0
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/android/internal/telephony/msim/MSimHWGlobalMode;
    .locals 1
    .parameter "context"

    .prologue
    sget-object v0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mMSimHWGlobalMode:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    if-nez v0, :cond_0

    new-instance v0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    invoke-direct {v0, p0}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mMSimHWGlobalMode:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    :cond_0
    sget-object v0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mMSimHWGlobalMode:Lcom/android/internal/telephony/msim/MSimHWGlobalMode;

    return-object v0
.end method

.method private inHomeLand(Ljava/lang/String;)Z
    .locals 2
    .parameter "plmn"

    .prologue
    const/4 v1, -0x1

    if-eqz p1, :cond_1

    const-string v0, "460"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ne v0, v1, :cond_0

    const-string v0, "455"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-eq v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isCardChanged(I)Z
    .locals 6
    .parameter "cardId"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v0, 0x1

    .local v0, bResult:Z
    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardStatus:[Z

    aget-boolean v4, v4, p1

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardSubMgr:Lcom/android/internal/telephony/msim/CardSubscriptionManager;

    invoke-virtual {v4, p1}, Lcom/android/internal/telephony/msim/CardSubscriptionManager;->getCardSubscriptions(I)Lcom/android/internal/telephony/msim/SubscriptionData;

    move-result-object v1

    .local v1, subData:Lcom/android/internal/telephony/msim/SubscriptionData;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/android/internal/telephony/msim/SubscriptionData;->getIccId()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    invoke-virtual {v1}, Lcom/android/internal/telephony/msim/SubscriptionData;->getIccId()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mlastmIccIds:[Ljava/lang/String;

    aget-object v5, v5, p1

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    move v0, v2

    .end local v1           #subData:Lcom/android/internal/telephony/msim/SubscriptionData;
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isCardChanged, bResult = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    .restart local v1       #subData:Lcom/android/internal/telephony/msim/SubscriptionData;
    :cond_1
    move v0, v3

    goto :goto_0

    .end local v1           #subData:Lcom/android/internal/telephony/msim/SubscriptionData;
    :cond_2
    iget-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mlastmIccIds:[Ljava/lang/String;

    aget-object v4, v4, p1

    if-eqz v4, :cond_3

    move v0, v2

    :goto_1
    goto :goto_0

    :cond_3
    move v0, v3

    goto :goto_1
.end method

.method private mapAppType2RILMode(I)I
    .locals 1
    .parameter "nAppType"

    .prologue
    const/4 v0, 0x7

    .local v0, nRilMode:I
    packed-switch p1, :pswitch_data_0

    :goto_0
    return v0

    :pswitch_0
    const/4 v0, 0x4

    goto :goto_0

    :pswitch_1
    const/4 v0, 0x7

    goto :goto_0

    :pswitch_2
    const/4 v0, 0x1

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private mapRIL2AppType(I)I
    .locals 1
    .parameter "nRilMode"

    .prologue
    const/4 v0, -0x1

    .local v0, nAppType:I
    packed-switch p1, :pswitch_data_0

    :goto_0
    :pswitch_0
    return v0

    :pswitch_1
    const/4 v0, 0x0

    goto :goto_0

    :pswitch_2
    const/4 v0, 0x2

    goto :goto_0

    :pswitch_3
    const/4 v0, 0x1

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_0
        :pswitch_3
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private process2ndSelNetwork()V
    .locals 13

    .prologue
    const/4 v12, -0x1

    const/4 v11, 0x2

    const/4 v10, 0x0

    const/4 v9, 0x1

    const/4 v0, 0x1

    .local v0, bsub1Change:Z
    const/4 v1, 0x1

    .local v1, bsub2Change:Z
    :try_start_0
    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    const-string v7, "always_show_roaming_mode_selection"

    const/4 v8, 0x0

    invoke-static {v6, v7, v8}, Landroid/provider/SettingsEx$Systemex;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v3

    .local v3, n2SelNet:I
    if-ne v9, v3, :cond_1

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v7, "Avoid 2nd Sel network process for R&D test!"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v3           #n2SelNet:I
    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v2

    .local v2, ex:Ljava/lang/Exception;
    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Exception happen, exception="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .end local v2           #ex:Ljava/lang/Exception;
    :cond_1
    iget-boolean v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->bSupport2ndSelNet:Z

    if-nez v6, :cond_2

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v7, "Don\'t support 2nd Sel Network process!"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_2
    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mHwTelephonyMgr:Lcom/huawei/telephony/HuaweiTelephonyManager;

    const/16 v6, 0x29

    iget-object v7, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mHwTelephonyMgr:Lcom/huawei/telephony/HuaweiTelephonyManager;

    invoke-virtual {v7, v10}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getCardType(I)I

    move-result v7

    if-eq v6, v7, :cond_3

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "card1 not CT international roaming dual mode Card, card1 is!"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mHwTelephonyMgr:Lcom/huawei/telephony/HuaweiTelephonyManager;

    invoke-virtual {v8, v10}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getCardType(I)I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_3
    const-string v6, "gsm.globalmode.plmn.cdma"

    const-string v7, ""

    invoke-static {v6, v7}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .local v4, plmn1:Ljava/lang/String;
    const-string v6, "gsm.globalmode.plmn.gsm"

    const-string v7, ""

    invoke-static {v6, v7}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .local v5, plmn2:Ljava/lang/String;
    const-string v6, ""

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    const/4 v4, 0x0

    :cond_4
    const-string v6, ""

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    const/4 v5, 0x0

    :cond_5
    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Received ACTION_START_SEC_NET_SEL, plmn_cdma = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ",plmn_gsm = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Received ACTION_START_SEC_NET_SEL, last_cdma = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mLastPlmn1:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ",last_gsm = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mLastPlmn2:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v4, :cond_6

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mLastPlmn1:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_7

    :cond_6
    if-nez v4, :cond_8

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mLastPlmn1:Ljava/lang/String;

    if-nez v6, :cond_8

    :cond_7
    const/4 v0, 0x0

    :cond_8
    if-eqz v5, :cond_9

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mLastPlmn2:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_a

    :cond_9
    if-nez v5, :cond_b

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mLastPlmn2:Ljava/lang/String;

    if-nez v6, :cond_b

    :cond_a
    const/4 v1, 0x0

    :cond_b
    if-nez v0, :cond_c

    if-nez v1, :cond_c

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v7, "both plmn not changed, so don\'t do 2ndselNetwork!"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :cond_c
    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v7, "begin to process 2nd-sel-network!"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-object v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mLastPlmn1:Ljava/lang/String;

    iput-object v5, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mLastPlmn2:Ljava/lang/String;

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardStatus:[Z

    aget-boolean v6, v6, v10

    if-eqz v6, :cond_14

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardStatus:[Z

    aget-boolean v6, v6, v9

    if-eqz v6, :cond_14

    if-nez v4, :cond_f

    if-eqz v5, :cond_f

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;

    invoke-virtual {v6, v10}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isSubActive(I)Z

    move-result v6

    if-eqz v6, :cond_d

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;

    invoke-virtual {v6, v9}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isSubActive(I)Z

    move-result v6

    if-nez v6, :cond_d

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v7, "Card1 active, card2 inactive, do nothing!"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :cond_d
    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;

    invoke-virtual {v6, v10}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isSubActive(I)Z

    move-result v6

    if-nez v6, :cond_e

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;

    invoke-virtual {v6, v9}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isSubActive(I)Z

    move-result v6

    if-eqz v6, :cond_e

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v7, "Card1 inactive, card2 active, do nothing!"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :cond_e
    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;

    invoke-virtual {v6, v10}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isSubActive(I)Z

    move-result v6

    if-eqz v6, :cond_0

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;

    invoke-virtual {v6, v9}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isSubActive(I)Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-static {}, Lcom/android/internal/telephony/msim/MSimPhoneFactory;->getVoiceSubscription()I

    move-result v6

    if-nez v6, :cond_0

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->inHomeLand(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v7, "both cards inserted, g signal, popup to let user switch to global mode"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v6, "android.intent.action.CDMA_2ND_SEL_NET_SWITCH2"

    invoke-direct {p0, v6}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->sendIntent2Upplayer(Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_f
    if-eqz v4, :cond_11

    if-nez v5, :cond_11

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;

    invoke-virtual {v6, v9}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isSubActive(I)Z

    move-result v6

    if-nez v6, :cond_10

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->getAutoDeactSub1Flag()Z

    move-result v6

    if-eqz v6, :cond_10

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v7, "card2 inactive, swith card1 to be cdma mode, then active card2"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0, v9, v9, v9}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->setSubscriptionExt(IIZ)V

    invoke-virtual {p0, v10, v10, v9}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->setSubscriptionExt(IIZ)V

    goto/16 :goto_0

    :cond_10
    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v7, "card2 active, do nothing for now design!"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :cond_11
    if-nez v4, :cond_13

    if-nez v5, :cond_13

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;

    invoke-virtual {v6, v10}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isSubActive(I)Z

    move-result v6

    if-eqz v6, :cond_0

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;

    invoke-virtual {v6, v9}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isSubActive(I)Z

    move-result v6

    if-nez v6, :cond_0

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->getDualCardMode()I

    move-result v6

    if-nez v6, :cond_12

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v7, "card1 active,card2 inactive, no c/g signal, let upper layer disposal"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v6, "android.intent.action.CDMA_2ND_SEL_NET_SWITCH3"

    invoke-direct {p0, v6}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->sendIntent2Upplayer(Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_12
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->getDualCardMode()I

    move-result v6

    if-ne v9, v6, :cond_0

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v7, "card1 active,card2 inactive, no c/g signal, let upper layer disposal"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v6, "android.intent.action.CDMA_2ND_SEL_NET_SWITCH4"

    invoke-direct {p0, v6}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->sendIntent2Upplayer(Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_13
    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v7, "both cards inserted, c/g signal, do nothing!"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :cond_14
    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardStatus:[Z

    aget-boolean v6, v6, v10

    if-eqz v6, :cond_17

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardStatus:[Z

    aget-boolean v6, v6, v9

    if-nez v6, :cond_17

    if-nez v4, :cond_15

    if-nez v5, :cond_15

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->getDualCardMode()I

    move-result v6

    if-eq v11, v6, :cond_0

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v7, "Only card1 inserted, no c/g signal, popup to let user switch to global mode"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v6, "android.intent.action.CDMA_2ND_SEL_NET_SWITCH1"

    invoke-direct {p0, v6}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->sendIntent2Upplayer(Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_15
    if-eqz v4, :cond_16

    invoke-direct {p0, v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->inHomeLand(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->getDualCardMode()I

    move-result v6

    if-eq v11, v6, :cond_0

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v7, "only card1 exsists, cdma signal, homeLand, confirm to be global mode"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0, v10, v11, v9}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->setSubscriptionExt(IIZ)V

    invoke-virtual {p0, v9, v12, v10}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->setSubscriptionExt(IIZ)V

    goto/16 :goto_0

    :cond_16
    if-eqz v5, :cond_0

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->inHomeLand(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->getDualCardMode()I

    move-result v6

    if-eq v11, v6, :cond_0

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v7, "only card1 exsists, gsm signal, homeLand, confirm to be global mode"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0, v10, v11, v9}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->setSubscriptionExt(IIZ)V

    invoke-virtual {p0, v9, v12, v10}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->setSubscriptionExt(IIZ)V

    goto/16 :goto_0

    :cond_17
    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardStatus:[Z

    aget-boolean v6, v6, v10

    if-nez v6, :cond_0

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardStatus:[Z

    aget-boolean v6, v6, v9

    if-eqz v6, :cond_0

    goto/16 :goto_0
.end method

.method private promptUserSubscription()V
    .locals 3

    .prologue
    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v2, "promptUserSubscription"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .local v0, setSubscriptionIntent:Landroid/content/Intent;
    const-string v1, "com.huawei.android.dsdscardmanager"

    const-string v2, "com.huawei.android.dsdscardmanager.HWCardManagerTabActivity"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v1, 0x1000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string v1, "dualmgrstartcause"

    const-string v2, "framework"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->setTimerToCloseCardManager()V

    return-void
.end method

.method private sendIntent2Upplayer(Ljava/lang/String;)V
    .locals 2
    .parameter "intent"

    .prologue
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .local v0, intent_sel2:Landroid/content/Intent;
    const/high16 v1, 0x2000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendStickyBroadcast(Landroid/content/Intent;)V

    return-void
.end method


# virtual methods
.method public cancelTheTimer()V
    .locals 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v1, "cancelTheTimer---"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->countdown:Landroid/os/CountDownTimer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->countdown:Landroid/os/CountDownTimer;

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    :cond_0
    return-void
.end method

.method public getAutoDeactSub1Flag()Z
    .locals 2

    .prologue
    const-string v0, "persist.radio.hw.deact2flag"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public getDualCardMode()I
    .locals 2

    .prologue
    const-string v0, "persist.radio.hw.ctmode"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    int-to-short v0, v0

    return v0
.end method

.method public setAutoDeactSub1Flag(Z)V
    .locals 2
    .parameter "bFlag"

    .prologue
    const-string v1, "persist.radio.hw.deact2flag"

    if-eqz p1, :cond_0

    const-string v0, "true"

    :goto_0
    invoke-static {v1, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const-string v0, "false"

    goto :goto_0
.end method

.method public setDualCardMode(I)V
    .locals 2
    .parameter "nMode"

    .prologue
    const-string v0, "persist.radio.hw.ctmode"

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setSubscriptionExt(IIZ)V
    .locals 6
    .parameter "subId"
    .parameter "nAppType"
    .parameter "bActive"

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Prepare setSubscriptionExt! subId = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", nAppType="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", bActive = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Global Mode init = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->bInit:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->bInit:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Global Mode not init, so setSubscriptionExt directly exit"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-boolean v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mbSetSubscriptionStatus:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Can\'t call this method, because someone else is being process setSubscription!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubData:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v0, v0, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v0, v0, v3

    invoke-virtual {v0}, Lcom/android/internal/telephony/msim/Subscription;->clear()V

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubData:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v0, v0, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v0, v0, v4

    invoke-virtual {v0}, Lcom/android/internal/telephony/msim/Subscription;->clear()V

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubReady:[Z

    aput-boolean v3, v0, v3

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubReady:[Z

    aput-boolean v3, v0, v4

    goto :goto_0

    :cond_2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->checkClearPrefAPNId(IIZ)V

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubReady:[Z

    aput-boolean v4, v0, p1

    packed-switch p2, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubData:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v0, v0, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Lcom/android/internal/telephony/msim/Subscription;->clear()V

    :goto_1
    if-nez p1, :cond_3

    if-eqz p3, :cond_3

    invoke-virtual {p0, p2}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->setDualCardMode(I)V

    :cond_3
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubReady:[Z

    aget-boolean v0, v0, v3

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubReady:[Z

    aget-boolean v0, v0, v4

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;

    invoke-virtual {v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->clearPendingQueue()V

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Start setSubscriptionExt subData="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubData:Lcom/android/internal/telephony/msim/SubscriptionData;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mbSetSubscriptionStatus:Z

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubData:Lcom/android/internal/telephony/msim/SubscriptionData;

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->MSimHwSetSubscription(Lcom/android/internal/telephony/msim/SubscriptionData;)V

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubData:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v0, v0, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v0, v0, v3

    invoke-virtual {v0}, Lcom/android/internal/telephony/msim/Subscription;->clear()V

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubData:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v0, v0, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v0, v0, v4

    invoke-virtual {v0}, Lcom/android/internal/telephony/msim/Subscription;->clear()V

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubReady:[Z

    aput-boolean v3, v0, v3

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubReady:[Z

    aput-boolean v3, v0, v4

    goto/16 :goto_0

    :pswitch_1
    if-eqz p3, :cond_5

    if-nez p1, :cond_4

    invoke-direct {p0, p2}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mapAppType2RILMode(I)I

    move-result v0

    iput v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mIfTypeToSet:I

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->getDualCardMode()I

    move-result v0

    if-eq p2, v0, :cond_4

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Called by upper layer, current setting not equal the expected! so firstly change NV!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubReady:[Z

    aput-boolean v3, v0, p1

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;

    iget v1, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mIfTypeToSet:I

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mMainHandler:Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;

    invoke-virtual {v2, v5}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v0, v3, v1, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->setPreferredNetworkType(IILandroid/os/Message;)V

    goto/16 :goto_0

    :cond_4
    invoke-direct {p0, p1, p2}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->activateSub(II)V

    goto/16 :goto_1

    :cond_5
    invoke-direct {p0, p1, p2}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->deactivateSub(II)V

    goto/16 :goto_1

    :pswitch_2
    if-eqz p3, :cond_7

    if-nez p1, :cond_7

    invoke-direct {p0, p2}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mapAppType2RILMode(I)I

    move-result v0

    iput v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mIfTypeToSet:I

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->getDualCardMode()I

    move-result v0

    if-eq p2, v0, :cond_6

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Called by upper layer, current setting not equal the expected! so firstly change NV!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubReady:[Z

    aput-boolean v3, v0, p1

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;

    iget v1, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mIfTypeToSet:I

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mMainHandler:Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;

    invoke-virtual {v2, v5}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v0, v3, v1, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->setPreferredNetworkType(IILandroid/os/Message;)V

    goto/16 :goto_0

    :cond_6
    invoke-direct {p0, p1, v3}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->activateSub(II)V

    iput-boolean v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->bActSub1Pending:Z

    goto/16 :goto_1

    :cond_7
    if-nez p3, :cond_0

    if-nez p1, :cond_0

    invoke-direct {p0, p2}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mapAppType2RILMode(I)I

    move-result v0

    iput v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mIfTypeToSet:I

    invoke-direct {p0, p1, v3}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->deactivateSub(II)V

    iput-boolean v4, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->bDeactSub1Pending:Z

    goto/16 :goto_1

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public setTimerToCloseCardManager()V
    .locals 6

    .prologue
    new-instance v0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$1;

    sget v1, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->TIME_TO_CLOSE_DSDS:I

    int-to-long v2, v1

    const-wide/16 v4, 0x3e8

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$1;-><init>(Lcom/android/internal/telephony/msim/MSimHWGlobalMode;JJ)V

    iput-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->countdown:Landroid/os/CountDownTimer;

    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->countdown:Landroid/os/CountDownTimer;

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->start()Landroid/os/CountDownTimer;

    return-void
.end method

.method public validateGlobalMode()Z
    .locals 11

    .prologue
    const/4 v10, -0x1

    const/4 v8, 0x0

    const/4 v9, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x1

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v6, "validateGlobalMode enter!"

    invoke-static {v3, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    .local v0, bResult:Z
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getInstance()Lcom/android/internal/telephony/msim/SubscriptionManager;

    move-result-object v3

    iput-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;

    invoke-static {}, Lcom/android/internal/telephony/msim/CardSubscriptionManager;->getInstance()Lcom/android/internal/telephony/msim/CardSubscriptionManager;

    move-result-object v3

    iput-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardSubMgr:Lcom/android/internal/telephony/msim/CardSubscriptionManager;

    invoke-static {}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getDefault()Lcom/huawei/telephony/HuaweiTelephonyManager;

    move-result-object v3

    iput-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mHwTelephonyMgr:Lcom/huawei/telephony/HuaweiTelephonyManager;

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardSubMgr:Lcom/android/internal/telephony/msim/CardSubscriptionManager;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mHwTelephonyMgr:Lcom/huawei/telephony/HuaweiTelephonyManager;

    if-nez v3, :cond_1

    :cond_0
    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v5, "validateGlobalMode, Fail to get instance!"

    invoke-static {v3, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return v4

    :cond_1
    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mMainHandler:Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;

    const/4 v7, 0x3

    invoke-virtual {v3, v4, v6, v7, v8}, Lcom/android/internal/telephony/msim/SubscriptionManager;->registerForSubscriptionActivated(ILandroid/os/Handler;ILjava/lang/Object;)V

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mMainHandler:Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;

    const/4 v7, 0x4

    invoke-virtual {v3, v4, v6, v7, v8}, Lcom/android/internal/telephony/msim/SubscriptionManager;->registerForSubscriptionDeactivated(ILandroid/os/Handler;ILjava/lang/Object;)V

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mMainHandler:Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;

    const/4 v7, 0x5

    invoke-virtual {v3, v5, v6, v7, v8}, Lcom/android/internal/telephony/msim/SubscriptionManager;->registerForSubscriptionDeactivated(ILandroid/os/Handler;ILjava/lang/Object;)V

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mMainHandler:Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;

    const/4 v7, 0x6

    invoke-virtual {v3, v6, v7, v8}, Lcom/android/internal/telephony/msim/SubscriptionManager;->registerForSetSubscriptionCompleted(Landroid/os/Handler;ILjava/lang/Object;)V

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mMainHandler:Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;

    const/4 v7, 0x7

    invoke-virtual {v3, v5, v6, v7, v8}, Lcom/android/internal/telephony/msim/SubscriptionManager;->registerForSubscriptionActivated(ILandroid/os/Handler;ILjava/lang/Object;)V

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mMainHandler:Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mMainHandler:Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;

    const/16 v7, 0x8

    invoke-static {v6, v7}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v6

    sget v7, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->TIME_DELAY_TO_REC_INTENT:I

    int-to-long v7, v7

    invoke-virtual {v3, v6, v7, v8}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->sendMessageDelayed(Landroid/os/Message;J)Z

    new-instance v3, Lcom/android/internal/telephony/msim/SubscriptionData;

    invoke-direct {v3, v9}, Lcom/android/internal/telephony/msim/SubscriptionData;-><init>(I)V

    iput-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubData:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;

    invoke-virtual {v3}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getLastIccidInfo()[Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mlastmIccIds:[Ljava/lang/String;

    new-array v3, v9, [Lcom/android/internal/telephony/msim/SubscriptionData;

    iput-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardSubData:[Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardSubData:[Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardSubMgr:Lcom/android/internal/telephony/msim/CardSubscriptionManager;

    invoke-virtual {v6, v4}, Lcom/android/internal/telephony/msim/CardSubscriptionManager;->getCardSubscriptions(I)Lcom/android/internal/telephony/msim/SubscriptionData;

    move-result-object v6

    aput-object v6, v3, v4

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardSubData:[Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardSubMgr:Lcom/android/internal/telephony/msim/CardSubscriptionManager;

    invoke-virtual {v6, v5}, Lcom/android/internal/telephony/msim/CardSubscriptionManager;->getCardSubscriptions(I)Lcom/android/internal/telephony/msim/SubscriptionData;

    move-result-object v6

    aput-object v6, v3, v5

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;

    invoke-virtual {v3}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getUserSubInfo()Lcom/android/internal/telephony/msim/SubscriptionData;

    move-result-object v3

    iput-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardStatus:[Z

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mHwTelephonyMgr:Lcom/huawei/telephony/HuaweiTelephonyManager;

    invoke-virtual {v6, v4}, Lcom/huawei/telephony/HuaweiTelephonyManager;->isCardPresent(I)Z

    move-result v6

    aput-boolean v6, v3, v4

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardStatus:[Z

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mHwTelephonyMgr:Lcom/huawei/telephony/HuaweiTelephonyManager;

    invoke-virtual {v6, v5}, Lcom/huawei/telephony/HuaweiTelephonyManager;->isCardPresent(I)Z

    move-result v6

    aput-boolean v6, v3, v5

    invoke-direct {p0, v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->isCardChanged(I)Z

    move-result v3

    if-nez v3, :cond_2

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->isCardChanged(I)Z

    move-result v3

    if-eqz v3, :cond_5

    :cond_2
    move v3, v5

    :goto_1
    iput-boolean v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardChanged:Z

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "mCardStatus[0]="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardStatus:[Z

    aget-boolean v7, v7, v4

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ",mCardStatus[1]="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardStatus:[Z

    aget-boolean v7, v7, v5

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ",mCardChanged="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-boolean v7, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardChanged:Z

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardChanged:Z

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardStatus:[Z

    aget-boolean v3, v3, v4

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardStatus:[Z

    aget-boolean v3, v3, v5

    if-eqz v3, :cond_3

    invoke-direct {p0}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->promptUserSubscription()V

    :cond_3
    const/4 v1, 0x0

    .local v1, i:I
    :goto_2
    if-ge v1, v9, :cond_6

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardStatus:[Z

    aget-boolean v3, v3, v1

    if-nez v3, :cond_4

    new-instance v2, Lcom/android/internal/telephony/msim/Subscription;

    invoke-direct {v2}, Lcom/android/internal/telephony/msim/Subscription;-><init>()V

    .local v2, tmpSub:Lcom/android/internal/telephony/msim/Subscription;
    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;

    invoke-virtual {v3, v1, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->saveUserPreferredSubscription(ILcom/android/internal/telephony/msim/Subscription;)V

    .end local v2           #tmpSub:Lcom/android/internal/telephony/msim/Subscription;
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .end local v1           #i:I
    :cond_5
    move v3, v4

    goto :goto_1

    .restart local v1       #i:I
    :cond_6
    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v6, "init Global Mode Complete"

    invoke-static {v3, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v5, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->bInit:Z

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardStatus:[Z

    aget-boolean v3, v3, v4

    if-nez v3, :cond_a

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardStatus:[Z

    aget-boolean v3, v3, v5

    if-eqz v3, :cond_a

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v6, "only card2 inserted!"

    invoke-static {v3, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardChanged:Z

    if-eqz v3, :cond_9

    invoke-virtual {p0, v4, v10, v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->setSubscriptionExt(IIZ)V

    invoke-virtual {p0, v5, v5, v5}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->setSubscriptionExt(IIZ)V

    :cond_7
    :goto_3
    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "validateGlobalMode exit! bResult = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v0, :cond_8

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardStatus:[Z

    aget-boolean v3, v3, v4

    if-eqz v3, :cond_8

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardStatus:[Z

    aget-boolean v3, v3, v5

    if-eqz v3, :cond_8

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;

    invoke-virtual {v3}, Lcom/android/internal/telephony/msim/SubscriptionManager;->setDefaultFlag()V

    :cond_8
    move v4, v0

    goto/16 :goto_0

    :cond_9
    const/4 v0, 0x0

    goto :goto_3

    :cond_a
    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardStatus:[Z

    aget-boolean v3, v3, v4

    if-eqz v3, :cond_d

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardStatus:[Z

    aget-boolean v3, v3, v5

    if-nez v3, :cond_d

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v6, "only card1 inserted! Read NV10"

    invoke-static {v3, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardChanged:Z

    if-nez v3, :cond_b

    sget-object v3, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v6, v6, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v6, v6, v4

    iget-object v6, v6, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v3, v6, :cond_c

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->getDualCardMode()I

    move-result v3

    if-ne v9, v3, :cond_c

    :cond_b
    invoke-virtual {p0, v5, v10, v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->setSubscriptionExt(IIZ)V

    const/4 v3, 0x7

    iput v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mIfTypeToSet:I

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mMainHandler:Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;

    invoke-virtual {v6, v5}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v6

    invoke-virtual {v3, v4, v6}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getPreferredNetworkType(ILandroid/os/Message;)V

    goto :goto_3

    :cond_c
    const/4 v0, 0x0

    goto :goto_3

    :cond_d
    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardStatus:[Z

    aget-boolean v3, v3, v4

    if-eqz v3, :cond_7

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardStatus:[Z

    aget-boolean v3, v3, v5

    if-eqz v3, :cond_7

    iget-boolean v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mCardChanged:Z

    if-eqz v3, :cond_e

    invoke-virtual {p0, v5, v5, v5}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->setSubscriptionExt(IIZ)V

    const/4 v3, 0x4

    iput v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mIfTypeToSet:I

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mMainHandler:Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;

    invoke-virtual {v6, v5}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v6

    invoke-virtual {v3, v4, v6}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getPreferredNetworkType(ILandroid/os/Message;)V

    goto/16 :goto_3

    :cond_e
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->getDualCardMode()I

    move-result v3

    if-ne v9, v3, :cond_f

    sget-object v3, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v6, v6, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v6, v6, v5

    iget-object v6, v6, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v3, v6, :cond_f

    const/4 v3, 0x7

    iput v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mIfTypeToSet:I

    invoke-virtual {p0, v5, v10, v4}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->setSubscriptionExt(IIZ)V

    iget-object v3, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mSubMgr:Lcom/android/internal/telephony/msim/SubscriptionManager;

    iget-object v6, p0, Lcom/android/internal/telephony/msim/MSimHWGlobalMode;->mMainHandler:Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;

    invoke-virtual {v6, v5}, Lcom/android/internal/telephony/msim/MSimHWGlobalMode$MainHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v6

    invoke-virtual {v3, v4, v6}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getPreferredNetworkType(ILandroid/os/Message;)V

    goto/16 :goto_3

    :cond_f
    const/4 v0, 0x0

    goto/16 :goto_3
.end method
