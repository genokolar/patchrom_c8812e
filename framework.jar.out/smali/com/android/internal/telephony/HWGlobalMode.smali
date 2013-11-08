.class public Lcom/android/internal/telephony/HWGlobalMode;
.super Landroid/os/Handler;
.source "HWGlobalMode.java"


# static fields
.field private static final ALWAYS_SHOW_ROAMING_MODE_SELECTION:Ljava/lang/String; = "always_show_roaming_mode_selection"

.field private static final AREA_CLASS_A:I = 0x1

.field private static final AREA_CLASS_B:I = 0x2

.field private static final AREA_CLASS_C:I = 0x3

.field private static final AREA_CLASS_UNKNOWN:I = 0x0

.field private static final DUAL_CARD_MODE_CDMA:I = 0x0

.field private static final DUAL_CARD_MODE_GLOBAL:I = 0x2

.field private static final DUAL_CARD_MODE_GSM:I = 0x1

.field private static final DUAL_CARD_MODE_INVALID:I = -0x1

.field private static final EVENT_DELAY_RECEIVE_INTENT:I = 0x1

#the value of this static final field might be set in the static constructor
.field private static final TIME_DELAY_TO_REC_INTENT:I = 0x0

.field private static final UNINITIAL:Ljava/lang/String; = "uninitialized"

.field private static mHWGlobalMode:Lcom/android/internal/telephony/HWGlobalMode;


# instance fields
.field private LOG_TAG:Ljava/lang/String;

.field private bSupport2ndSelNet:Z

.field private mAreaClass:I

.field private mCardType:I

.field private mContext:Landroid/content/Context;

.field private mIntentReceiver:Landroid/content/BroadcastReceiver;

.field private mIsSecNetSelReceiverRegistered:Z

.field private mLastPlmn1:Ljava/lang/String;

.field private mLastPlmn2:Ljava/lang/String;

.field private mSecNetSelIntentReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v0, 0x0

    sput-object v0, Lcom/android/internal/telephony/HWGlobalMode;->mHWGlobalMode:Lcom/android/internal/telephony/HWGlobalMode;

    const-string v0, "ro.config.cdma.2nd.delay"

    const v1, 0xea60

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/android/internal/telephony/HWGlobalMode;->TIME_DELAY_TO_REC_INTENT:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 4
    .parameter "context"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    const-string v1, "HWGlobalMode"

    iput-object v1, p0, Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v1, "uninitialized"

    iput-object v1, p0, Lcom/android/internal/telephony/HWGlobalMode;->mLastPlmn1:Ljava/lang/String;

    const-string v1, "uninitialized"

    iput-object v1, p0, Lcom/android/internal/telephony/HWGlobalMode;->mLastPlmn2:Ljava/lang/String;

    const-string v1, "ro.config.cdma.2ndselnet"

    invoke-static {v1, v3}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/internal/telephony/HWGlobalMode;->bSupport2ndSelNet:Z

    iput v2, p0, Lcom/android/internal/telephony/HWGlobalMode;->mAreaClass:I

    const/4 v1, -0x1

    iput v1, p0, Lcom/android/internal/telephony/HWGlobalMode;->mCardType:I

    iput-boolean v2, p0, Lcom/android/internal/telephony/HWGlobalMode;->mIsSecNetSelReceiverRegistered:Z

    new-instance v1, Lcom/android/internal/telephony/HWGlobalMode$1;

    invoke-direct {v1, p0}, Lcom/android/internal/telephony/HWGlobalMode$1;-><init>(Lcom/android/internal/telephony/HWGlobalMode;)V

    iput-object v1, p0, Lcom/android/internal/telephony/HWGlobalMode;->mSecNetSelIntentReceiver:Landroid/content/BroadcastReceiver;

    new-instance v1, Lcom/android/internal/telephony/HWGlobalMode$2;

    invoke-direct {v1, p0}, Lcom/android/internal/telephony/HWGlobalMode$2;-><init>(Lcom/android/internal/telephony/HWGlobalMode;)V

    iput-object v1, p0, Lcom/android/internal/telephony/HWGlobalMode;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    iget-object v1, p0, Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Constructor - Enter"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-object p1, p0, Lcom/android/internal/telephony/HWGlobalMode;->mContext:Landroid/content/Context;

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .local v0, filter:Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/android/internal/telephony/HWGlobalMode;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/internal/telephony/HWGlobalMode;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/HWGlobalMode;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    sget v2, Lcom/android/internal/telephony/HWGlobalMode;->TIME_DELAY_TO_REC_INTENT:I

    int-to-long v2, v2

    invoke-virtual {p0, v1, v2, v3}, Lcom/android/internal/telephony/HWGlobalMode;->sendMessageDelayed(Landroid/os/Message;J)Z

    iget-object v1, p0, Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Constructor - Exit"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method static synthetic access$000(Lcom/android/internal/telephony/HWGlobalMode;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/internal/telephony/HWGlobalMode;)V
    .locals 0
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lcom/android/internal/telephony/HWGlobalMode;->process2ndSelNetwork()V

    return-void
.end method

.method static synthetic access$200(Lcom/android/internal/telephony/HWGlobalMode;)Z
    .locals 1
    .parameter "x0"

    .prologue
    iget-boolean v0, p0, Lcom/android/internal/telephony/HWGlobalMode;->mIsSecNetSelReceiverRegistered:Z

    return v0
.end method

.method static synthetic access$202(Lcom/android/internal/telephony/HWGlobalMode;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput-boolean p1, p0, Lcom/android/internal/telephony/HWGlobalMode;->mIsSecNetSelReceiverRegistered:Z

    return p1
.end method

.method static synthetic access$300(Lcom/android/internal/telephony/HWGlobalMode;)Landroid/content/BroadcastReceiver;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/HWGlobalMode;->mSecNetSelIntentReceiver:Landroid/content/BroadcastReceiver;

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/internal/telephony/HWGlobalMode;)Landroid/content/Context;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/HWGlobalMode;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$500()I
    .locals 1

    .prologue
    sget v0, Lcom/android/internal/telephony/HWGlobalMode;->TIME_DELAY_TO_REC_INTENT:I

    return v0
.end method

.method public static getInstance()Lcom/android/internal/telephony/HWGlobalMode;
    .locals 1

    .prologue
    sget-object v0, Lcom/android/internal/telephony/HWGlobalMode;->mHWGlobalMode:Lcom/android/internal/telephony/HWGlobalMode;

    return-object v0
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/android/internal/telephony/HWGlobalMode;
    .locals 1
    .parameter "context"

    .prologue
    sget-object v0, Lcom/android/internal/telephony/HWGlobalMode;->mHWGlobalMode:Lcom/android/internal/telephony/HWGlobalMode;

    if-nez v0, :cond_0

    new-instance v0, Lcom/android/internal/telephony/HWGlobalMode;

    invoke-direct {v0, p0}, Lcom/android/internal/telephony/HWGlobalMode;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/android/internal/telephony/HWGlobalMode;->mHWGlobalMode:Lcom/android/internal/telephony/HWGlobalMode;

    :cond_0
    sget-object v0, Lcom/android/internal/telephony/HWGlobalMode;->mHWGlobalMode:Lcom/android/internal/telephony/HWGlobalMode;

    return-object v0
.end method

.method private inAClassLand(Ljava/lang/String;)Z
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

.method private inBClassLand(Ljava/lang/String;)Z
    .locals 2
    .parameter "plmn"

    .prologue
    const/4 v1, -0x1

    if-eqz p1, :cond_1

    const-string v0, "466"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ne v0, v1, :cond_0

    const-string v0, "440"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ne v0, v1, :cond_0

    const-string v0, "441"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ne v0, v1, :cond_0

    const-string v0, "310"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ne v0, v1, :cond_0

    const-string v0, "311"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ne v0, v1, :cond_0

    const-string v0, "316"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ne v0, v1, :cond_0

    const-string v0, "450"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ne v0, v1, :cond_0

    const-string v0, "302"

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

.method private inCClassLand(Ljava/lang/String;)Z
    .locals 1
    .parameter "plmn"

    .prologue
    if-eqz p1, :cond_0

    invoke-direct {p0, p1}, Lcom/android/internal/telephony/HWGlobalMode;->inAClassLand(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Lcom/android/internal/telephony/HWGlobalMode;->inBClassLand(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isAirplaneModeOn()Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/android/internal/telephony/HWGlobalMode;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "airplane_mode_on"

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    move v0, v1

    goto :goto_0
.end method

.method private process2ndSelNetwork()V
    .locals 14

    .prologue
    const/16 v13, 0x29

    const/4 v12, 0x0

    const/4 v11, 0x1

    const/4 v10, 0x2

    const/4 v0, 0x1

    .local v0, bsub1Change:Z
    const/4 v1, 0x1

    .local v1, bsub2Change:Z
    const/4 v2, -0x1

    .local v2, dualCardMode:I
    :try_start_0
    iget-object v7, p0, Lcom/android/internal/telephony/HWGlobalMode;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    const-string v8, "always_show_roaming_mode_selection"

    const/4 v9, 0x0

    invoke-static {v7, v8, v9}, Landroid/provider/SettingsEx$Systemex;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v4

    .local v4, n2SelNet:I
    if-ne v11, v4, :cond_0

    iget-object v7, p0, Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v8, "Avoid 2nd Sel network process for R&D test!"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v4           #n2SelNet:I
    :goto_0
    return-void

    :catch_0
    move-exception v3

    .local v3, ex:Ljava/lang/Exception;
    iget-object v7, p0, Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Exception happen, exception = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .end local v3           #ex:Ljava/lang/Exception;
    :cond_0
    iget-boolean v7, p0, Lcom/android/internal/telephony/HWGlobalMode;->bSupport2ndSelNet:Z

    if-nez v7, :cond_1

    iget-object v7, p0, Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v8, "Don\'t support 2nd Sel Network process!"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getDefault()Lcom/huawei/telephony/HuaweiTelephonyManager;

    invoke-static {}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getDefault()Lcom/huawei/telephony/HuaweiTelephonyManager;

    move-result-object v7

    invoke-virtual {v7, v12}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getCardType(I)I

    move-result v7

    if-ne v13, v7, :cond_2

    invoke-static {}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getDefault()Lcom/huawei/telephony/HuaweiTelephonyManager;

    iput v13, p0, Lcom/android/internal/telephony/HWGlobalMode;->mCardType:I

    :cond_2
    invoke-static {}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getDefault()Lcom/huawei/telephony/HuaweiTelephonyManager;

    iget v7, p0, Lcom/android/internal/telephony/HWGlobalMode;->mCardType:I

    if-eq v13, v7, :cond_3

    iget-object v7, p0, Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "card is not CT international roaming dual mode Card, card is "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getDefault()Lcom/huawei/telephony/HuaweiTelephonyManager;

    move-result-object v9

    invoke-virtual {v9, v12}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getCardType(I)I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_3
    invoke-direct {p0}, Lcom/android/internal/telephony/HWGlobalMode;->isAirplaneModeOn()Z

    move-result v7

    if-eqz v7, :cond_4

    iget-object v7, p0, Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v8, "air plane mode on, return"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_4
    const-string v7, "gsm.globalmode.plmn.cdma"

    const-string v8, ""

    invoke-static {v7, v8}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .local v5, plmn1:Ljava/lang/String;
    const-string v7, "gsm.globalmode.plmn.gsm"

    const-string v8, ""

    invoke-static {v7, v8}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .local v6, plmn2:Ljava/lang/String;
    const-string v7, ""

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    const/4 v5, 0x0

    :cond_5
    const-string v7, ""

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    const/4 v6, 0x0

    :cond_6
    iget-object v7, p0, Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Received ACTION_START_SEC_NET_SEL, plmn_cdma = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", plmn_gsm = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v7, p0, Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Received ACTION_START_SEC_NET_SEL, last_cdma = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/android/internal/telephony/HWGlobalMode;->mLastPlmn1:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", last_gsm = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/android/internal/telephony/HWGlobalMode;->mLastPlmn2:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0, v5, v6}, Lcom/android/internal/telephony/HWGlobalMode;->updateAreaClass(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v7, p0, Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "area class = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/android/internal/telephony/HWGlobalMode;->mAreaClass:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v5, :cond_7

    iget-object v7, p0, Lcom/android/internal/telephony/HWGlobalMode;->mLastPlmn1:Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_8

    :cond_7
    if-nez v5, :cond_9

    iget-object v7, p0, Lcom/android/internal/telephony/HWGlobalMode;->mLastPlmn1:Ljava/lang/String;

    if-nez v7, :cond_9

    :cond_8
    const/4 v0, 0x0

    :cond_9
    if-eqz v6, :cond_a

    iget-object v7, p0, Lcom/android/internal/telephony/HWGlobalMode;->mLastPlmn2:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_b

    :cond_a
    if-nez v6, :cond_c

    iget-object v7, p0, Lcom/android/internal/telephony/HWGlobalMode;->mLastPlmn2:Ljava/lang/String;

    if-nez v7, :cond_c

    :cond_b
    const/4 v1, 0x0

    :cond_c
    if-nez v0, :cond_d

    if-nez v1, :cond_d

    iget-object v7, p0, Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v8, "both plmn not changed, so don\'t do 2ndselNetwork!"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :cond_d
    invoke-static {}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getDefault()Lcom/huawei/telephony/HuaweiTelephonyManager;

    move-result-object v7

    invoke-virtual {v7}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getDualCardMode()I

    move-result v2

    iget-object v7, p0, Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "dual card mode = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v7, p0, Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v8, "begin to process 2nd-sel-network!"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-object v5, p0, Lcom/android/internal/telephony/HWGlobalMode;->mLastPlmn1:Ljava/lang/String;

    iput-object v6, p0, Lcom/android/internal/telephony/HWGlobalMode;->mLastPlmn2:Ljava/lang/String;

    if-nez v5, :cond_10

    if-nez v6, :cond_10

    iget-object v7, p0, Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v8, "no cdma or gsm signal"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eq v10, v2, :cond_e

    iget v7, p0, Lcom/android/internal/telephony/HWGlobalMode;->mAreaClass:I

    if-ne v11, v7, :cond_e

    iget-object v7, p0, Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v8, "a class land, card not global mode, confirm to global mode"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getDefault()Lcom/huawei/telephony/HuaweiTelephonyManager;

    move-result-object v7

    invoke-virtual {v7, v10}, Lcom/huawei/telephony/HuaweiTelephonyManager;->setDualCardMode(I)Z

    goto/16 :goto_0

    :cond_e
    if-eq v10, v2, :cond_f

    iget-object v7, p0, Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v8, "not a class land, card not global mode, popup to let user switch to global mode"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v7, "android.intent.action.CDMA_2ND_SEL_NET_SWITCH1"

    invoke-direct {p0, v7}, Lcom/android/internal/telephony/HWGlobalMode;->sendIntent2Upplayer(Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_f
    iget-object v7, p0, Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v8, "other case, do nothing for now design"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :cond_10
    if-eqz v5, :cond_12

    iget-object v7, p0, Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v8, "only cdma signal"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v7, p0, Lcom/android/internal/telephony/HWGlobalMode;->mAreaClass:I

    if-ne v11, v7, :cond_11

    if-eq v10, v2, :cond_11

    iget-object v7, p0, Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v8, "a class land, card not global mode, confirm to be global mode"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getDefault()Lcom/huawei/telephony/HuaweiTelephonyManager;

    move-result-object v7

    invoke-virtual {v7, v10}, Lcom/huawei/telephony/HuaweiTelephonyManager;->setDualCardMode(I)Z

    goto/16 :goto_0

    :cond_11
    iget-object v7, p0, Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v8, "other case, do nothing for now design"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :cond_12
    if-eqz v6, :cond_14

    iget-object v7, p0, Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v8, "only gsm signal"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v7, p0, Lcom/android/internal/telephony/HWGlobalMode;->mAreaClass:I

    if-ne v11, v7, :cond_13

    if-eq v10, v2, :cond_13

    iget-object v7, p0, Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v8, "a class land, card not global mode, confirm to be global mode"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getDefault()Lcom/huawei/telephony/HuaweiTelephonyManager;

    move-result-object v7

    invoke-virtual {v7, v10}, Lcom/huawei/telephony/HuaweiTelephonyManager;->setDualCardMode(I)Z

    goto/16 :goto_0

    :cond_13
    iget-object v7, p0, Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v8, "other case, do nothing for now design"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :cond_14
    iget-object v7, p0, Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v8, "impossible to enter this branch"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
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

    iget-object v1, p0, Lcom/android/internal/telephony/HWGlobalMode;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendStickyBroadcast(Landroid/content/Intent;)V

    return-void
.end method

.method private updateAreaClass(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .parameter "plmn1"
    .parameter "plmn2"

    .prologue
    const/4 v3, 0x3

    const/4 v2, 0x2

    const/4 v1, 0x1

    if-nez p1, :cond_0

    if-nez p2, :cond_0

    :goto_0
    return-void

    :cond_0
    if-eqz p1, :cond_3

    if-nez p2, :cond_3

    invoke-direct {p0, p1}, Lcom/android/internal/telephony/HWGlobalMode;->inAClassLand(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    iput v1, p0, Lcom/android/internal/telephony/HWGlobalMode;->mAreaClass:I

    goto :goto_0

    :cond_1
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/HWGlobalMode;->inBClassLand(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    iput v2, p0, Lcom/android/internal/telephony/HWGlobalMode;->mAreaClass:I

    goto :goto_0

    :cond_2
    iput v3, p0, Lcom/android/internal/telephony/HWGlobalMode;->mAreaClass:I

    goto :goto_0

    :cond_3
    if-nez p1, :cond_6

    if-eqz p2, :cond_6

    invoke-direct {p0, p2}, Lcom/android/internal/telephony/HWGlobalMode;->inAClassLand(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    iput v1, p0, Lcom/android/internal/telephony/HWGlobalMode;->mAreaClass:I

    goto :goto_0

    :cond_4
    invoke-direct {p0, p2}, Lcom/android/internal/telephony/HWGlobalMode;->inBClassLand(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    iput v2, p0, Lcom/android/internal/telephony/HWGlobalMode;->mAreaClass:I

    goto :goto_0

    :cond_5
    iput v3, p0, Lcom/android/internal/telephony/HWGlobalMode;->mAreaClass:I

    goto :goto_0

    :cond_6
    iget-object v0, p0, Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v1, "updateAreaClass, impossible to enter this branch"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5
    .parameter "msg"

    .prologue
    iget v2, p1, Landroid/os/Message;->what:I

    packed-switch v2, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    :try_start_0
    iget-object v2, p0, Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v3, "EVENT_DELAY_RECEIVE_INTENT"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v1, Landroid/content/IntentFilter;

    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .local v1, filter:Landroid/content/IntentFilter;
    const-string v2, "android.intent.action.START_SEC_NET_SEL"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/android/internal/telephony/HWGlobalMode;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/android/internal/telephony/HWGlobalMode;->mSecNetSelIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v2, v3, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/internal/telephony/HWGlobalMode;->mIsSecNetSelReceiverRegistered:Z

    iget-object v2, p0, Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;

    const-string v3, "start receive ACTION_START_SEC_NET_SEL"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .end local v1           #filter:Landroid/content/IntentFilter;
    :catch_0
    move-exception v0

    .local v0, ex:Ljava/lang/Exception;
    iget-object v2, p0, Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception happen, exception = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
