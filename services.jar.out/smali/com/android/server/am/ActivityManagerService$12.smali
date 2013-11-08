.class Lcom/android/server/am/ActivityManagerService$12;
.super Ljava/lang/Thread;
.source "ActivityManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/am/ActivityManagerService;->addErrorToDropBox(Ljava/lang/String;Lcom/android/server/am/ProcessRecord;Ljava/lang/String;Lcom/android/server/am/ActivityRecord;Lcom/android/server/am/ActivityRecord;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;Landroid/app/ApplicationErrorReport$CrashInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/am/ActivityManagerService;

.field final synthetic val$args:[Ljava/lang/String;

.field final synthetic val$crashInfo:Landroid/app/ApplicationErrorReport$CrashInfo;

.field final synthetic val$dbox:Landroid/os/DropBoxManager;

.field final synthetic val$dropboxTag:Ljava/lang/String;

.field final synthetic val$error_systemmilli:J

.field final synthetic val$evnetType_final:Ljava/lang/String;

.field final synthetic val$logFile:Ljava/io/File;

.field final synthetic val$needReboot:Z

.field final synthetic val$report:Ljava/lang/String;

.field final synthetic val$sb:Ljava/lang/StringBuilder;


# direct methods
.method constructor <init>(Lcom/android/server/am/ActivityManagerService;Ljava/lang/String;Ljava/lang/String;Ljava/lang/StringBuilder;Ljava/io/File;Landroid/app/ApplicationErrorReport$CrashInfo;Ljava/lang/String;Landroid/os/DropBoxManager;ZJLjava/lang/String;[Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter "x0"
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    iput-object p1, p0, Lcom/android/server/am/ActivityManagerService$12;->this$0:Lcom/android/server/am/ActivityManagerService;

    iput-object p3, p0, Lcom/android/server/am/ActivityManagerService$12;->val$report:Ljava/lang/String;

    iput-object p4, p0, Lcom/android/server/am/ActivityManagerService$12;->val$sb:Ljava/lang/StringBuilder;

    iput-object p5, p0, Lcom/android/server/am/ActivityManagerService$12;->val$logFile:Ljava/io/File;

    iput-object p6, p0, Lcom/android/server/am/ActivityManagerService$12;->val$crashInfo:Landroid/app/ApplicationErrorReport$CrashInfo;

    iput-object p7, p0, Lcom/android/server/am/ActivityManagerService$12;->val$dropboxTag:Ljava/lang/String;

    iput-object p8, p0, Lcom/android/server/am/ActivityManagerService$12;->val$dbox:Landroid/os/DropBoxManager;

    iput-boolean p9, p0, Lcom/android/server/am/ActivityManagerService$12;->val$needReboot:Z

    iput-wide p10, p0, Lcom/android/server/am/ActivityManagerService$12;->val$error_systemmilli:J

    iput-object p12, p0, Lcom/android/server/am/ActivityManagerService$12;->val$evnetType_final:Ljava/lang/String;

    iput-object p13, p0, Lcom/android/server/am/ActivityManagerService$12;->val$args:[Ljava/lang/String;

    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .prologue
    const/4 v4, 0x0

    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService$12;->val$report:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService$12;->val$sb:Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/server/am/ActivityManagerService$12;->val$report:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService$12;->val$logFile:Ljava/io/File;

    if-eqz v0, :cond_1

    :try_start_0
    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService$12;->val$sb:Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/server/am/ActivityManagerService$12;->val$logFile:Ljava/io/File;

    const/high16 v2, 0x2

    const-string v3, "\n\n[[TRUNCATED]]"

    invoke-static {v1, v2, v3}, Landroid/os/FileUtils;->readTextFile(Ljava/io/File;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService$12;->val$crashInfo:Landroid/app/ApplicationErrorReport$CrashInfo;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService$12;->val$crashInfo:Landroid/app/ApplicationErrorReport$CrashInfo;

    iget-object v0, v0, Landroid/app/ApplicationErrorReport$CrashInfo;->stackTrace:Ljava/lang/String;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService$12;->val$sb:Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/server/am/ActivityManagerService$12;->val$crashInfo:Landroid/app/ApplicationErrorReport$CrashInfo;

    iget-object v1, v1, Landroid/app/ApplicationErrorReport$CrashInfo;->stackTrace:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "logcat_for_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/am/ActivityManagerService$12;->val$dropboxTag:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .local v14, setting:Ljava/lang/String;
    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService$12;->this$0:Lcom/android/server/am/ActivityManagerService;

    iget-object v0, v0, Lcom/android/server/am/ActivityManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v0, v14, v4}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v10

    .local v10, lines:I
    if-lez v10, :cond_3

    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService$12;->val$sb:Ljava/lang/StringBuilder;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v8, 0x0

    .local v8, input:Ljava/io/InputStreamReader;
    :try_start_1
    new-instance v0, Ljava/lang/ProcessBuilder;

    const/16 v1, 0xb

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "/system/bin/logcat"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "-v"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "time"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "-b"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "events"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "-b"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "system"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "-b"

    aput-object v3, v1, v2

    const/16 v2, 0x8

    const-string v3, "main"

    aput-object v3, v1, v2

    const/16 v2, 0x9

    const-string v3, "-t"

    aput-object v3, v1, v2

    const/16 v2, 0xa

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-direct {v0, v1}, Ljava/lang/ProcessBuilder;-><init>([Ljava/lang/String;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/ProcessBuilder;->redirectErrorStream(Z)Ljava/lang/ProcessBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ProcessBuilder;->start()Ljava/lang/Process;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_5

    move-result-object v11

    .local v11, logcat:Ljava/lang/Process;
    :try_start_2
    invoke-virtual {v11}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_7

    :goto_1
    :try_start_3
    invoke-virtual {v11}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_6

    :goto_2
    :try_start_4
    new-instance v9, Ljava/io/InputStreamReader;

    invoke-virtual {v11}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-direct {v9, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_5

    .end local v8           #input:Ljava/io/InputStreamReader;
    .local v9, input:Ljava/io/InputStreamReader;
    const/16 v0, 0x2000

    :try_start_5
    new-array v6, v0, [C

    .local v6, buf:[C
    :goto_3
    invoke-virtual {v9, v6}, Ljava/io/InputStreamReader;->read([C)I

    move-result v13

    .local v13, num:I
    if-lez v13, :cond_6

    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService$12;->val$sb:Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v6, v1, v13}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_3

    .end local v6           #buf:[C
    .end local v13           #num:I
    :catch_0
    move-exception v7

    move-object v8, v9

    .end local v9           #input:Ljava/io/InputStreamReader;
    .end local v11           #logcat:Ljava/lang/Process;
    .local v7, e:Ljava/io/IOException;
    .restart local v8       #input:Ljava/io/InputStreamReader;
    :goto_4
    :try_start_6
    const-string v0, "ActivityManager"

    const-string v1, "Error running logcat"

    invoke-static {v0, v1, v7}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    if-eqz v8, :cond_3

    :try_start_7
    invoke-virtual {v8}, Ljava/io/InputStreamReader;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_4

    .end local v7           #e:Ljava/io/IOException;
    .end local v8           #input:Ljava/io/InputStreamReader;
    :cond_3
    :goto_5
    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService$12;->val$dbox:Landroid/os/DropBoxManager;

    iget-object v1, p0, Lcom/android/server/am/ActivityManagerService$12;->val$dropboxTag:Ljava/lang/String;

    iget-object v2, p0, Lcom/android/server/am/ActivityManagerService$12;->val$sb:Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/DropBoxManager;->addText(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_8
    iget-boolean v0, p0, Lcom/android/server/am/ActivityManagerService$12;->val$needReboot:Z

    if-nez v0, :cond_5

    const-wide/16 v0, 0x3e8

    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V

    const-string v0, "archive"

    iget-wide v1, p0, Lcom/android/server/am/ActivityManagerService$12;->val$error_systemmilli:J

    iget-object v3, p0, Lcom/android/server/am/ActivityManagerService$12;->val$evnetType_final:Ljava/lang/String;

    iget-boolean v4, p0, Lcom/android/server/am/ActivityManagerService$12;->val$needReboot:Z

    const/4 v5, 0x1

    invoke-static/range {v0 .. v5}, Lcom/huawei/android/hwlog/HWFileUtils;->getSocketMessage(Ljava/lang/String;JLjava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v12

    .local v12, msg:Ljava/lang/String;
    const-string v0, "ActivityManager"

    invoke-static {v0, v12}, Landroid/util/LogException;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_8
    .catch Ljava/lang/InterruptedException; {:try_start_8 .. :try_end_8} :catch_2

    .end local v12           #msg:Ljava/lang/String;
    :goto_6
    return-void

    .end local v10           #lines:I
    .end local v14           #setting:Ljava/lang/String;
    :catch_1
    move-exception v7

    .restart local v7       #e:Ljava/io/IOException;
    const-string v0, "ActivityManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error reading "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/am/ActivityManagerService$12;->val$logFile:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v7}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_0

    .end local v7           #e:Ljava/io/IOException;
    .restart local v8       #input:Ljava/io/InputStreamReader;
    .restart local v10       #lines:I
    .restart local v14       #setting:Ljava/lang/String;
    :catchall_0
    move-exception v0

    :goto_7
    if-eqz v8, :cond_4

    :try_start_9
    invoke-virtual {v8}, Ljava/io/InputStreamReader;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_3

    :cond_4
    :goto_8
    throw v0

    .end local v8           #input:Ljava/io/InputStreamReader;
    :cond_5
    :try_start_a
    const-string v0, "/data/log/error_log.txt"

    iget-object v1, p0, Lcom/android/server/am/ActivityManagerService$12;->val$args:[Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/huawei/android/hwlog/HWFileUtils;->addInfoToFile(Ljava/lang/String;[Ljava/lang/String;)Z
    :try_end_a
    .catch Ljava/lang/InterruptedException; {:try_start_a .. :try_end_a} :catch_2

    goto :goto_6

    :catch_2
    move-exception v7

    .local v7, e:Ljava/lang/InterruptedException;
    const-string v0, "ActivityManager"

    const-string v1, "sleep error"

    invoke-static {v0, v1, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_6

    .end local v7           #e:Ljava/lang/InterruptedException;
    .restart local v8       #input:Ljava/io/InputStreamReader;
    :catch_3
    move-exception v1

    goto :goto_8

    .end local v8           #input:Ljava/io/InputStreamReader;
    :catch_4
    move-exception v0

    goto :goto_5

    .restart local v6       #buf:[C
    .restart local v9       #input:Ljava/io/InputStreamReader;
    .restart local v11       #logcat:Ljava/lang/Process;
    .restart local v13       #num:I
    :cond_6
    if-eqz v9, :cond_3

    :try_start_b
    invoke-virtual {v9}, Ljava/io/InputStreamReader;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_4

    goto :goto_5

    .end local v6           #buf:[C
    .end local v13           #num:I
    :catchall_1
    move-exception v0

    move-object v8, v9

    .end local v9           #input:Ljava/io/InputStreamReader;
    .restart local v8       #input:Ljava/io/InputStreamReader;
    goto :goto_7

    .end local v11           #logcat:Ljava/lang/Process;
    :catch_5
    move-exception v7

    goto :goto_4

    .restart local v11       #logcat:Ljava/lang/Process;
    :catch_6
    move-exception v0

    goto/16 :goto_2

    :catch_7
    move-exception v0

    goto/16 :goto_1
.end method
