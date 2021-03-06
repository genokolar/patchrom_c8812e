.class public Lcom/huawei/android/hwnv/NvInteger;
.super Lcom/huawei/android/hwnv/BaseHWNvItemType;
.source "NvInteger.java"


# instance fields
.field mVal:J


# direct methods
.method constructor <init>()V
    .locals 2

    .prologue
    invoke-direct {p0}, Lcom/huawei/android/hwnv/BaseHWNvItemType;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/huawei/android/hwnv/NvInteger;->mVal:J

    return-void
.end method

.method constructor <init>(J)V
    .locals 2
    .parameter "val"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidParameterException;
        }
    .end annotation

    .prologue
    invoke-direct {p0}, Lcom/huawei/android/hwnv/BaseHWNvItemType;-><init>()V

    const-wide v0, 0xffffffffL

    cmp-long v0, v0, p1

    if-gez v0, :cond_0

    new-instance v0, Ljava/lang/NumberFormatException;

    invoke-direct {v0}, Ljava/lang/NumberFormatException;-><init>()V

    throw v0

    :cond_0
    iput-wide p1, p0, Lcom/huawei/android/hwnv/NvInteger;->mVal:J

    return-void
.end method

.method constructor <init>([B)V
    .locals 3
    .parameter "bArray"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    invoke-direct {p0}, Lcom/huawei/android/hwnv/BaseHWNvItemType;-><init>()V

    invoke-virtual {p0, p1}, Lcom/huawei/android/hwnv/NvInteger;->createByteBuffer([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .local v0, buf:Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/huawei/android/hwnv/NvInteger;->parseUnsignedIntToLong(I)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/huawei/android/hwnv/NvInteger;->mVal:J

    return-void
.end method


# virtual methods
.method public getNvInteger()J
    .locals 2

    .prologue
    iget-wide v0, p0, Lcom/huawei/android/hwnv/NvInteger;->mVal:J

    return-wide v0
.end method

.method public getNvSize()B
    .locals 1

    .prologue
    const/4 v0, 0x4

    return v0
.end method

.method public setNvInteger(J)V
    .locals 2
    .parameter "val"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidParameterException;
        }
    .end annotation

    .prologue
    const-wide v0, 0xffffffffL

    cmp-long v0, v0, p1

    if-gez v0, :cond_0

    new-instance v0, Ljava/lang/NumberFormatException;

    invoke-direct {v0}, Ljava/lang/NumberFormatException;-><init>()V

    throw v0

    :cond_0
    iput-wide p1, p0, Lcom/huawei/android/hwnv/NvInteger;->mVal:J

    return-void
.end method

.method public setNvInteger([B)V
    .locals 3
    .parameter "bArray"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    invoke-virtual {p0, p1}, Lcom/huawei/android/hwnv/NvInteger;->createByteBuffer([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .local v0, buf:Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/huawei/android/hwnv/NvInteger;->parseUnsignedIntToLong(I)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/huawei/android/hwnv/NvInteger;->mVal:J

    return-void
.end method

.method public toByteArray()[B
    .locals 3

    .prologue
    invoke-virtual {p0}, Lcom/huawei/android/hwnv/NvInteger;->getNvSize()B

    move-result v1

    invoke-virtual {p0, v1}, Lcom/huawei/android/hwnv/NvInteger;->createByteBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .local v0, buf:Ljava/nio/ByteBuffer;
    iget-wide v1, p0, Lcom/huawei/android/hwnv/NvInteger;->mVal:J

    long-to-int v1, v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    return-object v1
.end method

.method public toDebugString()Ljava/lang/String;
    .locals 5

    .prologue
    const-string v0, "val=%d"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-wide v3, p0, Lcom/huawei/android/hwnv/NvInteger;->mVal:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
