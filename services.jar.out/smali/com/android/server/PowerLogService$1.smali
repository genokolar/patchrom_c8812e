.class Lcom/android/server/PowerLogService$1;
.super Landroid/content/BroadcastReceiver;
.source "PowerLogService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/PowerLogService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/PowerLogService;


# direct methods
.method constructor <init>(Lcom/android/server/PowerLogService;)V
    .locals 0
    .parameter

    .prologue
    iput-object p1, p0, Lcom/android/server/PowerLogService$1;->this$0:Lcom/android/server/PowerLogService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 15
    .parameter "context"
    .parameter "intent"

    .prologue
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    .local v1, action:Ljava/lang/String;
    const-string v9, "android.intent.action.ACTION_SHUTDOWN"

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    iget-object v9, p0, Lcom/android/server/PowerLogService$1;->this$0:Lcom/android/server/PowerLogService;

    iget-object v9, v9, Lcom/android/server/PowerLogService;->mSdf:Ljava/text/SimpleDateFormat;

    new-instance v10, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    invoke-direct {v10, v11, v12}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v9, v10}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    .local v2, date:Ljava/lang/String;
    iget-object v9, p0, Lcom/android/server/PowerLogService$1;->this$0:Lcom/android/server/PowerLogService;

    const-string v10, "SHUTDOWN"

    const-string v11, "system_process"

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v12

    #calls: Lcom/android/server/PowerLogService;->addOneLine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v9, v2, v10, v11, v12}, Lcom/android/server/PowerLogService;->access$000(Lcom/android/server/PowerLogService;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v9, p0, Lcom/android/server/PowerLogService$1;->this$0:Lcom/android/server/PowerLogService;

    const-string v10, "PowerLog"

    iget-object v11, p0, Lcom/android/server/PowerLogService$1;->this$0:Lcom/android/server/PowerLogService;

    #getter for: Lcom/android/server/PowerLogService;->mLogBuilder:Ljava/lang/StringBuilder;
    invoke-static {v11}, Lcom/android/server/PowerLogService;->access$100(Lcom/android/server/PowerLogService;)Ljava/lang/StringBuilder;

    move-result-object v11

    #calls: Lcom/android/server/PowerLogService;->addLogToDropBox(Ljava/lang/String;Ljava/lang/StringBuilder;)V
    invoke-static {v9, v10, v11}, Lcom/android/server/PowerLogService;->access$200(Lcom/android/server/PowerLogService;Ljava/lang/String;Ljava/lang/StringBuilder;)V

    .end local v2           #date:Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    :cond_1
    const-string v9, "android.intent.action.BOOT_COMPLETED"

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .local v4, now:J
    iget-object v9, p0, Lcom/android/server/PowerLogService$1;->this$0:Lcom/android/server/PowerLogService;

    iget-object v10, p0, Lcom/android/server/PowerLogService$1;->this$0:Lcom/android/server/PowerLogService;

    iget-object v10, v10, Lcom/android/server/PowerLogService;->mSdf:Ljava/text/SimpleDateFormat;

    new-instance v11, Ljava/util/Date;

    invoke-direct {v11, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v10, v11}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v10

    #setter for: Lcom/android/server/PowerLogService;->bootTime:Ljava/lang/String;
    invoke-static {v9, v10}, Lcom/android/server/PowerLogService;->access$302(Lcom/android/server/PowerLogService;Ljava/lang/String;)Ljava/lang/String;

    iget-object v9, p0, Lcom/android/server/PowerLogService$1;->this$0:Lcom/android/server/PowerLogService;

    iget-object v10, p0, Lcom/android/server/PowerLogService$1;->this$0:Lcom/android/server/PowerLogService;

    #getter for: Lcom/android/server/PowerLogService;->mLogBuilder:Ljava/lang/StringBuilder;
    invoke-static {v10}, Lcom/android/server/PowerLogService;->access$100(Lcom/android/server/PowerLogService;)Ljava/lang/StringBuilder;

    move-result-object v10

    #calls: Lcom/android/server/PowerLogService;->buildFileHeader(Ljava/lang/StringBuilder;)V
    invoke-static {v9, v10}, Lcom/android/server/PowerLogService;->access$400(Lcom/android/server/PowerLogService;Ljava/lang/StringBuilder;)V

    iget-object v9, p0, Lcom/android/server/PowerLogService$1;->this$0:Lcom/android/server/PowerLogService;

    const/4 v10, 0x1

    iput-boolean v10, v9, Lcom/android/server/PowerLogService;->bootCompleted:Z

    iget-object v9, p0, Lcom/android/server/PowerLogService$1;->this$0:Lcom/android/server/PowerLogService;

    iget-object v10, p0, Lcom/android/server/PowerLogService$1;->this$0:Lcom/android/server/PowerLogService;

    #getter for: Lcom/android/server/PowerLogService;->bootTime:Ljava/lang/String;
    invoke-static {v10}, Lcom/android/server/PowerLogService;->access$300(Lcom/android/server/PowerLogService;)Ljava/lang/String;

    move-result-object v10

    const-string v11, "BOOT_COMPLETED"

    const-string v12, "system_process"

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v13

    #calls: Lcom/android/server/PowerLogService;->addOneLine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v9, v10, v11, v12, v13}, Lcom/android/server/PowerLogService;->access$000(Lcom/android/server/PowerLogService;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .end local v4           #now:J
    :cond_2
    const-string v9, "android.intent.action.DROPBOX_ENTRY_ADDED"

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    const-string v9, "tag"

    const-string v10, ""

    move-object/from16 v0, p2

    invoke-virtual {v0, v9, v10}, Landroid/content/Intent;->getExtra(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .local v6, tag:Ljava/lang/String;
    const-string v9, "time"

    const-wide/16 v10, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v9, v10, v11}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v7

    .local v7, timestampMillis:J
    const-string v9, "PowerLog"

    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    iget-object v9, p0, Lcom/android/server/PowerLogService$1;->this$0:Lcom/android/server/PowerLogService;

    #calls: Lcom/android/server/PowerLogService;->newPowerLogInDropbox(Ljava/lang/String;J)V
    invoke-static {v9, v6, v7, v8}, Lcom/android/server/PowerLogService;->access$500(Lcom/android/server/PowerLogService;Ljava/lang/String;J)V

    goto :goto_0

    .end local v6           #tag:Ljava/lang/String;
    .end local v7           #timestampMillis:J
    :cond_3
    const-string v9, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    const-string v9, "networkInfo"

    move-object/from16 v0, p2

    invoke-virtual {v0, v9}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v3

    check-cast v3, Landroid/net/NetworkInfo;

    .local v3, networkInfo:Landroid/net/NetworkInfo;
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getType()I

    move-result v9

    if-eqz v9, :cond_4

    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getType()I

    move-result v9

    const/4 v10, 0x1

    if-ne v9, v10, :cond_0

    :cond_4
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v9

    if-eqz v9, :cond_0

    iget-object v9, p0, Lcom/android/server/PowerLogService$1;->this$0:Lcom/android/server/PowerLogService;

    invoke-virtual {v9}, Lcom/android/server/PowerLogService;->sendByLogMail()V

    goto/16 :goto_0
.end method
