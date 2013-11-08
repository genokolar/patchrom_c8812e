.class public Lcom/huawei/atcommand/HuaweiProtocolATProcessor;
.super Ljava/lang/Object;
.source "HuaweiProtocolATProcessor.java"


# static fields
.field private static final INVALID_VALUE:I = -0x1

.field private static final TAG:Ljava/lang/String; = "HuaweiProtocolATProcessor"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static atCmdReadParserInt(Lcom/huawei/atcommand/HuaweiATResponseParser;)I
    .locals 4
    .parameter "response"

    .prologue
    const/4 v0, -0x1

    .local v0, value:I
    if-eqz p0, :cond_0

    const/4 v1, 0x1

    iget-boolean v2, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mAtCmdResult:Z

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mRawData:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mData:Lcom/android/internal/telephony/ATResponseParser;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mData:Lcom/android/internal/telephony/ATResponseParser;

    invoke-virtual {v1}, Lcom/android/internal/telephony/ATResponseParser;->nextInt()I

    move-result v0

    const-string v1, "HuaweiProtocolATProcessor"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "value ="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",has More = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mData:Lcom/android/internal/telephony/ATResponseParser;

    invoke-virtual {v3}, Lcom/android/internal/telephony/ATResponseParser;->hasMore()Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :goto_0
    return v0

    :cond_1
    const-string v1, "HuaweiProtocolATProcessor"

    const-string v2, "data&mRawData = null!"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method protected static atCmdSetAndActionParser(Lcom/huawei/atcommand/HuaweiATResponseParser;)Z
    .locals 1
    .parameter "response"

    .prologue
    const/4 v0, 0x0

    .local v0, result:Z
    if-eqz p0, :cond_0

    iget-boolean v0, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mAtCmdResult:Z

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
