.class Lcom/android/server/BootReceiver$1;
.super Ljava/lang/Thread;
.source "BootReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/BootReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/BootReceiver;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/android/server/BootReceiver;Landroid/content/Context;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    iput-object p1, p0, Lcom/android/server/BootReceiver$1;->this$0:Lcom/android/server/BootReceiver;

    iput-object p2, p0, Lcom/android/server/BootReceiver$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 14

    .prologue
    :try_start_0
    iget-object v1, p0, Lcom/android/server/BootReceiver$1;->this$0:Lcom/android/server/BootReceiver;

    iget-object v2, p0, Lcom/android/server/BootReceiver$1;->val$context:Landroid/content/Context;

    #calls: Lcom/android/server/BootReceiver;->logBootEvents(Landroid/content/Context;)V
    invoke-static {v1, v2}, Lcom/android/server/BootReceiver;->access$000(Lcom/android/server/BootReceiver;Landroid/content/Context;)V

    const-string v1, "/data/log/error_log.txt"

    invoke-static {v1}, Lcom/huawei/android/hwlog/HWFileUtils;->getErrorRecordToPackage(Ljava/lang/String;)Ljava/util/List;

    move-result-object v11

    .local v11, lst:Ljava/util/List;
    const/4 v10, 0x0

    .local v10, i:I
    :goto_0
    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v1

    if-ge v10, v1, :cond_0

    invoke-interface {v11, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    move-object v0, v1

    check-cast v0, [Ljava/lang/String;

    move-object v8, v0

    .local v8, args:[Ljava/lang/String;
    const-string v1, "archive"

    const/4 v2, 0x0

    aget-object v2, v8, v2

    invoke-static {v2}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    const/4 v4, 0x1

    aget-object v4, v8, v4

    const/4 v5, 0x1

    const/4 v6, 0x1

    invoke-static/range {v1 .. v6}, Lcom/huawei/android/hwlog/HWFileUtils;->getSocketMessage(Ljava/lang/String;JLjava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v13

    .local v13, msg:Ljava/lang/String;
    const-string v1, "BootReceiver"

    invoke-static {v1, v13}, Landroid/util/LogException;->i(Ljava/lang/String;Ljava/lang/String;)I

    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .end local v8           #args:[Ljava/lang/String;
    .end local v13           #msg:Ljava/lang/String;
    :cond_0
    const-string v1, "1"

    const-string v2, "ro.config.hw.usedtime.statis"

    const-string v3, "0"

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "/data/HWUserData/calibration/used_time_stat.txt"

    invoke-static {v1}, Lcom/huawei/android/hwlog/HWFileUtils;->getInfosFromFile(Ljava/lang/String;)Ljava/util/List;

    move-result-object v12

    .local v12, lt:Ljava/util/List;
    const/4 v7, 0x0

    .local v7, addArgs:[Ljava/lang/String;
    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_3

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v12, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    move-object v0, v1

    check-cast v0, [Ljava/lang/String;

    move-object v8, v0

    .restart local v8       #args:[Ljava/lang/String;
    const-string v1, " "

    const/4 v2, 0x2

    aget-object v2, v8, v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const/4 v1, 0x4

    new-array v7, v1, [Ljava/lang/String;

    .end local v7           #addArgs:[Ljava/lang/String;
    const/4 v1, 0x0

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    const-string v3, "yyyy/MM/dd HH:mm:ss"

    invoke-static {v2, v3}, Lcom/huawei/android/hwlog/HWFileUtils;->getTimeString(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v7, v1

    const/4 v1, 0x1

    const-string v2, "0H0M0S"

    aput-object v2, v7, v1

    const/4 v1, 0x2

    const-string v2, " "

    aput-object v2, v7, v1

    const/4 v1, 0x3

    const-string v2, "N"

    aput-object v2, v7, v1

    .end local v8           #args:[Ljava/lang/String;
    .restart local v7       #addArgs:[Ljava/lang/String;
    :cond_1
    :goto_1
    if-eqz v7, :cond_2

    const-string v1, "/data/HWUserData/calibration/used_time_stat.txt"

    const/16 v2, 0x64

    invoke-static {v1, v7, v2, v12}, Lcom/huawei/android/hwlog/HWFileUtils;->addInfoToFile(Ljava/lang/String;[Ljava/lang/String;ILjava/util/List;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v7           #addArgs:[Ljava/lang/String;
    .end local v10           #i:I
    .end local v11           #lst:Ljava/util/List;
    .end local v12           #lt:Ljava/util/List;
    :cond_2
    :goto_2
    :try_start_1
    iget-object v1, p0, Lcom/android/server/BootReceiver$1;->this$0:Lcom/android/server/BootReceiver;

    iget-object v2, p0, Lcom/android/server/BootReceiver$1;->val$context:Landroid/content/Context;

    #calls: Lcom/android/server/BootReceiver;->removeOldUpdatePackages(Landroid/content/Context;)V
    invoke-static {v1, v2}, Lcom/android/server/BootReceiver;->access$100(Lcom/android/server/BootReceiver;Landroid/content/Context;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :goto_3
    return-void

    .restart local v7       #addArgs:[Ljava/lang/String;
    .restart local v10       #i:I
    .restart local v11       #lst:Ljava/util/List;
    .restart local v12       #lt:Ljava/util/List;
    :cond_3
    const/4 v1, 0x4

    :try_start_2
    new-array v7, v1, [Ljava/lang/String;

    .end local v7           #addArgs:[Ljava/lang/String;
    const/4 v1, 0x0

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    const-string v3, "yyyy/MM/dd HH:mm:ss"

    invoke-static {v2, v3}, Lcom/huawei/android/hwlog/HWFileUtils;->getTimeString(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v7, v1

    const/4 v1, 0x1

    const-string v2, "0H0M0S"

    aput-object v2, v7, v1

    const/4 v1, 0x2

    const-string v2, " "

    aput-object v2, v7, v1

    const/4 v1, 0x3

    const-string v2, "N"

    aput-object v2, v7, v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .restart local v7       #addArgs:[Ljava/lang/String;
    goto :goto_1

    .end local v7           #addArgs:[Ljava/lang/String;
    .end local v10           #i:I
    .end local v11           #lst:Ljava/util/List;
    .end local v12           #lt:Ljava/util/List;
    :catch_0
    move-exception v9

    .local v9, e:Ljava/lang/Exception;
    const-string v1, "BootReceiver"

    const-string v2, "Can\'t log boot events"

    invoke-static {v1, v2, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2

    .end local v9           #e:Ljava/lang/Exception;
    :catch_1
    move-exception v9

    .restart local v9       #e:Ljava/lang/Exception;
    const-string v1, "BootReceiver"

    const-string v2, "Can\'t remove old update packages"

    invoke-static {v1, v2, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3
.end method
