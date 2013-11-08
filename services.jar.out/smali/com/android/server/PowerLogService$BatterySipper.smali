.class final Lcom/android/server/PowerLogService$BatterySipper;
.super Ljava/lang/Object;
.source "PowerLogService.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/PowerLogService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "BatterySipper"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/PowerLogService$BatterySipper$UidToDetail;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/android/server/PowerLogService$BatterySipper;",
        ">;"
    }
.end annotation


# instance fields
.field cpuFgTime:J

.field cpuTime:J

.field defaultPackageName:Ljava/lang/String;

.field drainType:Lcom/android/server/PowerLogService$DrainType;

.field gpsTime:J

.field final mContext:Landroid/content/Context;

.field final mUidCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/android/server/PowerLogService$BatterySipper$UidToDetail;",
            ">;"
        }
    .end annotation
.end field

.field name:Ljava/lang/String;

.field noCoveragePercent:D

.field percent:D

.field tcpBytesReceived:J

.field tcpBytesSent:J

.field final synthetic this$0:Lcom/android/server/PowerLogService;

.field uidObj:Landroid/os/BatteryStats$Uid;

.field usageTime:J

.field value:D

.field values:[D

.field wakeLockTime:J

.field wifiRunningTime:J


# direct methods
.method constructor <init>(Lcom/android/server/PowerLogService;Landroid/content/Context;Ljava/lang/String;Lcom/android/server/PowerLogService$DrainType;Landroid/os/BatteryStats$Uid;[D)V
    .locals 2
    .parameter
    .parameter "context"
    .parameter "label"
    .parameter "drainType"
    .parameter "uid"
    .parameter "values"

    .prologue
    iput-object p1, p0, Lcom/android/server/PowerLogService$BatterySipper;->this$0:Lcom/android/server/PowerLogService;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/PowerLogService$BatterySipper;->mUidCache:Ljava/util/HashMap;

    iput-object p2, p0, Lcom/android/server/PowerLogService$BatterySipper;->mContext:Landroid/content/Context;

    iput-object p6, p0, Lcom/android/server/PowerLogService$BatterySipper;->values:[D

    iput-object p3, p0, Lcom/android/server/PowerLogService$BatterySipper;->name:Ljava/lang/String;

    iput-object p4, p0, Lcom/android/server/PowerLogService$BatterySipper;->drainType:Lcom/android/server/PowerLogService$DrainType;

    if-eqz p6, :cond_0

    const/4 v0, 0x0

    aget-wide v0, p6, v0

    iput-wide v0, p0, Lcom/android/server/PowerLogService$BatterySipper;->value:D

    :cond_0
    if-nez p3, :cond_1

    if-eqz p5, :cond_1

    invoke-virtual {p0, p5}, Lcom/android/server/PowerLogService$BatterySipper;->getQuickNameForUid(Landroid/os/BatteryStats$Uid;)V

    :cond_1
    iput-object p5, p0, Lcom/android/server/PowerLogService$BatterySipper;->uidObj:Landroid/os/BatteryStats$Uid;

    return-void
.end method


# virtual methods
.method public compareTo(Lcom/android/server/PowerLogService$BatterySipper;)I
    .locals 4
    .parameter "other"

    .prologue
    invoke-virtual {p1}, Lcom/android/server/PowerLogService$BatterySipper;->getSortValue()D

    move-result-wide v0

    invoke-virtual {p0}, Lcom/android/server/PowerLogService$BatterySipper;->getSortValue()D

    move-result-wide v2

    sub-double/2addr v0, v2

    double-to-int v0, v0

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"

    .prologue
    check-cast p1, Lcom/android/server/PowerLogService$BatterySipper;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/android/server/PowerLogService$BatterySipper;->compareTo(Lcom/android/server/PowerLogService$BatterySipper;)I

    move-result v0

    return v0
.end method

.method getQuickNameForUid(Landroid/os/BatteryStats$Uid;)V
    .locals 7
    .parameter "uidObj"

    .prologue
    invoke-virtual {p1}, Landroid/os/BatteryStats$Uid;->getUid()I

    move-result v2

    .local v2, uid:I
    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    .local v3, uidString:Ljava/lang/String;
    iget-object v5, p0, Lcom/android/server/PowerLogService$BatterySipper;->mUidCache:Ljava/util/HashMap;

    invoke-virtual {v5, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    iget-object v5, p0, Lcom/android/server/PowerLogService$BatterySipper;->mUidCache:Ljava/util/HashMap;

    invoke-virtual {v5, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/server/PowerLogService$BatterySipper$UidToDetail;

    .local v4, utd:Lcom/android/server/PowerLogService$BatterySipper$UidToDetail;
    iget-object v5, v4, Lcom/android/server/PowerLogService$BatterySipper$UidToDetail;->packageName:Ljava/lang/String;

    iput-object v5, p0, Lcom/android/server/PowerLogService$BatterySipper;->defaultPackageName:Ljava/lang/String;

    iget-object v5, v4, Lcom/android/server/PowerLogService$BatterySipper$UidToDetail;->name:Ljava/lang/String;

    iput-object v5, p0, Lcom/android/server/PowerLogService$BatterySipper;->name:Ljava/lang/String;

    .end local v4           #utd:Lcom/android/server/PowerLogService$BatterySipper$UidToDetail;
    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v5, p0, Lcom/android/server/PowerLogService$BatterySipper;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .local v1, pm:Landroid/content/pm/PackageManager;
    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->getPackagesForUid(I)[Ljava/lang/String;

    move-result-object v0

    .local v0, packages:[Ljava/lang/String;
    if-nez v0, :cond_0

    if-nez v2, :cond_2

    const-string v5, "Android OS"

    iput-object v5, p0, Lcom/android/server/PowerLogService$BatterySipper;->name:Ljava/lang/String;

    goto :goto_0

    :cond_2
    const-string v5, "mediaserver"

    iget-object v6, p0, Lcom/android/server/PowerLogService$BatterySipper;->name:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const-string v5, "Mediaserver"

    iput-object v5, p0, Lcom/android/server/PowerLogService$BatterySipper;->name:Ljava/lang/String;

    goto :goto_0
.end method

.method getSortValue()D
    .locals 2

    .prologue
    iget-wide v0, p0, Lcom/android/server/PowerLogService$BatterySipper;->value:D

    return-wide v0
.end method

.method getValues()[D
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/android/server/PowerLogService$BatterySipper;->values:[D

    return-object v0
.end method
