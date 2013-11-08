.class public Lcom/huawei/atcommand/HuaweiATCmds;
.super Ljava/lang/Object;
.source "HuaweiATCmds.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/huawei/atcommand/HuaweiATCmds$1;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "HuaweiATCmds"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static huaweiATResponse(ILcom/huawei/atcommand/HuaweiATUtils$ATCmdType;Ljava/lang/String;)Ljava/lang/Object;
    .locals 4
    .parameter "atCmdId"
    .parameter "atCmdType"
    .parameter "atCmdValue"

    .prologue
    const/4 v0, 0x0

    .local v0, atResponse:Ljava/lang/Object;
    const-string v1, "HuaweiATCmds"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ATDirectChannel: atCmdId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",atCmdType= "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",atCmdValue = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v1, Lcom/huawei/atcommand/HuaweiATCmds$1;->$SwitchMap$com$huawei$atcommand$HuaweiATUtils$ATCmdType:[I

    invoke-virtual {p1}, Lcom/huawei/atcommand/HuaweiATUtils$ATCmdType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    const-string v1, "HuaweiATCmds"

    const-string v2, "Invalid At Cmd Type, please check it!"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .end local v0           #atResponse:Ljava/lang/Object;
    :goto_0
    return-object v0

    .restart local v0       #atResponse:Ljava/lang/Object;
    :pswitch_0
    invoke-static {p0, p1}, Lcom/huawei/atcommand/HuaweiATCmdsProcessor;->atCmdAction(ILcom/huawei/atcommand/HuaweiATUtils$ATCmdType;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    :pswitch_1
    if-eqz p2, :cond_0

    const-string v1, ""

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const-string v1, "HuaweiATCmds"

    const-string v2, "AT Cmds Set, please input set value"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_1
    invoke-static {p0, p1, p2}, Lcom/huawei/atcommand/HuaweiATCmdsProcessor;->atCmdSet(ILcom/huawei/atcommand/HuaweiATUtils$ATCmdType;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    :pswitch_2
    invoke-static {p0, p1}, Lcom/huawei/atcommand/HuaweiATCmdsProcessor;->atCmdRead(ILcom/huawei/atcommand/HuaweiATUtils$ATCmdType;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    :pswitch_3
    invoke-static {p0, p1}, Lcom/huawei/atcommand/HuaweiATCmdsProcessor;->atCmdTest(ILcom/huawei/atcommand/HuaweiATUtils$ATCmdType;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
