.class public Lcom/huawei/android/hwnv/DirNumberPCSInfo;
.super Lcom/huawei/android/hwnv/BaseHWNvItemType;
.source "DirNumberPCSInfo.java"


# static fields
.field private static final MAX_NV_DIR_NUMBER_PCS_NAM:I = 0x2

.field private static final MAX_NV_DIR_NUMBER_PCS_SIZE:B = 0xft


# instance fields
.field private digitn:[B

.field private mNam:B

.field private nDigits:B


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    invoke-direct {p0}, Lcom/huawei/android/hwnv/BaseHWNvItemType;-><init>()V

    const/16 v0, 0xf

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/huawei/android/hwnv/DirNumberPCSInfo;->digitn:[B

    return-void
.end method


# virtual methods
.method public getDigitn()[B
    .locals 2

    .prologue
    iget-object v0, p0, Lcom/huawei/android/hwnv/DirNumberPCSInfo;->digitn:[B

    iget-byte v1, p0, Lcom/huawei/android/hwnv/DirNumberPCSInfo;->nDigits:B

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v0

    return-object v0
.end method

.method public getDigits()B
    .locals 1

    .prologue
    iget-byte v0, p0, Lcom/huawei/android/hwnv/DirNumberPCSInfo;->nDigits:B

    return v0
.end method

.method public getNam()B
    .locals 1

    .prologue
    iget-byte v0, p0, Lcom/huawei/android/hwnv/DirNumberPCSInfo;->mNam:B

    return v0
.end method

.method public getNvSize()B
    .locals 1

    .prologue
    const/16 v0, 0x11

    return v0
.end method

.method public setDirNumberPCSInfo([B)V
    .locals 4
    .parameter "bArray"

    .prologue
    invoke-virtual {p0, p1}, Lcom/huawei/android/hwnv/DirNumberPCSInfo;->createByteBuffer([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .local v0, buf:Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    move-result v2

    iput-byte v2, p0, Lcom/huawei/android/hwnv/DirNumberPCSInfo;->mNam:B

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    move-result v2

    iput-byte v2, p0, Lcom/huawei/android/hwnv/DirNumberPCSInfo;->nDigits:B

    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget-byte v2, p0, Lcom/huawei/android/hwnv/DirNumberPCSInfo;->nDigits:B

    if-ge v1, v2, :cond_0

    iget-object v2, p0, Lcom/huawei/android/hwnv/DirNumberPCSInfo;->digitn:[B

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    move-result v3

    aput-byte v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public setNam(B)V
    .locals 1
    .parameter "nam"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidParameterException;
        }
    .end annotation

    .prologue
    if-ltz p1, :cond_0

    const/4 v0, 0x2

    if-gt v0, p1, :cond_1

    :cond_0
    new-instance v0, Ljava/security/InvalidParameterException;

    invoke-direct {v0}, Ljava/security/InvalidParameterException;-><init>()V

    throw v0

    :cond_1
    iput-byte p1, p0, Lcom/huawei/android/hwnv/DirNumberPCSInfo;->mNam:B

    return-void
.end method

.method public toByteArray()[B
    .locals 3

    .prologue
    invoke-virtual {p0}, Lcom/huawei/android/hwnv/DirNumberPCSInfo;->getNvSize()B

    move-result v2

    invoke-virtual {p0, v2}, Lcom/huawei/android/hwnv/DirNumberPCSInfo;->createByteBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .local v0, buf:Ljava/nio/ByteBuffer;
    iget-byte v2, p0, Lcom/huawei/android/hwnv/DirNumberPCSInfo;->mNam:B

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-byte v2, p0, Lcom/huawei/android/hwnv/DirNumberPCSInfo;->nDigits:B

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    const/16 v2, 0xf

    if-ge v1, v2, :cond_0

    iget-object v2, p0, Lcom/huawei/android/hwnv/DirNumberPCSInfo;->digitn:[B

    aget-byte v2, v2, v1

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    return-object v2
.end method

.method public toDebugString()Ljava/lang/String;
    .locals 4

    .prologue
    const-string v0, "mNam:%d, nDigits:%d"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-byte v3, p0, Lcom/huawei/android/hwnv/DirNumberPCSInfo;->mNam:B

    invoke-static {v3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-byte v3, p0, Lcom/huawei/android/hwnv/DirNumberPCSInfo;->nDigits:B

    invoke-static {v3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
