.class final Lcom/huawei/telephony/msim/HuaweiPhoneService$MainThreadRequest;
.super Ljava/lang/Object;
.source "HuaweiPhoneService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/huawei/telephony/msim/HuaweiPhoneService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "MainThreadRequest"
.end annotation


# instance fields
.field public arg1:Ljava/lang/Object;

.field public arg2:Ljava/lang/Object;

.field public result:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .parameter "arg1"
    .parameter "arg2"

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService$MainThreadRequest;->arg1:Ljava/lang/Object;

    iput-object p2, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService$MainThreadRequest;->arg2:Ljava/lang/Object;

    return-void
.end method
