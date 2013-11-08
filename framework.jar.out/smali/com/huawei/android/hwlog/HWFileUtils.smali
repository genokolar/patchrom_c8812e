.class public Lcom/huawei/android/hwlog/HWFileUtils;
.super Ljava/lang/Object;
.source "HWFileUtils.java"


# static fields
.field public static final ANR_TRACE_LOG:Ljava/lang/String; = "/data/anr/"

.field public static final ARCHIVE_COMMAND:Ljava/lang/String; = "archive"

.field public static final DATA_LOG:Ljava/lang/String; = "/data/log/"

.field public static final DONTPANIC_LOG:Ljava/lang/String; = "/data/dontpanic/"

.field public static final DROPBOX_LOG:Ljava/lang/String; = "/data/system/dropbox/"

.field public static final ERROR_LOG_FILE:Ljava/lang/String; = "error_log.txt"

.field public static final GZ_SUFFIX:Ljava/lang/String; = "gz"

.field public static final HOUR_FOR_SHORT:Ljava/lang/String; = "H"

.field public static final INTERVAL_CAT_LOG_MININET:I = 0x3

.field public static final INTERVAL_CAT_LOG_SECOND:I = 0x5

.field public static final IN_PARAM_COMMAND:Ljava/lang/String; = "-i"

.field public static final IS_OFFICAL_VERSION:Z = false

.field public static final LINE_SEPARATOR:Ljava/lang/String; = ";"

.field public static final MAX_LINE_NUMBER:I = 0x64

.field public static final MINUTES_FOR_SHORT:Ljava/lang/String; = "M"

.field public static final OUT_PARAM_COMMAND:Ljava/lang/String; = "-o"

.field public static final PSTACK:Ljava/lang/String; = "pstack"

.field public static final PSTACK_LOG:Ljava/lang/String; = "/data/log/dbox/pstack/"

.field public static final RE_CALCULATE_TIME_INTERVAL:J = 0xcL

.field public static final SECOND_FOR_SHORT:Ljava/lang/String; = "S"

.field public static final TAG:Ljava/lang/String; = "HWFileUtils"

.field public static final TOMBSTONES_LOG:Ljava/lang/String; = "/data/tombstones/"

.field public static final USED_TIME_STAT_FILE:Ljava/lang/String; = "used_time_stat.txt"

.field public static final USED_TIME_STAT_PATH:Ljava/lang/String; = "/data/HWUserData/calibration/"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addInfoToFile(Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 2
    .parameter "filePath"
    .parameter "infos"

    .prologue
    invoke-static {p0}, Lcom/huawei/android/hwlog/HWFileUtils;->getInfosFromFile(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .local v0, list:Ljava/util/List;
    if-eqz p1, :cond_0

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    invoke-static {p0, v0}, Lcom/huawei/android/hwlog/HWFileUtils;->writeToFile(Ljava/lang/String;Ljava/util/List;)Z

    move-result v1

    return v1
.end method

.method public static addInfoToFile(Ljava/lang/String;[Ljava/lang/String;ILjava/util/List;)Z
    .locals 1
    .parameter "filePath"
    .parameter "infos"
    .parameter "maxLine"
    .parameter "list"

    .prologue
    if-eqz p1, :cond_3

    if-lez p2, :cond_0

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v0

    if-gt v0, p2, :cond_1

    :cond_0
    if-nez p2, :cond_2

    :cond_1
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-interface {p3, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    :cond_2
    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    invoke-static {p0, p3}, Lcom/huawei/android/hwlog/HWFileUtils;->writeToFile(Ljava/lang/String;Ljava/util/List;)Z

    move-result v0

    return v0
.end method

.method public static addPstackToDropbox(ILjava/lang/String;)V
    .locals 10
    .parameter "pid"
    .parameter "errorType"

    .prologue
    invoke-static {}, Lcom/huawei/android/hwlog/HWFileUtils;->getDropBoxManager()Landroid/os/DropBoxManager;

    move-result-object v1

    .local v1, dbox:Landroid/os/DropBoxManager;
    if-nez v1, :cond_0

    const-string v7, "HWFileUtils"

    const-string v8, "dropboxManager is null"

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void

    :cond_0
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    .local v6, sb_pstack:Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .local v2, input_pstack:Ljava/io/InputStreamReader;
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "pstack "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4

    move-result-object v5

    .local v5, pstack:Ljava/lang/Process;
    :try_start_1
    invoke-virtual {v5}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v7

    invoke-virtual {v7}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_6

    :goto_1
    :try_start_2
    invoke-virtual {v5}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v7

    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_5

    :goto_2
    :try_start_3
    new-instance v3, Ljava/io/InputStreamReader;

    invoke-virtual {v5}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v3, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4

    .end local v2           #input_pstack:Ljava/io/InputStreamReader;
    .local v3, input_pstack:Ljava/io/InputStreamReader;
    const/16 v7, 0x2000

    :try_start_4
    new-array v0, v7, [C

    .local v0, buf:[C
    :goto_3
    invoke-virtual {v3, v0}, Ljava/io/InputStreamReader;->read([C)I

    move-result v4

    .local v4, num:I
    if-lez v4, :cond_2

    const/4 v7, 0x0

    invoke-virtual {v6, v0, v7, v4}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_3

    .end local v0           #buf:[C
    .end local v4           #num:I
    :catch_0
    move-exception v7

    move-object v2, v3

    .end local v3           #input_pstack:Ljava/io/InputStreamReader;
    .end local v5           #pstack:Ljava/lang/Process;
    .restart local v2       #input_pstack:Ljava/io/InputStreamReader;
    :goto_4
    if-eqz v2, :cond_1

    :try_start_5
    invoke-virtual {v2}, Ljava/io/InputStreamReader;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    :cond_1
    :goto_5
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "pstack_"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v7, v8}, Landroid/os/DropBoxManager;->addText(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .end local v2           #input_pstack:Ljava/io/InputStreamReader;
    .restart local v0       #buf:[C
    .restart local v3       #input_pstack:Ljava/io/InputStreamReader;
    .restart local v4       #num:I
    .restart local v5       #pstack:Ljava/lang/Process;
    :cond_2
    if-eqz v3, :cond_3

    :try_start_6
    invoke-virtual {v3}, Ljava/io/InputStreamReader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    :cond_3
    :goto_6
    move-object v2, v3

    .end local v3           #input_pstack:Ljava/io/InputStreamReader;
    .restart local v2       #input_pstack:Ljava/io/InputStreamReader;
    goto :goto_5

    .end local v0           #buf:[C
    .end local v4           #num:I
    .end local v5           #pstack:Ljava/lang/Process;
    :catchall_0
    move-exception v7

    :goto_7
    if-eqz v2, :cond_4

    :try_start_7
    invoke-virtual {v2}, Ljava/io/InputStreamReader;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_2

    :cond_4
    :goto_8
    throw v7

    :catch_1
    move-exception v7

    goto :goto_5

    :catch_2
    move-exception v8

    goto :goto_8

    .end local v2           #input_pstack:Ljava/io/InputStreamReader;
    .restart local v0       #buf:[C
    .restart local v3       #input_pstack:Ljava/io/InputStreamReader;
    .restart local v4       #num:I
    .restart local v5       #pstack:Ljava/lang/Process;
    :catch_3
    move-exception v7

    goto :goto_6

    .end local v0           #buf:[C
    .end local v4           #num:I
    :catchall_1
    move-exception v7

    move-object v2, v3

    .end local v3           #input_pstack:Ljava/io/InputStreamReader;
    .restart local v2       #input_pstack:Ljava/io/InputStreamReader;
    goto :goto_7

    .end local v5           #pstack:Ljava/lang/Process;
    :catch_4
    move-exception v7

    goto :goto_4

    .restart local v5       #pstack:Ljava/lang/Process;
    :catch_5
    move-exception v7

    goto :goto_2

    :catch_6
    move-exception v7

    goto :goto_1
.end method

.method public static convertMillToHMS(Ljava/lang/String;J)Ljava/lang/String;
    .locals 11
    .parameter "initHMS"
    .parameter "milli"

    .prologue
    const/4 v7, 0x0

    const-string v8, "H"

    invoke-virtual {p0, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {p0, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    const-wide/16 v9, 0x3e8

    mul-long/2addr v7, v9

    const-wide/16 v9, 0x3c

    mul-long/2addr v7, v9

    const-wide/16 v9, 0x3c

    mul-long/2addr v7, v9

    add-long/2addr p1, v7

    const-string v7, "H"

    invoke-virtual {p0, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    const-string v8, "M"

    invoke-virtual {p0, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {p0, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    const-wide/16 v9, 0x3e8

    mul-long/2addr v7, v9

    const-wide/16 v9, 0x3c

    mul-long/2addr v7, v9

    add-long/2addr p1, v7

    const-string v7, "M"

    invoke-virtual {p0, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    const-string v8, "S"

    invoke-virtual {p0, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {p0, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    const-wide/16 v9, 0x3e8

    mul-long/2addr v7, v9

    add-long/2addr p1, v7

    const-wide/32 v7, 0x36ee80

    div-long v0, p1, v7

    .local v0, hour:J
    const-wide/32 v7, 0x36ee80

    rem-long v7, p1, v7

    const-wide/32 v9, 0xea60

    div-long v2, v7, v9

    .local v2, minute:J
    const-wide/32 v7, 0x36ee80

    rem-long v7, p1, v7

    const-wide/32 v9, 0xea60

    rem-long/2addr v7, v9

    const-wide/16 v9, 0x3e8

    div-long v5, v7, v9

    .local v5, second:J
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .local v4, sb:Ljava/lang/StringBuffer;
    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, "H"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v2, v3}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, "M"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v5, v6}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, "S"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7
.end method

.method public static editInfoToFile(Ljava/lang/String;IILjava/lang/String;Ljava/util/List;)Z
    .locals 2
    .parameter "filePath"
    .parameter "recoverLineNum"
    .parameter "recoverColumnNum"
    .parameter "val"
    .parameter "list"

    .prologue
    if-eqz p4, :cond_1

    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result v1

    if-lt p1, v1, :cond_0

    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 p1, v1, -0x1

    :cond_0
    invoke-interface {p4, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    move-object v0, v1

    check-cast v0, [Ljava/lang/String;

    .local v0, infos_last:[Ljava/lang/String;
    aput-object p3, v0, p2

    invoke-interface {p4, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    invoke-interface {p4, p1, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    invoke-static {p0, p4}, Lcom/huawei/android/hwlog/HWFileUtils;->writeToFile(Ljava/lang/String;Ljava/util/List;)Z

    move-result v1

    .end local v0           #infos_last:[Ljava/lang/String;
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static getAllChildFiles([Ljava/lang/String;)Ljava/util/List;
    .locals 7
    .parameter "dirs"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .prologue
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    .local v3, list:Ljava/util/List;,"Ljava/util/List<Ljava/io/File;>;"
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    :try_start_0
    array-length v4, p0

    if-ge v2, v4, :cond_1

    new-instance v1, Ljava/io/File;

    aget-object v4, p0, v2

    invoke-direct {v1, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .local v1, f:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .end local v1           #f:Ljava/io/File;
    :catch_0
    move-exception v0

    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .end local v0           #e:Ljava/lang/Exception;
    :cond_1
    return-object v3

    .restart local v1       #f:Ljava/io/File;
    :cond_2
    :try_start_1
    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v4

    if-eqz v4, :cond_3

    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_1

    :cond_3
    const-string v4, "HWFileUtils"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "null == f.listFiles(), dir: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, p0, v2

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method private static getDropBoxManager()Landroid/os/DropBoxManager;
    .locals 3

    .prologue
    const-string v2, "dropbox"

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    .local v0, b:Landroid/os/IBinder;
    invoke-static {v0}, Lcom/android/internal/os/IDropBoxManagerService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/os/IDropBoxManagerService;

    move-result-object v1

    .local v1, service:Lcom/android/internal/os/IDropBoxManagerService;
    if-nez v1, :cond_0

    const/4 v2, 0x0

    :goto_0
    return-object v2

    :cond_0
    new-instance v2, Landroid/os/DropBoxManager;

    invoke-direct {v2, v1}, Landroid/os/DropBoxManager;-><init>(Lcom/android/internal/os/IDropBoxManagerService;)V

    goto :goto_0
.end method

.method public static getErrorRecordToPackage(Ljava/lang/String;)Ljava/util/List;
    .locals 6
    .parameter "filePath"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<[",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    new-instance v4, Ljava/util/LinkedList;

    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    .local v4, lst:Ljava/util/List;,"Ljava/util/List<[Ljava/lang/String;>;"
    invoke-static {p0}, Lcom/huawei/android/hwlog/HWFileUtils;->getInfosFromFile(Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    .local v3, list:Ljava/util/List;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    if-ge v2, v5, :cond_0

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/String;

    move-object v0, v5

    check-cast v0, [Ljava/lang/String;

    .local v0, args:[Ljava/lang/String;
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .end local v0           #args:[Ljava/lang/String;
    :cond_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .local v1, file:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_1

    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    :goto_1
    return-object v4

    :catch_0
    move-exception v5

    goto :goto_1
.end method

.method public static getInfosFromFile(Ljava/lang/String;)Ljava/util/List;
    .locals 11
    .parameter "filePath"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<[",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    new-instance v7, Ljava/util/LinkedList;

    invoke-direct {v7}, Ljava/util/LinkedList;-><init>()V

    .local v7, list:Ljava/util/List;,"Ljava/util/List<[Ljava/lang/String;>;"
    new-instance v4, Ljava/io/File;

    const/4 v8, 0x0

    const-string v9, "/"

    invoke-virtual {p0, v9}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v9

    invoke-virtual {p0, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v4, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .local v4, f:Ljava/io/File;
    :try_start_0
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v8

    if-nez v8, :cond_0

    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    :cond_0
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .end local v4           #f:Ljava/io/File;
    .local v5, f:Ljava/io/File;
    :try_start_1
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v8

    if-nez v8, :cond_2

    invoke-virtual {v5}, Ljava/io/File;->createNewFile()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_9

    move-object v4, v5

    .end local v5           #f:Ljava/io/File;
    .restart local v4       #f:Ljava/io/File;
    :cond_1
    :goto_0
    return-object v7

    .end local v4           #f:Ljava/io/File;
    .restart local v5       #f:Ljava/io/File;
    :cond_2
    move-object v4, v5

    .end local v5           #f:Ljava/io/File;
    .restart local v4       #f:Ljava/io/File;
    :goto_1
    const/4 v1, 0x0

    .local v1, bufferedReader:Ljava/io/BufferedReader;
    :try_start_2
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v8, Ljava/io/FileReader;

    invoke-direct {v8, v4}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v2, v8}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_8
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    .end local v1           #bufferedReader:Ljava/io/BufferedReader;
    .local v2, bufferedReader:Ljava/io/BufferedReader;
    const/4 v6, 0x0

    .local v6, line:Ljava/lang/String;
    :cond_3
    :goto_2
    :try_start_3
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_4

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    const-string v8, ""

    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_3

    const-string v8, ";"

    invoke-virtual {v6, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .local v0, args:[Ljava/lang/String;
    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_7

    goto :goto_2

    .end local v0           #args:[Ljava/lang/String;
    :catch_0
    move-exception v3

    move-object v1, v2

    .end local v2           #bufferedReader:Ljava/io/BufferedReader;
    .end local v6           #line:Ljava/lang/String;
    .restart local v1       #bufferedReader:Ljava/io/BufferedReader;
    .local v3, e:Ljava/io/FileNotFoundException;
    :goto_3
    :try_start_4
    const-string v8, "HWFileUtils"

    const-string v9, "reading configuration file error"

    invoke-static {v8, v9, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-eqz v1, :cond_1

    :try_start_5
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_0

    :catch_1
    move-exception v3

    .local v3, e:Ljava/io/IOException;
    const-string v8, "HWFileUtils"

    const-string v9, "failed to close configuration file reader"

    :goto_4
    invoke-static {v8, v9, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .end local v1           #bufferedReader:Ljava/io/BufferedReader;
    .end local v3           #e:Ljava/io/IOException;
    :catch_2
    move-exception v3

    .local v3, e:Ljava/lang/Exception;
    :goto_5
    const-string v8, "HWFileUtils"

    const-string v9, "create configuration file error"

    invoke-static {v8, v9, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .end local v3           #e:Ljava/lang/Exception;
    .restart local v2       #bufferedReader:Ljava/io/BufferedReader;
    .restart local v6       #line:Ljava/lang/String;
    :cond_4
    if-eqz v2, :cond_5

    :try_start_6
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_6

    :cond_5
    :goto_6
    move-object v1, v2

    .end local v2           #bufferedReader:Ljava/io/BufferedReader;
    .restart local v1       #bufferedReader:Ljava/io/BufferedReader;
    goto :goto_0

    .end local v6           #line:Ljava/lang/String;
    :catch_3
    move-exception v3

    .local v3, e:Ljava/io/IOException;
    :goto_7
    :try_start_7
    const-string v8, "HWFileUtils"

    const-string v9, "reading configuration file error"

    invoke-static {v8, v9, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    if-eqz v1, :cond_1

    :try_start_8
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_4

    goto :goto_0

    :catch_4
    move-exception v3

    const-string v8, "HWFileUtils"

    const-string v9, "failed to close configuration file reader"

    goto :goto_4

    .end local v3           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v8

    :goto_8
    if-eqz v1, :cond_6

    :try_start_9
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_5

    :cond_6
    :goto_9
    throw v8

    :catch_5
    move-exception v3

    .restart local v3       #e:Ljava/io/IOException;
    const-string v9, "HWFileUtils"

    const-string v10, "failed to close configuration file reader"

    invoke-static {v9, v10, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_9

    .end local v1           #bufferedReader:Ljava/io/BufferedReader;
    .end local v3           #e:Ljava/io/IOException;
    .restart local v2       #bufferedReader:Ljava/io/BufferedReader;
    .restart local v6       #line:Ljava/lang/String;
    :catch_6
    move-exception v3

    .restart local v3       #e:Ljava/io/IOException;
    const-string v8, "HWFileUtils"

    const-string v9, "failed to close configuration file reader"

    invoke-static {v8, v9, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_6

    .end local v3           #e:Ljava/io/IOException;
    :catchall_1
    move-exception v8

    move-object v1, v2

    .end local v2           #bufferedReader:Ljava/io/BufferedReader;
    .restart local v1       #bufferedReader:Ljava/io/BufferedReader;
    goto :goto_8

    .end local v1           #bufferedReader:Ljava/io/BufferedReader;
    .restart local v2       #bufferedReader:Ljava/io/BufferedReader;
    :catch_7
    move-exception v3

    move-object v1, v2

    .end local v2           #bufferedReader:Ljava/io/BufferedReader;
    .restart local v1       #bufferedReader:Ljava/io/BufferedReader;
    goto :goto_7

    .end local v6           #line:Ljava/lang/String;
    :catch_8
    move-exception v3

    goto :goto_3

    .end local v1           #bufferedReader:Ljava/io/BufferedReader;
    .end local v4           #f:Ljava/io/File;
    .restart local v5       #f:Ljava/io/File;
    :catch_9
    move-exception v3

    move-object v4, v5

    .end local v5           #f:Ljava/io/File;
    .restart local v4       #f:Ljava/io/File;
    goto :goto_5
.end method

.method private static getLogDirPathByError(Ljava/lang/String;)[Ljava/lang/String;
    .locals 6
    .parameter "error"

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v0, 0x0

    .local v0, args:[Ljava/lang/String;
    const-string v1, "anr"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-array v0, v5, [Ljava/lang/String;

    .end local v0           #args:[Ljava/lang/String;
    const-string v1, "/data/system/dropbox/"

    aput-object v1, v0, v2

    const-string v1, "/data/anr/"

    aput-object v1, v0, v3

    const-string v1, "/data/log/dbox/pstack/"

    aput-object v1, v0, v4

    .restart local v0       #args:[Ljava/lang/String;
    :goto_0
    return-object v0

    :cond_0
    const-string v1, "crash"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "watchdog"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "wtf"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "lowmem"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_1
    new-array v0, v5, [Ljava/lang/String;

    .end local v0           #args:[Ljava/lang/String;
    const-string v1, "/data/system/dropbox/"

    aput-object v1, v0, v2

    const-string v1, "/data/tombstones/"

    aput-object v1, v0, v3

    const-string v1, "/data/log/dbox/pstack/"

    aput-object v1, v0, v4

    .restart local v0       #args:[Ljava/lang/String;
    goto :goto_0

    :cond_2
    new-array v0, v5, [Ljava/lang/String;

    .end local v0           #args:[Ljava/lang/String;
    const-string v1, "/data/system/dropbox/"

    aput-object v1, v0, v2

    const-string v1, "/data/tombstones/"

    aput-object v1, v0, v3

    const-string v1, "/data/dontpanic/"

    aput-object v1, v0, v4

    .restart local v0       #args:[Ljava/lang/String;
    goto :goto_0
.end method

.method private static getLogFilePaths([Ljava/lang/String;[Ljava/lang/String;JZ)Ljava/lang/String;
    .locals 11
    .parameter "dirs"
    .parameter "keys"
    .parameter "date"
    .parameter "needRoot"

    .prologue
    const-wide/16 v9, 0x1388

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    .local v7, sb:Ljava/lang/StringBuffer;
    sub-long v5, p2, v9

    .local v5, preTime:J
    add-long v0, p2, v9

    .local v0, aftTime:J
    if-eqz p4, :cond_0

    const-wide/32 v9, 0x2bf20

    add-long v0, p2, v9

    :cond_0
    invoke-static {p0}, Lcom/huawei/android/hwlog/HWFileUtils;->getAllChildFiles([Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    .local v4, list:Ljava/util/List;
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v9

    if-ge v3, v9, :cond_5

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/io/File;

    .local v2, f:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->lastModified()J

    move-result-wide v9

    cmp-long v9, v9, v5

    if-lez v9, :cond_1

    invoke-virtual {v2}, Ljava/io/File;->lastModified()J

    move-result-wide v9

    cmp-long v9, v9, v0

    if-gez v9, :cond_1

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    const-string v10, "/data/system/dropbox/"

    invoke-virtual {v9, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v9

    const-string v10, ".gz"

    invoke-virtual {v9, v10}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_2

    const-string v9, "-i"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, " "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, " "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    invoke-static {v2, p1}, Lcom/huawei/android/hwlog/HWFileUtils;->isFileNameHasKeys(Ljava/io/File;[Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_3

    invoke-static {v2, p1}, Lcom/huawei/android/hwlog/HWFileUtils;->isFileHasKeys(Ljava/io/File;[Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_1

    :cond_3
    const-string v9, "-i"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, " "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, " "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    :cond_4
    const-string v9, "-i"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, " "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, " "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .end local v2           #f:Ljava/io/File;
    :cond_5
    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    .local v8, str:Ljava/lang/String;
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_6

    const/4 v9, 0x0

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v10

    add-int/lit8 v10, v10, -0x1

    invoke-virtual {v8, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    :cond_6
    return-object v8
.end method

.method private static getOutFileName(JLjava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "errTime"
    .parameter "errType"

    .prologue
    const-string v0, ""

    .local v0, tf:Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2, p0, p1}, Ljava/util/Date;-><init>(J)V

    const-string v3, "yyyyMMddHHmmss"

    invoke-static {v2, v3}, Lcom/huawei/android/hwlog/HWFileUtils;->getTimeString(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    if-eqz p2, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public static getSocketMessage(Ljava/lang/String;JLjava/lang/String;ZZ)Ljava/lang/String;
    .locals 5
    .parameter "command"
    .parameter "errorTime"
    .parameter "errorType"
    .parameter "needReboot"
    .parameter "isZip"

    .prologue
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .local v2, sb:Ljava/lang/StringBuffer;
    invoke-static {p3}, Lcom/huawei/android/hwlog/HWFileUtils;->getLogDirPathByError(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .local v0, dir:[Ljava/lang/String;
    const-string v1, ""

    .local v1, logpath:Ljava/lang/String;
    if-eqz p3, :cond_0

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p3, v3, v4

    invoke-static {v0, v3, p1, p2, p4}, Lcom/huawei/android/hwlog/HWFileUtils;->getLogFilePaths([Ljava/lang/String;[Ljava/lang/String;JZ)Ljava/lang/String;

    move-result-object v1

    :cond_0
    invoke-virtual {v2, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v3, ""

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :cond_1
    const-string v3, "-o"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-static {p1, p2, p3}, Lcom/huawei/android/hwlog/HWFileUtils;->getOutFileName(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v3, " -z "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    if-eqz p5, :cond_2

    const-string v3, "zip"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :goto_0
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    :cond_2
    const-string v3, "unzip"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0
.end method

.method private static getTelephoneInfo()Ljava/lang/String;
    .locals 3

    .prologue
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .local v0, sb:Ljava/lang/StringBuffer;
    sget-object v1, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    sget-object v2, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getTimeString(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "date"
    .parameter "fomateStr"

    .prologue
    new-instance v0, Ljava/text/SimpleDateFormat;

    invoke-direct {v0, p1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .local v0, sd:Ljava/text/SimpleDateFormat;
    invoke-virtual {v0, p0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static getValueByKeyFromCfg(Ljava/io/File;Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .parameter "file"
    .parameter "key"

    .prologue
    const/4 v8, 0x1

    const/4 v5, 0x0

    const/4 v1, 0x0

    .local v1, bufferedReader:Ljava/io/BufferedReader;
    :try_start_0
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v6, Ljava/io/FileReader;

    invoke-direct {v6, p0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v2, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .end local v1           #bufferedReader:Ljava/io/BufferedReader;
    .local v2, bufferedReader:Ljava/io/BufferedReader;
    const/4 v4, 0x0

    .local v4, line:Ljava/lang/String;
    :cond_0
    :try_start_1
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_6

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    const-string v6, "="

    invoke-virtual {v4, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .local v0, args:[Ljava/lang/String;
    array-length v6, v0

    if-le v6, v8, :cond_3

    const/4 v6, 0x1

    aget-object v5, v0, v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_9
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_8

    if-eqz v2, :cond_1

    :try_start_2
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_5

    :cond_1
    :goto_0
    move-object v1, v2

    .end local v0           #args:[Ljava/lang/String;
    .end local v2           #bufferedReader:Ljava/io/BufferedReader;
    .end local v4           #line:Ljava/lang/String;
    .restart local v1       #bufferedReader:Ljava/io/BufferedReader;
    :cond_2
    :goto_1
    return-object v5

    .end local v1           #bufferedReader:Ljava/io/BufferedReader;
    .restart local v0       #args:[Ljava/lang/String;
    .restart local v2       #bufferedReader:Ljava/io/BufferedReader;
    .restart local v4       #line:Ljava/lang/String;
    :cond_3
    if-eqz v2, :cond_4

    :try_start_3
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_6

    :cond_4
    :goto_2
    move-object v1, v2

    .end local v2           #bufferedReader:Ljava/io/BufferedReader;
    .restart local v1       #bufferedReader:Ljava/io/BufferedReader;
    goto :goto_1

    .end local v0           #args:[Ljava/lang/String;
    .end local v4           #line:Ljava/lang/String;
    :catch_0
    move-exception v3

    .local v3, e:Ljava/io/FileNotFoundException;
    :goto_3
    if-eqz v1, :cond_2

    :try_start_4
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_1

    :catch_1
    move-exception v3

    .local v3, e:Ljava/io/IOException;
    const-string v6, "HWFileUtils"

    const-string v7, "failed to close configuration file reader"

    :goto_4
    invoke-static {v6, v7, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .end local v3           #e:Ljava/io/IOException;
    :catch_2
    move-exception v3

    .restart local v3       #e:Ljava/io/IOException;
    :goto_5
    if-eqz v1, :cond_2

    :try_start_5
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_1

    :catch_3
    move-exception v3

    const-string v6, "HWFileUtils"

    const-string v7, "failed to close configuration file reader"

    goto :goto_4

    .end local v3           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v5

    :goto_6
    if-eqz v1, :cond_5

    :try_start_6
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    :cond_5
    :goto_7
    throw v5

    .end local v1           #bufferedReader:Ljava/io/BufferedReader;
    .restart local v2       #bufferedReader:Ljava/io/BufferedReader;
    .restart local v4       #line:Ljava/lang/String;
    :cond_6
    if-eqz v2, :cond_7

    :try_start_7
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_7

    :cond_7
    :goto_8
    move-object v1, v2

    .end local v2           #bufferedReader:Ljava/io/BufferedReader;
    .restart local v1       #bufferedReader:Ljava/io/BufferedReader;
    goto :goto_1

    .end local v4           #line:Ljava/lang/String;
    :catch_4
    move-exception v3

    .restart local v3       #e:Ljava/io/IOException;
    const-string v6, "HWFileUtils"

    const-string v7, "failed to close configuration file reader"

    invoke-static {v6, v7, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_7

    .end local v1           #bufferedReader:Ljava/io/BufferedReader;
    .end local v3           #e:Ljava/io/IOException;
    .restart local v0       #args:[Ljava/lang/String;
    .restart local v2       #bufferedReader:Ljava/io/BufferedReader;
    .restart local v4       #line:Ljava/lang/String;
    :catch_5
    move-exception v3

    .restart local v3       #e:Ljava/io/IOException;
    const-string v6, "HWFileUtils"

    const-string v7, "failed to close configuration file reader"

    invoke-static {v6, v7, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .end local v3           #e:Ljava/io/IOException;
    :catch_6
    move-exception v3

    .restart local v3       #e:Ljava/io/IOException;
    const-string v6, "HWFileUtils"

    const-string v7, "failed to close configuration file reader"

    invoke-static {v6, v7, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2

    .end local v0           #args:[Ljava/lang/String;
    .end local v3           #e:Ljava/io/IOException;
    :catch_7
    move-exception v3

    .restart local v3       #e:Ljava/io/IOException;
    const-string v6, "HWFileUtils"

    const-string v7, "failed to close configuration file reader"

    invoke-static {v6, v7, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_8

    .end local v3           #e:Ljava/io/IOException;
    :catchall_1
    move-exception v5

    move-object v1, v2

    .end local v2           #bufferedReader:Ljava/io/BufferedReader;
    .restart local v1       #bufferedReader:Ljava/io/BufferedReader;
    goto :goto_6

    .end local v1           #bufferedReader:Ljava/io/BufferedReader;
    .restart local v2       #bufferedReader:Ljava/io/BufferedReader;
    :catch_8
    move-exception v3

    move-object v1, v2

    .end local v2           #bufferedReader:Ljava/io/BufferedReader;
    .restart local v1       #bufferedReader:Ljava/io/BufferedReader;
    goto :goto_5

    .end local v1           #bufferedReader:Ljava/io/BufferedReader;
    .restart local v2       #bufferedReader:Ljava/io/BufferedReader;
    :catch_9
    move-exception v3

    move-object v1, v2

    .end local v2           #bufferedReader:Ljava/io/BufferedReader;
    .restart local v1       #bufferedReader:Ljava/io/BufferedReader;
    goto :goto_3
.end method

.method private static isFileHasKeys(Ljava/io/File;[Ljava/lang/String;)Z
    .locals 9
    .parameter "file"
    .parameter "keys"

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    if-nez p1, :cond_1

    :cond_0
    :goto_0
    return v6

    :cond_1
    const/4 v0, 0x0

    .local v0, bufferedReader:Ljava/io/BufferedReader;
    const/4 v5, 0x0

    .local v5, tNum:I
    :try_start_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v8, Ljava/io/FileReader;

    invoke-direct {v8, p0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v8}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .end local v0           #bufferedReader:Ljava/io/BufferedReader;
    .local v1, bufferedReader:Ljava/io/BufferedReader;
    const/4 v4, 0x0

    .local v4, line:Ljava/lang/String;
    :cond_2
    :try_start_1
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_8

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    const/4 v3, 0x0

    .local v3, i:I
    :goto_1
    array-length v8, p1

    if-ge v3, v8, :cond_4

    aget-object v8, p1, v3

    invoke-virtual {v4, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_3

    add-int/lit8 v5, v5, 0x1

    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_4
    array-length v8, p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_8
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_7

    if-ne v5, v8, :cond_2

    if-eqz v1, :cond_0

    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    :catch_0
    move-exception v2

    .local v2, e:Ljava/io/IOException;
    const-string v7, "HWFileUtils"

    const-string v8, "failed to close configuration file reader"

    invoke-static {v7, v8, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .end local v1           #bufferedReader:Ljava/io/BufferedReader;
    .end local v2           #e:Ljava/io/IOException;
    .end local v3           #i:I
    .end local v4           #line:Ljava/lang/String;
    .restart local v0       #bufferedReader:Ljava/io/BufferedReader;
    :catch_1
    move-exception v2

    .local v2, e:Ljava/io/FileNotFoundException;
    :goto_2
    if-eqz v0, :cond_5

    :try_start_3
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    .end local v2           #e:Ljava/io/FileNotFoundException;
    :cond_5
    :goto_3
    move v6, v7

    goto :goto_0

    :catch_2
    move-exception v2

    .local v2, e:Ljava/io/IOException;
    :goto_4
    if-eqz v0, :cond_6

    :try_start_4
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    :cond_6
    :goto_5
    move v6, v7

    goto :goto_0

    .end local v2           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v6

    :goto_6
    if-eqz v0, :cond_7

    :try_start_5
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_5

    :cond_7
    :goto_7
    throw v6

    .end local v0           #bufferedReader:Ljava/io/BufferedReader;
    .restart local v1       #bufferedReader:Ljava/io/BufferedReader;
    .restart local v4       #line:Ljava/lang/String;
    :cond_8
    if-eqz v1, :cond_9

    :try_start_6
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_6

    :cond_9
    :goto_8
    move v6, v7

    goto :goto_0

    .end local v1           #bufferedReader:Ljava/io/BufferedReader;
    .end local v4           #line:Ljava/lang/String;
    .restart local v0       #bufferedReader:Ljava/io/BufferedReader;
    .local v2, e:Ljava/io/FileNotFoundException;
    :catch_3
    move-exception v2

    .local v2, e:Ljava/io/IOException;
    const-string v6, "HWFileUtils"

    const-string v8, "failed to close configuration file reader"

    invoke-static {v6, v8, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3

    :catch_4
    move-exception v2

    const-string v6, "HWFileUtils"

    const-string v8, "failed to close configuration file reader"

    invoke-static {v6, v8, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5

    .end local v2           #e:Ljava/io/IOException;
    :catch_5
    move-exception v2

    .restart local v2       #e:Ljava/io/IOException;
    const-string v7, "HWFileUtils"

    const-string v8, "failed to close configuration file reader"

    invoke-static {v7, v8, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_7

    .end local v0           #bufferedReader:Ljava/io/BufferedReader;
    .end local v2           #e:Ljava/io/IOException;
    .restart local v1       #bufferedReader:Ljava/io/BufferedReader;
    .restart local v4       #line:Ljava/lang/String;
    :catch_6
    move-exception v2

    .restart local v2       #e:Ljava/io/IOException;
    const-string v6, "HWFileUtils"

    const-string v8, "failed to close configuration file reader"

    invoke-static {v6, v8, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_8

    .end local v2           #e:Ljava/io/IOException;
    :catchall_1
    move-exception v6

    move-object v0, v1

    .end local v1           #bufferedReader:Ljava/io/BufferedReader;
    .restart local v0       #bufferedReader:Ljava/io/BufferedReader;
    goto :goto_6

    .end local v0           #bufferedReader:Ljava/io/BufferedReader;
    .restart local v1       #bufferedReader:Ljava/io/BufferedReader;
    :catch_7
    move-exception v2

    move-object v0, v1

    .end local v1           #bufferedReader:Ljava/io/BufferedReader;
    .restart local v0       #bufferedReader:Ljava/io/BufferedReader;
    goto :goto_4

    .end local v0           #bufferedReader:Ljava/io/BufferedReader;
    .restart local v1       #bufferedReader:Ljava/io/BufferedReader;
    :catch_8
    move-exception v2

    move-object v0, v1

    .end local v1           #bufferedReader:Ljava/io/BufferedReader;
    .restart local v0       #bufferedReader:Ljava/io/BufferedReader;
    goto :goto_2
.end method

.method private static isFileNameHasKeys(Ljava/io/File;[Ljava/lang/String;)Z
    .locals 5
    .parameter "file"
    .parameter "keys"

    .prologue
    const/4 v3, 0x1

    if-nez p1, :cond_1

    :cond_0
    :goto_0
    return v3

    :cond_1
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    .local v1, name:Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, tNum:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v4, p1

    if-ge v0, v4, :cond_3

    aget-object v4, p1, v0

    invoke-virtual {v1, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_2

    add-int/lit8 v2, v2, 0x1

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    array-length v4, p1

    if-eq v2, v4, :cond_0

    const/4 v3, 0x0

    goto :goto_0
.end method

.method private static writeToFile(Ljava/lang/String;Ljava/util/List;)Z
    .locals 12
    .parameter "filePath"
    .parameter "list"

    .prologue
    const/4 v10, 0x0

    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .local v3, f:Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v9

    if-nez v9, :cond_0

    :try_start_0
    invoke-virtual {v3}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    const/4 v4, 0x0

    .local v4, fileWriter:Ljava/io/FileWriter;
    :try_start_1
    new-instance v5, Ljava/io/FileWriter;

    invoke-direct {v5, v3}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_5

    .end local v4           #fileWriter:Ljava/io/FileWriter;
    .local v5, fileWriter:Ljava/io/FileWriter;
    :try_start_2
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    .local v8, sb:Ljava/lang/StringBuffer;
    const/4 v6, 0x0

    .local v6, i:I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v9

    if-ge v6, v9, :cond_4

    invoke-interface {p1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Ljava/lang/String;

    move-object v0, v9

    check-cast v0, [Ljava/lang/String;

    move-object v1, v0

    .local v1, args:[Ljava/lang/String;
    const/4 v7, 0x0

    .local v7, j:I
    :goto_1
    array-length v9, v1

    if-ge v7, v9, :cond_3

    array-length v9, v1

    add-int/lit8 v9, v9, -0x1

    if-ne v7, v9, :cond_1

    aget-object v9, v1, v7

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v11, "\r\n"

    invoke-virtual {v9, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :goto_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .end local v1           #args:[Ljava/lang/String;
    .end local v5           #fileWriter:Ljava/io/FileWriter;
    .end local v6           #i:I
    .end local v7           #j:I
    .end local v8           #sb:Ljava/lang/StringBuffer;
    :catch_0
    move-exception v2

    .local v2, e:Ljava/io/IOException;
    move v9, v10

    .end local v2           #e:Ljava/io/IOException;
    :goto_3
    return v9

    .restart local v1       #args:[Ljava/lang/String;
    .restart local v5       #fileWriter:Ljava/io/FileWriter;
    .restart local v6       #i:I
    .restart local v7       #j:I
    .restart local v8       #sb:Ljava/lang/StringBuffer;
    :cond_1
    aget-object v9, v1, v7

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v11, ";"

    invoke-virtual {v9, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    .end local v1           #args:[Ljava/lang/String;
    .end local v6           #i:I
    .end local v7           #j:I
    .end local v8           #sb:Ljava/lang/StringBuffer;
    :catch_1
    move-exception v2

    move-object v4, v5

    .end local v5           #fileWriter:Ljava/io/FileWriter;
    .restart local v2       #e:Ljava/io/IOException;
    .restart local v4       #fileWriter:Ljava/io/FileWriter;
    :goto_4
    if-eqz v4, :cond_2

    :try_start_3
    invoke-virtual {v4}, Ljava/io/FileWriter;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    :cond_2
    :goto_5
    move v9, v10

    goto :goto_3

    .end local v2           #e:Ljava/io/IOException;
    .end local v4           #fileWriter:Ljava/io/FileWriter;
    .restart local v1       #args:[Ljava/lang/String;
    .restart local v5       #fileWriter:Ljava/io/FileWriter;
    .restart local v6       #i:I
    .restart local v7       #j:I
    .restart local v8       #sb:Ljava/lang/StringBuffer;
    :cond_3
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .end local v1           #args:[Ljava/lang/String;
    .end local v7           #j:I
    :cond_4
    :try_start_4
    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/FileWriter;->flush()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    if-eqz v5, :cond_5

    :try_start_5
    invoke-virtual {v5}, Ljava/io/FileWriter;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    :cond_5
    :goto_6
    const/4 v9, 0x1

    goto :goto_3

    .end local v5           #fileWriter:Ljava/io/FileWriter;
    .end local v6           #i:I
    .end local v8           #sb:Ljava/lang/StringBuffer;
    .restart local v4       #fileWriter:Ljava/io/FileWriter;
    :catchall_0
    move-exception v9

    :goto_7
    if-eqz v4, :cond_6

    :try_start_6
    invoke-virtual {v4}, Ljava/io/FileWriter;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    :cond_6
    :goto_8
    throw v9

    .restart local v2       #e:Ljava/io/IOException;
    :catch_2
    move-exception v2

    const-string v9, "HWFileUtils"

    const-string v11, "failed to close file writer for saving configuration"

    invoke-static {v9, v11, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5

    .end local v2           #e:Ljava/io/IOException;
    :catch_3
    move-exception v2

    .restart local v2       #e:Ljava/io/IOException;
    const-string v10, "HWFileUtils"

    const-string v11, "failed to close file writer for saving configuration"

    invoke-static {v10, v11, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_8

    .end local v2           #e:Ljava/io/IOException;
    .end local v4           #fileWriter:Ljava/io/FileWriter;
    .restart local v5       #fileWriter:Ljava/io/FileWriter;
    .restart local v6       #i:I
    .restart local v8       #sb:Ljava/lang/StringBuffer;
    :catch_4
    move-exception v2

    .restart local v2       #e:Ljava/io/IOException;
    const-string v9, "HWFileUtils"

    const-string v10, "failed to close file writer for saving configuration"

    invoke-static {v9, v10, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_6

    .end local v2           #e:Ljava/io/IOException;
    .end local v6           #i:I
    .end local v8           #sb:Ljava/lang/StringBuffer;
    :catchall_1
    move-exception v9

    move-object v4, v5

    .end local v5           #fileWriter:Ljava/io/FileWriter;
    .restart local v4       #fileWriter:Ljava/io/FileWriter;
    goto :goto_7

    :catch_5
    move-exception v2

    goto :goto_4
.end method
