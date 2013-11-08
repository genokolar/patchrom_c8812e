.class public Lcom/huawei/android/hwnv/CallLogTypeInfo;
.super Lcom/huawei/android/hwnv/BaseHWNvItemType;
.source "CallLogTypeInfo.java"


# instance fields
.field private mCallLogCounter:J

.field private mCallLogTime:J

.field private mDataTraffic:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    invoke-direct {p0}, Lcom/huawei/android/hwnv/BaseHWNvItemType;-><init>()V

    return-void
.end method


# virtual methods
.method public getCallLogCounter()J
    .locals 2

    .prologue
    iget-wide v0, p0, Lcom/huawei/android/hwnv/CallLogTypeInfo;->mCallLogCounter:J

    return-wide v0
.end method

.method public getCallLogTime()J
    .locals 2

    .prologue
    iget-wide v0, p0, Lcom/huawei/android/hwnv/CallLogTypeInfo;->mCallLogTime:J

    return-wide v0
.end method

.method public getDataTraffic()J
    .locals 2

    .prologue
    iget-wide v0, p0, Lcom/huawei/android/hwnv/CallLogTypeInfo;->mDataTraffic:J

    return-wide v0
.end method

.method public getNvSize()B
    .locals 1

    .prologue
    const/16 v0, 0xc

    return v0
.end method

.method public setCallLogCounter(J)V
    .locals 0
    .parameter "callLogCounter"

    .prologue
    iput-wide p1, p0, Lcom/huawei/android/hwnv/CallLogTypeInfo;->mCallLogCounter:J

    return-void
.end method

.method public setCallLogTime(J)V
    .locals 0
    .parameter "callLogTime"

    .prologue
    iput-wide p1, p0, Lcom/huawei/android/hwnv/CallLogTypeInfo;->mCallLogTime:J

    return-void
.end method

.method public setCallLogTypeInfo([B)V
    .locals 3
    .parameter "bArray"

    .prologue
    invoke-virtual {p0, p1}, Lcom/huawei/android/hwnv/CallLogTypeInfo;->createByteBuffer([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .local v0, buf:Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/huawei/android/hwnv/CallLogTypeInfo;->parseUnsignedIntToLong(I)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/huawei/android/hwnv/CallLogTypeInfo;->mCallLogCounter:J

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/huawei/android/hwnv/CallLogTypeInfo;->parseUnsignedIntToLong(I)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/huawei/android/hwnv/CallLogTypeInfo;->mCallLogTime:J

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/huawei/android/hwnv/CallLogTypeInfo;->parseUnsignedIntToLong(I)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/huawei/android/hwnv/CallLogTypeInfo;->mDataTraffic:J

    return-void
.end method

.method public setDataTraffic(J)V
    .locals 0
    .parameter "dataTraffic"

    .prologue
    iput-wide p1, p0, Lcom/huawei/android/hwnv/CallLogTypeInfo;->mDataTraffic:J

    return-void
.end method

.method public toByteArray()[B
    .locals 3

    .prologue
    invoke-virtual {p0}, Lcom/huawei/android/hwnv/CallLogTypeInfo;->getNvSize()B

    move-result v1

    invoke-virtual {p0, v1}, Lcom/huawei/android/hwnv/CallLogTypeInfo;->createByteBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .local v0, buf:Ljava/nio/ByteBuffer;
    iget-wide v1, p0, Lcom/huawei/android/hwnv/CallLogTypeInfo;->mCallLogCounter:J

    long-to-int v1, v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget-wide v1, p0, Lcom/huawei/android/hwnv/CallLogTypeInfo;->mCallLogTime:J

    long-to-int v1, v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget-wide v1, p0, Lcom/huawei/android/hwnv/CallLogTypeInfo;->mDataTraffic:J

    long-to-int v1, v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    return-object v1
.end method

.method public toDebugString()Ljava/lang/String;
    .locals 5

    .prologue
    const-string v0, "mCallLogCounter:%d, mCallLogTime:%d, mDataTraffic:%d"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-wide v3, p0, Lcom/huawei/android/hwnv/CallLogTypeInfo;->mCallLogCounter:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-wide v3, p0, Lcom/huawei/android/hwnv/CallLogTypeInfo;->mCallLogTime:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-wide v3, p0, Lcom/huawei/android/hwnv/CallLogTypeInfo;->mDataTraffic:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
