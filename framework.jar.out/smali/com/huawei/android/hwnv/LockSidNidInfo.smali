.class public Lcom/huawei/android/hwnv/LockSidNidInfo;
.super Lcom/huawei/android/hwnv/BaseHWNvItemType;
.source "LockSidNidInfo.java"


# static fields
.field private static final MAX_LOCK_SID_NID_NUM:I = 0xa

.field private static final SD_WILDCARD_NID:I = 0xffff

.field private static final SD_WILDCARD_SID:I = 0x0

.field private static final TAG:Ljava/lang/String; = "LockSidNidInfo"


# instance fields
.field private mNid:[I

.field private mSid:[I

.field private mSidNidPair:I


# direct methods
.method constructor <init>()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/16 v3, 0xa

    invoke-direct {p0}, Lcom/huawei/android/hwnv/BaseHWNvItemType;-><init>()V

    iput v4, p0, Lcom/huawei/android/hwnv/LockSidNidInfo;->mSidNidPair:I

    new-array v1, v3, [I

    iput-object v1, p0, Lcom/huawei/android/hwnv/LockSidNidInfo;->mSid:[I

    new-array v1, v3, [I

    iput-object v1, p0, Lcom/huawei/android/hwnv/LockSidNidInfo;->mNid:[I

    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v3, :cond_0

    iget-object v1, p0, Lcom/huawei/android/hwnv/LockSidNidInfo;->mSid:[I

    aput v4, v1, v0

    iget-object v1, p0, Lcom/huawei/android/hwnv/LockSidNidInfo;->mNid:[I

    const v2, 0xffff

    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public getNid(I)I
    .locals 1
    .parameter "index"

    .prologue
    if-ltz p1, :cond_0

    const/16 v0, 0xa

    if-lt p1, v0, :cond_1

    :cond_0
    const v0, 0xffff

    :goto_0
    return v0

    :cond_1
    iget-object v0, p0, Lcom/huawei/android/hwnv/LockSidNidInfo;->mNid:[I

    aget v0, v0, p1

    goto :goto_0
.end method

.method public getSid(I)I
    .locals 1
    .parameter "index"

    .prologue
    if-ltz p1, :cond_0

    const/16 v0, 0xa

    if-lt p1, v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_1
    iget-object v0, p0, Lcom/huawei/android/hwnv/LockSidNidInfo;->mSid:[I

    aget v0, v0, p1

    goto :goto_0
.end method

.method public getSidNidPair()I
    .locals 1

    .prologue
    iget v0, p0, Lcom/huawei/android/hwnv/LockSidNidInfo;->mSidNidPair:I

    return v0
.end method

.method public setNid(IS)V
    .locals 3
    .parameter "index"
    .parameter "nid"

    .prologue
    if-ltz p1, :cond_0

    const/16 v0, 0xa

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/huawei/android/hwnv/LockSidNidInfo;->mNid:[I

    invoke-virtual {p0, p2}, Lcom/huawei/android/hwnv/LockSidNidInfo;->parseUnsignedShortToInt(S)I

    move-result v1

    aput v1, v0, p1

    :goto_0
    return-void

    :cond_0
    const-string v0, "LockSidNidInfo"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid para! index = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public setSid(IS)V
    .locals 3
    .parameter "index"
    .parameter "sid"

    .prologue
    if-ltz p1, :cond_0

    const/16 v0, 0xa

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/huawei/android/hwnv/LockSidNidInfo;->mSid:[I

    invoke-virtual {p0, p2}, Lcom/huawei/android/hwnv/LockSidNidInfo;->parseUnsignedShortToInt(S)I

    move-result v1

    aput v1, v0, p1

    :goto_0
    return-void

    :cond_0
    const-string v0, "LockSidNidInfo"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid para! index = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public setSidNidPair(I)V
    .locals 3
    .parameter "sidNidpair"

    .prologue
    if-lez p1, :cond_0

    const/16 v0, 0xa

    if-gt p1, v0, :cond_0

    iput p1, p0, Lcom/huawei/android/hwnv/LockSidNidInfo;->mSidNidPair:I

    :goto_0
    return-void

    :cond_0
    const-string v0, "LockSidNidInfo"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid para! sidNidpair = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public toDebugString()Ljava/lang/String;
    .locals 5

    .prologue
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v1, p0, Lcom/huawei/android/hwnv/LockSidNidInfo;->mSidNidPair:I

    if-ge v0, v1, :cond_0

    const-string v1, "LockSidNidInfo"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mSid["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/huawei/android/hwnv/LockSidNidInfo;->mSid:[I

    aget v3, v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "mNid["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/huawei/android/hwnv/LockSidNidInfo;->mNid:[I

    aget v3, v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    const-string v1, "mSidNidPair:%d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget v4, p0, Lcom/huawei/android/hwnv/LockSidNidInfo;->mSidNidPair:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
