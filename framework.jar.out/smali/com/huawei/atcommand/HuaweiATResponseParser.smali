.class public Lcom/huawei/atcommand/HuaweiATResponseParser;
.super Ljava/lang/Object;
.source "HuaweiATResponseParser.java"


# instance fields
.field TAG:Ljava/lang/String;

.field mAtCmdResult:Z

.field mData:Lcom/android/internal/telephony/ATResponseParser;

.field mRawData:Ljava/lang/String;

.field mRawError:Ljava/lang/String;


# direct methods
.method constructor <init>(ZLcom/android/internal/telephony/ATResponseParser;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "result"
    .parameter "data"
    .parameter "rawError"
    .parameter "rawData"

    .prologue
    const/4 v1, 0x0

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "HuaweiATResponseParser"

    iput-object v0, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->TAG:Ljava/lang/String;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mAtCmdResult:Z

    iput-object v1, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mData:Lcom/android/internal/telephony/ATResponseParser;

    iput-object v1, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mRawError:Ljava/lang/String;

    iput-object v1, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mRawData:Ljava/lang/String;

    iput-boolean p1, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mAtCmdResult:Z

    iput-object p2, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mData:Lcom/android/internal/telephony/ATResponseParser;

    iput-object p3, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mRawError:Ljava/lang/String;

    iput-object p4, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mRawData:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public toDebugString()V
    .locals 3

    .prologue
    iget-object v0, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ATResponse: mAtCmdResult = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mAtCmdResult:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",mRawError = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mRawError:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",mRawData="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/huawei/atcommand/HuaweiATResponseParser;->mRawData:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
