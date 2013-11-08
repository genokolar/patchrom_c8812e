.class Lcom/android/server/PowerLogService$BatterySipper$UidToDetail;
.super Ljava/lang/Object;
.source "PowerLogService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/PowerLogService$BatterySipper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "UidToDetail"
.end annotation


# instance fields
.field name:Ljava/lang/String;

.field packageName:Ljava/lang/String;

.field final synthetic this$1:Lcom/android/server/PowerLogService$BatterySipper;


# direct methods
.method constructor <init>(Lcom/android/server/PowerLogService$BatterySipper;)V
    .locals 0
    .parameter

    .prologue
    iput-object p1, p0, Lcom/android/server/PowerLogService$BatterySipper$UidToDetail;->this$1:Lcom/android/server/PowerLogService$BatterySipper;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
