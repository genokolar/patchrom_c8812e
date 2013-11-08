.class public Lcom/huawei/telephony/HuaweiTelephonyManager;
.super Ljava/lang/Object;
.source "HuaweiTelephonyManager.java"


# static fields
.field private static final CDMA_AND_HDR_ONLY:I = 0x13

.field public static final CT_NATIONAL_ROAMING_CARD:I = 0x29

.field public static final CU_DUAL_MODE_CARD:I = 0x2a

.field private static final DUAL_CARD_MODE_CDMA:I = 0x0

.field private static final DUAL_CARD_MODE_GLOBAL:I = 0x2

.field private static final DUAL_CARD_MODE_GSM:I = 0x1

.field public static final DUAL_MODE_CG_CARD:I = 0x28

.field public static final DUAL_MODE_UG_CARD:I = 0x32

.field private static final GSM_ONLY:I = 0xd

.field public static final SINGLE_MODE_RUIM_CARD:I = 0x1e

.field public static final SINGLE_MODE_SIM_CARD:I = 0xa

.field public static final SINGLE_MODE_USIM_CARD:I = 0x14

.field private static final TAG:Ljava/lang/String; = "HuaweiTelephonyManager"

.field public static final UNKNOWN_CARD:I = -0x1

.field protected static final isHuaweiDSDA:Z

.field private static isHwDSDAEnabled:Z

.field private static isMultiSimEnabled:Z

.field private static sInstance:Lcom/huawei/telephony/HuaweiTelephonyManager;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/telephony/MSimTelephonyManager;->isMultiSimEnabled()Z

    move-result v0

    sput-boolean v0, Lcom/huawei/telephony/HuaweiTelephonyManager;->isMultiSimEnabled:Z

    const-string v0, "ro.config.hw_dsda"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/huawei/telephony/HuaweiTelephonyManager;->isHwDSDAEnabled:Z

    new-instance v0, Lcom/huawei/telephony/HuaweiTelephonyManager;

    invoke-direct {v0}, Lcom/huawei/telephony/HuaweiTelephonyManager;-><init>()V

    sput-object v0, Lcom/huawei/telephony/HuaweiTelephonyManager;->sInstance:Lcom/huawei/telephony/HuaweiTelephonyManager;

    const-string v0, "ro.config.hw_dsda"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/huawei/telephony/HuaweiTelephonyManager;->isHuaweiDSDA:Z

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDefault()Lcom/huawei/telephony/HuaweiTelephonyManager;
    .locals 1

    .prologue
    sget-object v0, Lcom/huawei/telephony/HuaweiTelephonyManager;->sInstance:Lcom/huawei/telephony/HuaweiTelephonyManager;

    return-object v0
.end method

.method private getIHuaweiTelephony()Lcom/huawei/telephony/msim/IHuaweiTelephony;
    .locals 1

    .prologue
    const-string v0, "huaweiphone"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    invoke-static {v0}, Lcom/huawei/telephony/msim/IHuaweiTelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/huawei/telephony/msim/IHuaweiTelephony;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public ATDirectChannel(Ljava/lang/String;)[Ljava/lang/String;
    .locals 6
    .parameter "ATCommand"

    .prologue
    const/4 v3, 0x1

    new-array v1, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "0"

    aput-object v4, v1, v3

    .local v1, response:[Ljava/lang/String;
    :try_start_0
    invoke-direct {p0}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getIHuaweiTelephony()Lcom/huawei/telephony/msim/IHuaweiTelephony;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-direct {p0}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getIHuaweiTelephony()Lcom/huawei/telephony/msim/IHuaweiTelephony;

    move-result-object v3

    invoke-interface {v3, p1}, Lcom/huawei/telephony/msim/IHuaweiTelephony;->ATDirectChannel(Ljava/lang/String;)[Ljava/lang/String;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v1

    :cond_0
    move-object v2, v1

    .end local v1           #response:[Ljava/lang/String;
    .local v2, response:[Ljava/lang/String;
    :goto_0
    return-object v2

    .end local v2           #response:[Ljava/lang/String;
    .restart local v1       #response:[Ljava/lang/String;
    :catch_0
    move-exception v0

    .local v0, ex:Landroid/os/RemoteException;
    const-string v3, "HuaweiTelephonyManager"

    const-string v4, "ATDirectChannel remoteException"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .end local v0           #ex:Landroid/os/RemoteException;
    :goto_1
    move-object v2, v1

    .end local v1           #response:[Ljava/lang/String;
    .restart local v2       #response:[Ljava/lang/String;
    goto :goto_0

    .end local v2           #response:[Ljava/lang/String;
    .restart local v1       #response:[Ljava/lang/String;
    :catch_1
    move-exception v0

    .local v0, ex:Ljava/lang/NullPointerException;
    const-string v3, "HuaweiTelephonyManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "ATDirectChannel NullPointerException ="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public clearPreferedApnId()V
    .locals 3

    .prologue
    const-string v1, "HuaweiTelephonyManager"

    const-string v2, "clearPreferedApnId"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    invoke-direct {p0}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getIHuaweiTelephony()Lcom/huawei/telephony/msim/IHuaweiTelephony;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-direct {p0}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getIHuaweiTelephony()Lcom/huawei/telephony/msim/IHuaweiTelephony;

    move-result-object v1

    invoke-interface {v1}, Lcom/huawei/telephony/msim/IHuaweiTelephony;->clearPreferedApnId()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    .local v0, ex:Ljava/lang/Exception;
    const-string v1, "HuaweiTelephonyManager"

    const-string v2, "Got an exception when clearPreferedApnId."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public getCardType(I)I
    .locals 6
    .parameter "slotId"

    .prologue
    const/4 v5, 0x1

    const/4 v2, -0x1

    sget-boolean v3, Lcom/huawei/telephony/HuaweiTelephonyManager;->isHuaweiDSDA:Z

    if-eqz v3, :cond_2

    :try_start_0
    invoke-direct {p0}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getIHuaweiTelephony()Lcom/huawei/telephony/msim/IHuaweiTelephony;

    move-result-object v3

    if-eqz v3, :cond_1

    invoke-direct {p0}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getIHuaweiTelephony()Lcom/huawei/telephony/msim/IHuaweiTelephony;

    move-result-object v3

    invoke-interface {v3, p1}, Lcom/huawei/telephony/msim/IHuaweiTelephony;->getCardType(I)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    :cond_0
    :goto_0
    return v2

    :catch_0
    move-exception v1

    .local v1, ex:Ljava/lang/Exception;
    const-string v3, "HuaweiTelephonyManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getCardType Exception ="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .end local v1           #ex:Ljava/lang/Exception;
    :cond_1
    const-string v3, "HuaweiTelephonyManager"

    const-string v4, "getCardType getIHuaweiTelephony = null"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_2
    const/4 v3, 0x2

    new-array v0, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "gsm.sim1.type"

    aput-object v4, v0, v3

    const-string v3, "gsm.sim2.type"

    aput-object v3, v0, v5

    .local v0, card_type_prop:[Ljava/lang/String;
    if-eqz p1, :cond_3

    if-ne p1, v5, :cond_0

    :cond_3
    aget-object v3, v0, p1

    invoke-static {v3, v2}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v2

    goto :goto_0
.end method

.method public getDSDARadioState(I)Z
    .locals 5
    .parameter "subId"

    .prologue
    const/4 v1, 0x0

    :try_start_0
    invoke-direct {p0}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getIHuaweiTelephony()Lcom/huawei/telephony/msim/IHuaweiTelephony;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-direct {p0}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getIHuaweiTelephony()Lcom/huawei/telephony/msim/IHuaweiTelephony;

    move-result-object v2

    invoke-interface {v2, p1}, Lcom/huawei/telephony/msim/IHuaweiTelephony;->getDSDARadioState(I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    :goto_0
    return v1

    :catch_0
    move-exception v0

    .local v0, ex:Ljava/lang/Exception;
    const-string v2, "HuaweiTelephonyManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getDSDARadioState Exception ="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .end local v0           #ex:Ljava/lang/Exception;
    :cond_0
    const-string v2, "HuaweiTelephonyManager"

    const-string v3, "getDSDARadioState getIHuaweiTelephony=null"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public getDemoString()Ljava/lang/String;
    .locals 1

    .prologue
    const-string v0, ""

    return-object v0
.end method

.method public getDemoStringAsync(Lcom/huawei/telephony/msim/IPhoneCallback;)V
    .locals 3
    .parameter "callback"

    .prologue
    const-string v1, "HuaweiTelephonyManager"

    const-string v2, "getDemoStringAsync in"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    invoke-direct {p0}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getIHuaweiTelephony()Lcom/huawei/telephony/msim/IHuaweiTelephony;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-direct {p0}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getIHuaweiTelephony()Lcom/huawei/telephony/msim/IHuaweiTelephony;

    move-result-object v1

    invoke-interface {v1, p1}, Lcom/huawei/telephony/msim/IHuaweiTelephony;->getDemoStringAsync(Lcom/huawei/telephony/msim/IPhoneCallback;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    .local v0, ex:Landroid/os/RemoteException;
    const-string v1, "HuaweiTelephonyManager"

    const-string v2, "getDemoStringAsync remoteException"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public getDualCardMode()I
    .locals 7

    .prologue
    const/4 v3, -0x1

    const/4 v1, -0x1

    .local v1, cardSwitchMode:S
    const/4 v0, -0x1

    .local v0, cardPrefMode:S
    const/4 v2, 0x0

    .local v2, setResult:Z
    invoke-virtual {p0}, Lcom/huawei/telephony/HuaweiTelephonyManager;->isMultiSimEnabled()Z

    move-result v4

    if-eqz v4, :cond_0

    sget-boolean v4, Lcom/huawei/telephony/HuaweiTelephonyManager;->isHwDSDAEnabled:Z

    if-eqz v4, :cond_0

    const-string v3, "persist.radio.hw.ctmode"

    const/4 v4, 0x0

    invoke-static {v3, v4}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v3

    int-to-short v1, v3

    const-string v3, "HuaweiTelephonyManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getDualCardMode  "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v3, v1

    :goto_0
    return v3

    :cond_0
    invoke-virtual {p0}, Lcom/huawei/telephony/HuaweiTelephonyManager;->isMultiSimEnabled()Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, "persist.radio.hw.ctmode"

    invoke-static {v4, v3}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v3

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/huawei/android/hwnv/HWNVFuncation;->getCardSwitchMode()B

    move-result v4

    int-to-short v1, v4

    if-eqz v1, :cond_2

    const/4 v4, 0x1

    if-eq v1, v4, :cond_2

    const-string v4, "HuaweiTelephonyManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "getCardSwitchMode "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " error"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_2
    move v3, v1

    goto :goto_0
.end method

.method public getEsn()Ljava/lang/String;
    .locals 3

    .prologue
    const/4 v0, 0x0

    .local v0, esnStr:Ljava/lang/String;
    :try_start_0
    invoke-direct {p0}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getIHuaweiTelephony()Lcom/huawei/telephony/msim/IHuaweiTelephony;

    move-result-object v2

    invoke-interface {v2}, Lcom/huawei/telephony/msim/IHuaweiTelephony;->getEsn()Ljava/lang/String;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    :goto_0
    return-object v0

    :catch_0
    move-exception v1

    .local v1, ex:Landroid/os/RemoteException;
    const/4 v0, 0x0

    goto :goto_0

    .end local v1           #ex:Landroid/os/RemoteException;
    :catch_1
    move-exception v1

    .local v1, ex:Ljava/lang/NullPointerException;
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getMin()Ljava/lang/String;
    .locals 3

    .prologue
    const/4 v1, 0x0

    .local v1, mString:Ljava/lang/String;
    :try_start_0
    invoke-direct {p0}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getIHuaweiTelephony()Lcom/huawei/telephony/msim/IHuaweiTelephony;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-direct {p0}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getIHuaweiTelephony()Lcom/huawei/telephony/msim/IHuaweiTelephony;

    move-result-object v2

    invoke-interface {v2}, Lcom/huawei/telephony/msim/IHuaweiTelephony;->getMin()Ljava/lang/String;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v1

    :cond_0
    :goto_0
    return-object v1

    :catch_0
    move-exception v0

    .local v0, ex:Landroid/os/RemoteException;
    const/4 v1, 0x0

    goto :goto_0

    .end local v0           #ex:Landroid/os/RemoteException;
    :catch_1
    move-exception v0

    .local v0, ex:Ljava/lang/NullPointerException;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getSlotIdFromSubId(I)I
    .locals 5
    .parameter "subId"

    .prologue
    const/4 v1, -0x1

    :try_start_0
    invoke-direct {p0}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getIHuaweiTelephony()Lcom/huawei/telephony/msim/IHuaweiTelephony;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-direct {p0}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getIHuaweiTelephony()Lcom/huawei/telephony/msim/IHuaweiTelephony;

    move-result-object v2

    invoke-interface {v2, p1}, Lcom/huawei/telephony/msim/IHuaweiTelephony;->getSlotIdFromSubId(I)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v1

    :cond_0
    :goto_0
    return v1

    :catch_0
    move-exception v0

    .local v0, ex:Landroid/os/RemoteException;
    const-string v2, "HuaweiTelephonyManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getSlotIdFromSubId RemoteException ="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .end local v0           #ex:Landroid/os/RemoteException;
    :catch_1
    move-exception v0

    .local v0, ex:Ljava/lang/NullPointerException;
    const-string v2, "HuaweiTelephonyManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getSlotIdFromSubId NullPointerException ="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public getSubidFromSlotId(I)I
    .locals 5
    .parameter "slotId"

    .prologue
    const/4 v1, -0x1

    :try_start_0
    invoke-direct {p0}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getIHuaweiTelephony()Lcom/huawei/telephony/msim/IHuaweiTelephony;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-direct {p0}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getIHuaweiTelephony()Lcom/huawei/telephony/msim/IHuaweiTelephony;

    move-result-object v2

    invoke-interface {v2, p1}, Lcom/huawei/telephony/msim/IHuaweiTelephony;->getSubidFromSlotId(I)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v1

    :cond_0
    :goto_0
    return v1

    :catch_0
    move-exception v0

    .local v0, ex:Landroid/os/RemoteException;
    const-string v2, "HuaweiTelephonyManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getSubidFromSlotId RemoteException ="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .end local v0           #ex:Landroid/os/RemoteException;
    :catch_1
    move-exception v0

    .local v0, ex:Ljava/lang/NullPointerException;
    const-string v2, "HuaweiTelephonyManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getSubidFromSlotId NullPointerException ="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public isCTNationRoamingEnable()Z
    .locals 5

    .prologue
    const/4 v1, 0x0

    :try_start_0
    invoke-direct {p0}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getIHuaweiTelephony()Lcom/huawei/telephony/msim/IHuaweiTelephony;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-direct {p0}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getIHuaweiTelephony()Lcom/huawei/telephony/msim/IHuaweiTelephony;

    move-result-object v2

    invoke-interface {v2}, Lcom/huawei/telephony/msim/IHuaweiTelephony;->isCTNationRoamingEnable()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    :goto_0
    return v1

    :catch_0
    move-exception v0

    .local v0, ex:Ljava/lang/Exception;
    const-string v2, "HuaweiTelephonyManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isCTNationRoamingEnable Exception ="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .end local v0           #ex:Ljava/lang/Exception;
    :cond_0
    const-string v2, "HuaweiTelephonyManager"

    const-string v3, "isCTNationRoamingEnable getIHuaweiTelephony=null"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public isCardPresent(I)Z
    .locals 5
    .parameter "slotId"

    .prologue
    const/4 v1, 0x0

    :try_start_0
    invoke-direct {p0}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getIHuaweiTelephony()Lcom/huawei/telephony/msim/IHuaweiTelephony;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-direct {p0}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getIHuaweiTelephony()Lcom/huawei/telephony/msim/IHuaweiTelephony;

    move-result-object v2

    invoke-interface {v2, p1}, Lcom/huawei/telephony/msim/IHuaweiTelephony;->isCardPresent(I)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v1

    :cond_0
    :goto_0
    return v1

    :catch_0
    move-exception v0

    .local v0, ex:Landroid/os/RemoteException;
    const-string v2, "HuaweiTelephonyManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isCardPresent RemoteException ="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .end local v0           #ex:Landroid/os/RemoteException;
    :catch_1
    move-exception v0

    .local v0, ex:Ljava/lang/NullPointerException;
    const-string v2, "HuaweiTelephonyManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isCardPresent NullPointerException ="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public isMultiSimEnabled()Z
    .locals 1

    .prologue
    sget-boolean v0, Lcom/huawei/telephony/HuaweiTelephonyManager;->isMultiSimEnabled:Z

    return v0
.end method

.method public isSubActive(I)Z
    .locals 5
    .parameter "subId"

    .prologue
    const/4 v1, 0x0

    .local v1, result:Z
    :try_start_0
    invoke-direct {p0}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getIHuaweiTelephony()Lcom/huawei/telephony/msim/IHuaweiTelephony;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-direct {p0}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getIHuaweiTelephony()Lcom/huawei/telephony/msim/IHuaweiTelephony;

    move-result-object v2

    invoke-interface {v2, p1}, Lcom/huawei/telephony/msim/IHuaweiTelephony;->isSubActive(I)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v1

    :cond_0
    :goto_0
    return v1

    :catch_0
    move-exception v0

    .local v0, ex:Landroid/os/RemoteException;
    const-string v2, "HuaweiTelephonyManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isSubActive RemoteException ="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .end local v0           #ex:Landroid/os/RemoteException;
    :catch_1
    move-exception v0

    .local v0, ex:Ljava/lang/NullPointerException;
    const-string v2, "HuaweiTelephonyManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isSubActive NullPointerException ="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public mapDualCardSubID(I)I
    .locals 3
    .parameter "subscription"

    .prologue
    const-string v0, "HuaweiTelephonyManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mapDualCardSubID, input subscription = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-ltz p1, :cond_0

    const/4 v0, 0x2

    if-lt p1, v0, :cond_1

    :cond_0
    const-string v0, "HuaweiTelephonyManager"

    const-string v1, "invalid subscription!, force to 0"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    :cond_1
    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getDualCardMode()I

    move-result v1

    if-ne v0, v1, :cond_2

    sget-boolean v0, Lcom/huawei/telephony/HuaweiTelephonyManager;->isHwDSDAEnabled:Z

    if-eqz v0, :cond_2

    rsub-int/lit8 v0, p1, 0x2

    add-int/lit8 p1, v0, -0x1

    .end local p1
    :cond_2
    return p1
.end method

.method public rilMode2DualMode(I)S
    .locals 2
    .parameter "nRilMode"

    .prologue
    const/4 v1, 0x4

    if-eq v1, p1, :cond_0

    const/4 v1, 0x5

    if-eq v1, p1, :cond_0

    const/4 v1, 0x6

    if-ne v1, p1, :cond_1

    :cond_0
    const/4 v0, 0x0

    .local v0, dualMode:S
    :goto_0
    return v0

    .end local v0           #dualMode:S
    :cond_1
    const/4 v1, 0x1

    if-eq v1, p1, :cond_2

    const/4 v1, 0x3

    if-ne v1, p1, :cond_3

    :cond_2
    const/4 v0, 0x1

    .restart local v0       #dualMode:S
    goto :goto_0

    .end local v0           #dualMode:S
    :cond_3
    const/4 v1, 0x7

    if-ne v1, p1, :cond_4

    const/4 v0, 0x2

    .restart local v0       #dualMode:S
    goto :goto_0

    .end local v0           #dualMode:S
    :cond_4
    const/4 v0, -0x1

    .restart local v0       #dualMode:S
    goto :goto_0
.end method

.method public setDualCardMode(I)Z
    .locals 11
    .parameter "nMode"

    .prologue
    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v0, -0x1

    .local v0, dualCardMode:S
    const/4 v4, 0x0

    .local v4, sub1nwMode:I
    const/4 v5, 0x0

    .local v5, sub2nwMode:I
    const/4 v3, -0x1

    .local v3, nPrefMode:I
    const/4 v2, 0x0

    .local v2, huaweiTelephony:Lcom/huawei/telephony/msim/IHuaweiTelephony;
    invoke-direct {p0}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getIHuaweiTelephony()Lcom/huawei/telephony/msim/IHuaweiTelephony;

    move-result-object v2

    invoke-virtual {p0}, Lcom/huawei/telephony/HuaweiTelephonyManager;->clearPreferedApnId()V

    if-nez v2, :cond_0

    :goto_0
    return v6

    :cond_0
    if-nez p1, :cond_1

    const/4 v4, 0x4

    const/4 v5, 0x1

    const/16 v0, 0x13

    const/4 v3, 0x4

    :goto_1
    const-string v8, "HuaweiTelephonyManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "setDualCardMode, nMode="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-boolean v8, Lcom/huawei/telephony/HuaweiTelephonyManager;->isMultiSimEnabled:Z

    if-eqz v8, :cond_4

    sget-boolean v8, Lcom/huawei/telephony/HuaweiTelephonyManager;->isHwDSDAEnabled:Z

    if-eqz v8, :cond_4

    const/4 v6, 0x0

    :try_start_0
    invoke-interface {v2, v6, v4}, Lcom/huawei/telephony/msim/IHuaweiTelephony;->setPreferredNetworkMode(II)V

    const/4 v6, 0x1

    invoke-interface {v2, v6, v5}, Lcom/huawei/telephony/msim/IHuaweiTelephony;->setPreferredNetworkMode(II)V

    invoke-interface {v2, p1}, Lcom/huawei/telephony/msim/IHuaweiTelephony;->clearUserPrefWhenChangeMode(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_2
    const-string v6, "persist.radio.hw.ctmode"

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    move v6, v7

    goto :goto_0

    :cond_1
    if-ne v7, p1, :cond_2

    const/4 v4, 0x1

    const/4 v5, 0x4

    const/16 v0, 0xd

    const/4 v3, 0x1

    goto :goto_1

    :cond_2
    const/4 v8, 0x2

    if-ne v8, p1, :cond_3

    const/4 v3, 0x7

    const/4 v0, 0x4

    goto :goto_1

    :cond_3
    const-string v7, "HuaweiTelephonyManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "nMode = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", is error"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :catch_0
    move-exception v1

    .local v1, ex:Ljava/lang/Exception;
    const-string v6, "HuaweiTelephonyManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "clearUserPrefWhenChangeMode Exception ="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .end local v1           #ex:Ljava/lang/Exception;
    :cond_4
    sget-boolean v8, Lcom/huawei/telephony/HuaweiTelephonyManager;->isMultiSimEnabled:Z

    if-nez v8, :cond_5

    :try_start_1
    invoke-interface {v2, v3, p1}, Lcom/huawei/telephony/msim/IHuaweiTelephony;->setPreferredNetworks(II)Z

    invoke-static {v0}, Lcom/huawei/android/hwnv/HWNVFuncation;->setPrefMode(S)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move v6, v7

    goto/16 :goto_0

    :catch_1
    move-exception v1

    .restart local v1       #ex:Ljava/lang/Exception;
    const-string v7, "HuaweiTelephonyManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "setPreferredNetworks Exception ="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .end local v1           #ex:Ljava/lang/Exception;
    :cond_5
    int-to-byte v8, p1

    invoke-static {v8}, Lcom/huawei/android/hwnv/HWNVFuncation;->setCardSwitchMode(B)Z

    move-result v8

    if-ne v7, v8, :cond_6

    const-string v8, "HuaweiTelephonyManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "setCardSwitchMode "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " success"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v0}, Lcom/huawei/android/hwnv/HWNVFuncation;->setPrefMode(S)Z

    move-result v8

    if-ne v7, v8, :cond_7

    const-string v6, "HuaweiTelephonyManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "setPrefMode "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " success"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v6, v7

    goto/16 :goto_0

    :cond_6
    const-string v7, "HuaweiTelephonyManager"

    const-string v8, "setCardSwitchMode fail"

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :cond_7
    const-string v7, "HuaweiTelephonyManager"

    const-string v8, "setPrefMode fail"

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
.end method
