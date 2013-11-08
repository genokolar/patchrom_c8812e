.class public Lcom/huawei/android/hwnv/NvByte;
.super Lcom/huawei/android/hwnv/BaseHWNvItemType;
.source "NvByte.java"


# instance fields
.field mVal:S


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    invoke-direct {p0}, Lcom/huawei/android/hwnv/BaseHWNvItemType;-><init>()V

    const/4 v0, 0x0

    iput-short v0, p0, Lcom/huawei/android/hwnv/NvByte;->mVal:S

    return-void
.end method

.method constructor <init>(S)V
    .locals 1
    .parameter "val"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidParameterException;
        }
    .end annotation

    .prologue
    invoke-direct {p0}, Lcom/huawei/android/hwnv/BaseHWNvItemType;-><init>()V

    const/16 v0, 0xff

    if-ge v0, p1, :cond_0

    new-instance v0, Ljava/lang/NumberFormatException;

    invoke-direct {v0}, Ljava/lang/NumberFormatException;-><init>()V

    throw v0

    :cond_0
    iput-short p1, p0, Lcom/huawei/android/hwnv/NvByte;->mVal:S

    return-void
.end method

.method constructor <init>([B)V
    .locals 1
    .parameter "bArray"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    invoke-direct {p0}, Lcom/huawei/android/hwnv/BaseHWNvItemType;-><init>()V

    const/4 v0, 0x0

    aget-byte v0, p1, v0

    invoke-virtual {p0, v0}, Lcom/huawei/android/hwnv/NvByte;->parseUnsignedByteToShort(B)S

    move-result v0

    iput-short v0, p0, Lcom/huawei/android/hwnv/NvByte;->mVal:S

    return-void
.end method


# virtual methods
.method public getNvSize()B
    .locals 1

    .prologue
    const/4 v0, 0x1

    return v0
.end method

.method public setNvByte()S
    .locals 1

    .prologue
    iget-short v0, p0, Lcom/huawei/android/hwnv/NvByte;->mVal:S

    return v0
.end method

.method public setNvByte(S)V
    .locals 1
    .parameter "val"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidParameterException;
        }
    .end annotation

    .prologue
    const/16 v0, 0xff

    if-ge v0, p1, :cond_0

    new-instance v0, Ljava/lang/NumberFormatException;

    invoke-direct {v0}, Ljava/lang/NumberFormatException;-><init>()V

    throw v0

    :cond_0
    iput-short p1, p0, Lcom/huawei/android/hwnv/NvByte;->mVal:S

    return-void
.end method

.method public setNvByte([B)V
    .locals 1
    .parameter "bArray"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    aget-byte v0, p1, v0

    invoke-virtual {p0, v0}, Lcom/huawei/android/hwnv/NvByte;->parseUnsignedByteToShort(B)S

    move-result v0

    iput-short v0, p0, Lcom/huawei/android/hwnv/NvByte;->mVal:S

    return-void
.end method

.method public toByteArray()[B
    .locals 2

    .prologue
    invoke-virtual {p0}, Lcom/huawei/android/hwnv/NvByte;->getNvSize()B

    move-result v1

    invoke-virtual {p0, v1}, Lcom/huawei/android/hwnv/NvByte;->createByteBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .local v0, buf:Ljava/nio/ByteBuffer;
    iget-short v1, p0, Lcom/huawei/android/hwnv/NvByte;->mVal:S

    int-to-byte v1, v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    return-object v1
.end method

.method public toDebugString()Ljava/lang/String;
    .locals 4

    .prologue
    const-string v0, "val=%d"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-short v3, p0, Lcom/huawei/android/hwnv/NvByte;->mVal:S

    invoke-static {v3}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
