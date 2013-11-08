.class public Lcom/huawei/atcommand/HuaweiATUtils;
.super Ljava/lang/Object;
.source "HuaweiATUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/huawei/atcommand/HuaweiATUtils$ATCmdCmeErrorType;,
        Lcom/huawei/atcommand/HuaweiATUtils$SimStatus;,
        Lcom/huawei/atcommand/HuaweiATUtils$ATCmdType;
    }
.end annotation


# static fields
.field private static final AT_CMD_ERROR_NUM:I = 0x6

.field private static final TAG:Ljava/lang/String; = "HuaweiATUtils"

.field private static final mAtCmdError:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    sput-object v0, Lcom/huawei/atcommand/HuaweiATUtils;->mAtCmdError:Ljava/util/ArrayList;

    sget-object v0, Lcom/huawei/atcommand/HuaweiATUtils;->mAtCmdError:Ljava/util/ArrayList;

    const-string v1, "ERROR"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/huawei/atcommand/HuaweiATUtils;->mAtCmdError:Ljava/util/ArrayList;

    const-string v1, "+CMS ERROR:"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/huawei/atcommand/HuaweiATUtils;->mAtCmdError:Ljava/util/ArrayList;

    const-string v1, "+CME ERROR:"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/huawei/atcommand/HuaweiATUtils;->mAtCmdError:Ljava/util/ArrayList;

    const-string v1, "NO CARRIER"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/huawei/atcommand/HuaweiATUtils;->mAtCmdError:Ljava/util/ArrayList;

    const-string v1, "NO ANSWER"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/huawei/atcommand/HuaweiATUtils;->mAtCmdError:Ljava/util/ArrayList;

    const-string v1, "NO DIALTONE"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static checkForDigit(Ljava/lang/String;)Z
    .locals 5
    .parameter "digitString"

    .prologue
    const/4 v1, 0x0

    const-string v2, "HuaweiATUtils"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "input digitString ="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p0, :cond_0

    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_2

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isDigit(C)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "HuaweiATUtils"

    const-string v3, "input digitString inclue no-digit, please check!"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .end local v0           #i:I
    :cond_0
    :goto_1
    return v1

    .restart local v0       #i:I
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v1, 0x1

    goto :goto_1
.end method

.method public static findCommasNum(Ljava/lang/String;)I
    .locals 6
    .parameter "input"

    .prologue
    const-string v3, "HuaweiATUtils"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "input ="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-nez p0, :cond_1

    const/4 v1, 0x0

    :cond_0
    return v1

    :cond_1
    const/4 v1, 0x0

    .local v1, num:I
    const-string v3, ","

    invoke-static {v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    .local v2, p:Ljava/util/regex/Pattern;
    invoke-virtual {v2, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .local v0, m:Ljava/util/regex/Matcher;
    :goto_0
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-eqz v3, :cond_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static getCmeError(Ljava/lang/String;)Lcom/huawei/atcommand/HuaweiATUtils$ATCmdCmeErrorType;
    .locals 4
    .parameter "cmeError"

    .prologue
    const/4 v2, 0x0

    const/4 v0, 0x0

    .local v0, errorType:Lcom/huawei/atcommand/HuaweiATUtils$ATCmdCmeErrorType;
    const/4 v1, 0x0

    .local v1, stripCmeError:Ljava/lang/String;
    invoke-static {p0}, Lcom/huawei/atcommand/HuaweiATUtils;->stripPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0}, Lcom/huawei/atcommand/HuaweiATUtils;->isStartWithAtCmeError(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    sget-object v2, Lcom/huawei/atcommand/HuaweiATUtils$ATCmdCmeErrorType;->CME_ERROR_NON_CME:Lcom/huawei/atcommand/HuaweiATUtils$ATCmdCmeErrorType;

    :cond_0
    :goto_0
    return-object v2

    :cond_1
    invoke-static {v1}, Lcom/huawei/atcommand/HuaweiATUtils;->checkForDigit(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-static {v3}, Lcom/huawei/atcommand/HuaweiATUtils$ATCmdCmeErrorType;->fromInt(I)Lcom/huawei/atcommand/HuaweiATUtils$ATCmdCmeErrorType;

    move-result-object v0

    if-eqz v0, :cond_0

    move-object v2, v0

    goto :goto_0
.end method

.method public static getSplitedString(Ljava/lang/String;)[Ljava/lang/String;
    .locals 2
    .parameter "rawdString"

    .prologue
    const/4 v0, 0x0

    .local v0, stripedString:Ljava/lang/String;
    invoke-static {p0}, Lcom/huawei/atcommand/HuaweiATUtils;->stripPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static isStartWithAtCmdError(Ljava/lang/String;)Z
    .locals 4
    .parameter "error"

    .prologue
    const-string v1, "HuaweiATUtils"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isStartWithAtCmdError: error = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p0, :cond_1

    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    const/4 v1, 0x6

    if-ge v0, v1, :cond_1

    sget-object v1, Lcom/huawei/atcommand/HuaweiATUtils;->mAtCmdError:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    .end local v0           #i:I
    :goto_1
    return v1

    .restart local v0       #i:I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .end local v0           #i:I
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public static isStartWithAtCmeError(Ljava/lang/String;)Z
    .locals 3
    .parameter "error"

    .prologue
    const-string v0, "HuaweiATUtils"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "isStartWithAtCmeError: error = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p0, :cond_0

    const-string v0, "+CME ERROR:"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static stripPrefix(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .parameter "rawString"

    .prologue
    const/4 v5, -0x1

    const-string v2, "HuaweiATUtils"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "rawString = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p0, :cond_2

    const-string v2, ":"

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .local v0, posColon:I
    const-string v2, ": "

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .local v1, posColonSpace:I
    const-string v2, "HuaweiATUtils"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "posColon = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ",posColonSpace = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eq v1, v5, :cond_1

    add-int/lit8 v2, v1, 0x2

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .restart local p0
    :cond_1
    if-ne v1, v5, :cond_0

    if-eq v0, v5, :cond_0

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .end local v0           #posColon:I
    .end local v1           #posColonSpace:I
    :cond_2
    const/4 p0, 0x0

    goto :goto_0
.end method
