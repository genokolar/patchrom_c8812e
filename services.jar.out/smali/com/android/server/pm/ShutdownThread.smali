.class public final Lcom/android/server/pm/ShutdownThread;
.super Ljava/lang/Thread;
.source "ShutdownThread.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/pm/ShutdownThread$CloseDialogReceiver;
    }
.end annotation


# static fields
.field private static final ACTION_ACTURAL_SHUTDOWN:Ljava/lang/String; = "com.android.internal.app.SHUTDOWNBROADCAST"

.field private static final MAX_BROADCAST_TIME:I = 0x2710

.field private static final MAX_NUM_PHONE_STATE_READS:I = 0x10

.field private static final MAX_RADIO_WAIT_TIME:I = 0x2ee0

.field private static final MAX_SHUTDOWN_WAIT_TIME:I = 0x4e20

.field private static final PHONE_STATE_POLL_SLEEP_MSEC:I = 0x1f4

.field public static final RADIO_SHUTDOWN_PROPERTY:Ljava/lang/String; = "sys.radio.shutdown"

.field public static final REBOOT_SAFEMODE_PROPERTY:Ljava/lang/String; = "persist.sys.safemode"

.field public static final SHUTDOWN_ACTION_PROPERTY:Ljava/lang/String; = "sys.shutdown.requested"

.field private static final SHUTDOWN_ANIMATION_WAIT_TIME:I = 0x7d0

.field private static final SHUTDOWN_ANIMATION_WAIT_TIME_MORE:I = 0x1f4

.field private static final SHUTDOWN_VIBRATE_MS:I = 0x1f4

.field private static final SYSFS_MDM_EFS_SYNC_COMPLETE:Ljava/lang/String; = "/sys/devices/platform/rs300100a7.65536/sync_sts"

.field private static final SYSFS_MDM_EFS_SYNC_FORCE:Ljava/lang/String; = "/sys/devices/platform/rs300000a7.65536/force_sync"

.field private static final SYSFS_MSM_EFS_SYNC_COMPLETE:Ljava/lang/String; = "/sys/devices/platform/rs300000a7.65536/sync_sts"

.field private static final TAG:Ljava/lang/String; = "ShutdownThread"

.field private static animProcess:Ljava/lang/Process;

.field private static isHaveShutdownAnimation:Z

.field private static mBatteryStats:Lcom/android/internal/app/IBatteryStats;

.field private static mHomeIntent:Landroid/content/Intent;

.field private static mReboot:Z

.field private static mRebootReason:Ljava/lang/String;

.field private static mRebootSafeMode:Z

.field private static mShutdown_path1:Ljava/lang/String;

.field private static mShutdown_path2:Ljava/lang/String;

.field private static mShutdown_path3:Ljava/lang/String;

.field private static pd:Landroid/app/ProgressDialog;

.field private static final sInstance:Lcom/android/server/pm/ShutdownThread;

.field private static sIsRestart:Z

.field private static sIsStarted:Z

.field private static sIsStartedGuard:Ljava/lang/Object;


# instance fields
.field private mActionDone:Z

.field private final mActionDoneSync:Ljava/lang/Object;

.field private mContext:Landroid/content/Context;

.field private mCpuWakeLock:Landroid/os/PowerManager$WakeLock;

.field private mHandler:Landroid/os/Handler;

.field private mPowerManager:Landroid/os/PowerManager;

.field private mScreenWakeLock:Landroid/os/PowerManager$WakeLock;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    new-instance v0, Ljava/lang/Object;

    invoke-direct/range {v0 .. v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/android/server/pm/ShutdownThread;->sIsStartedGuard:Ljava/lang/Object;

    sput-boolean v1, Lcom/android/server/pm/ShutdownThread;->sIsStarted:Z

    new-instance v0, Lcom/android/server/pm/ShutdownThread;

    invoke-direct {v0}, Lcom/android/server/pm/ShutdownThread;-><init>()V

    sput-object v0, Lcom/android/server/pm/ShutdownThread;->sInstance:Lcom/android/server/pm/ShutdownThread;

    sput-boolean v1, Lcom/android/server/pm/ShutdownThread;->sIsRestart:Z

    const/4 v0, 0x0

    sput-object v0, Lcom/android/server/pm/ShutdownThread;->animProcess:Ljava/lang/Process;

    sput-boolean v1, Lcom/android/server/pm/ShutdownThread;->isHaveShutdownAnimation:Z

    const-string v0, "/data/cust/media/shutdownanimation.zip"

    sput-object v0, Lcom/android/server/pm/ShutdownThread;->mShutdown_path1:Ljava/lang/String;

    const-string v0, "/data/local/shutdownanimation.zip"

    sput-object v0, Lcom/android/server/pm/ShutdownThread;->mShutdown_path2:Ljava/lang/String;

    const-string v0, "/system/media/shutdownanimation.zip"

    sput-object v0, Lcom/android/server/pm/ShutdownThread;->mShutdown_path3:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct/range {v0 .. v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/server/pm/ShutdownThread;->mActionDoneSync:Ljava/lang/Object;

    return-void
.end method

.method static synthetic access$000()Z
    .locals 1

    .prologue
    sget-boolean v0, Lcom/android/server/pm/ShutdownThread;->isHaveShutdownAnimation:Z

    return v0
.end method

.method static synthetic access$100()Ljava/lang/Process;
    .locals 1

    .prologue
    sget-object v0, Lcom/android/server/pm/ShutdownThread;->animProcess:Ljava/lang/Process;

    return-object v0
.end method

.method static synthetic access$102(Ljava/lang/Process;)Ljava/lang/Process;
    .locals 0
    .parameter "x0"

    .prologue
    sput-object p0, Lcom/android/server/pm/ShutdownThread;->animProcess:Ljava/lang/Process;

    return-object p0
.end method

.method static synthetic access$200()Landroid/app/ProgressDialog;
    .locals 1

    .prologue
    sget-object v0, Lcom/android/server/pm/ShutdownThread;->pd:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$300()Ljava/lang/Object;
    .locals 1

    .prologue
    sget-object v0, Lcom/android/server/pm/ShutdownThread;->sIsStartedGuard:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$402(Z)Z
    .locals 0
    .parameter "x0"

    .prologue
    sput-boolean p0, Lcom/android/server/pm/ShutdownThread;->sIsStarted:Z

    return p0
.end method

.method static synthetic access$500(Landroid/content/Context;)V
    .locals 0
    .parameter "x0"

    .prologue
    invoke-static {p0}, Lcom/android/server/pm/ShutdownThread;->beginShutdownSequence(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$602(Z)Z
    .locals 0
    .parameter "x0"

    .prologue
    sput-boolean p0, Lcom/android/server/pm/ShutdownThread;->sIsRestart:Z

    return p0
.end method

.method private static beginShutdownSequence(Landroid/content/Context;)V
    .locals 10
    .parameter "context"

    .prologue
    const v9, 0x104012e

    const v8, 0x104012a

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v5, 0x1

    new-instance v2, Landroid/content/Intent;

    const-string v3, "com.android.internal.app.SHUTDOWNBROADCAST"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .local v2, shutdownBroadcast:Landroid/content/Intent;
    invoke-virtual {p0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    sget-object v4, Lcom/android/server/pm/ShutdownThread;->sIsStartedGuard:Ljava/lang/Object;

    monitor-enter v4

    :try_start_0
    sget-boolean v3, Lcom/android/server/pm/ShutdownThread;->sIsStarted:Z

    if-eqz v3, :cond_0

    const-string v3, "ShutdownThread"

    const-string v5, "Shutdown sequence already running, returning."

    invoke-static {v3, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v4

    :goto_0
    return-void

    :cond_0
    const/4 v3, 0x1

    sput-boolean v3, Lcom/android/server/pm/ShutdownThread;->sIsStarted:Z

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    new-instance v3, Landroid/content/Intent;

    const-string v4, "android.intent.action.MAIN"

    invoke-direct {v3, v4, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    sput-object v3, Lcom/android/server/pm/ShutdownThread;->mHomeIntent:Landroid/content/Intent;

    sget-object v3, Lcom/android/server/pm/ShutdownThread;->mHomeIntent:Landroid/content/Intent;

    const-string v4, "android.intent.category.HOME"

    invoke-virtual {v3, v4}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    sget-object v3, Lcom/android/server/pm/ShutdownThread;->mHomeIntent:Landroid/content/Intent;

    const/high16 v4, 0x1020

    invoke-virtual {v3, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    sget-object v3, Lcom/android/server/pm/ShutdownThread;->mHomeIntent:Landroid/content/Intent;

    invoke-virtual {p0, v3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    invoke-static {}, Lcom/android/server/pm/ShutdownThread;->isDoShutdownAnimation()Z

    move-result v3

    if-nez v3, :cond_1

    new-instance v1, Landroid/app/ProgressDialog;

    invoke-direct {v1, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .local v1, pd:Landroid/app/ProgressDialog;
    const-string v3, "true"

    const-string v4, "ro.config.hw_quickpoweron"

    invoke-static {v4}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "fast_power_on"

    invoke-static {v3, v4, v5}, Landroid/provider/SettingsEx$Systemex;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v3

    if-lez v3, :cond_4

    sget-boolean v3, Lcom/android/server/pm/ShutdownThread;->sIsRestart:Z

    if-ne v3, v5, :cond_3

    const v3, 0x202000b

    invoke-virtual {p0, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    const v3, 0x202000f

    invoke-virtual {p0, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    :goto_1
    invoke-virtual {v1, v5}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    invoke-virtual {v1, v6}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->getWindow()Landroid/view/Window;

    move-result-object v3

    const/16 v4, 0x7d9

    invoke-virtual {v3, v4}, Landroid/view/Window;->setType(I)V

    invoke-static {p0}, Lcom/android/server/pm/ShutdownThread$Injector;->createShutDownDialog(Landroid/content/Context;)V

    .end local v1           #pd:Landroid/app/ProgressDialog;
    :cond_1
    sget-object v3, Lcom/android/server/pm/ShutdownThread;->sInstance:Lcom/android/server/pm/ShutdownThread;

    iput-object p0, v3, Lcom/android/server/pm/ShutdownThread;->mContext:Landroid/content/Context;

    sget-object v4, Lcom/android/server/pm/ShutdownThread;->sInstance:Lcom/android/server/pm/ShutdownThread;

    const-string v3, "power"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/PowerManager;

    iput-object v3, v4, Lcom/android/server/pm/ShutdownThread;->mPowerManager:Landroid/os/PowerManager;

    sget-object v3, Lcom/android/server/pm/ShutdownThread;->sInstance:Lcom/android/server/pm/ShutdownThread;

    iput-object v7, v3, Lcom/android/server/pm/ShutdownThread;->mCpuWakeLock:Landroid/os/PowerManager$WakeLock;

    :try_start_1
    sget-object v3, Lcom/android/server/pm/ShutdownThread;->sInstance:Lcom/android/server/pm/ShutdownThread;

    sget-object v4, Lcom/android/server/pm/ShutdownThread;->sInstance:Lcom/android/server/pm/ShutdownThread;

    iget-object v4, v4, Lcom/android/server/pm/ShutdownThread;->mPowerManager:Landroid/os/PowerManager;

    const/4 v5, 0x1

    const-string v6, "ShutdownThread-cpu"

    invoke-virtual {v4, v5, v6}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v4

    iput-object v4, v3, Lcom/android/server/pm/ShutdownThread;->mCpuWakeLock:Landroid/os/PowerManager$WakeLock;

    sget-object v3, Lcom/android/server/pm/ShutdownThread;->sInstance:Lcom/android/server/pm/ShutdownThread;

    iget-object v3, v3, Lcom/android/server/pm/ShutdownThread;->mCpuWakeLock:Landroid/os/PowerManager$WakeLock;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    sget-object v3, Lcom/android/server/pm/ShutdownThread;->sInstance:Lcom/android/server/pm/ShutdownThread;

    iget-object v3, v3, Lcom/android/server/pm/ShutdownThread;->mCpuWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v3}, Landroid/os/PowerManager$WakeLock;->acquire()V
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_0

    :goto_2
    sget-object v3, Lcom/android/server/pm/ShutdownThread;->sInstance:Lcom/android/server/pm/ShutdownThread;

    iput-object v7, v3, Lcom/android/server/pm/ShutdownThread;->mScreenWakeLock:Landroid/os/PowerManager$WakeLock;

    sget-object v3, Lcom/android/server/pm/ShutdownThread;->sInstance:Lcom/android/server/pm/ShutdownThread;

    iget-object v3, v3, Lcom/android/server/pm/ShutdownThread;->mPowerManager:Landroid/os/PowerManager;

    invoke-virtual {v3}, Landroid/os/PowerManager;->isScreenOn()Z

    move-result v3

    if-eqz v3, :cond_2

    :try_start_2
    sget-object v3, Lcom/android/server/pm/ShutdownThread;->sInstance:Lcom/android/server/pm/ShutdownThread;

    sget-object v4, Lcom/android/server/pm/ShutdownThread;->sInstance:Lcom/android/server/pm/ShutdownThread;

    iget-object v4, v4, Lcom/android/server/pm/ShutdownThread;->mPowerManager:Landroid/os/PowerManager;

    const/16 v5, 0x1a

    const-string v6, "ShutdownThread-screen"

    invoke-virtual {v4, v5, v6}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v4

    iput-object v4, v3, Lcom/android/server/pm/ShutdownThread;->mScreenWakeLock:Landroid/os/PowerManager$WakeLock;

    sget-object v3, Lcom/android/server/pm/ShutdownThread;->sInstance:Lcom/android/server/pm/ShutdownThread;

    iget-object v3, v3, Lcom/android/server/pm/ShutdownThread;->mScreenWakeLock:Landroid/os/PowerManager$WakeLock;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    sget-object v3, Lcom/android/server/pm/ShutdownThread;->sInstance:Lcom/android/server/pm/ShutdownThread;

    iget-object v3, v3, Lcom/android/server/pm/ShutdownThread;->mScreenWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v3}, Landroid/os/PowerManager$WakeLock;->acquire()V
    :try_end_2
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_1

    :cond_2
    :goto_3
    sget-object v3, Lcom/android/server/pm/ShutdownThread;->sInstance:Lcom/android/server/pm/ShutdownThread;

    new-instance v4, Lcom/android/server/pm/ShutdownThread$4;

    invoke-direct {v4}, Lcom/android/server/pm/ShutdownThread$4;-><init>()V

    iput-object v4, v3, Lcom/android/server/pm/ShutdownThread;->mHandler:Landroid/os/Handler;

    sget-object v3, Lcom/android/server/pm/ShutdownThread;->sInstance:Lcom/android/server/pm/ShutdownThread;

    invoke-virtual {v3}, Lcom/android/server/pm/ShutdownThread;->start()V

    goto/16 :goto_0

    :catchall_0
    move-exception v3

    :try_start_3
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v3

    .restart local v1       #pd:Landroid/app/ProgressDialog;
    :cond_3
    invoke-virtual {p0, v8}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v9}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    :cond_4
    invoke-virtual {p0, v8}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v9}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .end local v1           #pd:Landroid/app/ProgressDialog;
    :catch_0
    move-exception v0

    .local v0, e:Ljava/lang/SecurityException;
    const-string v3, "ShutdownThread"

    const-string v4, "No permission to acquire wake lock"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    sget-object v3, Lcom/android/server/pm/ShutdownThread;->sInstance:Lcom/android/server/pm/ShutdownThread;

    iput-object v7, v3, Lcom/android/server/pm/ShutdownThread;->mCpuWakeLock:Landroid/os/PowerManager$WakeLock;

    goto :goto_2

    .end local v0           #e:Ljava/lang/SecurityException;
    :catch_1
    move-exception v0

    .restart local v0       #e:Ljava/lang/SecurityException;
    const-string v3, "ShutdownThread"

    const-string v4, "No permission to acquire wake lock"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    sget-object v3, Lcom/android/server/pm/ShutdownThread;->sInstance:Lcom/android/server/pm/ShutdownThread;

    iput-object v7, v3, Lcom/android/server/pm/ShutdownThread;->mScreenWakeLock:Landroid/os/PowerManager$WakeLock;

    goto :goto_3
.end method

.method private static isDoShutdownAnimation()Z
    .locals 4

    .prologue
    const/4 v1, 0x1

    new-instance v2, Ljava/io/File;

    sget-object v3, Lcom/android/server/pm/ShutdownThread;->mShutdown_path1:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    new-instance v2, Ljava/io/File;

    sget-object v3, Lcom/android/server/pm/ShutdownThread;->mShutdown_path2:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    new-instance v2, Ljava/io/File;

    sget-object v3, Lcom/android/server/pm/ShutdownThread;->mShutdown_path3:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    sput-boolean v1, Lcom/android/server/pm/ShutdownThread;->isHaveShutdownAnimation:Z

    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v2

    const-string v3, "/system/bin/shutdownanimation"

    invoke-virtual {v2, v3}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .local v0, e:Ljava/io/IOException;
    :goto_0
    return v1

    .end local v0           #e:Ljava/io/IOException;
    :catch_0
    move-exception v0

    .restart local v0       #e:Ljava/io/IOException;
    const-string v2, "ShutdownThread"

    const-string v3, "run shutdown animation failed"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .end local v0           #e:Ljava/io/IOException;
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method static getIsStarted()Z
    .locals 1
    .annotation build Landroid/annotation/MiuiHook;
        value = .enum Landroid/annotation/MiuiHook$MiuiHookType;->NEW_METHOD:Landroid/annotation/MiuiHook$MiuiHookType;
    .end annotation

    .prologue
    sget-boolean v0, Lcom/android/server/pm/ShutdownThread;->sIsStarted:Z

    return v0
.end method

.method static getIsStartedGuard()Ljava/lang/Object;
    .locals 1
    .annotation build Landroid/annotation/MiuiHook;
        value = .enum Landroid/annotation/MiuiHook$MiuiHookType;->NEW_METHOD:Landroid/annotation/MiuiHook$MiuiHookType;
    .end annotation

    .prologue
    sget-object v0, Lcom/android/server/pm/ShutdownThread;->sIsStartedGuard:Ljava/lang/Object;

    return-object v0
.end method

.method static getReboot()Z
    .locals 1
    .annotation build Landroid/annotation/MiuiHook;
        value = .enum Landroid/annotation/MiuiHook$MiuiHookType;->NEW_METHOD:Landroid/annotation/MiuiHook$MiuiHookType;
    .end annotation

    .prologue
    sget-boolean v0, Lcom/android/server/pm/ShutdownThread;->mReboot:Z

    return v0
.end method

.method public static reboot(Landroid/content/Context;Ljava/lang/String;Z)V
    .locals 1
    .parameter "context"
    .parameter "reason"
    .parameter "confirm"

    .prologue
    const/4 v0, 0x1

    sput-boolean v0, Lcom/android/server/pm/ShutdownThread;->mReboot:Z

    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/server/pm/ShutdownThread;->mRebootSafeMode:Z

    sput-object p1, Lcom/android/server/pm/ShutdownThread;->mRebootReason:Ljava/lang/String;

    invoke-static {p0, p2}, Lcom/android/server/pm/ShutdownThread;->shutdownInner(Landroid/content/Context;Z)V

    return-void
.end method

.method public static rebootOrShutdown(ZLjava/lang/String;)V
    .locals 18
    .parameter "reboot"
    .parameter "reason"

    .prologue
    const-string v12, "persist.sys.actualpoweron"

    const-string v13, "true"

    invoke-static {v12, v13}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    const-string v12, "1"

    const-string v13, "ro.config.hw.usedtime.statis"

    const-string v14, "0"

    invoke-static {v13, v14}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1

    const-string v12, "/data/HWUserData/calibration/used_time_stat.txt"

    invoke-static {v12}, Lcom/huawei/android/hwlog/HWFileUtils;->getInfosFromFile(Ljava/lang/String;)Ljava/util/List;

    move-result-object v6

    .local v6, lst:Ljava/util/List;
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v12

    if-lez v12, :cond_1

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v12

    add-int/lit8 v12, v12, -0x1

    invoke-interface {v6, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, [Ljava/lang/String;

    move-object v1, v12

    check-cast v1, [Ljava/lang/String;

    .local v1, args:[Ljava/lang/String;
    const/4 v12, 0x1

    const/4 v13, 0x1

    aget-object v13, v1, v13

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v14

    invoke-static {v13, v14, v15}, Lcom/huawei/android/hwlog/HWFileUtils;->convertMillToHMS(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v13

    aput-object v13, v1, v12

    const/4 v12, 0x1

    aget-object v12, v1, v12

    const/4 v13, 0x0

    const/4 v14, 0x1

    aget-object v14, v1, v14

    const-string v15, "H"

    invoke-virtual {v14, v15}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v14

    invoke-virtual {v12, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    .local v4, hours:J
    const-string v12, "N"

    const/4 v13, 0x3

    aget-object v13, v1, v13

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    const-wide/16 v12, 0xc

    cmp-long v12, v4, v12

    if-ltz v12, :cond_0

    const/4 v12, 0x1

    aget-object v12, v1, v12

    const/4 v13, 0x1

    aget-object v13, v1, v13

    const-string v14, "H"

    invoke-virtual {v13, v14}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v13

    add-int/lit8 v13, v13, 0x1

    const/4 v14, 0x1

    aget-object v14, v1, v14

    const-string v15, "M"

    invoke-virtual {v14, v15}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v14

    invoke-virtual {v12, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    .local v7, minutes:J
    const/4 v12, 0x1

    aget-object v12, v1, v12

    const/4 v13, 0x1

    aget-object v13, v1, v13

    const-string v14, "M"

    invoke-virtual {v13, v14}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v13

    add-int/lit8 v13, v13, 0x1

    const/4 v14, 0x1

    aget-object v14, v1, v14

    const-string v15, "S"

    invoke-virtual {v14, v15}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v14

    invoke-virtual {v12, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    .local v9, seconds:J
    new-instance v2, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    const-wide/16 v14, 0x3c

    mul-long/2addr v14, v4

    const-wide/16 v16, 0x3c

    mul-long v14, v14, v16

    const-wide/16 v16, 0x3e8

    mul-long v14, v14, v16

    sub-long/2addr v12, v14

    const-wide/16 v14, 0x3c

    mul-long/2addr v14, v7

    const-wide/16 v16, 0x3e8

    mul-long v14, v14, v16

    sub-long/2addr v12, v14

    const-wide/16 v14, 0x3e8

    mul-long/2addr v14, v9

    sub-long/2addr v12, v14

    invoke-direct {v2, v12, v13}, Ljava/util/Date;-><init>(J)V

    .local v2, d:Ljava/util/Date;
    const/4 v12, 0x0

    const-string v13, "yyyy/MM/dd HH:mm:ss"

    invoke-static {v2, v13}, Lcom/huawei/android/hwlog/HWFileUtils;->getTimeString(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    aput-object v13, v1, v12

    const/4 v12, 0x3

    const-string v13, "Y"

    aput-object v13, v1, v12

    .end local v2           #d:Ljava/util/Date;
    .end local v7           #minutes:J
    .end local v9           #seconds:J
    :cond_0
    const-string v12, "/data/HWUserData/calibration/used_time_stat.txt"

    const/4 v13, 0x0

    invoke-static {v12, v1, v13, v6}, Lcom/huawei/android/hwlog/HWFileUtils;->addInfoToFile(Ljava/lang/String;[Ljava/lang/String;ILjava/util/List;)Z

    .end local v1           #args:[Ljava/lang/String;
    .end local v4           #hours:J
    .end local v6           #lst:Ljava/util/List;
    :cond_1
    if-eqz p0, :cond_2

    const-string v12, "ShutdownThread"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Rebooting, reason: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p1

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    invoke-static/range {p1 .. p1}, Lcom/android/server/PowerManagerService;->lowLevelReboot(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    const-string v12, "ShutdownThread"

    const-string v13, "Performing low-level shutdown..."

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/server/PowerManagerService;->lowLevelShutdown()V

    return-void

    :catch_0
    move-exception v3

    .local v3, e:Ljava/lang/Exception;
    const-string v12, "ShutdownThread"

    const-string v13, "Reboot failed, will attempt shutdown instead"

    invoke-static {v12, v13, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .end local v3           #e:Ljava/lang/Exception;
    :cond_2
    invoke-static {}, Lcom/android/server/pm/ShutdownThread;->waitShutdownAnimation()V

    new-instance v11, Landroid/os/SystemVibrator;

    invoke-direct {v11}, Landroid/os/SystemVibrator;-><init>()V

    .local v11, vibrator:Landroid/os/Vibrator;
    const-wide/16 v12, 0x1f4

    :try_start_1
    invoke-virtual {v11, v12, v13}, Landroid/os/Vibrator;->vibrate(J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    :goto_1
    const-wide/16 v12, 0x1f4

    :try_start_2
    invoke-static {v12, v13}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    :catch_1
    move-exception v12

    goto :goto_0

    :catch_2
    move-exception v3

    .restart local v3       #e:Ljava/lang/Exception;
    const-string v12, "ShutdownThread"

    const-string v13, "Failed to vibrate during shutdown."

    invoke-static {v12, v13, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method

.method public static rebootSafeMode(Landroid/content/Context;Z)V
    .locals 1
    .parameter "context"
    .parameter "confirm"

    .prologue
    const/4 v0, 0x1

    sput-boolean v0, Lcom/android/server/pm/ShutdownThread;->mReboot:Z

    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/server/pm/ShutdownThread;->mRebootSafeMode:Z

    const/4 v0, 0x0

    sput-object v0, Lcom/android/server/pm/ShutdownThread;->mRebootReason:Ljava/lang/String;

    invoke-static {p0, p1}, Lcom/android/server/pm/ShutdownThread;->shutdownInner(Landroid/content/Context;Z)V

    return-void
.end method

.method public static restart(Landroid/content/Context;)V
    .locals 4
    .parameter "context"

    .prologue
    sget-object v2, Lcom/android/server/pm/ShutdownThread;->sIsStartedGuard:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    sget-boolean v1, Lcom/android/server/pm/ShutdownThread;->sIsStarted:Z

    if-eqz v1, :cond_0

    const-string v1, "ShutdownThread"

    const-string v3, "Request to shutdown already running, returning."

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v2

    :goto_0
    return-void

    :cond_0
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v1, "ShutdownThread"

    const-string v2, "Notifying thread to restart"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x1080027

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x202000d

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x202000e

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x1040013

    new-instance v3, Lcom/android/server/pm/ShutdownThread$3;

    invoke-direct {v3, p0}, Lcom/android/server/pm/ShutdownThread$3;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x1040009

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .local v0, dialog:Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/16 v2, 0x7d9

    invoke-virtual {v1, v2}, Landroid/view/Window;->setType(I)V

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x1110009

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/view/Window;->addFlags(I)V

    :cond_1
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    goto :goto_0

    .end local v0           #dialog:Landroid/app/AlertDialog;
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private static showPowerOffWait(Landroid/content/Context;)V
    .locals 4
    .parameter "context"

    .prologue
    const/4 v3, 0x1

    new-instance v1, Ljava/io/File;

    sget-object v2, Lcom/android/server/pm/ShutdownThread;->mShutdown_path1:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v1, Ljava/io/File;

    sget-object v2, Lcom/android/server/pm/ShutdownThread;->mShutdown_path2:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v1, Ljava/io/File;

    sget-object v2, Lcom/android/server/pm/ShutdownThread;->mShutdown_path3:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_0
    sput-boolean v3, Lcom/android/server/pm/ShutdownThread;->isHaveShutdownAnimation:Z

    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v1

    const-string v2, "/system/bin/shutdownanimation"

    invoke-virtual {v1, v2}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v1

    sput-object v1, Lcom/android/server/pm/ShutdownThread;->animProcess:Ljava/lang/Process;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    :goto_0
    return-void

    :catch_0
    move-exception v0

    .local v0, e:Ljava/io/IOException;
    const-string v1, "ShutdownThread"

    const-string v2, "run shutdown animation failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .end local v0           #e:Ljava/io/IOException;
    :cond_2
    sget-object v1, Lcom/android/server/pm/ShutdownThread;->pd:Landroid/app/ProgressDialog;

    if-eqz v1, :cond_3

    sget-object v1, Lcom/android/server/pm/ShutdownThread;->pd:Landroid/app/ProgressDialog;

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v1

    if-nez v1, :cond_1

    :cond_3
    new-instance v1, Landroid/app/ProgressDialog;

    invoke-direct {v1, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/android/server/pm/ShutdownThread;->pd:Landroid/app/ProgressDialog;

    sget-object v1, Lcom/android/server/pm/ShutdownThread;->pd:Landroid/app/ProgressDialog;

    const v2, 0x104012a

    invoke-virtual {p0, v2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    sget-object v1, Lcom/android/server/pm/ShutdownThread;->pd:Landroid/app/ProgressDialog;

    const v2, 0x104012e

    invoke-virtual {p0, v2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    sget-object v1, Lcom/android/server/pm/ShutdownThread;->pd:Landroid/app/ProgressDialog;

    invoke-virtual {v1, v3}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    sget-object v1, Lcom/android/server/pm/ShutdownThread;->pd:Landroid/app/ProgressDialog;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    sget-object v1, Lcom/android/server/pm/ShutdownThread;->pd:Landroid/app/ProgressDialog;

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/16 v2, 0x7d9

    invoke-virtual {v1, v2}, Landroid/view/Window;->setType(I)V

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x1110009

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1

    if-nez v1, :cond_4

    sget-object v1, Lcom/android/server/pm/ShutdownThread;->pd:Landroid/app/ProgressDialog;

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/view/Window;->addFlags(I)V

    :cond_4
    sget-object v1, Lcom/android/server/pm/ShutdownThread;->pd:Landroid/app/ProgressDialog;

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->show()V

    goto :goto_0
.end method

.method static setReboot(Z)V
    .locals 0
    .parameter "value"
    .annotation build Landroid/annotation/MiuiHook;
        value = .enum Landroid/annotation/MiuiHook$MiuiHookType;->NEW_METHOD:Landroid/annotation/MiuiHook$MiuiHookType;
    .end annotation

    .prologue
    sput-boolean p0, Lcom/android/server/pm/ShutdownThread;->mReboot:Z

    return-void
.end method

.method static setRebootReason(Ljava/lang/String;)V
    .locals 0
    .parameter "value"
    .annotation build Landroid/annotation/MiuiHook;
        value = .enum Landroid/annotation/MiuiHook$MiuiHookType;->NEW_METHOD:Landroid/annotation/MiuiHook$MiuiHookType;
    .end annotation

    .prologue
    sput-object p0, Lcom/android/server/pm/ShutdownThread;->mRebootReason:Ljava/lang/String;

    return-void
.end method

.method public static shutdown(Landroid/content/Context;Z)V
    .locals 1
    .parameter "context"
    .parameter "confirm"

    .prologue
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/server/pm/ShutdownThread;->mReboot:Z

    sput-boolean v0, Lcom/android/server/pm/ShutdownThread;->mRebootSafeMode:Z

    invoke-static {p0, p1}, Lcom/android/server/pm/ShutdownThread;->shutdownInner(Landroid/content/Context;Z)V

    return-void
.end method

.method static shutdownInner(Landroid/content/Context;Z)V
    .locals 13
    .parameter "context"
    .parameter "confirm"

    .prologue
    const/4 v12, 0x0

    const/4 v11, 0x1

    sget-object v8, Lcom/android/server/pm/ShutdownThread;->sIsStartedGuard:Ljava/lang/Object;

    monitor-enter v8

    :try_start_0
    sget-boolean v7, Lcom/android/server/pm/ShutdownThread;->sIsStarted:Z

    if-eqz v7, :cond_0

    const-string v7, "ShutdownThread"

    const-string v9, "Request to shutdown already running, returning."

    invoke-static {v7, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v8

    :goto_0
    return-void

    :cond_0
    monitor-exit v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x10e0016

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v5

    .local v5, longPressBehavior:I
    sget-boolean v7, Lcom/android/server/pm/ShutdownThread;->mRebootSafeMode:Z

    if-eqz v7, :cond_2

    const v6, 0x1040132

    .local v6, resourceId:I
    :goto_1
    const-string v7, "ShutdownThread"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Notifying thread to start shutdown longPressBehavior="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v7, "true"

    const-string v8, "ro.config.hw_quickpoweron"

    invoke-static {v8}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    const/4 v7, 0x0

    sput-boolean v7, Lcom/android/server/pm/ShutdownThread;->sIsRestart:Z

    :cond_1
    const-string v7, "persist.sys.actualpoweron"

    const-string v8, "true"

    invoke-static {v7, v8}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p1, :cond_9

    const-string v7, "ShutdownThread"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "shutdown settingon: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v9

    const-string v10, "fast_power_on"

    invoke-static {v9, v10, v11}, Landroid/provider/SettingsEx$Systemex;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-string v7, "true"

    const-string v8, "ro.config.hw_quickpoweron"

    invoke-static {v8}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    const-string v8, "fast_power_on"

    invoke-static {v7, v8, v11}, Landroid/provider/SettingsEx$Systemex;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v7

    if-lez v7, :cond_7

    const-string v7, "batteryinfo"

    invoke-static {v7}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v7

    invoke-static {v7}, Lcom/android/internal/app/IBatteryStats$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/app/IBatteryStats;

    move-result-object v7

    sput-object v7, Lcom/android/server/pm/ShutdownThread;->mBatteryStats:Lcom/android/internal/app/IBatteryStats;

    const/4 v0, 0x0

    .local v0, bBattery:Z
    :try_start_1
    sget-object v7, Lcom/android/server/pm/ShutdownThread;->mBatteryStats:Lcom/android/internal/app/IBatteryStats;

    invoke-interface {v7}, Lcom/android/internal/app/IBatteryStats;->isOnBattery()Z
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    move-result v0

    :goto_2
    const-string v7, "ShutdownThread"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "shutdown bBattery: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v0, :cond_5

    sget-object v8, Lcom/android/server/pm/ShutdownThread;->sIsStartedGuard:Ljava/lang/Object;

    monitor-enter v8

    :try_start_2
    sget-boolean v7, Lcom/android/server/pm/ShutdownThread;->sIsStarted:Z

    if-eqz v7, :cond_4

    const-string v7, "ShutdownThread"

    const-string v9, " Poweroff shutdown already return  running, returning."

    invoke-static {v7, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v8

    goto/16 :goto_0

    :catchall_0
    move-exception v7

    monitor-exit v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v7

    .end local v0           #bBattery:Z
    .end local v5           #longPressBehavior:I
    .end local v6           #resourceId:I
    :catchall_1
    move-exception v7

    :try_start_3
    monitor-exit v8
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v7

    .restart local v5       #longPressBehavior:I
    :cond_2
    const/4 v7, 0x2

    if-ne v5, v7, :cond_3

    const v6, 0x1040130

    goto/16 :goto_1

    :cond_3
    const v6, 0x104012f

    goto/16 :goto_1

    .restart local v0       #bBattery:Z
    .restart local v6       #resourceId:I
    :catch_0
    move-exception v3

    .local v3, e:Landroid/os/RemoteException;
    const-string v7, "ShutdownThread"

    const-string v8, "RemoteException:"

    invoke-static {v7, v8, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 v0, 0x0

    goto :goto_2

    .end local v3           #e:Landroid/os/RemoteException;
    :cond_4
    const/4 v7, 0x1

    :try_start_4
    sput-boolean v7, Lcom/android/server/pm/ShutdownThread;->sIsStarted:Z

    monitor-exit v8
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    new-instance v7, Landroid/content/Intent;

    const-string v8, "android.intent.action.MAIN"

    invoke-direct {v7, v8, v12}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    sput-object v7, Lcom/android/server/pm/ShutdownThread;->mHomeIntent:Landroid/content/Intent;

    sget-object v7, Lcom/android/server/pm/ShutdownThread;->mHomeIntent:Landroid/content/Intent;

    const-string v8, "android.intent.category.HOME"

    invoke-virtual {v7, v8}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    sget-object v7, Lcom/android/server/pm/ShutdownThread;->mHomeIntent:Landroid/content/Intent;

    const/high16 v8, 0x1020

    invoke-virtual {v7, v8}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    sget-object v7, Lcom/android/server/pm/ShutdownThread;->mHomeIntent:Landroid/content/Intent;

    invoke-virtual {p0, v7}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    invoke-static {p0}, Lcom/android/server/pm/ShutdownThread;->showPowerOffWait(Landroid/content/Context;)V

    new-instance v4, Lcom/android/server/pm/ShutdownThread$1;

    invoke-direct {v4, p0}, Lcom/android/server/pm/ShutdownThread$1;-><init>(Landroid/content/Context;)V

    .local v4, fakeshutdownThread:Ljava/lang/Thread;
    const-string v7, "shutdown"

    invoke-virtual {v4, v7}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/lang/Thread;->start()V

    goto/16 :goto_0

    .end local v4           #fakeshutdownThread:Ljava/lang/Thread;
    :cond_5
    const-string v7, "true"

    const-string v8, "ro.config.hw_quickpoweron"

    invoke-static {v8}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    const-string v7, "true"

    const-string v8, "ro.poweroff_alarm"

    const-string v9, "false"

    invoke-static {v8, v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    invoke-static {p0}, Lcom/android/internal/policy/Powerstate;->synAirplaneMode(Landroid/content/Context;)V

    :cond_6
    invoke-static {p0}, Lcom/android/server/pm/ShutdownThread;->beginShutdownSequence(Landroid/content/Context;)V

    goto/16 :goto_0

    .end local v0           #bBattery:Z
    :cond_7
    new-instance v1, Lcom/android/server/pm/ShutdownThread$CloseDialogReceiver;

    invoke-direct {v1, p0}, Lcom/android/server/pm/ShutdownThread$CloseDialogReceiver;-><init>(Landroid/content/Context;)V

    .local v1, closer:Lcom/android/server/pm/ShutdownThread$CloseDialogReceiver;
    new-instance v8, Landroid/app/AlertDialog$Builder;

    invoke-direct {v8, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget-boolean v7, Lcom/android/server/pm/ShutdownThread;->mRebootSafeMode:Z

    if-eqz v7, :cond_8

    const v7, 0x1040131

    :goto_3
    invoke-virtual {v8, v7}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    invoke-virtual {v7, v6}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    const v8, 0x1040013

    new-instance v9, Lcom/android/server/pm/ShutdownThread$2;

    invoke-direct {v9, p0}, Lcom/android/server/pm/ShutdownThread$2;-><init>(Landroid/content/Context;)V

    invoke-virtual {v7, v8, v9}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    const v8, 0x1040009

    invoke-virtual {v7, v8, v12}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    invoke-virtual {v7}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    .local v2, dialog:Landroid/app/AlertDialog;
    invoke-static {v2}, Lcom/android/server/pm/ShutdownThread$Injector;->setDialogTitle(Landroid/app/Dialog;)V

    iput-object v2, v1, Lcom/android/server/pm/ShutdownThread$CloseDialogReceiver;->dialog:Landroid/app/Dialog;

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    invoke-virtual {v2}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v7

    const/16 v8, 0x7d9

    invoke-virtual {v7, v8}, Landroid/view/Window;->setType(I)V

    invoke-virtual {v2}, Landroid/app/AlertDialog;->show()V

    goto/16 :goto_0

    .end local v2           #dialog:Landroid/app/AlertDialog;
    :cond_8
    const v7, 0x104012a

    goto :goto_3

    .end local v1           #closer:Lcom/android/server/pm/ShutdownThread$CloseDialogReceiver;
    :cond_9
    invoke-static {p0}, Lcom/android/server/pm/ShutdownThread;->beginShutdownSequence(Landroid/content/Context;)V

    goto/16 :goto_0
.end method

.method private shutdownRadios(I)V
    .locals 8
    .parameter "timeout"

    .prologue
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    int-to-long v6, p1

    add-long v1, v4, v6

    .local v1, endTime:J
    const/4 v4, 0x1

    new-array v0, v4, [Z

    .local v0, done:[Z
    new-instance v3, Lcom/android/server/pm/ShutdownThread$7;

    invoke-direct {v3, p0, v1, v2, v0}, Lcom/android/server/pm/ShutdownThread$7;-><init>(Lcom/android/server/pm/ShutdownThread;J[Z)V

    .local v3, t:Ljava/lang/Thread;
    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    int-to-long v4, p1

    :try_start_0
    invoke-virtual {v3, v4, v5}, Ljava/lang/Thread;->join(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    const/4 v4, 0x0

    aget-boolean v4, v0, v4

    if-nez v4, :cond_0

    const-string v4, "ShutdownThread"

    const-string v5, "Timed out waiting for NFC, Radio and Bluetooth shutdown."

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void

    :catch_0
    move-exception v4

    goto :goto_0
.end method

.method private static waitShutdownAnimation()V
    .locals 3

    .prologue
    sget-boolean v1, Lcom/android/server/pm/ShutdownThread;->isHaveShutdownAnimation:Z

    if-eqz v1, :cond_0

    const-wide/16 v1, 0x7d0

    :try_start_0
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .local v0, e:Ljava/lang/InterruptedException;
    :cond_0
    :goto_0
    return-void

    .end local v0           #e:Ljava/lang/InterruptedException;
    :catch_0
    move-exception v0

    .restart local v0       #e:Ljava/lang/InterruptedException;
    const-string v1, "ShutdownThread"

    const-string v2, "shutdown animation thread sleep 2s failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method


# virtual methods
.method actionDone()V
    .locals 2

    .prologue
    iget-object v1, p0, Lcom/android/server/pm/ShutdownThread;->mActionDoneSync:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/android/server/pm/ShutdownThread;->mActionDone:Z

    iget-object v0, p0, Lcom/android/server/pm/ShutdownThread;->mActionDoneSync:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public run()V
    .locals 31

    .prologue
    const/16 v27, 0x0

    .local v27, msmEfsSyncDone:Z
    const/16 v25, 0x0

    .local v25, mdmEfsSyncDone:Z
    const/16 v20, 0x0

    .local v20, fis:Ljava/io/FileInputStream;
    new-instance v5, Lcom/android/server/pm/ShutdownThread$5;

    move-object/from16 v0, p0

    invoke-direct {v5, v0}, Lcom/android/server/pm/ShutdownThread$5;-><init>(Lcom/android/server/pm/ShutdownThread;)V

    .local v5, br:Landroid/content/BroadcastReceiver;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-boolean v2, Lcom/android/server/pm/ShutdownThread;->mReboot:Z

    if-eqz v2, :cond_d

    const-string v2, "1"

    :goto_0
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v2, Lcom/android/server/pm/ShutdownThread;->mRebootReason:Ljava/lang/String;

    if-eqz v2, :cond_e

    sget-object v2, Lcom/android/server/pm/ShutdownThread;->mRebootReason:Ljava/lang/String;

    :goto_1
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    .local v29, reason:Ljava/lang/String;
    const-string v2, "sys.shutdown.requested"

    move-object/from16 v0, v29

    invoke-static {v2, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    sget-boolean v2, Lcom/android/server/pm/ShutdownThread;->mRebootSafeMode:Z

    if-eqz v2, :cond_0

    const-string v2, "persist.sys.safemode"

    const-string v3, "1"

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    const-string v2, "ShutdownThread"

    const-string v3, "Sending shutdown broadcast..."

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/android/server/pm/ShutdownThread;->mActionDone:Z

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/pm/ShutdownThread;->mContext:Landroid/content/Context;

    new-instance v3, Landroid/content/Intent;

    const-string v4, "android.intent.action.ACTION_SHUTDOWN"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/server/pm/ShutdownThread;->mHandler:Landroid/os/Handler;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v2 .. v9}, Landroid/content/Context;->sendOrderedBroadcast(Landroid/content/Intent;Ljava/lang/String;Landroid/content/BroadcastReceiver;Landroid/os/Handler;ILjava/lang/String;Landroid/os/Bundle;)V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    const-wide/16 v6, 0x2710

    add-long v17, v2, v6

    .local v17, endTime:J
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/ShutdownThread;->mActionDoneSync:Ljava/lang/Object;

    monitor-enter v3

    :goto_2
    :try_start_0
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/server/pm/ShutdownThread;->mActionDone:Z

    if-nez v2, :cond_1

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    sub-long v12, v17, v6

    .local v12, delay:J
    const-wide/16 v6, 0x0

    cmp-long v2, v12, v6

    if-gtz v2, :cond_f

    const-string v2, "ShutdownThread"

    const-string v4, "Shutdown broadcast timed out"

    invoke-static {v2, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .end local v12           #delay:J
    :cond_1
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v2, "ShutdownThread"

    const-string v3, "Shutting down activity manager..."

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v2, "activity"

    invoke-static {v2}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Landroid/app/ActivityManagerNative;->asInterface(Landroid/os/IBinder;)Landroid/app/IActivityManager;

    move-result-object v11

    .local v11, am:Landroid/app/IActivityManager;
    if-eqz v11, :cond_2

    const/16 v2, 0x2710

    :try_start_1
    invoke-interface {v11, v2}, Landroid/app/IActivityManager;->shutdown(I)Z
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_9

    :cond_2
    :goto_3
    const/16 v2, 0x2ee0

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/android/server/pm/ShutdownThread;->shutdownRadios(I)V

    const-string v2, "ShutdownThread"

    const-string v3, "Waiting for radio file system sync to complete ..."

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_2
    new-instance v21, Ljava/io/FileInputStream;

    const-string v2, "/sys/devices/platform/rs300000a7.65536/force_sync"

    move-object/from16 v0, v21

    invoke-direct {v0, v2}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .end local v20           #fis:Ljava/io/FileInputStream;
    .local v21, fis:Ljava/io/FileInputStream;
    :try_start_3
    invoke-virtual/range {v21 .. v21}, Ljava/io/FileInputStream;->read()I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_7
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_13

    if-eqz v21, :cond_3

    :try_start_4
    invoke-virtual/range {v21 .. v21}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_10

    :cond_3
    :goto_4
    move-object/from16 v20, v21

    .end local v21           #fis:Ljava/io/FileInputStream;
    .restart local v20       #fis:Ljava/io/FileInputStream;
    :cond_4
    :goto_5
    const/16 v22, 0x0

    .local v22, i:I
    move-object/from16 v21, v20

    .end local v20           #fis:Ljava/io/FileInputStream;
    .restart local v21       #fis:Ljava/io/FileInputStream;
    :goto_6
    const/16 v2, 0x10

    move/from16 v0, v22

    if-ge v0, v2, :cond_1b

    if-nez v27, :cond_7

    :try_start_5
    new-instance v20, Ljava/io/FileInputStream;

    const-string v2, "/sys/devices/platform/rs300000a7.65536/sync_sts"

    move-object/from16 v0, v20

    invoke-direct {v0, v2}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .end local v21           #fis:Ljava/io/FileInputStream;
    .restart local v20       #fis:Ljava/io/FileInputStream;
    :try_start_6
    invoke-virtual/range {v20 .. v20}, Ljava/io/FileInputStream;->read()I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_12

    move-result v30

    .local v30, result:I
    const/16 v2, 0x31

    move/from16 v0, v30

    if-ne v2, v0, :cond_5

    const/16 v27, 0x1

    :cond_5
    if-eqz v20, :cond_6

    :try_start_7
    invoke-virtual/range {v20 .. v20}, Ljava/io/FileInputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_f

    :cond_6
    :goto_7
    move-object/from16 v21, v20

    .end local v20           #fis:Ljava/io/FileInputStream;
    .end local v30           #result:I
    .restart local v21       #fis:Ljava/io/FileInputStream;
    :cond_7
    :goto_8
    if-nez v25, :cond_1a

    :try_start_8
    new-instance v20, Ljava/io/FileInputStream;

    const-string v2, "/sys/devices/platform/rs300100a7.65536/sync_sts"

    move-object/from16 v0, v20

    invoke-direct {v0, v2}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_4

    .end local v21           #fis:Ljava/io/FileInputStream;
    .restart local v20       #fis:Ljava/io/FileInputStream;
    :try_start_9
    invoke-virtual/range {v20 .. v20}, Ljava/io/FileInputStream;->read()I
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_5
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_11

    move-result v30

    .restart local v30       #result:I
    const/16 v2, 0x31

    move/from16 v0, v30

    if-ne v2, v0, :cond_8

    const/16 v25, 0x1

    :cond_8
    if-eqz v20, :cond_9

    :try_start_a
    invoke-virtual/range {v20 .. v20}, Ljava/io/FileInputStream;->close()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_e

    .end local v30           #result:I
    :cond_9
    :goto_9
    if-eqz v27, :cond_14

    if-eqz v25, :cond_14

    const-string v2, "ShutdownThread"

    const-string v3, "Radio file system sync complete."

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :goto_a
    new-instance v28, Lcom/android/server/pm/ShutdownThread$6;

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/android/server/pm/ShutdownThread$6;-><init>(Lcom/android/server/pm/ShutdownThread;)V

    .local v28, observer:Landroid/os/storage/IMountShutdownObserver;
    const-string v2, "ShutdownThread"

    const-string v3, "Shutting down MountService"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/android/server/pm/ShutdownThread;->mActionDone:Z

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    const-wide/16 v6, 0x4e20

    add-long v15, v2, v6

    .local v15, endShutTime:J
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/ShutdownThread;->mActionDoneSync:Ljava/lang/Object;

    monitor-enter v3

    :try_start_b
    const-string v2, "mount"

    invoke-static {v2}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Landroid/os/storage/IMountService$Stub;->asInterface(Landroid/os/IBinder;)Landroid/os/storage/IMountService;

    move-result-object v26

    .local v26, mount:Landroid/os/storage/IMountService;
    if-eqz v26, :cond_15

    move-object/from16 v0, v26

    move-object/from16 v1, v28

    invoke-interface {v0, v1}, Landroid/os/storage/IMountService;->shutdown(Landroid/os/storage/IMountShutdownObserver;)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_4
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_6

    .end local v26           #mount:Landroid/os/storage/IMountService;
    :goto_b
    :try_start_c
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/server/pm/ShutdownThread;->mActionDone:Z

    if-nez v2, :cond_a

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    sub-long v12, v15, v6

    .restart local v12       #delay:J
    const-wide/16 v6, 0x0

    cmp-long v2, v12, v6

    if-gtz v2, :cond_16

    const-string v2, "ShutdownThread"

    const-string v4, "Shutdown wait timed out"

    invoke-static {v2, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .end local v12           #delay:J
    :cond_a
    monitor-exit v3
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/pm/ShutdownThread;->mContext:Landroid/content/Context;

    const-string v3, "connectivity"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/ConnectivityManager;

    invoke-virtual {v2}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v23

    .local v23, info:Landroid/net/NetworkInfo;
    if-eqz v23, :cond_b

    invoke-virtual/range {v23 .. v23}, Landroid/net/NetworkInfo;->getType()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_b

    invoke-virtual/range {v23 .. v23}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v2

    sget-object v3, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    if-ne v2, v3, :cond_b

    const-string v2, "dz"

    const-string v3, "ro.config.cplusw.solution"

    const-string v4, "unknown"

    invoke-static {v3, v4}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_17

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/pm/ShutdownThread;->mContext:Landroid/content/Context;

    const-string v3, "wifi"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Landroid/net/wifi/WifiManager;

    .local v24, mWifiManager:Landroid/net/wifi/WifiManager;
    if-eqz v24, :cond_b

    invoke-virtual/range {v24 .. v24}, Landroid/net/wifi/WifiManager;->requestCpluswStop()V

    .end local v24           #mWifiManager:Landroid/net/wifi/WifiManager;
    :cond_b
    :goto_c
    const-string v2, "true"

    const-string v3, "ro.config.hw_quickpoweron"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19

    sget-boolean v2, Lcom/android/server/pm/ShutdownThread;->sIsRestart:Z

    const/4 v3, 0x1

    if-ne v2, v3, :cond_18

    sget-boolean v2, Lcom/android/server/pm/ShutdownThread;->isHaveShutdownAnimation:Z

    if-eqz v2, :cond_c

    const-wide/16 v2, 0x7d0

    :try_start_d
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_d
    .catch Ljava/lang/InterruptedException; {:try_start_d .. :try_end_d} :catch_8

    :cond_c
    :goto_d
    const/4 v2, 0x1

    const-string v3, "restart phone"

    invoke-static {v2, v3}, Lcom/android/server/pm/ShutdownThread;->rebootOrShutdown(ZLjava/lang/String;)V

    :goto_e
    return-void

    .end local v11           #am:Landroid/app/IActivityManager;
    .end local v15           #endShutTime:J
    .end local v17           #endTime:J
    .end local v22           #i:I
    .end local v23           #info:Landroid/net/NetworkInfo;
    .end local v28           #observer:Landroid/os/storage/IMountShutdownObserver;
    .end local v29           #reason:Ljava/lang/String;
    :cond_d
    const-string v2, "0"

    goto/16 :goto_0

    :cond_e
    const-string v2, ""

    goto/16 :goto_1

    .restart local v12       #delay:J
    .restart local v17       #endTime:J
    .restart local v29       #reason:Ljava/lang/String;
    :cond_f
    :try_start_e
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/pm/ShutdownThread;->mActionDoneSync:Ljava/lang/Object;

    invoke-virtual {v2, v12, v13}, Ljava/lang/Object;->wait(J)V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_e .. :try_end_e} :catch_0

    goto/16 :goto_2

    :catch_0
    move-exception v2

    goto/16 :goto_2

    .end local v12           #delay:J
    :catchall_0
    move-exception v2

    :try_start_f
    monitor-exit v3
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_0

    throw v2

    .restart local v11       #am:Landroid/app/IActivityManager;
    :catch_1
    move-exception v19

    .local v19, ex:Ljava/lang/Exception;
    :goto_f
    :try_start_10
    const-string v2, "ShutdownThread"

    const-string v3, "Exception during read sync force file"

    move-object/from16 v0, v19

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_1

    if-eqz v20, :cond_4

    :try_start_11
    invoke-virtual/range {v20 .. v20}, Ljava/io/FileInputStream;->close()V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_2

    goto/16 :goto_5

    :catch_2
    move-exception v19

    const-string v2, "ShutdownThread"

    const-string v3, "Exception during closing sync force file"

    move-object/from16 v0, v19

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_5

    .end local v19           #ex:Ljava/lang/Exception;
    :catchall_1
    move-exception v2

    :goto_10
    if-eqz v20, :cond_10

    :try_start_12
    invoke-virtual/range {v20 .. v20}, Ljava/io/FileInputStream;->close()V
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_a

    :cond_10
    :goto_11
    throw v2

    .end local v20           #fis:Ljava/io/FileInputStream;
    .restart local v21       #fis:Ljava/io/FileInputStream;
    .restart local v22       #i:I
    :catch_3
    move-exception v19

    move-object/from16 v20, v21

    .end local v21           #fis:Ljava/io/FileInputStream;
    .restart local v19       #ex:Ljava/lang/Exception;
    .restart local v20       #fis:Ljava/io/FileInputStream;
    :goto_12
    :try_start_13
    const-string v2, "ShutdownThread"

    const-string v3, "Exception during msmEfsSyncDone"

    move-object/from16 v0, v19

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_6

    const/16 v27, 0x1

    if-eqz v20, :cond_11

    :try_start_14
    invoke-virtual/range {v20 .. v20}, Ljava/io/FileInputStream;->close()V
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_c

    :cond_11
    :goto_13
    move-object/from16 v21, v20

    .end local v20           #fis:Ljava/io/FileInputStream;
    .restart local v21       #fis:Ljava/io/FileInputStream;
    goto/16 :goto_8

    .end local v19           #ex:Ljava/lang/Exception;
    :catchall_2
    move-exception v2

    move-object/from16 v20, v21

    .end local v21           #fis:Ljava/io/FileInputStream;
    .restart local v20       #fis:Ljava/io/FileInputStream;
    :goto_14
    if-eqz v20, :cond_12

    :try_start_15
    invoke-virtual/range {v20 .. v20}, Ljava/io/FileInputStream;->close()V
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_b

    :cond_12
    :goto_15
    throw v2

    .end local v20           #fis:Ljava/io/FileInputStream;
    .restart local v21       #fis:Ljava/io/FileInputStream;
    :catch_4
    move-exception v19

    move-object/from16 v20, v21

    .end local v21           #fis:Ljava/io/FileInputStream;
    .restart local v19       #ex:Ljava/lang/Exception;
    .restart local v20       #fis:Ljava/io/FileInputStream;
    :goto_16
    :try_start_16
    const-string v2, "ShutdownThread"

    const-string v3, "Exception during mdmEfsSyncDone"

    move-object/from16 v0, v19

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_5

    const/16 v25, 0x1

    if-eqz v20, :cond_9

    :try_start_17
    invoke-virtual/range {v20 .. v20}, Ljava/io/FileInputStream;->close()V
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_17} :catch_5

    goto/16 :goto_9

    :catch_5
    move-exception v19

    const-string v2, "ShutdownThread"

    const-string v3, "Exception during closing /sys/devices/platform/rs300100a7.65536/sync_sts"

    :goto_17
    move-object/from16 v0, v19

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_9

    .end local v19           #ex:Ljava/lang/Exception;
    .end local v20           #fis:Ljava/io/FileInputStream;
    .restart local v21       #fis:Ljava/io/FileInputStream;
    :catchall_3
    move-exception v2

    move-object/from16 v20, v21

    .end local v21           #fis:Ljava/io/FileInputStream;
    .restart local v20       #fis:Ljava/io/FileInputStream;
    :goto_18
    if-eqz v20, :cond_13

    :try_start_18
    invoke-virtual/range {v20 .. v20}, Ljava/io/FileInputStream;->close()V
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_18} :catch_d

    :cond_13
    :goto_19
    throw v2

    :cond_14
    const-string v2, "ShutdownThread"

    const-string v3, "Radio file system sync incomplete - retry."

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-wide/16 v2, 0x1f4

    invoke-static {v2, v3}, Landroid/os/SystemClock;->sleep(J)V

    add-int/lit8 v22, v22, 0x1

    move-object/from16 v21, v20

    .end local v20           #fis:Ljava/io/FileInputStream;
    .restart local v21       #fis:Ljava/io/FileInputStream;
    goto/16 :goto_6

    .end local v21           #fis:Ljava/io/FileInputStream;
    .restart local v15       #endShutTime:J
    .restart local v20       #fis:Ljava/io/FileInputStream;
    .restart local v26       #mount:Landroid/os/storage/IMountService;
    .restart local v28       #observer:Landroid/os/storage/IMountShutdownObserver;
    :cond_15
    :try_start_19
    const-string v2, "ShutdownThread"

    const-string v4, "MountService unavailable for shutdown"

    invoke-static {v2, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_4
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_19} :catch_6

    goto/16 :goto_b

    .end local v26           #mount:Landroid/os/storage/IMountService;
    :catch_6
    move-exception v14

    .local v14, e:Ljava/lang/Exception;
    :try_start_1a
    const-string v2, "ShutdownThread"

    const-string v4, "Exception during MountService shutdown"

    invoke-static {v2, v4, v14}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_b

    .end local v14           #e:Ljava/lang/Exception;
    :catchall_4
    move-exception v2

    monitor-exit v3
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_4

    throw v2

    .restart local v12       #delay:J
    :cond_16
    :try_start_1b
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/pm/ShutdownThread;->mActionDoneSync:Ljava/lang/Object;

    invoke-virtual {v2, v12, v13}, Ljava/lang/Object;->wait(J)V
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_4
    .catch Ljava/lang/InterruptedException; {:try_start_1b .. :try_end_1b} :catch_7

    goto/16 :goto_b

    :catch_7
    move-exception v2

    goto/16 :goto_b

    .end local v12           #delay:J
    .restart local v23       #info:Landroid/net/NetworkInfo;
    :cond_17
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/pm/ShutdownThread;->mContext:Landroid/content/Context;

    const-string v3, "wifi"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/wifi/WifiManager;

    invoke-virtual {v2}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    move-result-object v10

    .local v10, actApssid:Ljava/lang/String;
    const-string v2, "16"

    invoke-static {v10, v2}, Landroid/net/wifi/WifiManager;->ctcApSendCmd2Cpwd(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_c

    .end local v10           #actApssid:Ljava/lang/String;
    :catch_8
    move-exception v14

    .local v14, e:Ljava/lang/InterruptedException;
    const-string v2, "ShutdownThread"

    const-string v3, "shutdown animation thread sleep 2s failed"

    invoke-static {v2, v3, v14}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_d

    .end local v14           #e:Ljava/lang/InterruptedException;
    :cond_18
    sget-boolean v2, Lcom/android/server/pm/ShutdownThread;->mReboot:Z

    sget-object v3, Lcom/android/server/pm/ShutdownThread;->mRebootReason:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/android/server/pm/ShutdownThread;->rebootOrShutdown(ZLjava/lang/String;)V

    goto/16 :goto_e

    :cond_19
    sget-boolean v2, Lcom/android/server/pm/ShutdownThread;->mReboot:Z

    sget-object v3, Lcom/android/server/pm/ShutdownThread;->mRebootReason:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/android/server/pm/ShutdownThread;->rebootOrShutdown(ZLjava/lang/String;)V

    goto/16 :goto_e

    .end local v15           #endShutTime:J
    .end local v22           #i:I
    .end local v23           #info:Landroid/net/NetworkInfo;
    .end local v28           #observer:Landroid/os/storage/IMountShutdownObserver;
    :catch_9
    move-exception v2

    goto/16 :goto_3

    :catch_a
    move-exception v19

    .restart local v19       #ex:Ljava/lang/Exception;
    const-string v3, "ShutdownThread"

    const-string v4, "Exception during closing sync force file"

    move-object/from16 v0, v19

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_11

    .end local v19           #ex:Ljava/lang/Exception;
    .restart local v22       #i:I
    :catch_b
    move-exception v19

    .restart local v19       #ex:Ljava/lang/Exception;
    const-string v3, "ShutdownThread"

    const-string v4, "Exception during closing /sys/devices/platform/rs300000a7.65536/sync_sts"

    move-object/from16 v0, v19

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_15

    :catch_c
    move-exception v19

    const-string v2, "ShutdownThread"

    const-string v3, "Exception during closing /sys/devices/platform/rs300000a7.65536/sync_sts"

    move-object/from16 v0, v19

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_13

    .end local v19           #ex:Ljava/lang/Exception;
    :catch_d
    move-exception v19

    .restart local v19       #ex:Ljava/lang/Exception;
    const-string v3, "ShutdownThread"

    const-string v4, "Exception during closing /sys/devices/platform/rs300100a7.65536/sync_sts"

    move-object/from16 v0, v19

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_19

    .end local v19           #ex:Ljava/lang/Exception;
    .restart local v30       #result:I
    :catch_e
    move-exception v19

    .restart local v19       #ex:Ljava/lang/Exception;
    const-string v2, "ShutdownThread"

    const-string v3, "Exception during closing /sys/devices/platform/rs300100a7.65536/sync_sts"

    goto/16 :goto_17

    .end local v19           #ex:Ljava/lang/Exception;
    :catch_f
    move-exception v19

    .restart local v19       #ex:Ljava/lang/Exception;
    const-string v2, "ShutdownThread"

    const-string v3, "Exception during closing /sys/devices/platform/rs300000a7.65536/sync_sts"

    move-object/from16 v0, v19

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_7

    .end local v19           #ex:Ljava/lang/Exception;
    .end local v20           #fis:Ljava/io/FileInputStream;
    .end local v22           #i:I
    .end local v30           #result:I
    .restart local v21       #fis:Ljava/io/FileInputStream;
    :catch_10
    move-exception v19

    .restart local v19       #ex:Ljava/lang/Exception;
    const-string v2, "ShutdownThread"

    const-string v3, "Exception during closing sync force file"

    move-object/from16 v0, v19

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_4

    .end local v19           #ex:Ljava/lang/Exception;
    .end local v21           #fis:Ljava/io/FileInputStream;
    .restart local v20       #fis:Ljava/io/FileInputStream;
    .restart local v22       #i:I
    :catchall_5
    move-exception v2

    goto/16 :goto_18

    :catch_11
    move-exception v19

    goto/16 :goto_16

    :catchall_6
    move-exception v2

    goto/16 :goto_14

    :catch_12
    move-exception v19

    goto/16 :goto_12

    .end local v20           #fis:Ljava/io/FileInputStream;
    .end local v22           #i:I
    .restart local v21       #fis:Ljava/io/FileInputStream;
    :catchall_7
    move-exception v2

    move-object/from16 v20, v21

    .end local v21           #fis:Ljava/io/FileInputStream;
    .restart local v20       #fis:Ljava/io/FileInputStream;
    goto/16 :goto_10

    .end local v20           #fis:Ljava/io/FileInputStream;
    .restart local v21       #fis:Ljava/io/FileInputStream;
    :catch_13
    move-exception v19

    move-object/from16 v20, v21

    .end local v21           #fis:Ljava/io/FileInputStream;
    .restart local v20       #fis:Ljava/io/FileInputStream;
    goto/16 :goto_f

    .end local v20           #fis:Ljava/io/FileInputStream;
    .restart local v21       #fis:Ljava/io/FileInputStream;
    .restart local v22       #i:I
    :cond_1a
    move-object/from16 v20, v21

    .end local v21           #fis:Ljava/io/FileInputStream;
    .restart local v20       #fis:Ljava/io/FileInputStream;
    goto/16 :goto_9

    .end local v20           #fis:Ljava/io/FileInputStream;
    .restart local v21       #fis:Ljava/io/FileInputStream;
    :cond_1b
    move-object/from16 v20, v21

    .end local v21           #fis:Ljava/io/FileInputStream;
    .restart local v20       #fis:Ljava/io/FileInputStream;
    goto/16 :goto_a
.end method
