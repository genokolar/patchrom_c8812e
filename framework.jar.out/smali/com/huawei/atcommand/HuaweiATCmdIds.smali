.class public Lcom/huawei/atcommand/HuaweiATCmdIds;
.super Ljava/lang/Object;
.source "HuaweiATCmdIds.java"


# static fields
.field public static final HW_AT_CMD_ID_AT_AUD_DEV:I = 0x2

.field public static final HW_AT_CMD_ID_AT_AUD_MUTE:I = 0x4

.field public static final HW_AT_CMD_ID_AT_AUD_UNMUTE:I = 0x5

.field public static final HW_AT_CMD_ID_AT_AUD_VOL:I = 0x3

.field public static final HW_AT_CMD_ID_AT_CGMR:I = 0x1

.field public static final HW_AT_CMD_ID_AT_EGMR:I = 0x0

.field public static final HW_AT_CMD_ID_NONE:I = -0x1

.field private static final TAG:Ljava/lang/String; = "HuaweiATCmdIds"

.field private static final mAtCmdtable:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/huawei/atcommand/HuaweiATCmdIds;->mAtCmdtable:Ljava/util/HashMap;

    sget-object v0, Lcom/huawei/atcommand/HuaweiATCmdIds;->mAtCmdtable:Ljava/util/HashMap;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "AT+EGMR"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/huawei/atcommand/HuaweiATCmdIds;->mAtCmdtable:Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "AT+CGMR"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/huawei/atcommand/HuaweiATCmdIds;->mAtCmdtable:Ljava/util/HashMap;

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "AT^AudDev"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/huawei/atcommand/HuaweiATCmdIds;->mAtCmdtable:Ljava/util/HashMap;

    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "AT^AudVol"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/huawei/atcommand/HuaweiATCmdIds;->mAtCmdtable:Ljava/util/HashMap;

    const/4 v1, 0x4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "AT^MUTE"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/huawei/atcommand/HuaweiATCmdIds;->mAtCmdtable:Ljava/util/HashMap;

    const/4 v1, 0x5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "AT^UNMUTE"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static atCmdForATCmdId(I)Ljava/lang/String;
    .locals 4
    .parameter "atCmdId"

    .prologue
    const/4 v0, 0x0

    .local v0, atCmd:Ljava/lang/String;
    sget-object v1, Lcom/huawei/atcommand/HuaweiATCmdIds;->mAtCmdtable:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0           #atCmd:Ljava/lang/String;
    check-cast v0, Ljava/lang/String;

    .restart local v0       #atCmd:Ljava/lang/String;
    const-string v1, "HuaweiATCmdIds"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "atCmd = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0
.end method
