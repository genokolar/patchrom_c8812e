.class Lcom/android/server/LinkManager$LinkSocketInfo;
.super Ljava/lang/Object;
.source "LinkManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/LinkManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LinkSocketInfo"
.end annotation


# instance fields
.field public capabilities:Landroid/net/LinkCapabilities;

.field public id:I

.field public isQosRole:Z

.field final synthetic this$0:Lcom/android/server/LinkManager;


# direct methods
.method public constructor <init>(Lcom/android/server/LinkManager;ILandroid/net/LinkCapabilities;)V
    .locals 0
    .parameter
    .parameter "id"
    .parameter "capabilities"

    .prologue
    iput-object p1, p0, Lcom/android/server/LinkManager$LinkSocketInfo;->this$0:Lcom/android/server/LinkManager;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lcom/android/server/LinkManager$LinkSocketInfo;->id:I

    iput-object p3, p0, Lcom/android/server/LinkManager$LinkSocketInfo;->capabilities:Landroid/net/LinkCapabilities;

    invoke-direct {p0}, Lcom/android/server/LinkManager$LinkSocketInfo;->parseRole()V

    return-void
.end method

.method private parseRole()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    iget-object v1, p0, Lcom/android/server/LinkManager$LinkSocketInfo;->capabilities:Landroid/net/LinkCapabilities;

    if-nez v1, :cond_1

    const-string v0, "invalidString"

    .local v0, roleString:Ljava/lang/String;
    :goto_0
    const-string v1, "qos"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "QOS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/server/LinkManager$LinkSocketInfo;->isQosRole:Z

    :goto_1
    return-void

    .end local v0           #roleString:Ljava/lang/String;
    :cond_1
    iget-object v1, p0, Lcom/android/server/LinkManager$LinkSocketInfo;->capabilities:Landroid/net/LinkCapabilities;

    invoke-virtual {v1, v2}, Landroid/net/LinkCapabilities;->get(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .restart local v0       #roleString:Ljava/lang/String;
    :cond_2
    iput-boolean v2, p0, Lcom/android/server/LinkManager$LinkSocketInfo;->isQosRole:Z

    goto :goto_1
.end method
