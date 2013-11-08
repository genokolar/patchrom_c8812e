.class public Lcom/broadcom/bt/service/framework/PowerManagementService;
.super Lcom/broadcom/bt/service/framework/IPowerManager$Stub;
.source "PowerManagementService.java"


# static fields
.field public static final SERVICE_NAME:Ljava/lang/String; = "bt_fm_radio"


# instance fields
.field private final mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    invoke-direct {p0}, Lcom/broadcom/bt/service/framework/IPowerManager$Stub;-><init>()V

    iput-object p1, p0, Lcom/broadcom/bt/service/framework/PowerManagementService;->mContext:Landroid/content/Context;

    return-void
.end method
