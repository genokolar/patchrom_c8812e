.class public Lcom/huawei/android/hwnv/RefurbishTypeInfo;
.super Lcom/huawei/android/hwnv/BaseHWNvItemType;
.source "RefurbishTypeInfo.java"


# static fields
.field private static final SECONDS_INTERVAL:J = 0x12d53d80L


# instance fields
.field private refurbish_counter:J

.field private refurbish_time:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    invoke-direct {p0}, Lcom/huawei/android/hwnv/BaseHWNvItemType;-><init>()V

    return-void
.end method


# virtual methods
.method public getNvSize()B
    .locals 1

    .prologue
    const/16 v0, 0x8

    return v0
.end method

.method public getRefurbishCounter()J
    .locals 2

    .prologue
    iget-wide v0, p0, Lcom/huawei/android/hwnv/RefurbishTypeInfo;->refurbish_counter:J

    return-wide v0
.end method

.method public getRefurbishDate()Ljava/util/Date;
    .locals 5

    .prologue
    new-instance v0, Ljava/util/Date;

    iget-wide v1, p0, Lcom/huawei/android/hwnv/RefurbishTypeInfo;->refurbish_time:J

    const-wide/32 v3, 0x12d53d80

    add-long/2addr v1, v3

    const-wide/16 v3, 0x3e8

    mul-long/2addr v1, v3

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .local v0, refurbishDate:Ljava/util/Date;
    return-object v0
.end method

.method public getRefurbishTime()J
    .locals 2

    .prologue
    iget-wide v0, p0, Lcom/huawei/android/hwnv/RefurbishTypeInfo;->refurbish_time:J

    return-wide v0
.end method

.method public setRefurbishTypeInfo([B)V
    .locals 3
    .parameter "bArray"

    .prologue
    invoke-virtual {p0, p1}, Lcom/huawei/android/hwnv/RefurbishTypeInfo;->createByteBuffer([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .local v0, buf:Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/huawei/android/hwnv/RefurbishTypeInfo;->parseUnsignedIntToLong(I)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/huawei/android/hwnv/RefurbishTypeInfo;->refurbish_counter:J

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/huawei/android/hwnv/RefurbishTypeInfo;->parseUnsignedIntToLong(I)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/huawei/android/hwnv/RefurbishTypeInfo;->refurbish_time:J

    return-void
.end method

.method public toByteArray()[B
    .locals 3

    .prologue
    invoke-virtual {p0}, Lcom/huawei/android/hwnv/RefurbishTypeInfo;->getNvSize()B

    move-result v1

    invoke-virtual {p0, v1}, Lcom/huawei/android/hwnv/RefurbishTypeInfo;->createByteBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .local v0, buf:Ljava/nio/ByteBuffer;
    iget-wide v1, p0, Lcom/huawei/android/hwnv/RefurbishTypeInfo;->refurbish_counter:J

    long-to-int v1, v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    iget-wide v1, p0, Lcom/huawei/android/hwnv/RefurbishTypeInfo;->refurbish_time:J

    long-to-int v1, v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    return-object v1
.end method

.method public toDebugString()Ljava/lang/String;
    .locals 5

    .prologue
    const-string v0, "refurbish_counter:%d, refurbish_time:%d"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-wide v3, p0, Lcom/huawei/android/hwnv/RefurbishTypeInfo;->refurbish_counter:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-wide v3, p0, Lcom/huawei/android/hwnv/RefurbishTypeInfo;->refurbish_time:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
