.class public Lcom/huawei/android/hwnv/HWNVFuncation;
.super Ljava/lang/Object;
.source "HWNVFuncation.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/huawei/android/hwnv/HWNVFuncation$1;,
        Lcom/huawei/android/hwnv/HWNVFuncation$BandClassType;
    }
.end annotation


# static fields
.field private static final BC10_BIT_MASK:S = 0x4000s

.field private static final MAX_GET_NV_SIZE:I = 0x7f

.field private static final MAX_NV_ESN_SIZE:B = 0x4t

.field private static final MAX_NV_IMEI_SIZE:B = 0x9t

.field private static final MAX_NV_MEID_SIZE:B = 0x8t

.field private static final MAX_NV_MIP_MAX_ACTIVE_VALUE:B = 0x5t

.field private static final MAX_NV_PPP_PASSWORD_TRANSPORT_SIZE:B = 0x78t

.field private static final MAX_NV_PPP_USER_TRANSPORT_SIZE:B = 0x78t

.field private static final MAX_NV_SEC_CODE_SIZE:B = 0x6t

.field private static final MAX_SET_NV_SIZE:I = 0x7d

.field private static final NV_BAND_PREF_32_63_SIZE:B = 0x5t

.field private static final NV_BAND_PREF_SIZE:B = 0x3t

.field private static final NV_ESN_ME_SIZE:B = 0x8t

.field private static final NV_RF_BC_CONFIG_SIZE:B = 0x8t

.field private static final PREFMODE_SIZE:B = 0x3t

.field private static final SECOND_TO_MILLISECOND_UNITS:I = 0x3e8

.field private static final SECURITY_AUTH_FAIL:B = -0x1t

.field private static final TAG:Ljava/lang/String; = "HWNVFuncation"

.field private static final enableVLog:Z = true


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    :try_start_0
    const-string v1, "hwnv"

    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .local v0, e:Ljava/lang/UnsatisfiedLinkError;
    :goto_0
    return-void

    .end local v0           #e:Ljava/lang/UnsatisfiedLinkError;
    :catch_0
    move-exception v0

    .restart local v0       #e:Ljava/lang/UnsatisfiedLinkError;
    const-string v1, "HWNVFuncation"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "may be can\'t load so."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getBCBandValue(I)I
    .locals 7
    .parameter "BCNvitem"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .local v3, nam:B
    const/4 v1, 0x0

    .local v1, bandPref:S
    const/4 v0, 0x0

    .local v0, RFBCConfig:I
    const/4 v4, 0x0

    .local v4, returnValue:I
    sparse-switch p0, :sswitch_data_0

    new-instance v5, Ljava/security/InvalidParameterException;

    const-string v6, "Invalid param"

    invoke-direct {v5, v6}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v5

    :sswitch_0
    :try_start_0
    invoke-static {v3}, Lcom/huawei/android/hwnv/HWNVFuncation;->getNVBandPref(B)S
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    move v4, v1

    :goto_0
    return v4

    :catch_0
    move-exception v2

    .local v2, e:Ljava/io/IOException;
    const-string v5, "HWNVFuncation"

    const-string v6, "getBCBandValue IOException"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v5, Ljava/io/IOException;

    const-string v6, "getNVBandPref failed"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .end local v2           #e:Ljava/io/IOException;
    :sswitch_1
    :try_start_1
    invoke-static {v3}, Lcom/huawei/android/hwnv/HWNVFuncation;->getNVBandPref1631(B)S
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v1

    move v4, v1

    goto :goto_0

    :catch_1
    move-exception v2

    .restart local v2       #e:Ljava/io/IOException;
    const-string v5, "HWNVFuncation"

    const-string v6, "getBCBandValue IOException"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v5, Ljava/io/IOException;

    const-string v6, "getNVBandPref failed"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .end local v2           #e:Ljava/io/IOException;
    :sswitch_2
    :try_start_2
    invoke-static {v3}, Lcom/huawei/android/hwnv/HWNVFuncation;->getNVBandPref3263(B)I
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    move-result v0

    move v4, v0

    goto :goto_0

    :catch_2
    move-exception v2

    .restart local v2       #e:Ljava/io/IOException;
    const-string v5, "HWNVFuncation"

    const-string v6, "getBCBandValue IOException"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v5, Ljava/io/IOException;

    const-string v6, "getNVBandPref failed"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    nop

    :sswitch_data_0
    .sparse-switch
        0x1b9 -> :sswitch_0
        0x3b2 -> :sswitch_1
        0xb8a -> :sswitch_2
    .end sparse-switch
.end method

.method public static getBCSupport(Lcom/huawei/android/hwnv/HWNVFuncation$BandClassType;)Z
    .locals 7
    .parameter "BCValue"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/InvalidParameterException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .local v0, BCMask:I
    const/4 v2, 0x0

    .local v2, band:I
    const-string v4, "HWNVFuncation"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "getBCSupport BCValue =  "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    invoke-static {p0}, Lcom/huawei/android/hwnv/HWNVFuncation;->getBandClassNVType(Lcom/huawei/android/hwnv/HWNVFuncation$BandClassType;)I

    move-result v1

    .local v1, BCNvitem:I
    invoke-static {p0}, Lcom/huawei/android/hwnv/HWNVFuncation;->getBandClassMask(Lcom/huawei/android/hwnv/HWNVFuncation$BandClassType;)I

    move-result v0

    const-string v4, "HWNVFuncation"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "getBCSupport BCNvitem = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " BCMask = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v1}, Lcom/huawei/android/hwnv/HWNVFuncation;->getBCBandValue(I)I
    :try_end_0
    .catch Ljava/security/InvalidParameterException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v2

    and-int v4, v2, v0

    if-eqz v4, :cond_0

    const/4 v4, 0x1

    :goto_0
    return v4

    .end local v1           #BCNvitem:I
    :catch_0
    move-exception v3

    .local v3, e:Ljava/security/InvalidParameterException;
    const-string v4, "HWNVFuncation"

    const-string v5, "getBCSupport InvalidParameterException"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v4, Ljava/security/InvalidParameterException;

    const-string v5, "Invalid param"

    invoke-direct {v4, v5}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v4

    .end local v3           #e:Ljava/security/InvalidParameterException;
    :catch_1
    move-exception v3

    .local v3, e:Ljava/io/IOException;
    const-string v4, "HWNVFuncation"

    const-string v5, "getBCSupport IOException"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v4, Ljava/io/IOException;

    const-string v5, "get nv failed"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .end local v3           #e:Ljava/io/IOException;
    .restart local v1       #BCNvitem:I
    :cond_0
    const/4 v4, 0x0

    goto :goto_0
.end method

.method private static getBandClassMask(Lcom/huawei/android/hwnv/HWNVFuncation$BandClassType;)I
    .locals 3
    .parameter "BandClass"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidParameterException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .local v0, returnValue:I
    sget-object v1, Lcom/huawei/android/hwnv/HWNVFuncation$1;->$SwitchMap$com$huawei$android$hwnv$HWNVFuncation$BandClassType:[I

    invoke-virtual {p0}, Lcom/huawei/android/hwnv/HWNVFuncation$BandClassType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    new-instance v1, Ljava/security/InvalidParameterException;

    const-string v2, "Invalid param"

    invoke-direct {v1, v2}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v1

    :pswitch_0
    const/16 v0, 0x4000

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method private static getBandClassNVType(Lcom/huawei/android/hwnv/HWNVFuncation$BandClassType;)I
    .locals 2
    .parameter "BandClass"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidParameterException;
        }
    .end annotation

    .prologue
    sget-object v0, Lcom/huawei/android/hwnv/HWNVFuncation$1;->$SwitchMap$com$huawei$android$hwnv$HWNVFuncation$BandClassType:[I

    invoke-virtual {p0}, Lcom/huawei/android/hwnv/HWNVFuncation$BandClassType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    new-instance v0, Ljava/security/InvalidParameterException;

    const-string v1, "Invalid param"

    invoke-direct {v0, v1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    const/16 v0, 0x1b9

    return v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public static getCDMAPrlVersion()Ljava/lang/String;
    .locals 2

    .prologue
    const/4 v0, 0x0

    .local v0, prl:I
    invoke-static {}, Lcom/huawei/android/hwnv/HWNVFuncation;->getHwCDMAPrlVersion()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getCardSwitchMode()B
    .locals 5

    .prologue
    new-instance v3, Lcom/huawei/android/hwnv/NvByte;

    invoke-direct {v3}, Lcom/huawei/android/hwnv/NvByte;-><init>()V

    .local v3, out:Lcom/huawei/android/hwnv/NvByte;
    invoke-virtual {v3}, Lcom/huawei/android/hwnv/NvByte;->getNvSize()B

    move-result v2

    .local v2, nvSize:B
    new-array v0, v2, [B

    .local v0, buf:[B
    const v4, 0xea99

    invoke-static {v4, v2, v0}, Lcom/huawei/android/hwnv/HWNVFuncation;->getNV(IB[B)B

    :try_start_0
    invoke-virtual {v3, v0}, Lcom/huawei/android/hwnv/NvByte;->setNvByte([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    invoke-virtual {v3}, Lcom/huawei/android/hwnv/NvByte;->toDebugString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    iget-short v4, v3, Lcom/huawei/android/hwnv/NvByte;->mVal:S

    int-to-byte v4, v4

    return v4

    :catch_0
    move-exception v1

    .local v1, e:Ljava/io/IOException;
    const-string v4, "getCardSwitchMode: Error when setNvByte!"

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static getDsMobileIPRRPCode()I
    .locals 6

    .prologue
    const-string v4, "getDsMobileIPRRPCode"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    new-instance v3, Lcom/huawei/android/hwnv/NvByte;

    invoke-direct {v3}, Lcom/huawei/android/hwnv/NvByte;-><init>()V

    .local v3, out:Lcom/huawei/android/hwnv/NvByte;
    invoke-virtual {v3}, Lcom/huawei/android/hwnv/NvByte;->getNvSize()B

    move-result v2

    .local v2, nvSize:B
    new-array v0, v2, [B

    .local v0, buf:[B
    const v4, 0xea78

    invoke-static {v4, v2, v0}, Lcom/huawei/android/hwnv/HWNVFuncation;->getNV(IB[B)B

    :try_start_0
    invoke-virtual {v3, v0}, Lcom/huawei/android/hwnv/NvByte;->setNvByte([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    invoke-virtual {v3}, Lcom/huawei/android/hwnv/NvByte;->toDebugString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    iget-short v4, v3, Lcom/huawei/android/hwnv/NvByte;->mVal:S

    return v4

    :catch_0
    move-exception v1

    .local v1, e:Ljava/io/IOException;
    const-string v4, "getDsMobileIPRRPCode: Error when setNvByte!"

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected static native getFlag(IB[B)B
.end method

.method private static native getHwCDMAPrlVersion()I
.end method

.method protected static native getIDD(IB[B)B
.end method

.method public static getMipActiveProfile()B
    .locals 6

    .prologue
    const-string v4, "getMipActiveProfile"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    new-instance v3, Lcom/huawei/android/hwnv/NvByte;

    invoke-direct {v3}, Lcom/huawei/android/hwnv/NvByte;-><init>()V

    .local v3, out:Lcom/huawei/android/hwnv/NvByte;
    invoke-virtual {v3}, Lcom/huawei/android/hwnv/NvByte;->getNvSize()B

    move-result v2

    .local v2, nvSize:B
    new-array v0, v2, [B

    .local v0, buf:[B
    const/16 v4, 0x1d0

    invoke-static {v4, v2, v0}, Lcom/huawei/android/hwnv/HWNVFuncation;->getNV(IB[B)B

    :try_start_0
    invoke-virtual {v3, v0}, Lcom/huawei/android/hwnv/NvByte;->setNvByte([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    invoke-virtual {v3}, Lcom/huawei/android/hwnv/NvByte;->toDebugString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    iget-short v4, v3, Lcom/huawei/android/hwnv/NvByte;->mVal:S

    int-to-byte v4, v4

    return v4

    :catch_0
    move-exception v1

    .local v1, e:Ljava/io/IOException;
    const-string v4, "getMipActiveProfile: Error when setNvByte!"

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static getMipGenUserProf(Lcom/huawei/android/hwnv/MipGenUserProfType;I)Z
    .locals 7
    .parameter "mipUser"
    .parameter "index"

    .prologue
    const/4 v3, 0x0

    const-string v4, "getMipGenUserProf"

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    if-ltz p1, :cond_0

    const/4 v4, 0x6

    if-gt v4, p1, :cond_1

    :cond_0
    const-string v4, "HWNVFuncation"

    const-string v5, "getMipGenUserProf Invalid index"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return v3

    :cond_1
    :try_start_0
    invoke-virtual {p0}, Lcom/huawei/android/hwnv/MipGenUserProfType;->getNvSize()B

    move-result v2

    .local v2, nvSize:B
    new-array v0, v2, [B

    .local v0, buf:[B
    const/4 v4, 0x0

    int-to-byte v5, p1

    aput-byte v5, v0, v4

    const-string v4, "HWNVFuncation"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "getMipGenUserProf  index = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x0

    aget-byte v6, v0, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v4, 0x1d1

    invoke-static {v4, v2, v0}, Lcom/huawei/android/hwnv/HWNVFuncation;->getNV(IB[B)B

    invoke-virtual {p0, v0}, Lcom/huawei/android/hwnv/MipGenUserProfType;->setMipGenUserProfType([B)V

    invoke-virtual {p0}, Lcom/huawei/android/hwnv/MipGenUserProfType;->toDebugString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v3, 0x1

    goto :goto_0

    .end local v0           #buf:[B
    .end local v2           #nvSize:B
    :catch_0
    move-exception v1

    .local v1, e:Ljava/io/IOException;
    const-string v4, "HWNVFuncation"

    const-string v5, "getMipGenUserProf IOException"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static getMipTetheredNaiProf(BLcom/huawei/android/hwnv/MipTetheredNaiType;)Z
    .locals 7
    .parameter "index"
    .parameter "tetheredNai"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const-string v4, "getMipTetheredNaiProf"

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    if-ltz p0, :cond_0

    const/4 v4, 0x6

    if-gt v4, p0, :cond_1

    :cond_0
    const-string v4, "HWNVFuncation"

    const-string v5, "getMipTetheredNaiProf Invalid index"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return v3

    :cond_1
    :try_start_0
    invoke-virtual {p1}, Lcom/huawei/android/hwnv/MipTetheredNaiType;->getNvSize()B

    move-result v2

    .local v2, nvSize:B
    new-array v0, v2, [B

    .local v0, buf:[B
    const/4 v4, 0x0

    aput-byte p0, v0, v4

    const-string v4, "HWNVFuncation"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "getMipTetheredNaiProf index = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x0

    aget-byte v6, v0, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v4, 0xb09

    invoke-static {v4, v2, v0}, Lcom/huawei/android/hwnv/HWNVFuncation;->getNV(IB[B)B

    invoke-virtual {p1, v0}, Lcom/huawei/android/hwnv/MipTetheredNaiType;->setMipTetheredNaiType([B)V

    invoke-virtual {p1}, Lcom/huawei/android/hwnv/MipTetheredNaiType;->toDebugString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v3, 0x1

    goto :goto_0

    .end local v0           #buf:[B
    .end local v2           #nvSize:B
    :catch_0
    move-exception v1

    .local v1, e:Ljava/io/IOException;
    goto :goto_0
.end method

.method private static native getNV(IB[B)B
.end method

.method public static getNVActivationDate()J
    .locals 6

    .prologue
    const-string v4, "getNVActivationDate"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    new-instance v3, Lcom/huawei/android/hwnv/NvInteger;

    invoke-direct {v3}, Lcom/huawei/android/hwnv/NvInteger;-><init>()V

    .local v3, out:Lcom/huawei/android/hwnv/NvInteger;
    invoke-virtual {v3}, Lcom/huawei/android/hwnv/NvInteger;->getNvSize()B

    move-result v2

    .local v2, nvSize:B
    new-array v0, v2, [B

    .local v0, buf:[B
    const v4, 0xea79

    invoke-static {v4, v2, v0}, Lcom/huawei/android/hwnv/HWNVFuncation;->getNV(IB[B)B

    :try_start_0
    invoke-virtual {v3, v0}, Lcom/huawei/android/hwnv/NvInteger;->setNvInteger([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    invoke-virtual {v3}, Lcom/huawei/android/hwnv/NvInteger;->toDebugString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    iget-wide v4, v3, Lcom/huawei/android/hwnv/NvInteger;->mVal:J

    return-wide v4

    :catch_0
    move-exception v1

    .local v1, e:Ljava/io/IOException;
    const-string v4, "getNVActivationDate: Error when setNvInteger!"

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static getNVActivationDateData()Ljava/util/Date;
    .locals 9

    .prologue
    const-string v4, "getNVActivationDateData"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    new-instance v3, Lcom/huawei/android/hwnv/NvInteger;

    invoke-direct {v3}, Lcom/huawei/android/hwnv/NvInteger;-><init>()V

    .local v3, out:Lcom/huawei/android/hwnv/NvInteger;
    invoke-virtual {v3}, Lcom/huawei/android/hwnv/NvInteger;->getNvSize()B

    move-result v2

    .local v2, nvSize:B
    new-array v0, v2, [B

    .local v0, buf:[B
    const v4, 0xea79

    invoke-static {v4, v2, v0}, Lcom/huawei/android/hwnv/HWNVFuncation;->getNV(IB[B)B

    :try_start_0
    invoke-virtual {v3, v0}, Lcom/huawei/android/hwnv/NvInteger;->setNvInteger([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    invoke-virtual {v3}, Lcom/huawei/android/hwnv/NvInteger;->toDebugString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    new-instance v4, Ljava/util/Date;

    iget-wide v5, v3, Lcom/huawei/android/hwnv/NvInteger;->mVal:J

    const-wide/16 v7, 0x3e8

    mul-long/2addr v5, v7

    invoke-direct {v4, v5, v6}, Ljava/util/Date;-><init>(J)V

    return-object v4

    :catch_0
    move-exception v1

    .local v1, e:Ljava/io/IOException;
    const-string v4, "getNVActivationDateData: Error when setNvInteger!"

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private static getNVBandPref(B)S
    .locals 5
    .parameter "nam"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x3

    new-array v0, v4, [B

    .local v0, buf:[B
    const/4 v3, 0x0

    aput-byte p0, v0, v3

    const/16 v3, 0x1b9

    invoke-static {v3, v4, v0}, Lcom/huawei/android/hwnv/HWNVFuncation;->getNV(IB[B)B

    move-result v2

    .local v2, mResult:B
    if-eqz v2, :cond_0

    const-string v3, "HWNVFuncation"

    const-string v4, "getNV: NV_BAND_PREF_I failed"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v3, Ljava/io/IOException;

    const-string v4, "getNV: NV_BAND_PREF_I failed"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_0
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    .local v1, buftmp:Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->get()B

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v3

    return v3
.end method

.method private static getNVBandPref1631(B)S
    .locals 5
    .parameter "nam"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x3

    new-array v0, v4, [B

    .local v0, buf:[B
    const/4 v3, 0x0

    aput-byte p0, v0, v3

    const/16 v3, 0x3b2

    invoke-static {v3, v4, v0}, Lcom/huawei/android/hwnv/HWNVFuncation;->getNV(IB[B)B

    move-result v2

    .local v2, mResult:B
    if-eqz v2, :cond_0

    const-string v3, "HWNVFuncation"

    const-string v4, "getNV: NV_BAND_PREF_16_31_I failed"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v3, Ljava/io/IOException;

    const-string v4, "getNV: NV_BAND_PREF_16_31_I failed"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_0
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    .local v1, buftmp:Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->get()B

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v3

    return v3
.end method

.method private static getNVBandPref3263(B)I
    .locals 5
    .parameter "nam"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x5

    new-array v0, v4, [B

    .local v0, buf:[B
    const/4 v3, 0x0

    aput-byte p0, v0, v3

    const/16 v3, 0xb8a

    invoke-static {v3, v4, v0}, Lcom/huawei/android/hwnv/HWNVFuncation;->getNV(IB[B)B

    move-result v2

    .local v2, mResult:B
    if-eqz v2, :cond_0

    const-string v3, "HWNVFuncation"

    const-string v4, "getNV: NV_BAND_PREF_32_63_I failed"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v3, Ljava/io/IOException;

    const-string v4, "getNV: NV_BAND_PREF_32_63_I failed"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_0
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    .local v1, buftmp:Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->get()B

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v3

    return v3
.end method

.method public static getNVCallLog(Lcom/huawei/android/hwnv/CallLogTypeInfo;)Z
    .locals 6
    .parameter "callLog"

    .prologue
    const/4 v3, 0x0

    const-string v4, "getNVCallLog"

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/huawei/android/hwnv/CallLogTypeInfo;->getNvSize()B

    move-result v2

    .local v2, nvSize:B
    new-array v0, v2, [B

    .local v0, buf:[B
    const v4, 0xea76

    invoke-static {v4, v2, v0}, Lcom/huawei/android/hwnv/HWNVFuncation;->getNV(IB[B)B

    move-result v1

    .local v1, mResult:B
    invoke-virtual {p0, v0}, Lcom/huawei/android/hwnv/CallLogTypeInfo;->setCallLogTypeInfo([B)V

    invoke-virtual {p0}, Lcom/huawei/android/hwnv/CallLogTypeInfo;->toDebugString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    if-nez v1, :cond_0

    const/4 v3, 0x1

    :cond_0
    return v3
.end method

.method public static getNVDirNumberPCS(Lcom/huawei/android/hwnv/DirNumberPCSInfo;)Z
    .locals 7
    .parameter "mobDirNumberInfo"

    .prologue
    const/4 v3, 0x0

    const-string v4, "getNVDirNumberPCS"

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/huawei/android/hwnv/DirNumberPCSInfo;->getNvSize()B

    move-result v2

    .local v2, nvSize:B
    new-array v0, v2, [B

    .local v0, buf:[B
    invoke-virtual {p0}, Lcom/huawei/android/hwnv/DirNumberPCSInfo;->getNam()B

    move-result v4

    aput-byte v4, v0, v3

    const-string v4, "HWNVFuncation"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "getNVDirNumberPCS nam = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-byte v6, v0, v3

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v4, 0xd7

    invoke-static {v4, v2, v0}, Lcom/huawei/android/hwnv/HWNVFuncation;->getNV(IB[B)B

    move-result v1

    .local v1, mResult:B
    invoke-virtual {p0, v0}, Lcom/huawei/android/hwnv/DirNumberPCSInfo;->setDirNumberPCSInfo([B)V

    invoke-virtual {p0}, Lcom/huawei/android/hwnv/DirNumberPCSInfo;->toDebugString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    if-nez v1, :cond_0

    const/4 v3, 0x1

    :cond_0
    return v3
.end method

.method public static getNVESN()Ljava/lang/String;
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x0

    const/4 v1, 0x0

    .local v1, i:B
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .local v2, strResult:Ljava/lang/StringBuffer;
    new-array v0, v6, [B

    .local v0, esn:[B
    const-string v3, "getNVESN"

    new-array v4, v5, [Ljava/lang/Object;

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    invoke-static {v5, v6, v0}, Lcom/huawei/android/hwnv/HWNVFuncation;->getNV(IB[B)B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    const/4 v1, 0x3

    :goto_0
    if-ltz v1, :cond_2

    const/4 v3, 0x1

    aget-byte v4, v0, v1

    and-int/lit16 v4, v4, 0xff

    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-ne v3, v4, :cond_0

    const/4 v3, 0x3

    if-eq v3, v1, :cond_1

    const/16 v3, 0x30

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    :cond_0
    aget-byte v3, v0, v1

    and-int/lit16 v3, v3, 0xff

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :goto_1
    add-int/lit8 v3, v1, -0x1

    int-to-byte v1, v3

    goto :goto_0

    :cond_1
    aget-byte v3, v0, v1

    if-nez v3, :cond_0

    goto :goto_1

    :cond_2
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static getNVHacMode()B
    .locals 6

    .prologue
    const-string v4, "getNVHacMode"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    new-instance v3, Lcom/huawei/android/hwnv/NvByte;

    invoke-direct {v3}, Lcom/huawei/android/hwnv/NvByte;-><init>()V

    .local v3, out:Lcom/huawei/android/hwnv/NvByte;
    invoke-virtual {v3}, Lcom/huawei/android/hwnv/NvByte;->getNvSize()B

    move-result v2

    .local v2, nvSize:B
    new-array v0, v2, [B

    .local v0, buf:[B
    const v4, 0xea74

    invoke-static {v4, v2, v0}, Lcom/huawei/android/hwnv/HWNVFuncation;->getNV(IB[B)B

    :try_start_0
    invoke-virtual {v3, v0}, Lcom/huawei/android/hwnv/NvByte;->setNvByte([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    invoke-virtual {v3}, Lcom/huawei/android/hwnv/NvByte;->toDebugString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    iget-short v4, v3, Lcom/huawei/android/hwnv/NvByte;->mVal:S

    int-to-byte v4, v4

    return v4

    :catch_0
    move-exception v1

    .local v1, e:Ljava/io/IOException;
    const-string v4, "getNVHacMode: Error when setNvByte!"

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static getNVIMEI()Ljava/lang/String;
    .locals 12

    .prologue
    const/4 v11, 0x0

    const/16 v10, 0x9

    const/4 v3, 0x0

    .local v3, i:B
    const/4 v2, 0x0

    .local v2, bcd_index:B
    const/4 v0, 0x0

    .local v0, ascii_index:B
    const/4 v6, 0x0

    .local v6, imei_bcd_len:B
    new-array v4, v10, [B

    .local v4, imei:[B
    const/16 v8, 0x10

    new-array v5, v8, [B

    .local v5, imei_ascii:[B
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    .local v7, strResult:Ljava/lang/StringBuffer;
    const-string v8, "getNVIMEI"

    new-array v9, v11, [Ljava/lang/Object;

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    const/16 v8, 0x226

    invoke-static {v8, v10, v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->getNV(IB[B)B

    invoke-static {v4}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    aget-byte v6, v4, v11

    if-nez v6, :cond_0

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    :goto_0
    return-object v8

    :cond_0
    if-ge v6, v10, :cond_3

    const/4 v2, 0x1

    move v1, v0

    .end local v0           #ascii_index:B
    .local v1, ascii_index:B
    :goto_1
    if-gt v2, v6, :cond_1

    add-int/lit8 v8, v1, 0x1

    int-to-byte v0, v8

    .end local v1           #ascii_index:B
    .restart local v0       #ascii_index:B
    aget-byte v8, v4, v2

    and-int/lit8 v8, v8, 0xf

    int-to-byte v8, v8

    aput-byte v8, v5, v1

    add-int/lit8 v8, v0, 0x1

    int-to-byte v1, v8

    .end local v0           #ascii_index:B
    .restart local v1       #ascii_index:B
    aget-byte v8, v4, v2

    and-int/lit16 v8, v8, 0xf0

    shr-int/lit8 v8, v8, 0x4

    int-to-byte v8, v8

    aput-byte v8, v5, v0

    add-int/lit8 v8, v2, 0x1

    int-to-byte v2, v8

    goto :goto_1

    :cond_1
    const/4 v3, 0x0

    :goto_2
    add-int/lit8 v8, v1, -0x1

    if-ge v3, v8, :cond_2

    add-int/lit8 v8, v3, 0x1

    aget-byte v8, v5, v8

    aput-byte v8, v5, v3

    aget-byte v8, v5, v3

    invoke-static {v8}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    add-int/lit8 v8, v3, 0x1

    int-to-byte v3, v8

    goto :goto_2

    :cond_2
    move v0, v1

    .end local v1           #ascii_index:B
    .restart local v0       #ascii_index:B
    :cond_3
    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    goto :goto_0
.end method

.method public static getNVInterface(IB[B)B
    .locals 2
    .parameter "nvItem"
    .parameter "nvSize"
    .parameter "buf"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidParameterException;
        }
    .end annotation

    .prologue
    const-string v0, "ro.config.hwnv_security"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    if-eqz p2, :cond_0

    if-lez p1, :cond_0

    const/16 v0, 0x7f

    if-ge v0, p1, :cond_1

    :cond_0
    new-instance v0, Ljava/security/InvalidParameterException;

    invoke-direct {v0}, Ljava/security/InvalidParameterException;-><init>()V

    throw v0

    :cond_1
    invoke-static {p0, p1, p2}, Lcom/huawei/android/hwnv/HWNVFuncation;->getNV(IB[B)B

    move-result v0

    :goto_0
    return v0

    :cond_2
    const-string v0, "Because the security problem, you are not allowed to do it!"

    invoke-static {v0}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    const/4 v0, -0x1

    goto :goto_0
.end method

.method public static getNVMEID()Ljava/lang/String;
    .locals 5

    .prologue
    const/16 v4, 0x8

    const/4 v0, 0x0

    .local v0, i:B
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .local v2, strResult:Ljava/lang/StringBuffer;
    new-array v1, v4, [B

    .local v1, meid:[B
    const/16 v3, 0x797

    invoke-static {v3, v4, v1}, Lcom/huawei/android/hwnv/HWNVFuncation;->getNV(IB[B)B

    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v1}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v3}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2

    const/4 v0, 0x7

    :goto_0
    if-ltz v0, :cond_3

    const/4 v3, 0x1

    aget-byte v4, v1, v0

    and-int/lit16 v4, v4, 0xff

    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-ne v3, v4, :cond_0

    const/4 v3, 0x7

    if-eq v3, v0, :cond_1

    const/16 v3, 0x30

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    :cond_0
    aget-byte v3, v1, v0

    and-int/lit16 v3, v3, 0xff

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :goto_1
    add-int/lit8 v3, v0, -0x1

    int-to-byte v0, v3

    goto :goto_0

    :cond_1
    aget-byte v3, v1, v0

    if-nez v3, :cond_0

    goto :goto_1

    :cond_2
    invoke-static {}, Lcom/huawei/android/hwnv/HWNVFuncation;->getNVESN()Ljava/lang/String;

    move-result-object v3

    :goto_2
    return-object v3

    :cond_3
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_2
.end method

.method private static getNVRFBCCONFIG()J
    .locals 5

    .prologue
    const/16 v4, 0x8

    new-array v0, v4, [B

    .local v0, buf:[B
    const/16 v3, 0x755

    invoke-static {v3, v4, v0}, Lcom/huawei/android/hwnv/HWNVFuncation;->getNV(IB[B)B

    move-result v2

    .local v2, mResult:B
    if-eqz v2, :cond_0

    const-string v3, "HWNVFuncation"

    const-string v4, "getNV:NV_RF_BC_CONFIG_I failed"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    .local v1, buftmp:Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v3

    return-wide v3
.end method

.method public static getNVRefurbishCounter(Lcom/huawei/android/hwnv/RefurbishTypeInfo;)Z
    .locals 6
    .parameter "refurbishInfo"

    .prologue
    const/4 v3, 0x0

    const-string v4, "getNVRefurbishCounter"

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/huawei/android/hwnv/RefurbishTypeInfo;->getNvSize()B

    move-result v2

    .local v2, nvSize:B
    new-array v0, v2, [B

    .local v0, buf:[B
    const v4, 0xea72

    invoke-static {v4, v2, v0}, Lcom/huawei/android/hwnv/HWNVFuncation;->getNV(IB[B)B

    move-result v1

    .local v1, mResult:B
    invoke-virtual {p0, v0}, Lcom/huawei/android/hwnv/RefurbishTypeInfo;->setRefurbishTypeInfo([B)V

    invoke-virtual {p0}, Lcom/huawei/android/hwnv/RefurbishTypeInfo;->toDebugString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    if-nez v1, :cond_0

    const/4 v3, 0x1

    :cond_0
    return v3
.end method

.method public static getNVSecCode([B)Z
    .locals 6
    .parameter "NvSecCodeTypeInfo"

    .prologue
    const/4 v5, 0x6

    const/4 v2, 0x0

    const-string v3, "getNVSecCode"

    new-array v4, v2, [Ljava/lang/Object;

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    array-length v3, p0

    if-lez v3, :cond_0

    array-length v3, p0

    if-ge v5, v3, :cond_2

    :cond_0
    const-string v3, "HWNVFuncation"

    const-string v4, "getNVSecCode: Invalid length"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    :goto_0
    return v2

    :cond_2
    const/16 v3, 0x55

    invoke-static {v3, v5, p0}, Lcom/huawei/android/hwnv/HWNVFuncation;->getNV(IB[B)B

    move-result v1

    .local v1, mResult:B
    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .local v0, buf:Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    if-nez v1, :cond_1

    const/4 v2, 0x1

    goto :goto_0
.end method

.method public static getNVSmsBcUserPref()B
    .locals 6

    .prologue
    const-string v4, "getNVSmsBcUserPref"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    new-instance v3, Lcom/huawei/android/hwnv/NvByte;

    invoke-direct {v3}, Lcom/huawei/android/hwnv/NvByte;-><init>()V

    .local v3, out:Lcom/huawei/android/hwnv/NvByte;
    invoke-virtual {v3}, Lcom/huawei/android/hwnv/NvByte;->getNvSize()B

    move-result v2

    .local v2, nvSize:B
    new-array v0, v2, [B

    .local v0, buf:[B
    const/16 v4, 0x177

    invoke-static {v4, v2, v0}, Lcom/huawei/android/hwnv/HWNVFuncation;->getNV(IB[B)B

    :try_start_0
    invoke-virtual {v3, v0}, Lcom/huawei/android/hwnv/NvByte;->setNvByte([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    invoke-virtual {v3}, Lcom/huawei/android/hwnv/NvByte;->toDebugString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    iget-short v4, v3, Lcom/huawei/android/hwnv/NvByte;->mVal:S

    int-to-byte v4, v4

    return v4

    :catch_0
    move-exception v1

    .local v1, e:Ljava/io/IOException;
    const-string v4, "getNVSmsBcUserPref: Error when setNvByte!"

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static getNVUIMDeviceID([B)Z
    .locals 6
    .parameter "uimDeviceID"

    .prologue
    const/16 v5, 0x8

    const/4 v2, 0x0

    const-string v3, "getNVUIMDeviceID"

    new-array v4, v2, [Ljava/lang/Object;

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    array-length v3, p0

    if-lez v3, :cond_0

    array-length v3, p0

    if-ge v5, v3, :cond_2

    :cond_0
    const-string v3, "HWNVFuncation"

    const-string v4, "getNVUIMDeviceID: Invalid length"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    :goto_0
    return v2

    :cond_2
    const v3, 0xea6b

    invoke-static {v3, v5, p0}, Lcom/huawei/android/hwnv/HWNVFuncation;->getNV(IB[B)B

    move-result v1

    .local v1, mResult:B
    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .local v0, buf:Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    if-nez v1, :cond_1

    const/4 v2, 0x1

    goto :goto_0
.end method

.method public static getNVWarrantyDate()J
    .locals 6

    .prologue
    const-string v4, "getNVWarrantyDate"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    new-instance v3, Lcom/huawei/android/hwnv/NvInteger;

    invoke-direct {v3}, Lcom/huawei/android/hwnv/NvInteger;-><init>()V

    .local v3, out:Lcom/huawei/android/hwnv/NvInteger;
    invoke-virtual {v3}, Lcom/huawei/android/hwnv/NvInteger;->getNvSize()B

    move-result v2

    .local v2, nvSize:B
    new-array v0, v2, [B

    .local v0, buf:[B
    const v4, 0xea71

    invoke-static {v4, v2, v0}, Lcom/huawei/android/hwnv/HWNVFuncation;->getNV(IB[B)B

    :try_start_0
    invoke-virtual {v3, v0}, Lcom/huawei/android/hwnv/NvInteger;->setNvInteger([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    invoke-virtual {v3}, Lcom/huawei/android/hwnv/NvInteger;->toDebugString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    iget-wide v4, v3, Lcom/huawei/android/hwnv/NvInteger;->mVal:J

    return-wide v4

    :catch_0
    move-exception v1

    .local v1, e:Ljava/lang/Exception;
    const-string v4, "getNVWarrantyDate: Error when setNvInteger!"

    invoke-static {v4}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static getPPPPassword([B)J
    .locals 7
    .parameter "pppPassword"

    .prologue
    const/16 v6, 0x78

    const/4 v5, 0x0

    const-string v3, "getPPPPassword"

    new-array v4, v5, [Ljava/lang/Object;

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    array-length v3, p0

    if-gtz v3, :cond_0

    const-string v3, "HWNVFuncation"

    const-string v4, "getPPPPassword: Invalid length"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    new-array v1, v6, [B

    .local v1, pppPasswordData:[B
    const/16 v3, 0x38a

    invoke-static {v3, v6, v1}, Lcom/huawei/android/hwnv/HWNVFuncation;->getNV(IB[B)B

    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .local v0, buf:Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    aget-byte v2, v1, v5

    .local v2, pppPasswordLen:B
    const/4 v3, 0x1

    invoke-static {v1, v3, p0, v5, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    int-to-long v3, v2

    return-wide v3
.end method

.method public static getPPPUser([B)J
    .locals 7
    .parameter "pppUser"

    .prologue
    const/16 v6, 0x78

    const/4 v5, 0x0

    const-string v3, "getPPPUser"

    new-array v4, v5, [Ljava/lang/Object;

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    array-length v3, p0

    if-gtz v3, :cond_0

    const-string v3, "HWNVFuncation"

    const-string v4, "getPPPUser: Invalid length"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    new-array v1, v6, [B

    .local v1, pppUserData:[B
    const/16 v3, 0x38e

    invoke-static {v3, v6, v1}, Lcom/huawei/android/hwnv/HWNVFuncation;->getNV(IB[B)B

    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .local v0, buf:Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    aget-byte v2, v1, v5

    .local v2, pppUserLen:B
    const/4 v3, 0x1

    invoke-static {v1, v3, p0, v5, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    int-to-long v3, v2

    return-wide v3
.end method

.method public static getPrefMode()S
    .locals 4

    .prologue
    const/4 v3, 0x3

    new-array v1, v3, [B

    .local v1, prefMode:[B
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .local v0, buf:Ljava/nio/ByteBuffer;
    const/16 v2, 0xa

    invoke-static {v2, v3, v1}, Lcom/huawei/android/hwnv/HWNVFuncation;->getNV(IB[B)B

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v2

    return v2
.end method

.method private static getRFBConfigBit(II)J
    .locals 5
    .parameter "BCNvitem"
    .parameter "mask"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidParameterException;
        }
    .end annotation

    .prologue
    const-wide/16 v0, 0x0

    .local v0, resValue:J
    sparse-switch p0, :sswitch_data_0

    new-instance v2, Ljava/security/InvalidParameterException;

    const-string v3, "Invalid param"

    invoke-direct {v2, v3}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v2

    :sswitch_0
    int-to-long v0, p1

    :goto_0
    return-wide v0

    :sswitch_1
    shl-int/lit8 v2, p1, 0x10

    int-to-long v0, v2

    goto :goto_0

    :sswitch_2
    int-to-long v2, p1

    const/16 v4, 0x20

    shl-long v0, v2, v4

    goto :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        0x1b9 -> :sswitch_0
        0x3b2 -> :sswitch_1
        0xb8a -> :sswitch_2
    .end sparse-switch
.end method

.method public static setBCSupport(Lcom/huawei/android/hwnv/HWNVFuncation$BandClassType;Z)Z
    .locals 13
    .parameter "BCValue"
    .parameter "setValue"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/InvalidParameterException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    const/4 v8, 0x0

    .local v8, nam:B
    const-wide/16 v2, 0x0

    .local v2, RFBCConfigValue:J
    const/4 v6, 0x0

    .local v6, bandClassValue:I
    const/4 v0, 0x0

    .local v0, BCMask:I
    const-wide/16 v4, 0x0

    .local v4, RFBCMask:J
    :try_start_0
    invoke-static {p0}, Lcom/huawei/android/hwnv/HWNVFuncation;->getBandClassNVType(Lcom/huawei/android/hwnv/HWNVFuncation$BandClassType;)I

    move-result v1

    .local v1, BCNvitem:I
    invoke-static {p0}, Lcom/huawei/android/hwnv/HWNVFuncation;->getBandClassMask(Lcom/huawei/android/hwnv/HWNVFuncation$BandClassType;)I

    move-result v0

    invoke-static {v1, v0}, Lcom/huawei/android/hwnv/HWNVFuncation;->getRFBConfigBit(II)J

    move-result-wide v4

    invoke-static {}, Lcom/huawei/android/hwnv/HWNVFuncation;->getNVRFBCCONFIG()J

    move-result-wide v2

    invoke-static {v1}, Lcom/huawei/android/hwnv/HWNVFuncation;->getBCBandValue(I)I
    :try_end_0
    .catch Ljava/security/InvalidParameterException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v6

    if-ne v10, p1, :cond_1

    or-int/2addr v6, v0

    or-long/2addr v2, v4

    :goto_0
    invoke-static {v2, v3}, Lcom/huawei/android/hwnv/HWNVFuncation;->setNVRFBCCONFIG(J)Z

    move-result v11

    if-nez v11, :cond_2

    :cond_0
    :goto_1
    return v9

    .end local v1           #BCNvitem:I
    :catch_0
    move-exception v7

    .local v7, e:Ljava/security/InvalidParameterException;
    const-string v9, "HWNVFuncation"

    const-string v10, "getBCSupport InvalidParameterException"

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v9, Ljava/security/InvalidParameterException;

    const-string v10, "Invalid param"

    invoke-direct {v9, v10}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v9

    .end local v7           #e:Ljava/security/InvalidParameterException;
    :catch_1
    move-exception v7

    .local v7, e:Ljava/io/IOException;
    const-string v9, "HWNVFuncation"

    const-string v10, "setBCSupport IOException"

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v9, Ljava/io/IOException;

    const-string v10, "get nv failed"

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9

    .end local v7           #e:Ljava/io/IOException;
    .restart local v1       #BCNvitem:I
    :cond_1
    xor-int/lit8 v11, v0, -0x1

    and-int/2addr v6, v11

    const-wide/16 v11, -0x1

    xor-long/2addr v11, v4

    and-long/2addr v2, v11

    goto :goto_0

    :cond_2
    sparse-switch v1, :sswitch_data_0

    new-instance v9, Ljava/security/InvalidParameterException;

    const-string v10, "Invalid param"

    invoke-direct {v9, v10}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v9

    :sswitch_0
    int-to-short v11, v6

    invoke-static {v8, v11}, Lcom/huawei/android/hwnv/HWNVFuncation;->setNVBandPref(BS)Z

    move-result v11

    if-eqz v11, :cond_0

    :cond_3
    move v9, v10

    goto :goto_1

    :sswitch_1
    int-to-short v11, v6

    invoke-static {v8, v11}, Lcom/huawei/android/hwnv/HWNVFuncation;->setNVBandPref1631(BS)Z

    move-result v11

    if-nez v11, :cond_3

    goto :goto_1

    :sswitch_2
    invoke-static {v8, v6}, Lcom/huawei/android/hwnv/HWNVFuncation;->setNVBandPref3263(BI)Z

    move-result v11

    if-nez v11, :cond_3

    goto :goto_1

    :sswitch_data_0
    .sparse-switch
        0x1b9 -> :sswitch_0
        0x3b2 -> :sswitch_1
        0xb8a -> :sswitch_2
    .end sparse-switch
.end method

.method public static setCardSwitchMode(B)Z
    .locals 4
    .parameter "value"

    .prologue
    new-instance v0, Lcom/huawei/android/hwnv/NvByte;

    int-to-short v1, p0

    invoke-direct {v0, v1}, Lcom/huawei/android/hwnv/NvByte;-><init>(S)V

    .local v0, out:Lcom/huawei/android/hwnv/NvByte;
    invoke-virtual {v0}, Lcom/huawei/android/hwnv/NvByte;->toDebugString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    const v1, 0xea99

    invoke-virtual {v0}, Lcom/huawei/android/hwnv/NvByte;->getNvSize()B

    move-result v2

    invoke-virtual {v0}, Lcom/huawei/android/hwnv/NvByte;->toByteArray()[B

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/huawei/android/hwnv/HWNVFuncation;->setNV(IB[B)Z

    move-result v1

    return v1
.end method

.method protected static native setFlag(IB[B)Z
.end method

.method public static setMipActiveProfile(B)Z
    .locals 5
    .parameter "value"

    .prologue
    const/4 v1, 0x0

    const-string v2, "setMipActiveProfile"

    new-array v3, v1, [Ljava/lang/Object;

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    if-ltz p0, :cond_0

    const/4 v2, 0x5

    if-le p0, v2, :cond_1

    :cond_0
    const-string v2, "HWNVFuncation"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "setMipActiveProfile Invalid value "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return v1

    :cond_1
    new-instance v0, Lcom/huawei/android/hwnv/NvByte;

    int-to-short v1, p0

    invoke-direct {v0, v1}, Lcom/huawei/android/hwnv/NvByte;-><init>(S)V

    .local v0, out:Lcom/huawei/android/hwnv/NvByte;
    invoke-virtual {v0}, Lcom/huawei/android/hwnv/NvByte;->toDebugString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    const/16 v1, 0x1d0

    invoke-virtual {v0}, Lcom/huawei/android/hwnv/NvByte;->getNvSize()B

    move-result v2

    invoke-virtual {v0}, Lcom/huawei/android/hwnv/NvByte;->toByteArray()[B

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/huawei/android/hwnv/HWNVFuncation;->setNV(IB[B)Z

    move-result v1

    goto :goto_0
.end method

.method public static setMipTetheredNaiProf(Lcom/huawei/android/hwnv/MipTetheredNaiType;)Z
    .locals 3
    .parameter "tetheredNai"

    .prologue
    const-string v0, "setMipTetheredNaiProf"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/huawei/android/hwnv/MipTetheredNaiType;->toDebugString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    const/16 v0, 0xb09

    invoke-virtual {p0}, Lcom/huawei/android/hwnv/MipTetheredNaiType;->getNvSize()B

    move-result v1

    invoke-virtual {p0}, Lcom/huawei/android/hwnv/MipTetheredNaiType;->toByteArray()[B

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/huawei/android/hwnv/HWNVFuncation;->setNV(IB[B)Z

    move-result v0

    return v0
.end method

.method private static native setNV(IB[B)Z
.end method

.method public static setNVAKey(Lcom/huawei/android/hwnv/AKeyTypeInfo;)Z
    .locals 3
    .parameter "aKeyInfo"

    .prologue
    const-string v0, "setNVAKey"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/huawei/android/hwnv/AKeyTypeInfo;->toDebugString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    const/16 v0, 0x19

    invoke-virtual {p0}, Lcom/huawei/android/hwnv/AKeyTypeInfo;->getAKeySize()B

    move-result v1

    invoke-virtual {p0}, Lcom/huawei/android/hwnv/AKeyTypeInfo;->toByteArray()[B

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/huawei/android/hwnv/HWNVFuncation;->setNV(IB[B)Z

    move-result v0

    return v0
.end method

.method public static setNVActivationDate(J)Z
    .locals 4
    .parameter "date"

    .prologue
    const-string v1, "setNVActivationDate"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    new-instance v0, Lcom/huawei/android/hwnv/NvInteger;

    invoke-direct {v0, p0, p1}, Lcom/huawei/android/hwnv/NvInteger;-><init>(J)V

    .local v0, out:Lcom/huawei/android/hwnv/NvInteger;
    invoke-virtual {v0}, Lcom/huawei/android/hwnv/NvInteger;->toDebugString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    const v1, 0xea79

    invoke-virtual {v0}, Lcom/huawei/android/hwnv/NvInteger;->getNvSize()B

    move-result v2

    invoke-virtual {v0}, Lcom/huawei/android/hwnv/NvInteger;->toByteArray()[B

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/huawei/android/hwnv/HWNVFuncation;->setNV(IB[B)Z

    move-result v1

    return v1
.end method

.method public static setNVActivationDateData(Ljava/util/Date;)Z
    .locals 7
    .parameter "date"

    .prologue
    const-string v3, "setNVActivationDateData"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    const-wide/16 v5, 0x3e8

    div-long v1, v3, v5

    .local v1, time:J
    new-instance v0, Lcom/huawei/android/hwnv/NvInteger;

    invoke-direct {v0, v1, v2}, Lcom/huawei/android/hwnv/NvInteger;-><init>(J)V

    .local v0, out:Lcom/huawei/android/hwnv/NvInteger;
    invoke-virtual {v0}, Lcom/huawei/android/hwnv/NvInteger;->toDebugString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    const v3, 0xea79

    invoke-virtual {v0}, Lcom/huawei/android/hwnv/NvInteger;->getNvSize()B

    move-result v4

    invoke-virtual {v0}, Lcom/huawei/android/hwnv/NvInteger;->toByteArray()[B

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/huawei/android/hwnv/HWNVFuncation;->setNV(IB[B)Z

    move-result v3

    return v3
.end method

.method private static setNVBandPref(BS)Z
    .locals 4
    .parameter "nam"
    .parameter "band"

    .prologue
    const/4 v3, 0x3

    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .local v0, buf:Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/16 v1, 0x1b9

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    invoke-static {v1, v3, v2}, Lcom/huawei/android/hwnv/HWNVFuncation;->setNV(IB[B)Z

    move-result v1

    return v1
.end method

.method private static setNVBandPref1631(BS)Z
    .locals 4
    .parameter "nam"
    .parameter "band"

    .prologue
    const/4 v3, 0x3

    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .local v0, buf:Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/16 v1, 0x3b2

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    invoke-static {v1, v3, v2}, Lcom/huawei/android/hwnv/HWNVFuncation;->setNV(IB[B)Z

    move-result v1

    return v1
.end method

.method private static setNVBandPref3263(BI)Z
    .locals 4
    .parameter "nam"
    .parameter "band"

    .prologue
    const/4 v3, 0x5

    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .local v0, buf:Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    const/16 v1, 0xb8a

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    invoke-static {v1, v3, v2}, Lcom/huawei/android/hwnv/HWNVFuncation;->setNV(IB[B)Z

    move-result v1

    return v1
.end method

.method public static setNVCallLog(Lcom/huawei/android/hwnv/CallLogTypeInfo;)Z
    .locals 3
    .parameter "callLog"

    .prologue
    const-string v0, "setNVCallLog"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/huawei/android/hwnv/CallLogTypeInfo;->toDebugString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    const v0, 0xea76

    invoke-virtual {p0}, Lcom/huawei/android/hwnv/CallLogTypeInfo;->getNvSize()B

    move-result v1

    invoke-virtual {p0}, Lcom/huawei/android/hwnv/CallLogTypeInfo;->toByteArray()[B

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/huawei/android/hwnv/HWNVFuncation;->setNV(IB[B)Z

    move-result v0

    return v0
.end method

.method public static setNVHacMode(B)Z
    .locals 4
    .parameter "hac_mode"

    .prologue
    const-string v1, "setNVHacMode"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    new-instance v0, Lcom/huawei/android/hwnv/NvByte;

    int-to-short v1, p0

    invoke-direct {v0, v1}, Lcom/huawei/android/hwnv/NvByte;-><init>(S)V

    .local v0, out:Lcom/huawei/android/hwnv/NvByte;
    invoke-virtual {v0}, Lcom/huawei/android/hwnv/NvByte;->toDebugString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    const v1, 0xea74

    invoke-virtual {v0}, Lcom/huawei/android/hwnv/NvByte;->getNvSize()B

    move-result v2

    invoke-virtual {v0}, Lcom/huawei/android/hwnv/NvByte;->toByteArray()[B

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/huawei/android/hwnv/HWNVFuncation;->setNV(IB[B)Z

    move-result v1

    return v1
.end method

.method public static setNVInterface(IB[B)Z
    .locals 2
    .parameter "nvItem"
    .parameter "nvSize"
    .parameter "buf"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidParameterException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    const-string v1, "ro.config.hwnv_security"

    invoke-static {v1, v0}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_2

    if-eqz p2, :cond_0

    if-lez p1, :cond_0

    const/16 v0, 0x7d

    if-ge v0, p1, :cond_1

    :cond_0
    new-instance v0, Ljava/security/InvalidParameterException;

    invoke-direct {v0}, Ljava/security/InvalidParameterException;-><init>()V

    throw v0

    :cond_1
    invoke-static {p0, p1, p2}, Lcom/huawei/android/hwnv/HWNVFuncation;->setNV(IB[B)Z

    move-result v0

    :goto_0
    return v0

    :cond_2
    const-string v1, "Because the security problem, you are not allowed to do it!"

    invoke-static {v1}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static setNVModePref(B)Z
    .locals 4
    .parameter "sel_mode"

    .prologue
    const-string v1, "setNVModePref"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    new-instance v0, Lcom/huawei/android/hwnv/NvByte;

    int-to-short v1, p0

    invoke-direct {v0, v1}, Lcom/huawei/android/hwnv/NvByte;-><init>(S)V

    .local v0, out:Lcom/huawei/android/hwnv/NvByte;
    invoke-virtual {v0}, Lcom/huawei/android/hwnv/NvByte;->toDebugString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    const/16 v1, 0x351

    invoke-virtual {v0}, Lcom/huawei/android/hwnv/NvByte;->getNvSize()B

    move-result v2

    invoke-virtual {v0}, Lcom/huawei/android/hwnv/NvByte;->toByteArray()[B

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/huawei/android/hwnv/HWNVFuncation;->setNV(IB[B)Z

    move-result v1

    return v1
.end method

.method private static setNVRFBCCONFIG(J)Z
    .locals 4
    .parameter "value"

    .prologue
    const/16 v3, 0x8

    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .local v0, buf:Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p0, p1}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    const/16 v1, 0x755

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    invoke-static {v1, v3, v2}, Lcom/huawei/android/hwnv/HWNVFuncation;->setNV(IB[B)Z

    move-result v1

    return v1
.end method

.method public static setNVUIMDeviceID()Z
    .locals 5

    .prologue
    const/16 v4, 0x8

    const-string v2, "setNVUIMDeviceID Modem side will set data auto!"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    new-array v1, v4, [B

    .local v1, uimDeviceID:[B
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .local v0, buf:Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    const v2, 0xea6b

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    invoke-static {v2, v4, v3}, Lcom/huawei/android/hwnv/HWNVFuncation;->setNV(IB[B)Z

    move-result v2

    return v2
.end method

.method public static setNVWarrantyDate(J)Z
    .locals 4
    .parameter "warrantyDate"

    .prologue
    const-string v1, "setNVWarrantyDate"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    new-instance v0, Lcom/huawei/android/hwnv/NvInteger;

    invoke-direct {v0, p0, p1}, Lcom/huawei/android/hwnv/NvInteger;-><init>(J)V

    .local v0, out:Lcom/huawei/android/hwnv/NvInteger;
    invoke-virtual {v0}, Lcom/huawei/android/hwnv/NvInteger;->toDebugString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/huawei/android/hwnv/HWNVFuncation;->vLog(Ljava/lang/String;)V

    const v1, 0xea71

    invoke-virtual {v0}, Lcom/huawei/android/hwnv/NvInteger;->getNvSize()B

    move-result v2

    invoke-virtual {v0}, Lcom/huawei/android/hwnv/NvInteger;->toByteArray()[B

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/huawei/android/hwnv/HWNVFuncation;->setNV(IB[B)Z

    move-result v1

    return v1
.end method

.method public static setPrefMode(S)Z
    .locals 4
    .parameter "value"

    .prologue
    const/4 v3, 0x3

    new-array v1, v3, [B

    .local v1, prefMode:[B
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .local v0, buf:Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/16 v2, 0xa

    invoke-static {v2, v3, v1}, Lcom/huawei/android/hwnv/HWNVFuncation;->setNV(IB[B)Z

    move-result v2

    return v2
.end method

.method private static vLog(Ljava/lang/String;)V
    .locals 1
    .parameter "logString"

    .prologue
    const-string v0, "HWNVFuncation"

    invoke-static {v0, p0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
