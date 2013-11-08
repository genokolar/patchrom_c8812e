.class public Lcom/huawei/android/hwnv/HWFlagFuncation;
.super Ljava/lang/Object;
.source "HWFlagFuncation.java"


# static fields
.field private static final HWNV_FALSE:B = 0x0t

.field private static final HWNV_TRUE:B = 0x1t

.field private static final MAX_GET_FLAG_SIZE:I = 0x7f

.field private static final MAX_IDD_DIGIT_LEN:B = 0x7t

.field private static final MAX_LOCK_SID_NID_SIZE_IN_BYTE:B = 0x2at

.field private static final MAX_SET_FLAG_SIZE:I = 0x7b

.field private static final MIN_LOCK_SID_NID_SIZE:B = 0x2t

.field private static final TAG:Ljava/lang/String; = "HWFlagFuncation"

.field private static final enableVLog:Z = true


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clrLockSidNid()Z
    .locals 3

    .prologue
    const-string v2, "called clrLockSidNid!"

    invoke-static {v2}, Lcom/huawei/android/hwnv/HWFlagFuncation;->vLog(Ljava/lang/String;)V

    const/4 v1, 0x1

    .local v1, invalidSize:B
    new-array v0, v1, [B

    .local v0, invalidBuf:[B
    const/4 v2, 0x4

    invoke-static {v2, v1, v0}, Lcom/huawei/android/hwnv/HWNVFuncation;->setFlag(IB[B)Z

    move-result v2

    return v2
.end method

.method public static getFlagInterface(IB[B)B
    .locals 1
    .parameter "flag"
    .parameter "maxDataSize"
    .parameter "buf"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidParameterException;
        }
    .end annotation

    .prologue
    if-eqz p2, :cond_0

    if-lez p1, :cond_0

    const/16 v0, 0x7f

    if-ge v0, p1, :cond_1

    :cond_0
    new-instance v0, Ljava/security/InvalidParameterException;

    invoke-direct {v0}, Ljava/security/InvalidParameterException;-><init>()V

    throw v0

    :cond_1
    const-string v0, "GXH, In getFlagInterface()"

    invoke-static {v0}, Lcom/huawei/android/hwnv/HWFlagFuncation;->vLog(Ljava/lang/String;)V

    invoke-static {p0, p1, p2}, Lcom/huawei/android/hwnv/HWNVFuncation;->getFlag(IB[B)B

    move-result v0

    return v0
.end method

.method public static getIDD(I)Ljava/lang/String;
    .locals 6
    .parameter "mcc"

    .prologue
    const/16 v3, 0x8

    const/4 v5, 0x1

    new-array v0, v3, [B

    .local v0, buf:[B
    const/4 v1, 0x0

    .local v1, length:I
    invoke-static {p0, v3, v0}, Lcom/huawei/android/hwnv/HWNVFuncation;->getIDD(IB[B)B

    move-result v2

    .local v2, result:B
    if-ne v5, v2, :cond_0

    const-string v3, "getIDD: successfully!"

    invoke-static {v3}, Lcom/huawei/android/hwnv/HWFlagFuncation;->vLog(Ljava/lang/String;)V

    const/4 v3, 0x0

    aget-byte v1, v0, v3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getIDD: length="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/huawei/android/hwnv/HWFlagFuncation;->vLog(Ljava/lang/String;)V

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v0, v5, v1}, Ljava/lang/String;-><init>([BII)V

    :goto_0
    return-object v3

    :cond_0
    const-string v3, "getIDD: no records!"

    invoke-static {v3}, Lcom/huawei/android/hwnv/HWFlagFuncation;->vLog(Ljava/lang/String;)V

    const/4 v3, 0x0

    goto :goto_0
.end method

.method public static getLockSidNid()Lcom/huawei/android/hwnv/LockSidNidInfo;
    .locals 8

    .prologue
    const/16 v7, 0x2a

    const/4 v3, 0x0

    .local v3, lockSidNidNum:I
    new-instance v2, Lcom/huawei/android/hwnv/LockSidNidInfo;

    invoke-direct {v2}, Lcom/huawei/android/hwnv/LockSidNidInfo;-><init>()V

    .local v2, lockSidNidInfo:Lcom/huawei/android/hwnv/LockSidNidInfo;
    new-array v0, v7, [B

    .local v0, buf:[B
    const/4 v6, 0x3

    invoke-static {v6, v7, v0}, Lcom/huawei/android/hwnv/HWNVFuncation;->getFlag(IB[B)B

    move-result v4

    .local v4, result:B
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v5

    .local v5, tempInfo:Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v3

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "getLockSidNid: lockSidNidNum = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/huawei/android/hwnv/HWFlagFuncation;->vLog(Ljava/lang/String;)V

    const/4 v6, 0x1

    if-ne v6, v4, :cond_0

    if-lez v3, :cond_0

    invoke-virtual {v2, v3}, Lcom/huawei/android/hwnv/LockSidNidInfo;->setSidNidPair(I)V

    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v3, :cond_1

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v6

    invoke-virtual {v2, v1, v6}, Lcom/huawei/android/hwnv/LockSidNidInfo;->setSid(IS)V

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v6

    invoke-virtual {v2, v1, v6}, Lcom/huawei/android/hwnv/LockSidNidInfo;->setNid(IS)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .end local v1           #i:I
    :cond_0
    const-string v6, "getLockSidNid: no records!"

    invoke-static {v6}, Lcom/huawei/android/hwnv/HWFlagFuncation;->vLog(Ljava/lang/String;)V

    const/4 v2, 0x0

    .end local v2           #lockSidNidInfo:Lcom/huawei/android/hwnv/LockSidNidInfo;
    :cond_1
    return-object v2
.end method

.method public static setFlagInterface(IB[B)Z
    .locals 1
    .parameter "flag"
    .parameter "dataSize"
    .parameter "buf"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidParameterException;
        }
    .end annotation

    .prologue
    if-eqz p2, :cond_0

    if-lez p1, :cond_0

    const/16 v0, 0x7b

    if-ge v0, p1, :cond_1

    :cond_0
    new-instance v0, Ljava/security/InvalidParameterException;

    invoke-direct {v0}, Ljava/security/InvalidParameterException;-><init>()V

    throw v0

    :cond_1
    const-string v0, "GXH, In setFlagInterface()"

    invoke-static {v0}, Lcom/huawei/android/hwnv/HWFlagFuncation;->vLog(Ljava/lang/String;)V

    invoke-static {p0, p1, p2}, Lcom/huawei/android/hwnv/HWNVFuncation;->setFlag(IB[B)Z

    move-result v0

    return v0
.end method

.method public static setLockSidNid(Z)Z
    .locals 5
    .parameter "ignoreNid"

    .prologue
    const/4 v4, 0x0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "called setLockSidNid, ignoreNid = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/huawei/android/hwnv/HWFlagFuncation;->vLog(Ljava/lang/String;)V

    const/4 v1, 0x1

    .local v1, ignoreNidSize:B
    new-array v0, v1, [B

    .local v0, ignoreNidBuf:[B
    if-eqz p0, :cond_0

    const/4 v2, 0x1

    aput-byte v2, v0, v4

    :goto_0
    const/4 v2, 0x2

    invoke-static {v2, v1, v0}, Lcom/huawei/android/hwnv/HWNVFuncation;->setFlag(IB[B)Z

    move-result v2

    return v2

    :cond_0
    aput-byte v4, v0, v4

    goto :goto_0
.end method

.method private static vLog(Ljava/lang/String;)V
    .locals 1
    .parameter "logString"

    .prologue
    const-string v0, "HWFlagFuncation"

    invoke-static {v0, p0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
