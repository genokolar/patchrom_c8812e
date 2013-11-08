.class public final Landroid/util/Plog;
.super Ljava/lang/Object;
.source "Plog.java"


# static fields
.field public static final TAG_ACTIVITY_SWITCH:Ljava/lang/String; = "ACTIVITY_SWITCH"

.field public static final TAG_ALARM_START:Ljava/lang/String; = "ALARM_START"

.field public static final TAG_APP_CPU_FG_TIME:Ljava/lang/String; = "APP_CPU_FG_TIME"

.field public static final TAG_APP_CPU_TIME:Ljava/lang/String; = "APP_CPU_TIME"

.field public static final TAG_APP_GPS_TIME:Ljava/lang/String; = "APP_GPS_TIME"

.field public static final TAG_APP_TCP_RECV:Ljava/lang/String; = "APP_TCP_RECV"

.field public static final TAG_APP_TCP_SENT:Ljava/lang/String; = "APP_TCP_SENT"

.field public static final TAG_BAT_APP:Ljava/lang/String; = "BATTERY_APP_CONSUMPTION"

.field public static final TAG_BAT_CHARGING:Ljava/lang/String; = "BATTERY_CHARGING"

.field public static final TAG_BAT_LEVEL:Ljava/lang/String; = "BATTERY_LEVEL"

.field public static final TAG_BAT_TIME_ALL:Ljava/lang/String; = "BATTERY_RUM_TIME_ALL"

.field public static final TAG_BAT_TIME_WAKE:Ljava/lang/String; = "BATTERY_RUM_TIME_WAKE"

.field public static final TAG_BOOT_COMPLETED:Ljava/lang/String; = "BOOT_COMPLETED"

.field public static final TAG_BRIGHTNESS_MODE:Ljava/lang/String; = "BRIGHTNESS_MODE"

.field public static final TAG_BR_LOAD_FINISH:Ljava/lang/String; = "BROWSER_LOAD_FINISH"

.field public static final TAG_BR_LOAD_START:Ljava/lang/String; = "BROWSER_LOAD_START"

.field public static final TAG_BR_LOAD_URL:Ljava/lang/String; = "BROWSER_LOAD_URL"

.field public static final TAG_CPU_LOAD:Ljava/lang/String; = "CPU_LOAD"

.field public static final TAG_CPU_TIME_STATE:Ljava/lang/String; = "CPU_TIME_STATE"

.field public static final TAG_IP_PACKAGE:Ljava/lang/String; = "IP_PACKAGE_STATS"

.field public static final TAG_LCD_BLACK:Ljava/lang/String; = "LCD_BLACK"

.field public static final TAG_NETWORK_OK:Ljava/lang/String; = "NETWORK_OK"

.field private static final TAG_POWER_LOGCAT:Ljava/lang/String; = "PowerLogcat"

.field public static final TAG_POWER_LOG_FILE:Ljava/lang/String; = "PowerLogFile"

.field public static final TAG_POWER_MODE:Ljava/lang/String; = "POWER_MODE"

.field public static final TAG_SCREEN_STATE:Ljava/lang/String; = "SCREEN_STATE"

.field public static final TAG_SHUTDOWN:Ljava/lang/String; = "SHUTDOWN"

.field public static final TAG_WIFI_CONNECTED:Ljava/lang/String; = "WIFI_CONNECTED"

.field private static appName:Ljava/lang/String;

.field private static mService:Lcom/android/internal/os/IPowerLogService;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static power(Ljava/lang/String;I)I
    .locals 2
    .parameter "tag"
    .parameter "msg"

    .prologue
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/util/Plog;->power(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static power(Ljava/lang/String;ILjava/lang/String;)I
    .locals 1
    .parameter "tag"
    .parameter "msg"
    .parameter "name"

    .prologue
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, p2}, Landroid/util/Plog;->power(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static power(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1
    .parameter "tag"
    .parameter "msg"

    .prologue
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/util/Plog;->power(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static power(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 5
    .parameter "tag"
    .parameter "msg"
    .parameter "name"

    .prologue
    const-string v2, "1"

    const-string v3, "ro.config.hw.logsystem.send"

    const-string v4, "0"

    invoke-static {v3, v4}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    sget-object v2, Landroid/util/Plog;->mService:Lcom/android/internal/os/IPowerLogService;

    if-nez v2, :cond_0

    const-string v2, "PowerLog"

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    .local v0, b:Landroid/os/IBinder;
    invoke-static {v0}, Lcom/android/internal/os/IPowerLogService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/os/IPowerLogService;

    move-result-object v2

    sput-object v2, Landroid/util/Plog;->mService:Lcom/android/internal/os/IPowerLogService;

    .end local v0           #b:Landroid/os/IBinder;
    :cond_0
    :try_start_0
    sget-object v2, Landroid/util/Plog;->mService:Lcom/android/internal/os/IPowerLogService;

    if-eqz v2, :cond_2

    sput-object p2, Landroid/util/Plog;->appName:Ljava/lang/String;

    sget-object v2, Landroid/util/Plog;->appName:Ljava/lang/String;

    if-nez v2, :cond_1

    invoke-static {}, Landroid/ddm/DdmHandleAppName;->getAppName()Ljava/lang/String;

    move-result-object v2

    sput-object v2, Landroid/util/Plog;->appName:Ljava/lang/String;

    :cond_1
    sget-object v2, Landroid/util/Plog;->mService:Lcom/android/internal/os/IPowerLogService;

    sget-object v3, Landroid/util/Plog;->appName:Ljava/lang/String;

    invoke-interface {v2, v3, p0, p1}, Lcom/android/internal/os/IPowerLogService;->add(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    :goto_0
    const-string v2, "PowerLogcat"

    const/4 v3, 0x2

    invoke-static {v2, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-static {p0, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    :goto_1
    return v2

    :catch_0
    move-exception v1

    .local v1, e:Landroid/os/RemoteException;
    const-string v2, "PowerLogFile"

    const-string v3, "Error during add power log "

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .end local v1           #e:Landroid/os/RemoteException;
    :cond_3
    const/4 v2, 0x0

    goto :goto_1
.end method
