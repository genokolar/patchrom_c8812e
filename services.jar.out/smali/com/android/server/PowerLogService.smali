.class public final Lcom/android/server/PowerLogService;
.super Lcom/android/internal/os/IPowerLogService$Stub;
.source "PowerLogService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/PowerLogService$DrainType;,
        Lcom/android/server/PowerLogService$BatterySipper;
    }
.end annotation


# static fields
.field private static final BATTERY_LEVEL_STEP:I = 0x5

.field private static final DEBUG:Z = true

.field private static final DROPBOX_POWERLOG_PATH:Ljava/lang/String; = "/data/system/dropbox/"

.field private static final DROPBOX_TAG:Ljava/lang/String; = "PowerLog"

.field private static final FILE_SIZE:I = 0x1200

.field private static final LOGMAIL_POWERLOG_PATH:Ljava/lang/String; = "/data/system/powerlog/"

.field private static final LOG_SIZE:I = 0x1400

.field private static final MIN_POWER_THRESHOLD:I = 0x1

.field private static final POWER_MODE_UNKNOWN:I = 0x0

.field private static final SEND_LOG_NUM:I = 0x65

.field private static final SEND_POWERLOG_PATH:Ljava/lang/String; = "/data/system/powerlog/sendcache/"

.field private static mBatteryInterval:I

.field private static mBatteryLevel:I

.field private static final mStatsType:I


# instance fields
.field bootCompleted:Z

.field private bootTime:Ljava/lang/String;

.field private mAppWifiRunning:J

.field private mBatteryInfo:Lcom/android/internal/app/IBatteryStats;

.field private mBluetoothPower:D

.field private final mBluetoothSippers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/server/PowerLogService$BatterySipper;",
            ">;"
        }
    .end annotation
.end field

.field private final mBroadcastReceiver:Landroid/content/BroadcastReceiver;

.field private final mContext:Landroid/content/Context;

.field private final mDropBox:Landroid/os/DropBoxManager;

.field mImei:Ljava/lang/String;

.field private mLogBuilder:Ljava/lang/StringBuilder;

.field private mMaxPower:D

.field private mPowerProfile:Lcom/android/internal/os/PowerProfile;

.field mSdf:Ljava/text/SimpleDateFormat;

.field private mStats:Lcom/android/internal/os/BatteryStatsImpl;

.field private mStatsPeriod:J

.field private mTotalPower:D

.field private final mUsageList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/server/PowerLogService$BatterySipper;",
            ">;"
        }
    .end annotation
.end field

.field private mWifiPower:D

.field private final mWifiSippers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/server/PowerLogService$BatterySipper;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    sput v0, Lcom/android/server/PowerLogService;->mBatteryLevel:I

    sput v0, Lcom/android/server/PowerLogService;->mBatteryInterval:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 4
    .parameter "context"

    .prologue
    const/4 v3, 0x0

    invoke-direct {p0}, Lcom/android/internal/os/IPowerLogService$Stub;-><init>()V

    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v2, 0x1400

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v1, p0, Lcom/android/server/PowerLogService;->mLogBuilder:Ljava/lang/StringBuilder;

    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "yyyy-MM-dd HH:mm:ss:SSS"

    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/android/server/PowerLogService;->mSdf:Ljava/text/SimpleDateFormat;

    const-string v1, "unknown"

    iput-object v1, p0, Lcom/android/server/PowerLogService;->bootTime:Ljava/lang/String;

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/server/PowerLogService;->bootCompleted:Z

    new-instance v1, Lcom/android/server/PowerLogService$1;

    invoke-direct {v1, p0}, Lcom/android/server/PowerLogService$1;-><init>(Lcom/android/server/PowerLogService;)V

    iput-object v1, p0, Lcom/android/server/PowerLogService;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/android/server/PowerLogService;->mUsageList:Ljava/util/List;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/android/server/PowerLogService;->mWifiSippers:Ljava/util/List;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/android/server/PowerLogService;->mBluetoothSippers:Ljava/util/List;

    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/android/server/PowerLogService;->mStatsPeriod:J

    const-wide/high16 v1, 0x3ff0

    iput-wide v1, p0, Lcom/android/server/PowerLogService;->mMaxPower:D

    iput-object p1, p0, Lcom/android/server/PowerLogService;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/server/PowerLogService;->mContext:Landroid/content/Context;

    const-string v2, "dropbox"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/DropBoxManager;

    iput-object v1, p0, Lcom/android/server/PowerLogService;->mDropBox:Landroid/os/DropBoxManager;

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .local v0, filter:Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.ACTION_SHUTDOWN"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.BOOT_COMPLETED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.DROPBOX_ENTRY_ADDED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/android/server/PowerLogService;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/server/PowerLogService;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0, v3, v3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    return-void
.end method

.method static synthetic access$000(Lcom/android/server/PowerLogService;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"

    .prologue
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/server/PowerLogService;->addOneLine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/android/server/PowerLogService;)Ljava/lang/StringBuilder;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/server/PowerLogService;->mLogBuilder:Ljava/lang/StringBuilder;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/server/PowerLogService;Ljava/lang/String;Ljava/lang/StringBuilder;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/server/PowerLogService;->addLogToDropBox(Ljava/lang/String;Ljava/lang/StringBuilder;)V

    return-void
.end method

.method static synthetic access$300(Lcom/android/server/PowerLogService;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/server/PowerLogService;->bootTime:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$302(Lcom/android/server/PowerLogService;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput-object p1, p0, Lcom/android/server/PowerLogService;->bootTime:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$400(Lcom/android/server/PowerLogService;Ljava/lang/StringBuilder;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    invoke-direct {p0, p1}, Lcom/android/server/PowerLogService;->buildFileHeader(Ljava/lang/StringBuilder;)V

    return-void
.end method

.method static synthetic access$500(Lcom/android/server/PowerLogService;Ljava/lang/String;J)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    invoke-direct {p0, p1, p2, p3}, Lcom/android/server/PowerLogService;->newPowerLogInDropbox(Ljava/lang/String;J)V

    return-void
.end method

.method private addBluetoothUsage(J)V
    .locals 13
    .parameter "uSecNow"

    .prologue
    const-wide v11, 0x408f400000000000L

    iget-object v0, p0, Lcom/android/server/PowerLogService;->mStats:Lcom/android/internal/os/BatteryStatsImpl;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p2, v1}, Lcom/android/internal/os/BatteryStatsImpl;->getBluetoothOnTime(JI)J

    move-result-wide v0

    const-wide/16 v5, 0x3e8

    div-long v3, v0, v5

    .local v3, btOnTimeMs:J
    long-to-double v0, v3

    iget-object v2, p0, Lcom/android/server/PowerLogService;->mPowerProfile:Lcom/android/internal/os/PowerProfile;

    const-string v5, "bluetooth.on"

    invoke-virtual {v2, v5}, Lcom/android/internal/os/PowerProfile;->getAveragePower(Ljava/lang/String;)D

    move-result-wide v5

    mul-double/2addr v0, v5

    div-double v9, v0, v11

    .local v9, btPower:D
    iget-object v0, p0, Lcom/android/server/PowerLogService;->mStats:Lcom/android/internal/os/BatteryStatsImpl;

    invoke-virtual {v0}, Lcom/android/internal/os/BatteryStatsImpl;->getBluetoothPingCount()I

    move-result v8

    .local v8, btPingCount:I
    int-to-double v0, v8

    iget-object v2, p0, Lcom/android/server/PowerLogService;->mPowerProfile:Lcom/android/internal/os/PowerProfile;

    const-string v5, "bluetooth.at"

    invoke-virtual {v2, v5}, Lcom/android/internal/os/PowerProfile;->getAveragePower(Ljava/lang/String;)D

    move-result-wide v5

    mul-double/2addr v0, v5

    div-double/2addr v0, v11

    add-double/2addr v9, v0

    const-string v1, "Bluetooth"

    sget-object v2, Lcom/android/server/PowerLogService$DrainType;->BLUETOOTH:Lcom/android/server/PowerLogService$DrainType;

    iget-wide v5, p0, Lcom/android/server/PowerLogService;->mBluetoothPower:D

    add-double/2addr v5, v9

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/android/server/PowerLogService;->addEntry(Ljava/lang/String;Lcom/android/server/PowerLogService$DrainType;JD)Lcom/android/server/PowerLogService$BatterySipper;

    move-result-object v7

    .local v7, bs:Lcom/android/server/PowerLogService$BatterySipper;
    iget-object v0, p0, Lcom/android/server/PowerLogService;->mBluetoothSippers:Ljava/util/List;

    const-string v1, "Bluetooth"

    invoke-direct {p0, v7, v0, v1}, Lcom/android/server/PowerLogService;->aggregateSippers(Lcom/android/server/PowerLogService$BatterySipper;Ljava/util/List;Ljava/lang/String;)V

    return-void
.end method

.method private addEntry(Ljava/lang/String;Lcom/android/server/PowerLogService$DrainType;JD)Lcom/android/server/PowerLogService$BatterySipper;
    .locals 7
    .parameter "label"
    .parameter "drainType"
    .parameter "time"
    .parameter "power"

    .prologue
    iget-wide v1, p0, Lcom/android/server/PowerLogService;->mMaxPower:D

    cmpl-double v1, p5, v1

    if-lez v1, :cond_0

    iput-wide p5, p0, Lcom/android/server/PowerLogService;->mMaxPower:D

    :cond_0
    iget-wide v1, p0, Lcom/android/server/PowerLogService;->mTotalPower:D

    add-double/2addr v1, p5

    iput-wide v1, p0, Lcom/android/server/PowerLogService;->mTotalPower:D

    new-instance v0, Lcom/android/server/PowerLogService$BatterySipper;

    iget-object v2, p0, Lcom/android/server/PowerLogService;->mContext:Landroid/content/Context;

    const/4 v5, 0x0

    const/4 v1, 0x1

    new-array v6, v1, [D

    const/4 v1, 0x0

    aput-wide p5, v6, v1

    move-object v1, p0

    move-object v3, p1

    move-object v4, p2

    invoke-direct/range {v0 .. v6}, Lcom/android/server/PowerLogService$BatterySipper;-><init>(Lcom/android/server/PowerLogService;Landroid/content/Context;Ljava/lang/String;Lcom/android/server/PowerLogService$DrainType;Landroid/os/BatteryStats$Uid;[D)V

    .local v0, bs:Lcom/android/server/PowerLogService$BatterySipper;
    iput-wide p3, v0, Lcom/android/server/PowerLogService$BatterySipper;->usageTime:J

    iget-object v1, p0, Lcom/android/server/PowerLogService;->mUsageList:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method private addIdleUsage(J)V
    .locals 9
    .parameter "uSecNow"

    .prologue
    iget-object v0, p0, Lcom/android/server/PowerLogService;->mStats:Lcom/android/internal/os/BatteryStatsImpl;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p2, v1}, Lcom/android/internal/os/BatteryStatsImpl;->getScreenOnTime(JI)J

    move-result-wide v0

    sub-long v0, p1, v0

    const-wide/16 v7, 0x3e8

    div-long v3, v0, v7

    .local v3, idleTimeMs:J
    long-to-double v0, v3

    iget-object v2, p0, Lcom/android/server/PowerLogService;->mPowerProfile:Lcom/android/internal/os/PowerProfile;

    const-string v7, "cpu.idle"

    invoke-virtual {v2, v7}, Lcom/android/internal/os/PowerProfile;->getAveragePower(Ljava/lang/String;)D

    move-result-wide v7

    mul-double/2addr v0, v7

    const-wide v7, 0x408f400000000000L

    div-double v5, v0, v7

    .local v5, idlePower:D
    const-string v1, "Phone idle"

    sget-object v2, Lcom/android/server/PowerLogService$DrainType;->IDLE:Lcom/android/server/PowerLogService$DrainType;

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/android/server/PowerLogService;->addEntry(Ljava/lang/String;Lcom/android/server/PowerLogService$DrainType;JD)Lcom/android/server/PowerLogService$BatterySipper;

    return-void
.end method

.method private addLogToDropBox(Ljava/lang/String;Ljava/lang/StringBuilder;)V
    .locals 2
    .parameter "dropboxTag"
    .parameter "sb"

    .prologue
    iget-object v0, p0, Lcom/android/server/PowerLogService;->mDropBox:Landroid/os/DropBoxManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/PowerLogService;->mDropBox:Landroid/os/DropBoxManager;

    invoke-virtual {v0, p1}, Landroid/os/DropBoxManager;->isTagEnabled(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/android/server/PowerLogService;->mDropBox:Landroid/os/DropBoxManager;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Landroid/os/DropBoxManager;->addText(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method private addOneLine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "date"
    .parameter "tag"
    .parameter "name"
    .parameter "msg"

    .prologue
    iget-object v0, p0, Lcom/android/server/PowerLogService;->mLogBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\t"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\t"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\t"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method private addPhoneUsage(J)V
    .locals 9
    .parameter "uSecNow"

    .prologue
    iget-object v0, p0, Lcom/android/server/PowerLogService;->mStats:Lcom/android/internal/os/BatteryStatsImpl;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p2, v1}, Lcom/android/internal/os/BatteryStatsImpl;->getPhoneOnTime(JI)J

    move-result-wide v0

    const-wide/16 v7, 0x3e8

    div-long v3, v0, v7

    .local v3, phoneOnTimeMs:J
    iget-object v0, p0, Lcom/android/server/PowerLogService;->mPowerProfile:Lcom/android/internal/os/PowerProfile;

    const-string v1, "radio.active"

    invoke-virtual {v0, v1}, Lcom/android/internal/os/PowerProfile;->getAveragePower(Ljava/lang/String;)D

    move-result-wide v0

    long-to-double v7, v3

    mul-double/2addr v0, v7

    const-wide v7, 0x408f400000000000L

    div-double v5, v0, v7

    .local v5, phoneOnPower:D
    const-string v1, "Voice calls"

    sget-object v2, Lcom/android/server/PowerLogService$DrainType;->PHONE:Lcom/android/server/PowerLogService$DrainType;

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/android/server/PowerLogService;->addEntry(Ljava/lang/String;Lcom/android/server/PowerLogService$DrainType;JD)Lcom/android/server/PowerLogService$BatterySipper;

    return-void
.end method

.method private addRadioUsage(J)V
    .locals 19
    .parameter "uSecNow"

    .prologue
    const-wide/16 v7, 0x0

    .local v7, power:D
    const/4 v9, 0x5

    .local v9, BINS:I
    const-wide/16 v5, 0x0

    .local v5, signalTimeMs:J
    const/4 v12, 0x0

    .local v12, i:I
    :goto_0
    const/4 v2, 0x5

    if-ge v12, v2, :cond_0

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/PowerLogService;->mStats:Lcom/android/internal/os/BatteryStatsImpl;

    const/4 v3, 0x0

    move-wide/from16 v0, p1

    invoke-virtual {v2, v12, v0, v1, v3}, Lcom/android/internal/os/BatteryStatsImpl;->getPhoneSignalStrengthTime(IJI)J

    move-result-wide v2

    const-wide/16 v17, 0x3e8

    div-long v15, v2, v17

    .local v15, strengthTimeMs:J
    const-wide/16 v2, 0x3e8

    div-long v2, v15, v2

    long-to-double v2, v2

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/PowerLogService;->mPowerProfile:Lcom/android/internal/os/PowerProfile;

    const-string v17, "radio.on"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0, v12}, Lcom/android/internal/os/PowerProfile;->getAveragePower(Ljava/lang/String;I)D

    move-result-wide v17

    mul-double v2, v2, v17

    add-double/2addr v7, v2

    add-long/2addr v5, v15

    add-int/lit8 v12, v12, 0x1

    goto :goto_0

    .end local v15           #strengthTimeMs:J
    :cond_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/PowerLogService;->mStats:Lcom/android/internal/os/BatteryStatsImpl;

    const/4 v3, 0x0

    move-wide/from16 v0, p1

    invoke-virtual {v2, v0, v1, v3}, Lcom/android/internal/os/BatteryStatsImpl;->getPhoneSignalScanningTime(JI)J

    move-result-wide v2

    const-wide/16 v17, 0x3e8

    div-long v13, v2, v17

    .local v13, scanningTimeMs:J
    const-wide/16 v2, 0x3e8

    div-long v2, v13, v2

    long-to-double v2, v2

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/PowerLogService;->mPowerProfile:Lcom/android/internal/os/PowerProfile;

    const-string v17, "radio.scanning"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Lcom/android/internal/os/PowerProfile;->getAveragePower(Ljava/lang/String;)D

    move-result-wide v17

    mul-double v2, v2, v17

    add-double/2addr v7, v2

    const-string v3, "Cell standby"

    sget-object v4, Lcom/android/server/PowerLogService$DrainType;->CELL:Lcom/android/server/PowerLogService$DrainType;

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v8}, Lcom/android/server/PowerLogService;->addEntry(Ljava/lang/String;Lcom/android/server/PowerLogService$DrainType;JD)Lcom/android/server/PowerLogService$BatterySipper;

    move-result-object v10

    .local v10, bs:Lcom/android/server/PowerLogService$BatterySipper;
    const-wide/16 v2, 0x0

    cmp-long v2, v5, v2

    if-eqz v2, :cond_1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/PowerLogService;->mStats:Lcom/android/internal/os/BatteryStatsImpl;

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-wide/from16 v0, p1

    invoke-virtual {v2, v3, v0, v1, v4}, Lcom/android/internal/os/BatteryStatsImpl;->getPhoneSignalStrengthTime(IJI)J

    move-result-wide v2

    const-wide/16 v17, 0x3e8

    div-long v2, v2, v17

    long-to-double v2, v2

    const-wide/high16 v17, 0x4059

    mul-double v2, v2, v17

    long-to-double v0, v5

    move-wide/from16 v17, v0

    div-double v2, v2, v17

    iput-wide v2, v10, Lcom/android/server/PowerLogService$BatterySipper;->noCoveragePercent:D

    :cond_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/PowerLogService;->mSdf:Ljava/text/SimpleDateFormat;

    new-instance v3, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v17

    move-wide/from16 v0, v17

    invoke-direct {v3, v0, v1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v2, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v11

    .local v11, date:Ljava/lang/String;
    invoke-direct/range {p0 .. p0}, Lcom/android/server/PowerLogService;->isNetworkAvailable()Z

    move-result v2

    if-eqz v2, :cond_2

    const-string v2, "NETWORK_OK"

    const-string v3, "system_process"

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v11, v2, v3, v4}, Lcom/android/server/PowerLogService;->addOneLine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    return-void

    :cond_2
    const-string v2, "NETWORK_OK"

    const-string v3, "system_process"

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v11, v2, v3, v4}, Lcom/android/server/PowerLogService;->addOneLine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method private addScreenUsage(J)V
    .locals 20
    .parameter "uSecNow"

    .prologue
    const-wide/16 v7, 0x0

    .local v7, power:D
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/PowerLogService;->mStats:Lcom/android/internal/os/BatteryStatsImpl;

    const/4 v3, 0x0

    move-wide/from16 v0, p1

    invoke-virtual {v2, v0, v1, v3}, Lcom/android/internal/os/BatteryStatsImpl;->getScreenOnTime(JI)J

    move-result-wide v2

    const-wide/16 v18, 0x3e8

    div-long v5, v2, v18

    .local v5, screenOnTimeMs:J
    long-to-double v2, v5

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/PowerLogService;->mPowerProfile:Lcom/android/internal/os/PowerProfile;

    const-string v18, "screen.on"

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Lcom/android/internal/os/PowerProfile;->getAveragePower(Ljava/lang/String;)D

    move-result-wide v18

    mul-double v2, v2, v18

    add-double/2addr v7, v2

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/PowerLogService;->mPowerProfile:Lcom/android/internal/os/PowerProfile;

    const-string v3, "screen.full"

    invoke-virtual {v2, v3}, Lcom/android/internal/os/PowerProfile;->getAveragePower(Ljava/lang/String;)D

    move-result-wide v15

    .local v15, screenFullPower:D
    const/4 v12, 0x0

    .local v12, i:I
    :goto_0
    const/4 v2, 0x5

    if-ge v12, v2, :cond_0

    int-to-float v2, v12

    const/high16 v3, 0x3f00

    add-float/2addr v2, v3

    float-to-double v2, v2

    mul-double/2addr v2, v15

    const-wide/high16 v18, 0x4014

    div-double v13, v2, v18

    .local v13, screenBinPower:D
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/PowerLogService;->mStats:Lcom/android/internal/os/BatteryStatsImpl;

    const/4 v3, 0x0

    move-wide/from16 v0, p1

    invoke-virtual {v2, v12, v0, v1, v3}, Lcom/android/internal/os/BatteryStatsImpl;->getScreenBrightnessTime(IJI)J

    move-result-wide v2

    const-wide/16 v18, 0x3e8

    div-long v9, v2, v18

    .local v9, brightnessTime:J
    long-to-double v2, v9

    mul-double/2addr v2, v13

    add-double/2addr v7, v2

    const-string v2, "PowerLog"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Screen bin power = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    double-to-int v4, v13

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", time = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    add-int/lit8 v12, v12, 0x1

    goto :goto_0

    .end local v9           #brightnessTime:J
    .end local v13           #screenBinPower:D
    :cond_0
    const-wide v2, 0x408f400000000000L

    div-double/2addr v7, v2

    const-string v3, "Screen"

    sget-object v4, Lcom/android/server/PowerLogService$DrainType;->SCREEN:Lcom/android/server/PowerLogService$DrainType;

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v8}, Lcom/android/server/PowerLogService;->addEntry(Ljava/lang/String;Lcom/android/server/PowerLogService$DrainType;JD)Lcom/android/server/PowerLogService$BatterySipper;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/PowerLogService;->mSdf:Ljava/text/SimpleDateFormat;

    new-instance v3, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v18

    move-wide/from16 v0, v18

    invoke-direct {v3, v0, v1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v2, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v11

    .local v11, date:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/PowerLogService;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "screen_brightness_mode"

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v17

    .local v17, value:I
    const-string v2, "BRIGHTNESS_MODE"

    const-string v3, "system_process"

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v11, v2, v3, v4}, Lcom/android/server/PowerLogService;->addOneLine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    if-nez v17, :cond_1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/PowerLogService;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "screen_brightness"

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v17

    const-string v2, "LCD_BLACK"

    const-string v3, "system_process"

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v11, v2, v3, v4}, Lcom/android/server/PowerLogService;->addOneLine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method private addWiFiUsage(J)V
    .locals 19
    .parameter "uSecNow"

    .prologue
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/PowerLogService;->mStats:Lcom/android/internal/os/BatteryStatsImpl;

    const/4 v3, 0x0

    move-wide/from16 v0, p1

    invoke-virtual {v2, v0, v1, v3}, Lcom/android/internal/os/BatteryStatsImpl;->getWifiOnTime(JI)J

    move-result-wide v2

    const-wide/16 v7, 0x3e8

    div-long v12, v2, v7

    .local v12, onTimeMs:J
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/PowerLogService;->mStats:Lcom/android/internal/os/BatteryStatsImpl;

    const/4 v3, 0x0

    move-wide/from16 v0, p1

    invoke-virtual {v2, v0, v1, v3}, Lcom/android/internal/os/BatteryStatsImpl;->getGlobalWifiRunningTime(JI)J

    move-result-wide v2

    const-wide/16 v7, 0x3e8

    div-long v5, v2, v7

    .local v5, runningTimeMs:J
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/android/server/PowerLogService;->mAppWifiRunning:J

    sub-long/2addr v5, v2

    const-wide/16 v2, 0x0

    cmp-long v2, v5, v2

    if-gez v2, :cond_0

    const-wide/16 v5, 0x0

    :cond_0
    const-wide/16 v2, 0x0

    mul-long/2addr v2, v12

    long-to-double v2, v2

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/PowerLogService;->mPowerProfile:Lcom/android/internal/os/PowerProfile;

    const-string v7, "wifi.on"

    invoke-virtual {v4, v7}, Lcom/android/internal/os/PowerProfile;->getAveragePower(Ljava/lang/String;)D

    move-result-wide v7

    mul-double/2addr v2, v7

    long-to-double v7, v5

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/PowerLogService;->mPowerProfile:Lcom/android/internal/os/PowerProfile;

    const-string v17, "wifi.on"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Lcom/android/internal/os/PowerProfile;->getAveragePower(Ljava/lang/String;)D

    move-result-wide v17

    mul-double v7, v7, v17

    add-double/2addr v2, v7

    const-wide v7, 0x408f400000000000L

    div-double v14, v2, v7

    .local v14, wifiPower:D
    const-string v2, "PowerLog"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "WIFI power="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v14, v15}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " from procs="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-wide v7, v0, Lcom/android/server/PowerLogService;->mWifiPower:D

    invoke-virtual {v3, v7, v8}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v3, "Wi-Fi"

    sget-object v4, Lcom/android/server/PowerLogService$DrainType;->WIFI:Lcom/android/server/PowerLogService$DrainType;

    move-object/from16 v0, p0

    iget-wide v7, v0, Lcom/android/server/PowerLogService;->mWifiPower:D

    add-double/2addr v7, v14

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v8}, Lcom/android/server/PowerLogService;->addEntry(Ljava/lang/String;Lcom/android/server/PowerLogService$DrainType;JD)Lcom/android/server/PowerLogService$BatterySipper;

    move-result-object v9

    .local v9, bs:Lcom/android/server/PowerLogService$BatterySipper;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/PowerLogService;->mWifiSippers:Ljava/util/List;

    const-string v3, "WIFI"

    move-object/from16 v0, p0

    invoke-direct {v0, v9, v2, v3}, Lcom/android/server/PowerLogService;->aggregateSippers(Lcom/android/server/PowerLogService$BatterySipper;Ljava/util/List;Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/PowerLogService;->mContext:Landroid/content/Context;

    const-string v3, "wifi"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/net/wifi/WifiManager;

    .local v11, mWifiManager:Landroid/net/wifi/WifiManager;
    invoke-virtual {v11}, Landroid/net/wifi/WifiManager;->getWifiState()I

    move-result v16

    .local v16, wifiState:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/PowerLogService;->mSdf:Ljava/text/SimpleDateFormat;

    new-instance v3, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    invoke-direct {v3, v7, v8}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v2, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v10

    .local v10, date:Ljava/lang/String;
    packed-switch v16, :pswitch_data_0

    :goto_0
    :pswitch_0
    return-void

    :pswitch_1
    const-string v2, "WIFI_CONNECTED"

    const-string v3, "system_process"

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v10, v2, v3, v4}, Lcom/android/server/PowerLogService;->addOneLine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :pswitch_2
    const-string v2, "WIFI_CONNECTED"

    const-string v3, "system_process"

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v10, v2, v3, v4}, Lcom/android/server/PowerLogService;->addOneLine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method private aggregateSippers(Lcom/android/server/PowerLogService$BatterySipper;Ljava/util/List;Ljava/lang/String;)V
    .locals 6
    .parameter "bs"
    .parameter
    .parameter "tag"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/server/PowerLogService$BatterySipper;",
            "Ljava/util/List",
            "<",
            "Lcom/android/server/PowerLogService$BatterySipper;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .local p2, from:Ljava/util/List;,"Ljava/util/List<Lcom/android/server/PowerLogService$BatterySipper;>;"
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/PowerLogService$BatterySipper;

    .local v1, wbs:Lcom/android/server/PowerLogService$BatterySipper;
    const-string v2, "PowerLog"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " adding sipper "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": cpu="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, v1, Lcom/android/server/PowerLogService$BatterySipper;->cpuTime:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-wide v2, p1, Lcom/android/server/PowerLogService$BatterySipper;->cpuTime:J

    iget-wide v4, v1, Lcom/android/server/PowerLogService$BatterySipper;->cpuTime:J

    add-long/2addr v2, v4

    iput-wide v2, p1, Lcom/android/server/PowerLogService$BatterySipper;->cpuTime:J

    iget-wide v2, p1, Lcom/android/server/PowerLogService$BatterySipper;->gpsTime:J

    iget-wide v4, v1, Lcom/android/server/PowerLogService$BatterySipper;->gpsTime:J

    add-long/2addr v2, v4

    iput-wide v2, p1, Lcom/android/server/PowerLogService$BatterySipper;->gpsTime:J

    iget-wide v2, p1, Lcom/android/server/PowerLogService$BatterySipper;->wifiRunningTime:J

    iget-wide v4, v1, Lcom/android/server/PowerLogService$BatterySipper;->wifiRunningTime:J

    add-long/2addr v2, v4

    iput-wide v2, p1, Lcom/android/server/PowerLogService$BatterySipper;->wifiRunningTime:J

    iget-wide v2, p1, Lcom/android/server/PowerLogService$BatterySipper;->cpuFgTime:J

    iget-wide v4, v1, Lcom/android/server/PowerLogService$BatterySipper;->cpuFgTime:J

    add-long/2addr v2, v4

    iput-wide v2, p1, Lcom/android/server/PowerLogService$BatterySipper;->cpuFgTime:J

    iget-wide v2, p1, Lcom/android/server/PowerLogService$BatterySipper;->wakeLockTime:J

    iget-wide v4, v1, Lcom/android/server/PowerLogService$BatterySipper;->wakeLockTime:J

    add-long/2addr v2, v4

    iput-wide v2, p1, Lcom/android/server/PowerLogService$BatterySipper;->wakeLockTime:J

    iget-wide v2, p1, Lcom/android/server/PowerLogService$BatterySipper;->tcpBytesReceived:J

    iget-wide v4, v1, Lcom/android/server/PowerLogService$BatterySipper;->tcpBytesReceived:J

    add-long/2addr v2, v4

    iput-wide v2, p1, Lcom/android/server/PowerLogService$BatterySipper;->tcpBytesReceived:J

    iget-wide v2, p1, Lcom/android/server/PowerLogService$BatterySipper;->tcpBytesSent:J

    iget-wide v4, v1, Lcom/android/server/PowerLogService$BatterySipper;->tcpBytesSent:J

    add-long/2addr v2, v4

    iput-wide v2, p1, Lcom/android/server/PowerLogService$BatterySipper;->tcpBytesSent:J

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .end local v1           #wbs:Lcom/android/server/PowerLogService$BatterySipper;
    :cond_0
    return-void
.end method

.method private buildFileHeader(Ljava/lang/StringBuilder;)V
    .locals 3
    .parameter "sb"

    .prologue
    const-string v0, "Build:\t"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "SmartPowerMode:\t"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "persist.sys.smart_power"

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "Radio:\t"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "ro.baseband"

    const-string v2, "unknown"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "Network:\t"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "gsm.operator.alpha"

    const-string v2, "unknown"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "SystemBoot Time:\t"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/PowerLogService;->bootTime:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\n"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method private getAverageDataCost()D
    .locals 26

    .prologue
    const-wide/32 v6, 0xf4240

    .local v6, WIFI_BPS:J
    const-wide/32 v2, 0x30d40

    .local v2, MOBILE_BPS:J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/PowerLogService;->mPowerProfile:Lcom/android/internal/os/PowerProfile;

    move-object/from16 v22, v0

    const-string v23, "wifi.active"

    invoke-virtual/range {v22 .. v23}, Lcom/android/internal/os/PowerProfile;->getAveragePower(Ljava/lang/String;)D

    move-result-wide v22

    const-wide v24, 0x40ac200000000000L

    div-double v8, v22, v24

    .local v8, WIFI_POWER:D
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/PowerLogService;->mPowerProfile:Lcom/android/internal/os/PowerProfile;

    move-object/from16 v22, v0

    const-string v23, "radio.active"

    invoke-virtual/range {v22 .. v23}, Lcom/android/internal/os/PowerProfile;->getAveragePower(Ljava/lang/String;)D

    move-result-wide v22

    const-wide v24, 0x40ac200000000000L

    div-double v4, v22, v24

    .local v4, MOBILE_POWER:D
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/PowerLogService;->mStats:Lcom/android/internal/os/BatteryStatsImpl;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    invoke-virtual/range {v22 .. v23}, Lcom/android/internal/os/BatteryStatsImpl;->getMobileTcpBytesReceived(I)J

    move-result-wide v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/PowerLogService;->mStats:Lcom/android/internal/os/BatteryStatsImpl;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    invoke-virtual/range {v24 .. v25}, Lcom/android/internal/os/BatteryStatsImpl;->getMobileTcpBytesSent(I)J

    move-result-wide v24

    add-long v14, v22, v24

    .local v14, mobileData:J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/PowerLogService;->mStats:Lcom/android/internal/os/BatteryStatsImpl;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    invoke-virtual/range {v22 .. v23}, Lcom/android/internal/os/BatteryStatsImpl;->getTotalTcpBytesReceived(I)J

    move-result-wide v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/PowerLogService;->mStats:Lcom/android/internal/os/BatteryStatsImpl;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    invoke-virtual/range {v24 .. v25}, Lcom/android/internal/os/BatteryStatsImpl;->getTotalTcpBytesSent(I)J

    move-result-wide v24

    add-long v22, v22, v24

    sub-long v20, v22, v14

    .local v20, wifiData:J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/PowerLogService;->mStats:Lcom/android/internal/os/BatteryStatsImpl;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/android/internal/os/BatteryStatsImpl;->getRadioDataUptime()J

    move-result-wide v22

    const-wide/16 v24, 0x3e8

    div-long v16, v22, v24

    .local v16, radioDataUptimeMs:J
    const-wide/16 v22, 0x0

    cmp-long v22, v16, v22

    if-eqz v22, :cond_0

    const-wide/16 v22, 0x8

    mul-long v22, v22, v14

    const-wide/16 v24, 0x3e8

    mul-long v22, v22, v24

    div-long v10, v22, v16

    .local v10, mobileBps:J
    :goto_0
    const-wide/16 v22, 0x8

    div-long v22, v10, v22

    move-wide/from16 v0, v22

    long-to-double v0, v0

    move-wide/from16 v22, v0

    div-double v12, v4, v22

    .local v12, mobileCostPerByte:D
    const-wide v22, 0x40fe848000000000L

    div-double v18, v8, v22

    .local v18, wifiCostPerByte:D
    add-long v22, v20, v14

    const-wide/16 v24, 0x0

    cmp-long v22, v22, v24

    if-eqz v22, :cond_1

    long-to-double v0, v14

    move-wide/from16 v22, v0

    mul-double v22, v22, v12

    move-wide/from16 v0, v20

    long-to-double v0, v0

    move-wide/from16 v24, v0

    mul-double v24, v24, v18

    add-double v22, v22, v24

    add-long v24, v14, v20

    move-wide/from16 v0, v24

    long-to-double v0, v0

    move-wide/from16 v24, v0

    div-double v22, v22, v24

    :goto_1
    return-wide v22

    .end local v10           #mobileBps:J
    .end local v12           #mobileCostPerByte:D
    .end local v18           #wifiCostPerByte:D
    :cond_0
    const-wide/32 v10, 0x30d40

    goto :goto_0

    .restart local v10       #mobileBps:J
    .restart local v12       #mobileCostPerByte:D
    .restart local v18       #wifiCostPerByte:D
    :cond_1
    const-wide/16 v22, 0x0

    goto :goto_1
.end method

.method private isNetworkAvailable()Z
    .locals 6

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    iget-object v4, p0, Lcom/android/server/PowerLogService;->mContext:Landroid/content/Context;

    const-string v5, "connectivity"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .local v0, connMgr:Landroid/net/ConnectivityManager;
    invoke-virtual {v0, v2}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v1

    .local v1, ni:Landroid/net/NetworkInfo;
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isAvailable()Z

    move-result v4

    if-eqz v4, :cond_1

    move v2, v3

    :cond_0
    :goto_0
    return v2

    :cond_1
    invoke-virtual {v0, v3}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isAvailable()Z

    move-result v2

    goto :goto_0
.end method

.method private static isWifiOnly(Landroid/content/Context;)Z
    .locals 3
    .parameter "context"

    .prologue
    const/4 v1, 0x0

    const-string v2, "connectivity"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .local v0, cm:Landroid/net/ConnectivityManager;
    invoke-virtual {v0, v1}, Landroid/net/ConnectivityManager;->isNetworkSupported(I)Z

    move-result v2

    if-nez v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method private load()V
    .locals 5

    .prologue
    :try_start_0
    const-string v3, "batteryinfo"

    invoke-static {v3}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v3

    invoke-static {v3}, Lcom/android/internal/app/IBatteryStats$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/app/IBatteryStats;

    move-result-object v3

    iput-object v3, p0, Lcom/android/server/PowerLogService;->mBatteryInfo:Lcom/android/internal/app/IBatteryStats;

    new-instance v3, Lcom/android/internal/os/PowerProfile;

    iget-object v4, p0, Lcom/android/server/PowerLogService;->mContext:Landroid/content/Context;

    invoke-direct {v3, v4}, Lcom/android/internal/os/PowerProfile;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/android/server/PowerLogService;->mPowerProfile:Lcom/android/internal/os/PowerProfile;

    iget-object v3, p0, Lcom/android/server/PowerLogService;->mBatteryInfo:Lcom/android/internal/app/IBatteryStats;

    invoke-interface {v3}, Lcom/android/internal/app/IBatteryStats;->getStatisticsForMe()[B

    move-result-object v0

    .local v0, data:[B
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v2

    .local v2, parcel:Landroid/os/Parcel;
    const/4 v3, 0x0

    array-length v4, v0

    invoke-virtual {v2, v0, v3, v4}, Landroid/os/Parcel;->unmarshall([BII)V

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/os/Parcel;->setDataPosition(I)V

    sget-object v3, Lcom/android/internal/os/BatteryStatsImpl;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v3, v2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/internal/os/BatteryStatsImpl;

    iput-object v3, p0, Lcom/android/server/PowerLogService;->mStats:Lcom/android/internal/os/BatteryStatsImpl;

    iget-object v3, p0, Lcom/android/server/PowerLogService;->mStats:Lcom/android/internal/os/BatteryStatsImpl;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/android/internal/os/BatteryStatsImpl;->distributeWorkLocked(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v0           #data:[B
    .end local v2           #parcel:Landroid/os/Parcel;
    :goto_0
    return-void

    :catch_0
    move-exception v1

    .local v1, e:Landroid/os/RemoteException;
    const-string v3, "PowerLog"

    const-string v4, "RemoteException:"

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private movePowerLogToSendPath()Z
    .locals 18

    .prologue
    new-instance v8, Ljava/io/File;

    const-string v15, "/data/system/powerlog/"

    invoke-direct {v8, v15}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .local v8, powerLogDir:Ljava/io/File;
    new-instance v10, Ljava/io/File;

    const-string v15, "/data/system/powerlog/sendcache/"

    invoke-direct {v10, v15}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .local v10, powerLogSendDir:Ljava/io/File;
    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v15

    if-nez v15, :cond_0

    invoke-virtual {v10}, Ljava/io/File;->mkdir()Z

    move-result v15

    if-nez v15, :cond_0

    const-string v15, "PowerLog"

    const-string v16, "powerLogSend dir is not exist: /data/system/powerlog/sendcache/"

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v15, 0x0

    :goto_0
    return v15

    :cond_0
    invoke-virtual {v8}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v9

    .local v9, powerLogFiles:[Ljava/io/File;
    invoke-virtual {v10}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v11

    .local v11, powerLogSendFiles:[Ljava/io/File;
    array-length v15, v9

    const/16 v16, 0x65

    move/from16 v0, v16

    if-lt v15, v0, :cond_5

    if-eqz v11, :cond_2

    const/4 v4, 0x0

    .local v4, i:I
    :goto_1
    array-length v15, v11

    if-ge v4, v15, :cond_2

    aget-object v15, v11, v4

    invoke-virtual {v15}, Ljava/io/File;->delete()Z

    move-result v15

    if-nez v15, :cond_1

    const-string v15, "PowerLog"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "The powerLogZIP file can\'t to delete: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    aget-object v17, v11, v4

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .end local v4           #i:I
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v13

    .local v13, timeStamp:J
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "PowerLog@"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    sget-object v16, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "@"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/PowerLogService;->mImei:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "@"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, ".gz"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .local v3, filename:Ljava/lang/String;
    new-instance v12, Ljava/io/File;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "/data/system/powerlog/sendcache/"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v12, v15}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .local v12, powerLogZip:Ljava/io/File;
    const/16 v15, 0x400

    new-array v1, v15, [B

    .local v1, buf:[B
    :try_start_0
    new-instance v7, Ljava/util/zip/ZipOutputStream;

    new-instance v15, Ljava/io/FileOutputStream;

    invoke-direct {v15, v12}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v7, v15}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V

    .local v7, out:Ljava/util/zip/ZipOutputStream;
    const/4 v4, 0x0

    .restart local v4       #i:I
    :goto_2
    array-length v15, v9

    if-ge v4, v15, :cond_7

    aget-object v15, v9, v4

    invoke-virtual {v15}, Ljava/io/File;->isDirectory()Z

    move-result v15

    if-eqz v15, :cond_4

    :cond_3
    :goto_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    :cond_4
    new-instance v5, Ljava/io/FileInputStream;

    aget-object v15, v9, v4

    invoke-direct {v5, v15}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .local v5, in:Ljava/io/FileInputStream;
    new-instance v15, Ljava/util/zip/ZipEntry;

    aget-object v16, v9, v4

    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v15}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    :goto_4
    invoke-virtual {v5, v1}, Ljava/io/FileInputStream;->read([B)I

    move-result v6

    .local v6, len:I
    if-lez v6, :cond_6

    const/4 v15, 0x0

    invoke-virtual {v7, v1, v15, v6}, Ljava/util/zip/ZipOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    .end local v4           #i:I
    .end local v5           #in:Ljava/io/FileInputStream;
    .end local v6           #len:I
    .end local v7           #out:Ljava/util/zip/ZipOutputStream;
    :catch_0
    move-exception v2

    .local v2, e:Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    .end local v1           #buf:[B
    .end local v2           #e:Ljava/io/IOException;
    .end local v3           #filename:Ljava/lang/String;
    .end local v12           #powerLogZip:Ljava/io/File;
    .end local v13           #timeStamp:J
    :cond_5
    :goto_5
    const/4 v15, 0x1

    goto/16 :goto_0

    .restart local v1       #buf:[B
    .restart local v3       #filename:Ljava/lang/String;
    .restart local v4       #i:I
    .restart local v5       #in:Ljava/io/FileInputStream;
    .restart local v6       #len:I
    .restart local v7       #out:Ljava/util/zip/ZipOutputStream;
    .restart local v12       #powerLogZip:Ljava/io/File;
    .restart local v13       #timeStamp:J
    :cond_6
    :try_start_1
    invoke-virtual {v7}, Ljava/util/zip/ZipOutputStream;->closeEntry()V

    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V

    aget-object v15, v9, v4

    invoke-virtual {v15}, Ljava/io/File;->delete()Z

    move-result v15

    if-nez v15, :cond_3

    const-string v15, "PowerLog"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "The powerLog file can\'t to delete: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    aget-object v17, v9, v4

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .end local v5           #in:Ljava/io/FileInputStream;
    .end local v6           #len:I
    :cond_7
    invoke-virtual {v7}, Ljava/util/zip/ZipOutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_5
.end method

.method private moveToLogMailPath(Ljava/lang/String;)Z
    .locals 14
    .parameter "filename"

    .prologue
    const/4 v10, 0x0

    new-instance v3, Ljava/io/File;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "/data/system/dropbox/"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v3, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .local v3, fromFile:Ljava/io/File;
    new-instance v8, Ljava/io/File;

    const-string v11, "/data/system/powerlog/"

    invoke-direct {v8, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .local v8, targetDir:Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v11

    if-nez v11, :cond_1

    invoke-virtual {v8}, Ljava/io/File;->mkdir()Z

    move-result v11

    if-nez v11, :cond_1

    const-string v11, "PowerLog"

    const-string v12, "target dir is not exist:/data/system/powerlog/"

    invoke-static {v11, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :goto_0
    return v10

    :cond_1
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v11

    if-nez v11, :cond_2

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ".gz"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v3, Ljava/io/File;

    .end local v3           #fromFile:Ljava/io/File;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "/data/system/dropbox/"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v3, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .restart local v3       #fromFile:Ljava/io/File;
    :cond_2
    const-string v11, "PowerLog"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "new power log:"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v11

    if-nez v11, :cond_3

    const-string v11, "PowerLog"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "log file is not exist:"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_3
    const/4 v4, 0x0

    .local v4, in:Ljava/io/FileInputStream;
    const/4 v6, 0x0

    .local v6, out:Ljava/io/FileOutputStream;
    :try_start_0
    new-instance v9, Ljava/io/File;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "/data/system/powerlog/"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v9, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .local v9, toFile:Ljava/io/File;
    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4

    .end local v4           #in:Ljava/io/FileInputStream;
    .local v5, in:Ljava/io/FileInputStream;
    :try_start_1
    new-instance v7, Ljava/io/FileOutputStream;

    invoke-direct {v7, v9}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_5

    .end local v6           #out:Ljava/io/FileOutputStream;
    .local v7, out:Ljava/io/FileOutputStream;
    const/16 v11, 0x400

    :try_start_2
    new-array v0, v11, [B

    .local v0, bt:[B
    :goto_1
    invoke-virtual {v5, v0}, Ljava/io/FileInputStream;->read([B)I

    move-result v1

    .local v1, c:I
    if-lez v1, :cond_7

    const/4 v11, 0x0

    invoke-virtual {v7, v0, v11, v1}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    .end local v0           #bt:[B
    .end local v1           #c:I
    :catch_0
    move-exception v2

    move-object v6, v7

    .end local v7           #out:Ljava/io/FileOutputStream;
    .restart local v6       #out:Ljava/io/FileOutputStream;
    move-object v4, v5

    .end local v5           #in:Ljava/io/FileInputStream;
    .end local v9           #toFile:Ljava/io/File;
    .local v2, ex:Ljava/lang/Exception;
    .restart local v4       #in:Ljava/io/FileInputStream;
    :goto_2
    :try_start_3
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v4, :cond_4

    :try_start_4
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V

    :cond_4
    if-eqz v6, :cond_0

    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    goto/16 :goto_0

    :catch_1
    move-exception v11

    goto/16 :goto_0

    .end local v2           #ex:Ljava/lang/Exception;
    :catchall_0
    move-exception v10

    :goto_3
    if-eqz v4, :cond_5

    :try_start_5
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V

    :cond_5
    if-eqz v6, :cond_6

    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    :cond_6
    :goto_4
    throw v10

    .end local v4           #in:Ljava/io/FileInputStream;
    .end local v6           #out:Ljava/io/FileOutputStream;
    .restart local v0       #bt:[B
    .restart local v1       #c:I
    .restart local v5       #in:Ljava/io/FileInputStream;
    .restart local v7       #out:Ljava/io/FileOutputStream;
    .restart local v9       #toFile:Ljava/io/File;
    :cond_7
    if-eqz v5, :cond_8

    :try_start_6
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V

    :cond_8
    if-eqz v7, :cond_9

    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2

    :cond_9
    :goto_5
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    move-result v10

    if-nez v10, :cond_a

    const-string v10, "PowerLog"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "The old log file can\'t to delete: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_a
    const/4 v10, 0x1

    goto/16 :goto_0

    :catch_2
    move-exception v10

    goto :goto_5

    .end local v0           #bt:[B
    .end local v1           #c:I
    .end local v5           #in:Ljava/io/FileInputStream;
    .end local v7           #out:Ljava/io/FileOutputStream;
    .end local v9           #toFile:Ljava/io/File;
    .restart local v4       #in:Ljava/io/FileInputStream;
    .restart local v6       #out:Ljava/io/FileOutputStream;
    :catch_3
    move-exception v11

    goto :goto_4

    .end local v4           #in:Ljava/io/FileInputStream;
    .restart local v5       #in:Ljava/io/FileInputStream;
    .restart local v9       #toFile:Ljava/io/File;
    :catchall_1
    move-exception v10

    move-object v4, v5

    .end local v5           #in:Ljava/io/FileInputStream;
    .restart local v4       #in:Ljava/io/FileInputStream;
    goto :goto_3

    .end local v4           #in:Ljava/io/FileInputStream;
    .end local v6           #out:Ljava/io/FileOutputStream;
    .restart local v5       #in:Ljava/io/FileInputStream;
    .restart local v7       #out:Ljava/io/FileOutputStream;
    :catchall_2
    move-exception v10

    move-object v6, v7

    .end local v7           #out:Ljava/io/FileOutputStream;
    .restart local v6       #out:Ljava/io/FileOutputStream;
    move-object v4, v5

    .end local v5           #in:Ljava/io/FileInputStream;
    .restart local v4       #in:Ljava/io/FileInputStream;
    goto :goto_3

    .end local v9           #toFile:Ljava/io/File;
    :catch_4
    move-exception v2

    goto :goto_2

    .end local v4           #in:Ljava/io/FileInputStream;
    .restart local v5       #in:Ljava/io/FileInputStream;
    .restart local v9       #toFile:Ljava/io/File;
    :catch_5
    move-exception v2

    move-object v4, v5

    .end local v5           #in:Ljava/io/FileInputStream;
    .restart local v4       #in:Ljava/io/FileInputStream;
    goto :goto_2
.end method

.method private newPowerLogInDropbox(Ljava/lang/String;J)V
    .locals 4
    .parameter "tag"
    .parameter "timestampMillis"

    .prologue
    iget-object v2, p0, Lcom/android/server/PowerLogService;->mContext:Landroid/content/Context;

    const-string v3, "phone"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .local v1, telephonyManager:Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/android/server/PowerLogService;->mImei:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "@"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".txt"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .local v0, filename:Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/android/server/PowerLogService;->moveToLogMailPath(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-direct {p0}, Lcom/android/server/PowerLogService;->movePowerLogToSendPath()Z

    invoke-direct {p0}, Lcom/android/server/PowerLogService;->isNetworkAvailable()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lcom/android/server/PowerLogService;->sendByLogMail()V

    :cond_0
    return-void
.end method

.method private processAppUsage()V
    .locals 81

    .prologue
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/PowerLogService;->mContext:Landroid/content/Context;

    const-string v5, "sensor"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v45

    check-cast v45, Landroid/hardware/SensorManager;

    .local v45, sensorManager:Landroid/hardware/SensorManager;
    const/16 v74, 0x0

    .local v74, which:I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/PowerLogService;->mPowerProfile:Lcom/android/internal/os/PowerProfile;

    invoke-virtual {v4}, Lcom/android/internal/os/PowerProfile;->getNumSpeedSteps()I

    move-result v50

    .local v50, speedSteps:I
    move/from16 v0, v50

    new-array v0, v0, [D

    move-object/from16 v35, v0

    .local v35, powerCpuNormal:[D
    move/from16 v0, v50

    new-array v0, v0, [J

    move-object/from16 v17, v0

    .local v17, cpuSpeedStepTimes:[J
    const/16 v32, 0x0

    .local v32, p:I
    :goto_0
    move/from16 v0, v32

    move/from16 v1, v50

    if-ge v0, v1, :cond_0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/PowerLogService;->mPowerProfile:Lcom/android/internal/os/PowerProfile;

    const-string v5, "cpu.active"

    move/from16 v0, v32

    invoke-virtual {v4, v5, v0}, Lcom/android/internal/os/PowerProfile;->getAveragePower(Ljava/lang/String;I)D

    move-result-wide v4

    aput-wide v4, v35, v32

    add-int/lit8 v32, v32, 0x1

    goto :goto_0

    :cond_0
    invoke-direct/range {p0 .. p0}, Lcom/android/server/PowerLogService;->getAverageDataCost()D

    move-result-wide v13

    .local v13, averageCostPerByte:D
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/PowerLogService;->mStats:Lcom/android/internal/os/BatteryStatsImpl;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v77

    const-wide/16 v79, 0x3e8

    mul-long v77, v77, v79

    const/4 v5, 0x0

    move-wide/from16 v0, v77

    invoke-virtual {v4, v0, v1, v5}, Lcom/android/internal/os/BatteryStatsImpl;->computeBatteryRealtime(JI)J

    move-result-wide v62

    .local v62, uSecTime:J
    const-wide/16 v11, 0x0

    .local v11, appWakelockTime:J
    const/16 v31, 0x0

    .local v31, osApp:Lcom/android/server/PowerLogService$BatterySipper;
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/server/PowerLogService;->mStatsPeriod:J

    move-wide/from16 v62, v0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/PowerLogService;->mStats:Lcom/android/internal/os/BatteryStatsImpl;

    invoke-virtual {v4}, Lcom/android/internal/os/BatteryStatsImpl;->getUidStats()Landroid/util/SparseArray;

    move-result-object v64

    .local v64, uidStats:Landroid/util/SparseArray;,"Landroid/util/SparseArray<+Landroid/os/BatteryStats$Uid;>;"
    invoke-virtual/range {v64 .. v64}, Landroid/util/SparseArray;->size()I

    move-result v10

    .local v10, NU:I
    const/16 v28, 0x0

    .local v28, iu:I
    :goto_1
    move/from16 v0, v28

    if-ge v0, v10, :cond_16

    move-object/from16 v0, v64

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/os/BatteryStats$Uid;

    .local v8, u:Landroid/os/BatteryStats$Uid;
    const-wide/16 v33, 0x0

    .local v33, power:D
    const-wide/16 v25, 0x0

    .local v25, highestDrain:D
    const/4 v6, 0x0

    .local v6, packageWithHighestDrain:Ljava/lang/String;
    invoke-virtual {v8}, Landroid/os/BatteryStats$Uid;->getProcessStats()Ljava/util/Map;

    move-result-object v38

    .local v38, processStats:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;+Landroid/os/BatteryStats$Uid$Proc;>;"
    const-wide/16 v18, 0x0

    .local v18, cpuTime:J
    const-wide/16 v15, 0x0

    .local v15, cpuFgTime:J
    const-wide/16 v72, 0x0

    .local v72, wakelockTime:J
    const-wide/16 v23, 0x0

    .local v23, gpsTime:J
    invoke-interface/range {v38 .. v38}, Ljava/util/Map;->size()I

    move-result v4

    if-lez v4, :cond_8

    invoke-interface/range {v38 .. v38}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v27

    .local v27, i$:Ljava/util/Iterator;
    :cond_1
    :goto_2
    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7

    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/util/Map$Entry;

    .local v20, ent:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;+Landroid/os/BatteryStats$Uid$Proc;>;"
    const-string v5, "PowerLog"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Process name = "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface/range {v20 .. v20}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-interface/range {v20 .. v20}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v39

    check-cast v39, Landroid/os/BatteryStats$Uid$Proc;

    .local v39, ps:Landroid/os/BatteryStats$Uid$Proc;
    const/4 v4, 0x0

    move-object/from16 v0, v39

    invoke-virtual {v0, v4}, Landroid/os/BatteryStats$Uid$Proc;->getUserTime(I)J

    move-result-wide v65

    .local v65, userTime:J
    const/4 v4, 0x0

    move-object/from16 v0, v39

    invoke-virtual {v0, v4}, Landroid/os/BatteryStats$Uid$Proc;->getSystemTime(I)J

    move-result-wide v52

    .local v52, systemTime:J
    const/4 v4, 0x0

    move-object/from16 v0, v39

    invoke-virtual {v0, v4}, Landroid/os/BatteryStats$Uid$Proc;->getForegroundTime(I)J

    move-result-wide v21

    .local v21, foregroundTime:J
    const-wide/16 v4, 0xa

    mul-long v4, v4, v21

    add-long/2addr v15, v4

    add-long v4, v65, v52

    const-wide/16 v77, 0xa

    mul-long v59, v4, v77

    .local v59, tmpCpuTime:J
    const/16 v61, 0x0

    .local v61, totalTimeAtSpeeds:I
    const/16 v51, 0x0

    .local v51, step:I
    :goto_3
    move/from16 v0, v51

    move/from16 v1, v50

    if-ge v0, v1, :cond_2

    const/4 v4, 0x0

    move-object/from16 v0, v39

    move/from16 v1, v51

    invoke-virtual {v0, v1, v4}, Landroid/os/BatteryStats$Uid$Proc;->getTimeAtCpuSpeedStep(II)J

    move-result-wide v4

    aput-wide v4, v17, v51

    move/from16 v0, v61

    int-to-long v4, v0

    aget-wide v77, v17, v51

    add-long v4, v4, v77

    long-to-int v0, v4

    move/from16 v61, v0

    add-int/lit8 v51, v51, 0x1

    goto :goto_3

    :cond_2
    if-nez v61, :cond_3

    const/16 v61, 0x1

    :cond_3
    const-wide/16 v36, 0x0

    .local v36, processPower:D
    const/16 v51, 0x0

    :goto_4
    move/from16 v0, v51

    move/from16 v1, v50

    if-ge v0, v1, :cond_4

    aget-wide v4, v17, v51

    long-to-double v4, v4

    move/from16 v0, v61

    int-to-double v0, v0

    move-wide/from16 v77, v0

    div-double v40, v4, v77

    .local v40, ratio:D
    move-wide/from16 v0, v59

    long-to-double v4, v0

    mul-double v4, v4, v40

    aget-wide v77, v35, v51

    mul-double v4, v4, v77

    add-double v36, v36, v4

    add-int/lit8 v51, v51, 0x1

    goto :goto_4

    .end local v40           #ratio:D
    :cond_4
    add-long v18, v18, v59

    add-double v33, v33, v36

    if-eqz v6, :cond_5

    const-string v4, "*"

    invoke-virtual {v6, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    :cond_5
    move-wide/from16 v25, v36

    invoke-interface/range {v20 .. v20}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    .end local v6           #packageWithHighestDrain:Ljava/lang/String;
    check-cast v6, Ljava/lang/String;

    .restart local v6       #packageWithHighestDrain:Ljava/lang/String;
    goto/16 :goto_2

    :cond_6
    cmpg-double v4, v25, v36

    if-gez v4, :cond_1

    invoke-interface/range {v20 .. v20}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const-string v5, "*"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    move-wide/from16 v25, v36

    invoke-interface/range {v20 .. v20}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    .end local v6           #packageWithHighestDrain:Ljava/lang/String;
    check-cast v6, Ljava/lang/String;

    .restart local v6       #packageWithHighestDrain:Ljava/lang/String;
    goto/16 :goto_2

    .end local v20           #ent:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;+Landroid/os/BatteryStats$Uid$Proc;>;"
    .end local v21           #foregroundTime:J
    .end local v36           #processPower:D
    .end local v39           #ps:Landroid/os/BatteryStats$Uid$Proc;
    .end local v51           #step:I
    .end local v52           #systemTime:J
    .end local v59           #tmpCpuTime:J
    .end local v61           #totalTimeAtSpeeds:I
    .end local v65           #userTime:J
    :cond_7
    const-string v4, "PowerLog"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Max drain of "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-wide/from16 v0, v25

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " by "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .end local v27           #i$:Ljava/util/Iterator;
    :cond_8
    cmp-long v4, v15, v18

    if-lez v4, :cond_a

    const-wide/16 v4, 0x2710

    add-long v4, v4, v18

    cmp-long v4, v15, v4

    if-lez v4, :cond_9

    const-string v4, "PowerLog"

    const-string v5, "WARNING! Cputime is more than 10 seconds behind Foreground time"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_9
    move-wide/from16 v18, v15

    :cond_a
    const-wide v4, 0x408f400000000000L

    div-double v33, v33, v4

    invoke-virtual {v8}, Landroid/os/BatteryStats$Uid;->getWakelockStats()Ljava/util/Map;

    move-result-object v71

    .local v71, wakelockStats:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;+Landroid/os/BatteryStats$Uid$Wakelock;>;"
    invoke-interface/range {v71 .. v71}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v27

    .restart local v27       #i$:Ljava/util/Iterator;
    :cond_b
    :goto_5
    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_c

    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v70

    check-cast v70, Ljava/util/Map$Entry;

    .local v70, wakelockEntry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;+Landroid/os/BatteryStats$Uid$Wakelock;>;"
    invoke-interface/range {v70 .. v70}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v69

    check-cast v69, Landroid/os/BatteryStats$Uid$Wakelock;

    .local v69, wakelock:Landroid/os/BatteryStats$Uid$Wakelock;
    const/4 v4, 0x0

    move-object/from16 v0, v69

    invoke-virtual {v0, v4}, Landroid/os/BatteryStats$Uid$Wakelock;->getWakeTime(I)Landroid/os/BatteryStats$Timer;

    move-result-object v58

    .local v58, timer:Landroid/os/BatteryStats$Timer;
    if-eqz v58, :cond_b

    const/4 v4, 0x0

    move-object/from16 v0, v58

    move-wide/from16 v1, v62

    invoke-virtual {v0, v1, v2, v4}, Landroid/os/BatteryStats$Timer;->getTotalTimeLocked(JI)J

    move-result-wide v4

    add-long v72, v72, v4

    goto :goto_5

    .end local v58           #timer:Landroid/os/BatteryStats$Timer;
    .end local v69           #wakelock:Landroid/os/BatteryStats$Uid$Wakelock;
    .end local v70           #wakelockEntry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;+Landroid/os/BatteryStats$Uid$Wakelock;>;"
    :cond_c
    const-wide/16 v4, 0x3e8

    div-long v72, v72, v4

    add-long v11, v11, v72

    move-wide/from16 v0, v72

    long-to-double v4, v0

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/server/PowerLogService;->mPowerProfile:Lcom/android/internal/os/PowerProfile;

    const-string v9, "cpu.awake"

    invoke-virtual {v7, v9}, Lcom/android/internal/os/PowerProfile;->getAveragePower(Ljava/lang/String;)D

    move-result-wide v77

    mul-double v4, v4, v77

    const-wide v77, 0x408f400000000000L

    div-double v4, v4, v77

    add-double v33, v33, v4

    const/4 v4, 0x0

    invoke-virtual {v8, v4}, Landroid/os/BatteryStats$Uid;->getTcpBytesReceived(I)J

    move-result-wide v54

    .local v54, tcpBytesReceived:J
    const/4 v4, 0x0

    invoke-virtual {v8, v4}, Landroid/os/BatteryStats$Uid;->getTcpBytesSent(I)J

    move-result-wide v56

    .local v56, tcpBytesSent:J
    add-long v4, v54, v56

    long-to-double v4, v4

    mul-double/2addr v4, v13

    add-double v33, v33, v4

    const/4 v4, 0x0

    move-wide/from16 v0, v62

    invoke-virtual {v8, v0, v1, v4}, Landroid/os/BatteryStats$Uid;->getWifiRunningTime(JI)J

    move-result-wide v4

    const-wide/16 v77, 0x3e8

    div-long v75, v4, v77

    .local v75, wifiRunningTimeMs:J
    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/android/server/PowerLogService;->mAppWifiRunning:J

    add-long v4, v4, v75

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/android/server/PowerLogService;->mAppWifiRunning:J

    move-wide/from16 v0, v75

    long-to-double v4, v0

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/server/PowerLogService;->mPowerProfile:Lcom/android/internal/os/PowerProfile;

    const-string v9, "wifi.on"

    invoke-virtual {v7, v9}, Lcom/android/internal/os/PowerProfile;->getAveragePower(Ljava/lang/String;)D

    move-result-wide v77

    mul-double v4, v4, v77

    const-wide v77, 0x408f400000000000L

    div-double v4, v4, v77

    add-double v33, v33, v4

    invoke-virtual {v8}, Landroid/os/BatteryStats$Uid;->getSensorStats()Ljava/util/Map;

    move-result-object v46

    .local v46, sensorStats:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Integer;+Landroid/os/BatteryStats$Uid$Sensor;>;"
    invoke-interface/range {v46 .. v46}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v27

    :goto_6
    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_e

    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v44

    check-cast v44, Ljava/util/Map$Entry;

    .local v44, sensorEntry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/Integer;+Landroid/os/BatteryStats$Uid$Sensor;>;"
    invoke-interface/range {v44 .. v44}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v42

    check-cast v42, Landroid/os/BatteryStats$Uid$Sensor;

    .local v42, sensor:Landroid/os/BatteryStats$Uid$Sensor;
    invoke-virtual/range {v42 .. v42}, Landroid/os/BatteryStats$Uid$Sensor;->getHandle()I

    move-result v49

    .local v49, sensorType:I
    invoke-virtual/range {v42 .. v42}, Landroid/os/BatteryStats$Uid$Sensor;->getSensorTime()Landroid/os/BatteryStats$Timer;

    move-result-object v58

    .restart local v58       #timer:Landroid/os/BatteryStats$Timer;
    const/4 v4, 0x0

    move-object/from16 v0, v58

    move-wide/from16 v1, v62

    invoke-virtual {v0, v1, v2, v4}, Landroid/os/BatteryStats$Timer;->getTotalTimeLocked(JI)J

    move-result-wide v4

    const-wide/16 v77, 0x3e8

    div-long v47, v4, v77

    .local v47, sensorTime:J
    const-wide/16 v29, 0x0

    .local v29, multiplier:D
    packed-switch v49, :pswitch_data_0

    move-object/from16 v0, v45

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v43

    .local v43, sensorData:Landroid/hardware/Sensor;
    if-eqz v43, :cond_d

    invoke-virtual/range {v43 .. v43}, Landroid/hardware/Sensor;->getPower()F

    move-result v4

    float-to-double v0, v4

    move-wide/from16 v29, v0

    const-string v4, "PowerLog"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Got sensor "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v43 .. v43}, Landroid/hardware/Sensor;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " with power = "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-wide/from16 v0, v29

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .end local v43           #sensorData:Landroid/hardware/Sensor;
    :cond_d
    :goto_7
    move-wide/from16 v0, v47

    long-to-double v4, v0

    mul-double v4, v4, v29

    const-wide v77, 0x408f400000000000L

    div-double v4, v4, v77

    add-double v33, v33, v4

    goto :goto_6

    :pswitch_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/PowerLogService;->mPowerProfile:Lcom/android/internal/os/PowerProfile;

    const-string v5, "gps.on"

    invoke-virtual {v4, v5}, Lcom/android/internal/os/PowerProfile;->getAveragePower(Ljava/lang/String;)D

    move-result-wide v29

    move-wide/from16 v23, v47

    goto :goto_7

    .end local v29           #multiplier:D
    .end local v42           #sensor:Landroid/os/BatteryStats$Uid$Sensor;
    .end local v44           #sensorEntry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/Integer;+Landroid/os/BatteryStats$Uid$Sensor;>;"
    .end local v47           #sensorTime:J
    .end local v49           #sensorType:I
    .end local v58           #timer:Landroid/os/BatteryStats$Timer;
    :cond_e
    const-string v4, "PowerLog"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "UID "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v8}, Landroid/os/BatteryStats$Uid;->getUid()I

    move-result v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, ": power="

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-wide/from16 v0, v33

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-wide/16 v4, 0x0

    cmpl-double v4, v33, v4

    if-nez v4, :cond_f

    invoke-virtual {v8}, Landroid/os/BatteryStats$Uid;->getUid()I

    move-result v4

    if-nez v4, :cond_10

    :cond_f
    new-instance v3, Lcom/android/server/PowerLogService$BatterySipper;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/PowerLogService;->mContext:Landroid/content/Context;

    sget-object v7, Lcom/android/server/PowerLogService$DrainType;->APP:Lcom/android/server/PowerLogService$DrainType;

    const/4 v4, 0x1

    new-array v9, v4, [D

    const/4 v4, 0x0

    aput-wide v33, v9, v4

    move-object/from16 v4, p0

    invoke-direct/range {v3 .. v9}, Lcom/android/server/PowerLogService$BatterySipper;-><init>(Lcom/android/server/PowerLogService;Landroid/content/Context;Ljava/lang/String;Lcom/android/server/PowerLogService$DrainType;Landroid/os/BatteryStats$Uid;[D)V

    .local v3, app:Lcom/android/server/PowerLogService$BatterySipper;
    move-wide/from16 v0, v18

    iput-wide v0, v3, Lcom/android/server/PowerLogService$BatterySipper;->cpuTime:J

    move-wide/from16 v0, v23

    iput-wide v0, v3, Lcom/android/server/PowerLogService$BatterySipper;->gpsTime:J

    move-wide/from16 v0, v75

    iput-wide v0, v3, Lcom/android/server/PowerLogService$BatterySipper;->wifiRunningTime:J

    iput-wide v15, v3, Lcom/android/server/PowerLogService$BatterySipper;->cpuFgTime:J

    move-wide/from16 v0, v72

    iput-wide v0, v3, Lcom/android/server/PowerLogService$BatterySipper;->wakeLockTime:J

    move-wide/from16 v0, v54

    iput-wide v0, v3, Lcom/android/server/PowerLogService$BatterySipper;->tcpBytesReceived:J

    move-wide/from16 v0, v56

    iput-wide v0, v3, Lcom/android/server/PowerLogService$BatterySipper;->tcpBytesSent:J

    invoke-virtual {v8}, Landroid/os/BatteryStats$Uid;->getUid()I

    move-result v4

    const/16 v5, 0x3f2

    if-ne v4, v5, :cond_11

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/PowerLogService;->mWifiSippers:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_8
    invoke-virtual {v8}, Landroid/os/BatteryStats$Uid;->getUid()I

    move-result v4

    if-nez v4, :cond_10

    move-object/from16 v31, v3

    .end local v3           #app:Lcom/android/server/PowerLogService$BatterySipper;
    :cond_10
    invoke-virtual {v8}, Landroid/os/BatteryStats$Uid;->getUid()I

    move-result v4

    const/16 v5, 0x3f2

    if-ne v4, v5, :cond_13

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/android/server/PowerLogService;->mWifiPower:D

    add-double v4, v4, v33

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/android/server/PowerLogService;->mWifiPower:D

    :goto_9
    const-string v4, "PowerLog"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Added power = "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-wide/from16 v0, v33

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    add-int/lit8 v28, v28, 0x1

    goto/16 :goto_1

    .restart local v3       #app:Lcom/android/server/PowerLogService$BatterySipper;
    :cond_11
    invoke-virtual {v8}, Landroid/os/BatteryStats$Uid;->getUid()I

    move-result v4

    const/16 v5, 0x7d0

    if-ne v4, v5, :cond_12

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/PowerLogService;->mBluetoothSippers:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_8

    :cond_12
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/PowerLogService;->mUsageList:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .end local v3           #app:Lcom/android/server/PowerLogService$BatterySipper;
    :cond_13
    invoke-virtual {v8}, Landroid/os/BatteryStats$Uid;->getUid()I

    move-result v4

    const/16 v5, 0x7d0

    if-ne v4, v5, :cond_14

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/android/server/PowerLogService;->mBluetoothPower:D

    add-double v4, v4, v33

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/android/server/PowerLogService;->mBluetoothPower:D

    goto :goto_9

    :cond_14
    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/android/server/PowerLogService;->mMaxPower:D

    cmpl-double v4, v33, v4

    if-lez v4, :cond_15

    move-wide/from16 v0, v33

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/android/server/PowerLogService;->mMaxPower:D

    :cond_15
    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/android/server/PowerLogService;->mTotalPower:D

    add-double v4, v4, v33

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/android/server/PowerLogService;->mTotalPower:D

    goto :goto_9

    .end local v6           #packageWithHighestDrain:Ljava/lang/String;
    .end local v8           #u:Landroid/os/BatteryStats$Uid;
    .end local v15           #cpuFgTime:J
    .end local v18           #cpuTime:J
    .end local v23           #gpsTime:J
    .end local v25           #highestDrain:D
    .end local v27           #i$:Ljava/util/Iterator;
    .end local v33           #power:D
    .end local v38           #processStats:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;+Landroid/os/BatteryStats$Uid$Proc;>;"
    .end local v46           #sensorStats:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Integer;+Landroid/os/BatteryStats$Uid$Sensor;>;"
    .end local v54           #tcpBytesReceived:J
    .end local v56           #tcpBytesSent:J
    .end local v71           #wakelockStats:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;+Landroid/os/BatteryStats$Uid$Wakelock;>;"
    .end local v72           #wakelockTime:J
    .end local v75           #wifiRunningTimeMs:J
    :cond_16
    if-eqz v31, :cond_18

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/PowerLogService;->mStats:Lcom/android/internal/os/BatteryStatsImpl;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v77

    const-wide/16 v79, 0x3e8

    mul-long v77, v77, v79

    const/4 v5, 0x0

    move-wide/from16 v0, v77

    invoke-virtual {v4, v0, v1, v5}, Lcom/android/internal/os/BatteryStatsImpl;->computeBatteryUptime(JI)J

    move-result-wide v4

    const-wide/16 v77, 0x3e8

    div-long v67, v4, v77

    .local v67, wakeTimeMillis:J
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/PowerLogService;->mStats:Lcom/android/internal/os/BatteryStatsImpl;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v77

    const/4 v5, 0x0

    move-wide/from16 v0, v77

    invoke-virtual {v4, v0, v1, v5}, Lcom/android/internal/os/BatteryStatsImpl;->getScreenOnTime(JI)J

    move-result-wide v4

    const-wide/16 v77, 0x3e8

    div-long v4, v4, v77

    sub-long v4, v11, v4

    sub-long v67, v67, v4

    const-wide/16 v4, 0x0

    cmp-long v4, v67, v4

    if-lez v4, :cond_18

    move-wide/from16 v0, v67

    long-to-double v4, v0

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/server/PowerLogService;->mPowerProfile:Lcom/android/internal/os/PowerProfile;

    const-string v9, "cpu.awake"

    invoke-virtual {v7, v9}, Lcom/android/internal/os/PowerProfile;->getAveragePower(Ljava/lang/String;)D

    move-result-wide v77

    mul-double v4, v4, v77

    const-wide v77, 0x408f400000000000L

    div-double v33, v4, v77

    .restart local v33       #power:D
    move-object/from16 v0, v31

    iget-wide v4, v0, Lcom/android/server/PowerLogService$BatterySipper;->wakeLockTime:J

    add-long v4, v4, v67

    move-object/from16 v0, v31

    iput-wide v4, v0, Lcom/android/server/PowerLogService$BatterySipper;->wakeLockTime:J

    move-object/from16 v0, v31

    iget-wide v4, v0, Lcom/android/server/PowerLogService$BatterySipper;->value:D

    add-double v4, v4, v33

    move-object/from16 v0, v31

    iput-wide v4, v0, Lcom/android/server/PowerLogService$BatterySipper;->value:D

    move-object/from16 v0, v31

    iget-object v4, v0, Lcom/android/server/PowerLogService$BatterySipper;->values:[D

    const/4 v5, 0x0

    aget-wide v77, v4, v5

    add-double v77, v77, v33

    aput-wide v77, v4, v5

    move-object/from16 v0, v31

    iget-wide v4, v0, Lcom/android/server/PowerLogService$BatterySipper;->value:D

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/server/PowerLogService;->mMaxPower:D

    move-wide/from16 v77, v0

    cmpl-double v4, v4, v77

    if-lez v4, :cond_17

    move-object/from16 v0, v31

    iget-wide v4, v0, Lcom/android/server/PowerLogService$BatterySipper;->value:D

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/android/server/PowerLogService;->mMaxPower:D

    :cond_17
    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/android/server/PowerLogService;->mTotalPower:D

    add-double v4, v4, v33

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/android/server/PowerLogService;->mTotalPower:D

    .end local v33           #power:D
    .end local v67           #wakeTimeMillis:J
    :cond_18
    return-void

    :pswitch_data_0
    .packed-switch -0x2710
        :pswitch_0
    .end packed-switch
.end method

.method private processMiscUsage()V
    .locals 12

    .prologue
    const-wide/16 v10, 0x3e8

    const/4 v6, 0x0

    .local v6, which:I
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    mul-long v4, v7, v10

    .local v4, uSecTime:J
    iget-object v7, p0, Lcom/android/server/PowerLogService;->mStats:Lcom/android/internal/os/BatteryStatsImpl;

    const/4 v8, 0x0

    invoke-virtual {v7, v4, v5, v8}, Lcom/android/internal/os/BatteryStatsImpl;->computeBatteryRealtime(JI)J

    move-result-wide v2

    .local v2, uSecNow:J
    move-wide v0, v2

    .local v0, timeSinceUnplugged:J
    const-string v7, "PowerLog"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Uptime since last unplugged = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    div-long v9, v0, v10

    invoke-virtual {v8, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0, v2, v3}, Lcom/android/server/PowerLogService;->addPhoneUsage(J)V

    invoke-direct {p0, v2, v3}, Lcom/android/server/PowerLogService;->addScreenUsage(J)V

    invoke-direct {p0, v2, v3}, Lcom/android/server/PowerLogService;->addWiFiUsage(J)V

    invoke-direct {p0, v2, v3}, Lcom/android/server/PowerLogService;->addBluetoothUsage(J)V

    invoke-direct {p0, v2, v3}, Lcom/android/server/PowerLogService;->addIdleUsage(J)V

    iget-object v7, p0, Lcom/android/server/PowerLogService;->mContext:Landroid/content/Context;

    invoke-static {v7}, Lcom/android/server/PowerLogService;->isWifiOnly(Landroid/content/Context;)Z

    move-result v7

    if-nez v7, :cond_0

    invoke-direct {p0, v2, v3}, Lcom/android/server/PowerLogService;->addRadioUsage(J)V

    :cond_0
    return-void
.end method

.method private refreshPowerUsageStats(Ljava/lang/String;Ljava/lang/String;)V
    .locals 13
    .parameter "date"
    .parameter "tag"

    .prologue
    const-wide/high16 v11, 0x3ff0

    const-wide/16 v9, 0x0

    const-wide/16 v6, 0x0

    iget-object v5, p0, Lcom/android/server/PowerLogService;->mStats:Lcom/android/internal/os/BatteryStatsImpl;

    if-nez v5, :cond_0

    invoke-direct {p0}, Lcom/android/server/PowerLogService;->load()V

    :cond_0
    iput-wide v6, p0, Lcom/android/server/PowerLogService;->mMaxPower:D

    iput-wide v6, p0, Lcom/android/server/PowerLogService;->mTotalPower:D

    iput-wide v6, p0, Lcom/android/server/PowerLogService;->mWifiPower:D

    iput-wide v6, p0, Lcom/android/server/PowerLogService;->mBluetoothPower:D

    iput-wide v9, p0, Lcom/android/server/PowerLogService;->mAppWifiRunning:J

    iget-object v5, p0, Lcom/android/server/PowerLogService;->mUsageList:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->clear()V

    iget-object v5, p0, Lcom/android/server/PowerLogService;->mWifiSippers:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->clear()V

    iget-object v5, p0, Lcom/android/server/PowerLogService;->mBluetoothSippers:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->clear()V

    invoke-direct {p0}, Lcom/android/server/PowerLogService;->processAppUsage()V

    invoke-direct {p0}, Lcom/android/server/PowerLogService;->processMiscUsage()V

    iget-object v5, p0, Lcom/android/server/PowerLogService;->mUsageList:Ljava/util/List;

    invoke-static {v5}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    iget-object v5, p0, Lcom/android/server/PowerLogService;->mUsageList:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/server/PowerLogService$BatterySipper;

    .local v4, sipper:Lcom/android/server/PowerLogService$BatterySipper;
    invoke-virtual {v4}, Lcom/android/server/PowerLogService$BatterySipper;->getSortValue()D

    move-result-wide v5

    cmpg-double v5, v5, v11

    if-ltz v5, :cond_1

    invoke-virtual {v4}, Lcom/android/server/PowerLogService$BatterySipper;->getSortValue()D

    move-result-wide v5

    iget-wide v7, p0, Lcom/android/server/PowerLogService;->mTotalPower:D

    div-double/2addr v5, v7

    const-wide/high16 v7, 0x4059

    mul-double v2, v5, v7

    .local v2, percentOfTotal:D
    cmpg-double v5, v2, v11

    if-ltz v5, :cond_1

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v5

    double-to-int v1, v5

    .local v1, percent:I
    const-string v5, "PowerLog"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "app name :"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v4, Lcom/android/server/PowerLogService$BatterySipper;->name:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "  percentOfTotal:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v5, v4, Lcom/android/server/PowerLogService$BatterySipper;->name:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, p1, p2, v5, v6}, Lcom/android/server/PowerLogService;->addOneLine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v5, Lcom/android/server/PowerLogService$DrainType;->APP:Lcom/android/server/PowerLogService$DrainType;

    iget-object v6, v4, Lcom/android/server/PowerLogService$BatterySipper;->drainType:Lcom/android/server/PowerLogService$DrainType;

    if-ne v5, v6, :cond_1

    const-string v5, "APP_CPU_TIME"

    iget-object v6, v4, Lcom/android/server/PowerLogService$BatterySipper;->name:Ljava/lang/String;

    iget-wide v7, v4, Lcom/android/server/PowerLogService$BatterySipper;->cpuTime:J

    invoke-static {v7, v8}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, p1, v5, v6, v7}, Lcom/android/server/PowerLogService;->addOneLine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "APP_CPU_FG_TIME"

    iget-object v6, v4, Lcom/android/server/PowerLogService$BatterySipper;->name:Ljava/lang/String;

    iget-wide v7, v4, Lcom/android/server/PowerLogService$BatterySipper;->cpuFgTime:J

    invoke-static {v7, v8}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, p1, v5, v6, v7}, Lcom/android/server/PowerLogService;->addOneLine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-wide v5, v4, Lcom/android/server/PowerLogService$BatterySipper;->tcpBytesReceived:J

    cmp-long v5, v5, v9

    if-lez v5, :cond_2

    const-string v5, "APP_TCP_RECV"

    iget-object v6, v4, Lcom/android/server/PowerLogService$BatterySipper;->name:Ljava/lang/String;

    iget-wide v7, v4, Lcom/android/server/PowerLogService$BatterySipper;->tcpBytesReceived:J

    invoke-static {v7, v8}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, p1, v5, v6, v7}, Lcom/android/server/PowerLogService;->addOneLine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    iget-wide v5, v4, Lcom/android/server/PowerLogService$BatterySipper;->tcpBytesSent:J

    cmp-long v5, v5, v9

    if-lez v5, :cond_3

    const-string v5, "APP_TCP_SENT"

    iget-object v6, v4, Lcom/android/server/PowerLogService$BatterySipper;->name:Ljava/lang/String;

    iget-wide v7, v4, Lcom/android/server/PowerLogService$BatterySipper;->tcpBytesSent:J

    invoke-static {v7, v8}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, p1, v5, v6, v7}, Lcom/android/server/PowerLogService;->addOneLine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    iget-wide v5, v4, Lcom/android/server/PowerLogService$BatterySipper;->gpsTime:J

    cmp-long v5, v5, v9

    if-lez v5, :cond_1

    const-string v5, "APP_GPS_TIME"

    iget-object v6, v4, Lcom/android/server/PowerLogService$BatterySipper;->name:Ljava/lang/String;

    iget-wide v7, v4, Lcom/android/server/PowerLogService$BatterySipper;->gpsTime:J

    invoke-static {v7, v8}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, p1, v5, v6, v7}, Lcom/android/server/PowerLogService;->addOneLine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .end local v1           #percent:I
    .end local v2           #percentOfTotal:D
    .end local v4           #sipper:Lcom/android/server/PowerLogService$BatterySipper;
    :cond_4
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 9
    .parameter "appName"
    .parameter "tag"
    .parameter "msg"

    .prologue
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .local v3, now:J
    iget-object v5, p0, Lcom/android/server/PowerLogService;->mSdf:Ljava/text/SimpleDateFormat;

    new-instance v6, Ljava/util/Date;

    invoke-direct {v6, v3, v4}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v5, v6}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .local v0, date:Ljava/lang/String;
    iget-boolean v5, p0, Lcom/android/server/PowerLogService;->bootCompleted:Z

    if-nez v5, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v6, p0, Lcom/android/server/PowerLogService;->mLogBuilder:Ljava/lang/StringBuilder;

    monitor-enter v6

    :try_start_0
    invoke-direct {p0, v0, p2, p1, p3}, Lcom/android/server/PowerLogService;->addOneLine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "BATTERY_LEVEL"

    invoke-virtual {p2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v5

    if-eqz v5, :cond_3

    :try_start_1
    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .local v2, level:I
    sget v5, Lcom/android/server/PowerLogService;->mBatteryLevel:I

    if-gtz v5, :cond_1

    sput v2, Lcom/android/server/PowerLogService;->mBatteryLevel:I

    :cond_1
    sget v5, Lcom/android/server/PowerLogService;->mBatteryLevel:I

    sub-int/2addr v5, v2

    sput v5, Lcom/android/server/PowerLogService;->mBatteryInterval:I

    sget v5, Lcom/android/server/PowerLogService;->mBatteryInterval:I

    const/4 v7, 0x5

    if-ge v5, v7, :cond_2

    sget v5, Lcom/android/server/PowerLogService;->mBatteryInterval:I

    const/4 v7, -0x5

    if-gt v5, v7, :cond_3

    :cond_2
    sput v2, Lcom/android/server/PowerLogService;->mBatteryLevel:I

    const-string v5, "BATTERY_RUM_TIME_ALL"

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v0, v5, p1, v7}, Lcom/android/server/PowerLogService;->addOneLine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "BATTERY_RUM_TIME_WAKE"

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v0, v5, p1, v7}, Lcom/android/server/PowerLogService;->addOneLine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "BATTERY_APP_CONSUMPTION"

    invoke-direct {p0, v0, v5}, Lcom/android/server/PowerLogService;->refreshPowerUsageStats(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    .end local v2           #level:I
    :cond_3
    :goto_1
    :try_start_2
    iget-object v5, p0, Lcom/android/server/PowerLogService;->mLogBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    const/16 v7, 0x1200

    if-lt v5, v7, :cond_4

    const-string v5, "PowerLog"

    iget-object v7, p0, Lcom/android/server/PowerLogService;->mLogBuilder:Ljava/lang/StringBuilder;

    invoke-direct {p0, v5, v7}, Lcom/android/server/PowerLogService;->addLogToDropBox(Ljava/lang/String;Ljava/lang/StringBuilder;)V

    iget-object v5, p0, Lcom/android/server/PowerLogService;->mLogBuilder:Ljava/lang/StringBuilder;

    invoke-direct {p0, v5}, Lcom/android/server/PowerLogService;->buildFileHeader(Ljava/lang/StringBuilder;)V

    :cond_4
    monitor-exit v6

    goto :goto_0

    :catchall_0
    move-exception v5

    monitor-exit v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v5

    :catch_0
    move-exception v1

    .local v1, e:Ljava/lang/NumberFormatException;
    :try_start_3
    const-string v5, "PowerLog"

    const-string v7, "NumberFormatException:"

    invoke-static {v5, v7, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1
.end method

.method public sendByLogMail()V
    .locals 7

    .prologue
    new-instance v2, Ljava/io/File;

    const-string v4, "/data/system/powerlog/sendcache/"

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .local v2, targetDir:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {v2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .local v0, currentFiles:[Ljava/io/File;
    array-length v4, v0

    if-lez v4, :cond_0

    const-string v4, "alert_hidden"

    const-string v5, ""

    const/4 v6, 0x0

    invoke-static {v4, v5, v6}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .local v3, uri:Landroid/net/Uri;
    new-instance v1, Landroid/content/Intent;

    const-string v4, "com.huawei.hwuf.START_HWUF"

    invoke-direct {v1, v4, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .local v1, intent:Landroid/content/Intent;
    const-string v4, "logfilepath"

    const-string v5, "/data/system/powerlog/sendcache/"

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v4, p0, Lcom/android/server/PowerLogService;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    const-string v4, "PowerLog"

    const-string v5, "send power logs by mail"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .end local v0           #currentFiles:[Ljava/io/File;
    .end local v1           #intent:Landroid/content/Intent;
    .end local v3           #uri:Landroid/net/Uri;
    :cond_0
    return-void
.end method
