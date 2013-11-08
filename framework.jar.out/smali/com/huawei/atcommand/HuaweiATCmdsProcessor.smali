.class public Lcom/huawei/atcommand/HuaweiATCmdsProcessor;
.super Ljava/lang/Object;
.source "HuaweiATCmdsProcessor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/huawei/atcommand/HuaweiATCmdsProcessor$1;
    }
.end annotation


# static fields
.field private static final HW_AT_CMD_RAW_SUCESS:Ljava/lang/String; = "1"

.field private static final INDEX0:I = 0x0

.field private static final INDEX1:I = 0x1

.field private static final INDEX2:I = 0x2

.field private static final TAG:Ljava/lang/String; = "HuaweiATCmdsProcessor"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static atCmdAction(ILcom/huawei/atcommand/HuaweiATUtils$ATCmdType;)Ljava/lang/Object;
    .locals 5
    .parameter "atCmdId"
    .parameter "atCmdtype"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .local v1, atFinalResponse:Ljava/lang/Object;
    invoke-static {p0, p1, v2}, Lcom/huawei/atcommand/HuaweiATCmdsProcessor;->atCmdPreProcessor(ILcom/huawei/atcommand/HuaweiATUtils$ATCmdType;Ljava/lang/String;)Lcom/huawei/atcommand/HuaweiATResponseParser;

    move-result-object v0

    .local v0, atActionResponse:Lcom/huawei/atcommand/HuaweiATResponseParser;
    if-nez v0, :cond_0

    move-object v1, v2

    .end local v1           #atFinalResponse:Ljava/lang/Object;
    :goto_0
    return-object v1

    .restart local v1       #atFinalResponse:Ljava/lang/Object;
    :cond_0
    packed-switch p0, :pswitch_data_0

    const-string v2, "HuaweiATCmdsProcessor"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "This atCmdId("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ") is not supported in atCmdAction!"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :pswitch_0
    invoke-static {v0}, Lcom/huawei/atcommand/HuaweiATCmdsProcessor;->atCmdCGMRParser(Lcom/huawei/atcommand/HuaweiATResponseParser;)V

    goto :goto_0

    :pswitch_1
    invoke-static {v0}, Lcom/huawei/atcommand/HuaweiATCmdsProcessor;->atCmdEGMRParser(Lcom/huawei/atcommand/HuaweiATResponseParser;)V

    goto :goto_0

    :pswitch_2
    invoke-static {v0}, Lcom/huawei/atcommand/HuaweiProtocolATProcessor;->atCmdSetAndActionParser(Lcom/huawei/atcommand/HuaweiATResponseParser;)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .local v1, atFinalResponse:Ljava/lang/Boolean;
    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method private static atCmdCGMRParser(Lcom/huawei/atcommand/HuaweiATResponseParser;)V
    .locals 6
    .parameter "response"

    .prologue
    const/4 v2, 0x0

    .local v2, strNum:I
    const/4 v0, 0x0

    .local v0, cgmr:[Ljava/lang/String;
    const/4 v3, 0x1

    iget-boolean v4, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mAtCmdResult:Z

    if-ne v3, v4, :cond_2

    iget-object v3, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mRawData:Ljava/lang/String;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mRawData:Ljava/lang/String;

    invoke-static {v3}, Lcom/huawei/atcommand/HuaweiATUtils;->findCommasNum(Ljava/lang/String;)I

    move-result v3

    add-int/lit8 v2, v3, 0x1

    new-array v0, v2, [Ljava/lang/String;

    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v2, :cond_1

    iget-object v3, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mData:Lcom/android/internal/telephony/ATResponseParser;

    invoke-virtual {v3}, Lcom/android/internal/telephony/ATResponseParser;->nextString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v1

    const-string v3, "HuaweiATCmdsProcessor"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "cgmr["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v5, v0, v1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ",has More = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mData:Lcom/android/internal/telephony/ATResponseParser;

    invoke-virtual {v5}, Lcom/android/internal/telephony/ATResponseParser;->hasMore()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .end local v1           #i:I
    :cond_0
    const-string v3, "HuaweiATCmdsProcessor"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "cgmr: reault = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-boolean v5, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mAtCmdResult:Z

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ",no data mRawData "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mRawData:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    :goto_1
    return-void

    :cond_2
    const-string v3, "HuaweiATCmdsProcessor"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "error = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mRawError:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ",cmeError = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mRawError:Ljava/lang/String;

    invoke-static {v5}, Lcom/huawei/atcommand/HuaweiATUtils;->getCmeError(Ljava/lang/String;)Lcom/huawei/atcommand/HuaweiATUtils$ATCmdCmeErrorType;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private static atCmdEGMRParser(Lcom/huawei/atcommand/HuaweiATResponseParser;)V
    .locals 6
    .parameter "response"

    .prologue
    const/4 v0, 0x0

    .local v0, dataNum:I
    const/4 v1, 0x0

    .local v1, egmr:[I
    const/4 v3, 0x1

    iget-boolean v4, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mAtCmdResult:Z

    if-ne v3, v4, :cond_2

    iget-object v3, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mRawData:Ljava/lang/String;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mRawData:Ljava/lang/String;

    invoke-static {v3}, Lcom/huawei/atcommand/HuaweiATUtils;->findCommasNum(Ljava/lang/String;)I

    move-result v3

    add-int/lit8 v0, v3, 0x1

    new-array v1, v0, [I

    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v0, :cond_1

    iget-object v3, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mData:Lcom/android/internal/telephony/ATResponseParser;

    invoke-virtual {v3}, Lcom/android/internal/telephony/ATResponseParser;->nextInt()I

    move-result v3

    aput v3, v1, v2

    const-string v3, "HuaweiATCmdsProcessor"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "emgr["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget v5, v1, v2

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ",has More = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mData:Lcom/android/internal/telephony/ATResponseParser;

    invoke-virtual {v5}, Lcom/android/internal/telephony/ATResponseParser;->hasMore()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .end local v2           #i:I
    :cond_0
    const-string v3, "HuaweiATCmdsProcessor"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "egmr: reault = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-boolean v5, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mAtCmdResult:Z

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ",no data mRawData "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mRawData:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    :goto_1
    return-void

    :cond_2
    const-string v3, "HuaweiATCmdsProcessor"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "error = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mRawError:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ",cmeError = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mRawError:Ljava/lang/String;

    invoke-static {v5}, Lcom/huawei/atcommand/HuaweiATUtils;->getCmeError(Ljava/lang/String;)Lcom/huawei/atcommand/HuaweiATUtils$ATCmdCmeErrorType;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private static atCmdPreProcessor(ILcom/huawei/atcommand/HuaweiATUtils$ATCmdType;Ljava/lang/String;)Lcom/huawei/atcommand/HuaweiATResponseParser;
    .locals 12
    .parameter "atCmdId"
    .parameter "atCmdtype"
    .parameter "atCmdValue"

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x2

    const/4 v5, 0x0

    const/4 v9, 0x1

    const/4 v4, 0x0

    .local v4, rawResponse:[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, atCmdFinal:Ljava/lang/String;
    invoke-static {p0}, Lcom/huawei/atcommand/HuaweiATCmdIds;->atCmdForATCmdId(I)Ljava/lang/String;

    move-result-object v0

    .local v0, atCmd:Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, atResponse:Lcom/huawei/atcommand/HuaweiATResponseParser;
    const/4 v3, 0x0

    .local v3, data:Lcom/android/internal/telephony/ATResponseParser;
    const-string v6, "HuaweiATCmdsProcessor"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "atCmd = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-object v5

    :cond_1
    sget-object v6, Lcom/huawei/atcommand/HuaweiATCmdsProcessor$1;->$SwitchMap$com$huawei$atcommand$HuaweiATUtils$ATCmdType:[I

    invoke-virtual {p1}, Lcom/huawei/atcommand/HuaweiATUtils$ATCmdType;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_0

    const-string v6, "HuaweiATCmdsProcessor"

    const-string v7, "Invalid At Cmd Type, please check it!"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    const-string v6, "HuaweiATCmdsProcessor"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "atCmdFinal = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getDefault()Lcom/huawei/telephony/HuaweiTelephonyManager;

    move-result-object v6

    invoke-virtual {v6, v1}, Lcom/huawei/telephony/HuaweiTelephonyManager;->ATDirectChannel(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    array-length v6, v4

    if-le v6, v9, :cond_0

    const-string v6, "HuaweiATCmdsProcessor"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "AT Commands rawResponse len = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    array-length v8, v4

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v6, "1"

    aget-object v7, v4, v11

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    const-string v6, "HuaweiATCmdsProcessor"

    const-string v7, "AT Commands Excute Sucess!"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    array-length v6, v4

    if-le v6, v10, :cond_3

    const-string v5, "HuaweiATCmdsProcessor"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "rawData = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-object v7, v4, v10

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v5, Lcom/huawei/atcommand/HuaweiATUtils$ATCmdType;->AT_CMD_TEST:Lcom/huawei/atcommand/HuaweiATUtils$ATCmdType;

    if-eq p1, v5, :cond_2

    new-instance v3, Lcom/android/internal/telephony/ATResponseParser;

    .end local v3           #data:Lcom/android/internal/telephony/ATResponseParser;
    aget-object v5, v4, v10

    invoke-direct {v3, v5}, Lcom/android/internal/telephony/ATResponseParser;-><init>(Ljava/lang/String;)V

    .restart local v3       #data:Lcom/android/internal/telephony/ATResponseParser;
    :cond_2
    new-instance v2, Lcom/huawei/atcommand/HuaweiATResponseParser;

    .end local v2           #atResponse:Lcom/huawei/atcommand/HuaweiATResponseParser;
    aget-object v5, v4, v9

    aget-object v6, v4, v10

    invoke-direct {v2, v9, v3, v5, v6}, Lcom/huawei/atcommand/HuaweiATResponseParser;-><init>(ZLcom/android/internal/telephony/ATResponseParser;Ljava/lang/String;Ljava/lang/String;)V

    .restart local v2       #atResponse:Lcom/huawei/atcommand/HuaweiATResponseParser;
    :goto_2
    invoke-virtual {v2}, Lcom/huawei/atcommand/HuaweiATResponseParser;->toDebugString()V

    move-object v5, v2

    goto/16 :goto_0

    :pswitch_0
    move-object v1, v0

    goto/16 :goto_1

    :pswitch_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_1

    :pswitch_2
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "?"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_1

    :pswitch_3
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "=?"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_1

    :cond_3
    new-instance v2, Lcom/huawei/atcommand/HuaweiATResponseParser;

    .end local v2           #atResponse:Lcom/huawei/atcommand/HuaweiATResponseParser;
    aget-object v6, v4, v9

    invoke-direct {v2, v9, v5, v6, v5}, Lcom/huawei/atcommand/HuaweiATResponseParser;-><init>(ZLcom/android/internal/telephony/ATResponseParser;Ljava/lang/String;Ljava/lang/String;)V

    .restart local v2       #atResponse:Lcom/huawei/atcommand/HuaweiATResponseParser;
    goto :goto_2

    :cond_4
    const-string v6, "HuaweiATCmdsProcessor"

    const-string v7, "AT Commands Excute ERROR!"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v2, Lcom/huawei/atcommand/HuaweiATResponseParser;

    .end local v2           #atResponse:Lcom/huawei/atcommand/HuaweiATResponseParser;
    aget-object v6, v4, v9

    invoke-direct {v2, v11, v5, v6, v5}, Lcom/huawei/atcommand/HuaweiATResponseParser;-><init>(ZLcom/android/internal/telephony/ATResponseParser;Ljava/lang/String;Ljava/lang/String;)V

    .restart local v2       #atResponse:Lcom/huawei/atcommand/HuaweiATResponseParser;
    goto :goto_2

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method protected static atCmdRead(ILcom/huawei/atcommand/HuaweiATUtils$ATCmdType;)Ljava/lang/Object;
    .locals 5
    .parameter "atCmdId"
    .parameter "atCmdtype"

    .prologue
    const/4 v2, 0x0

    const/4 v0, 0x0

    .local v0, atFinalResponse:Ljava/lang/Object;
    invoke-static {p0, p1, v2}, Lcom/huawei/atcommand/HuaweiATCmdsProcessor;->atCmdPreProcessor(ILcom/huawei/atcommand/HuaweiATUtils$ATCmdType;Ljava/lang/String;)Lcom/huawei/atcommand/HuaweiATResponseParser;

    move-result-object v1

    .local v1, atReadResponse:Lcom/huawei/atcommand/HuaweiATResponseParser;
    if-nez v1, :cond_0

    move-object v0, v2

    .end local v0           #atFinalResponse:Ljava/lang/Object;
    :goto_0
    return-object v0

    .restart local v0       #atFinalResponse:Ljava/lang/Object;
    :cond_0
    packed-switch p0, :pswitch_data_0

    const-string v2, "HuaweiATCmdsProcessor"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "This atCmdId("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ") is not supported in atCmdRead!"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :pswitch_0
    invoke-static {v1}, Lcom/huawei/atcommand/HuaweiATCmdsProcessor;->atCmdCGMRParser(Lcom/huawei/atcommand/HuaweiATResponseParser;)V

    goto :goto_0

    :pswitch_1
    invoke-static {v1}, Lcom/huawei/atcommand/HuaweiATCmdsProcessor;->atCmdEGMRParser(Lcom/huawei/atcommand/HuaweiATResponseParser;)V

    goto :goto_0

    :pswitch_2
    invoke-static {v1}, Lcom/huawei/atcommand/HuaweiProtocolATProcessor;->atCmdReadParserInt(Lcom/huawei/atcommand/HuaweiATResponseParser;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .local v0, atFinalResponse:Ljava/lang/Integer;
    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method protected static atCmdSet(ILcom/huawei/atcommand/HuaweiATUtils$ATCmdType;Ljava/lang/String;)Ljava/lang/Object;
    .locals 5
    .parameter "atCmdId"
    .parameter "atCmdtype"
    .parameter "atCmdValue"

    .prologue
    const/4 v0, 0x0

    .local v0, atFinalResponse:Ljava/lang/Object;
    invoke-static {p0, p1, p2}, Lcom/huawei/atcommand/HuaweiATCmdsProcessor;->atCmdPreProcessor(ILcom/huawei/atcommand/HuaweiATUtils$ATCmdType;Ljava/lang/String;)Lcom/huawei/atcommand/HuaweiATResponseParser;

    move-result-object v1

    .local v1, atSetResponse:Lcom/huawei/atcommand/HuaweiATResponseParser;
    if-nez v1, :cond_0

    const/4 v0, 0x0

    .end local v0           #atFinalResponse:Ljava/lang/Object;
    :goto_0
    return-object v0

    .restart local v0       #atFinalResponse:Ljava/lang/Object;
    :cond_0
    packed-switch p0, :pswitch_data_0

    const-string v2, "HuaweiATCmdsProcessor"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "This atCmdId("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ") is not supported in atCmdSet!"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :pswitch_0
    invoke-static {v1}, Lcom/huawei/atcommand/HuaweiATCmdsProcessor;->atCmdCGMRParser(Lcom/huawei/atcommand/HuaweiATResponseParser;)V

    goto :goto_0

    :pswitch_1
    invoke-static {v1}, Lcom/huawei/atcommand/HuaweiATCmdsProcessor;->atCmdEGMRParser(Lcom/huawei/atcommand/HuaweiATResponseParser;)V

    goto :goto_0

    :pswitch_2
    invoke-static {v1}, Lcom/huawei/atcommand/HuaweiProtocolATProcessor;->atCmdSetAndActionParser(Lcom/huawei/atcommand/HuaweiATResponseParser;)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .local v0, atFinalResponse:Ljava/lang/Boolean;
    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method protected static atCmdTest(ILcom/huawei/atcommand/HuaweiATUtils$ATCmdType;)Ljava/lang/Object;
    .locals 5
    .parameter "atCmdId"
    .parameter "atCmdtype"

    .prologue
    const/4 v2, 0x0

    const/4 v0, 0x0

    .local v0, atFinalResponse:Ljava/lang/Object;
    invoke-static {p0, p1, v2}, Lcom/huawei/atcommand/HuaweiATCmdsProcessor;->atCmdPreProcessor(ILcom/huawei/atcommand/HuaweiATUtils$ATCmdType;Ljava/lang/String;)Lcom/huawei/atcommand/HuaweiATResponseParser;

    move-result-object v1

    .local v1, atTestResponse:Lcom/huawei/atcommand/HuaweiATResponseParser;
    if-nez v1, :cond_0

    move-object v0, v2

    .end local v0           #atFinalResponse:Ljava/lang/Object;
    :goto_0
    return-object v0

    .restart local v0       #atFinalResponse:Ljava/lang/Object;
    :cond_0
    invoke-static {v1}, Lcom/huawei/atcommand/HuaweiATCmdsProcessor;->atCmdTestParser(Lcom/huawei/atcommand/HuaweiATResponseParser;)Ljava/lang/String;

    move-result-object v0

    .local v0, atFinalResponse:Ljava/lang/String;
    const-string v2, "HuaweiATCmdsProcessor"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "This atCmdId("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ") go atCmdTest default branch!"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static atCmdTestParser(Lcom/huawei/atcommand/HuaweiATResponseParser;)Ljava/lang/String;
    .locals 2
    .parameter "response"

    .prologue
    if-nez p0, :cond_0

    const-string v0, "HuaweiATCmdsProcessor"

    const-string v1, "response = null"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x1

    iget-boolean v1, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mAtCmdResult:Z

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mRawData:Ljava/lang/String;

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mRawError:Ljava/lang/String;

    goto :goto_0
.end method
