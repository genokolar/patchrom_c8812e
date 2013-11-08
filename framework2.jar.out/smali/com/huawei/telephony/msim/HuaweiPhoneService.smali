.class public Lcom/huawei/telephony/msim/HuaweiPhoneService;
.super Lcom/huawei/telephony/msim/IHuaweiTelephony$Stub;
.source "HuaweiPhoneService.java"

# interfaces
.implements Lcom/android/internal/telephony/PhoneFactory$PhoneServiceInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/huawei/telephony/msim/HuaweiPhoneService$MainThreadRequest;,
        Lcom/huawei/telephony/msim/HuaweiPhoneService$MainHandler;
    }
.end annotation


# static fields
.field private static final CMD_HANDLE_DEMO:I = 0x1

.field private static final DBG:Z = false

.field private static final DEFAULT:Ljava/lang/String; = "default"

.field private static final EVENT_OEM_RIL_MESSAGE_DONE:I = 0x2

.field private static final EVENT_SET_PREF_NETWORKS:I = 0x4

.field private static final LOG_TAG:Ljava/lang/String; = "HuaweiPhoneService"

.field static final PREFERAPN_URI:Landroid/net/Uri; = null

.field private static final SYSTEM_ANR_TIME_OUT:I = 0x1194

.field private static final hwDSDSMode:Ljava/lang/String;

.field private static final isHwDSDAEnabled:Z


# instance fields
.field private mATResponse:[Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private mDualMode:I

.field mIntentReceiver:Landroid/content/BroadcastReceiver;

.field private final mLock:Ljava/lang/Object;

.field private mMainHandler:Lcom/huawei/telephony/msim/HuaweiPhoneService$MainHandler;

.field private mMessageThread:Landroid/os/HandlerThread;

.field private mPhone:Lcom/huawei/telephony/msim/HuaweiPhone;

.field private mPhones:[Lcom/huawei/telephony/msim/HuaweiPhone;

.field private mPrefNet:I

.field private mbATReady:Z

.field private timeOutCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const-string v0, "ro.config.hw_dsda"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->isHwDSDAEnabled:Z

    const-string v0, "ro.config.dsds_mode"

    const-string v1, ""

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->hwDSDSMode:Ljava/lang/String;

    const-string v0, "content://telephony/carriers/preferapn"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->PREFERAPN_URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    invoke-direct {p0}, Lcom/huawei/telephony/msim/IHuaweiTelephony$Stub;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct/range {v0 .. v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mLock:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mPhones:[Lcom/huawei/telephony/msim/HuaweiPhone;

    iput-boolean v1, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mbATReady:Z

    iput v1, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->timeOutCount:I

    const/4 v0, 0x4

    iput v0, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mPrefNet:I

    new-instance v0, Lcom/huawei/telephony/msim/HuaweiPhoneService$1;

    invoke-direct {v0, p0}, Lcom/huawei/telephony/msim/HuaweiPhoneService$1;-><init>(Lcom/huawei/telephony/msim/HuaweiPhoneService;)V

    iput-object v0, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "HuaweiPhoneTempService"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mMessageThread:Landroid/os/HandlerThread;

    iget-object v0, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mMessageThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    new-instance v0, Lcom/huawei/telephony/msim/HuaweiPhoneService$MainHandler;

    iget-object v1, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mMessageThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/huawei/telephony/msim/HuaweiPhoneService$MainHandler;-><init>(Lcom/huawei/telephony/msim/HuaweiPhoneService;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mMainHandler:Lcom/huawei/telephony/msim/HuaweiPhoneService$MainHandler;

    const-string v0, "huaweiphone"

    invoke-static {v0, p0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    return-void
.end method

.method static synthetic access$000(Lcom/huawei/telephony/msim/HuaweiPhoneService;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$100(Lcom/huawei/telephony/msim/HuaweiPhoneService;)I
    .locals 1
    .parameter "x0"

    .prologue
    iget v0, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->timeOutCount:I

    return v0
.end method

.method static synthetic access$102(Lcom/huawei/telephony/msim/HuaweiPhoneService;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput p1, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->timeOutCount:I

    return p1
.end method

.method static synthetic access$202(Lcom/huawei/telephony/msim/HuaweiPhoneService;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput-boolean p1, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mbATReady:Z

    return p1
.end method

.method static synthetic access$302(Lcom/huawei/telephony/msim/HuaweiPhoneService;[Ljava/lang/String;)[Ljava/lang/String;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput-object p1, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mATResponse:[Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$400(Lcom/huawei/telephony/msim/HuaweiPhoneService;)Landroid/content/Context;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$500(Lcom/huawei/telephony/msim/HuaweiPhoneService;)I
    .locals 1
    .parameter "x0"

    .prologue
    iget v0, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mPrefNet:I

    return v0
.end method

.method static synthetic access$502(Lcom/huawei/telephony/msim/HuaweiPhoneService;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput p1, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mPrefNet:I

    return p1
.end method

.method static synthetic access$600(Lcom/huawei/telephony/msim/HuaweiPhoneService;)I
    .locals 1
    .parameter "x0"

    .prologue
    iget v0, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mDualMode:I

    return v0
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .parameter "msg"

    .prologue
    const-string v0, "HuaweiPhoneService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[PhoneIntfMgr] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private sendRequest(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .parameter "command"
    .parameter "arg1"
    .parameter "arg2"

    .prologue
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v2

    iget-object v3, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mMainHandler:Lcom/huawei/telephony/msim/HuaweiPhoneService$MainHandler;

    invoke-virtual {v3}, Lcom/huawei/telephony/msim/HuaweiPhoneService$MainHandler;->getLooper()Landroid/os/Looper;

    move-result-object v3

    if-ne v2, v3, :cond_0

    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "This method will deadlock if called from the main thread."

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_0
    new-instance v1, Lcom/huawei/telephony/msim/HuaweiPhoneService$MainThreadRequest;

    invoke-direct {v1, p2, p3}, Lcom/huawei/telephony/msim/HuaweiPhoneService$MainThreadRequest;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .local v1, request:Lcom/huawei/telephony/msim/HuaweiPhoneService$MainThreadRequest;
    iget-object v2, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mMainHandler:Lcom/huawei/telephony/msim/HuaweiPhoneService$MainHandler;

    invoke-virtual {v2, p1, v1}, Lcom/huawei/telephony/msim/HuaweiPhoneService$MainHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .local v0, msg:Landroid/os/Message;
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    monitor-enter v1

    :goto_0
    :try_start_0
    iget-object v2, v1, Lcom/huawei/telephony/msim/HuaweiPhoneService$MainThreadRequest;->result:Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_1

    :try_start_1
    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception v2

    goto :goto_0

    :cond_1
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    iget-object v2, v1, Lcom/huawei/telephony/msim/HuaweiPhoneService$MainThreadRequest;->result:Ljava/lang/Object;

    return-object v2

    :catchall_0
    move-exception v2

    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v2
.end method


# virtual methods
.method public ATDirectChannel(Ljava/lang/String;)[Ljava/lang/String;
    .locals 10
    .parameter "ATCommand"

    .prologue
    const/4 v6, 0x2

    const/4 v7, 0x0

    const/4 v9, 0x1

    new-array v5, v6, [Ljava/lang/String;

    const-string v6, "0"

    aput-object v6, v5, v7

    const-string v6, "ERROR"

    aput-object v6, v5, v9

    .local v5, response:[Ljava/lang/String;
    new-array v0, v9, [Ljava/lang/String;

    aput-object p1, v0, v7

    .local v0, ATCommands:[Ljava/lang/String;
    iput-boolean v7, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mbATReady:Z

    :try_start_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v4

    .local v4, myLooper:Landroid/os/Looper;
    if-nez v4, :cond_0

    invoke-static {}, Landroid/os/Looper;->prepare()V

    :cond_0
    iget-object v7, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mLock:Ljava/lang/Object;

    monitor-enter v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iget-object v6, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mMainHandler:Lcom/huawei/telephony/msim/HuaweiPhoneService$MainHandler;

    const/4 v8, 0x2

    invoke-virtual {v6, v8}, Lcom/huawei/telephony/msim/HuaweiPhoneService$MainHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v3

    .local v3, msg:Landroid/os/Message;
    const-string v6, "cdma_gsm"

    sget-object v8, Lcom/huawei/telephony/msim/HuaweiPhoneService;->hwDSDSMode:Ljava/lang/String;

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    sget-boolean v6, Lcom/huawei/telephony/msim/HuaweiPhoneService;->isHwDSDAEnabled:Z

    if-eqz v6, :cond_4

    invoke-static {}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getDefault()Lcom/huawei/telephony/HuaweiTelephonyManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/huawei/telephony/HuaweiTelephonyManager;->getDualCardMode()I

    move-result v6

    if-ne v6, v9, :cond_4

    const-string v6, "HuaweiPhoneService"

    const-string v8, "ATDirectChannel use SUB1"

    invoke-static {v6, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v6, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mPhones:[Lcom/huawei/telephony/msim/HuaweiPhone;

    const/4 v8, 0x0

    aget-object v6, v6, v8

    invoke-virtual {v6, v0, v3}, Lcom/huawei/telephony/msim/HuaweiPhone;->invokeOemRilRequestStrings([Ljava/lang/String;Landroid/os/Message;)V

    :cond_1
    :goto_0
    iget-boolean v6, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mbATReady:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v6, :cond_2

    :try_start_2
    iget-object v6, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mLock:Ljava/lang/Object;

    const-wide/16 v8, 0x1194

    invoke-virtual {v6, v8, v9}, Ljava/lang/Object;->wait(J)V

    iget-boolean v6, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mbATReady:Z

    if-nez v6, :cond_1

    const-string v6, "HuaweiPhoneService"

    const-string v8, "[ATDirectChannel] no response from the RIL in 4500ms"

    invoke-static {v6, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iput-object v5, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mATResponse:[Ljava/lang/String;

    iget v6, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->timeOutCount:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->timeOutCount:I

    const/4 v6, 0x1

    iput-boolean v6, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mbATReady:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1

    :cond_2
    :try_start_3
    iget v6, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->timeOutCount:I

    if-eqz v6, :cond_3

    iget-object v6, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mLock:Ljava/lang/Object;

    invoke-virtual {v6}, Ljava/lang/Object;->notifyAll()V

    :cond_3
    monitor-exit v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    iget-object v5, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mATResponse:[Ljava/lang/String;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .end local v3           #msg:Landroid/os/Message;
    .end local v4           #myLooper:Landroid/os/Looper;
    :goto_1
    return-object v5

    .restart local v3       #msg:Landroid/os/Message;
    .restart local v4       #myLooper:Landroid/os/Looper;
    :cond_4
    :try_start_5
    const-string v6, "HuaweiPhoneService"

    const-string v8, "ATDirectChannel use SUB2"

    invoke-static {v6, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v6, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mPhones:[Lcom/huawei/telephony/msim/HuaweiPhone;

    const/4 v8, 0x1

    aget-object v6, v6, v8

    invoke-virtual {v6, v0, v3}, Lcom/huawei/telephony/msim/HuaweiPhone;->invokeOemRilRequestStrings([Ljava/lang/String;Landroid/os/Message;)V

    goto :goto_0

    .end local v3           #msg:Landroid/os/Message;
    :catchall_0
    move-exception v6

    monitor-exit v7
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    throw v6
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    .end local v4           #myLooper:Landroid/os/Looper;
    :catch_0
    move-exception v2

    .local v2, ex:Ljava/lang/Exception;
    const-string v6, "HuaweiPhoneService"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "ATDirectChannel Exception ="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .end local v2           #ex:Ljava/lang/Exception;
    .restart local v3       #msg:Landroid/os/Message;
    .restart local v4       #myLooper:Landroid/os/Looper;
    :catch_1
    move-exception v1

    .local v1, e:Ljava/lang/InterruptedException;
    :try_start_7
    const-string v6, "interrupted while trying to send command from ATDirectChannel"

    invoke-direct {p0, v6}, Lcom/huawei/telephony/msim/HuaweiPhoneService;->log(Ljava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_0
.end method

.method public clearPreferedApnId()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const-string v1, "HuaweiPhoneService"

    const-string v2, "clearPreferedApnId"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .local v0, resolver:Landroid/content/ContentResolver;
    sget-object v1, Lcom/huawei/telephony/msim/HuaweiPhoneService;->PREFERAPN_URI:Landroid/net/Uri;

    invoke-virtual {v0, v1, v3, v3}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    return-void
.end method

.method public clearUserPrefWhenChangeMode(I)V
    .locals 4
    .parameter "nMode"

    .prologue
    :try_start_0
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getInstance()Lcom/android/internal/telephony/msim/SubscriptionManager;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->clearUserPrefWhenChangeMode(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    .local v0, ex:Ljava/lang/Exception;
    const-string v1, "HuaweiPhoneService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isSubActive Exception = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public getCardType(I)I
    .locals 4
    .parameter "slotId"

    .prologue
    :try_start_0
    invoke-static {}, Lcom/android/internal/telephony/uicc/UiccController;->getInstance()Lcom/android/internal/telephony/uicc/UiccController;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/android/internal/telephony/uicc/UiccController;->getCardType(I)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    :goto_0
    return v1

    :catch_0
    move-exception v0

    .local v0, ex:Ljava/lang/Exception;
    const-string v1, "HuaweiPhoneService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getCardType Exception ="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, -0x1

    goto :goto_0
.end method

.method public getDSDARadioState(I)Z
    .locals 4
    .parameter "subId"

    .prologue
    sget-object v0, Lcom/android/internal/telephony/CommandsInterface$RadioState;->RADIO_UNAVAILABLE:Lcom/android/internal/telephony/CommandsInterface$RadioState;

    .local v0, radioState:Lcom/android/internal/telephony/CommandsInterface$RadioState;
    iget-object v1, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mContext:Landroid/content/Context;

    const-string v2, "android.permission.READ_PHONE_STATE"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mPhones:[Lcom/huawei/telephony/msim/HuaweiPhone;

    aget-object v1, v1, p1

    invoke-virtual {v1}, Lcom/huawei/telephony/msim/HuaweiPhone;->getRadioState()Lcom/android/internal/telephony/CommandsInterface$RadioState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/CommandsInterface$RadioState;->isOn()Z

    move-result v1

    return v1
.end method

.method public getDemoString(Ljava/lang/Object;)V
    .locals 1
    .parameter "callback"

    .prologue
    iget-object v0, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mPhone:Lcom/huawei/telephony/msim/HuaweiPhone;

    invoke-virtual {v0, p1}, Lcom/huawei/telephony/msim/HuaweiPhone;->getDemoString(Ljava/lang/Object;)V

    return-void
.end method

.method public getDemoStringAsync(Lcom/huawei/telephony/msim/IPhoneCallback;)V
    .locals 0
    .parameter "callback"

    .prologue
    invoke-virtual {p0, p1}, Lcom/huawei/telephony/msim/HuaweiPhoneService;->getDemoString(Ljava/lang/Object;)V

    return-void
.end method

.method public getEsn()Ljava/lang/String;
    .locals 3

    .prologue
    iget-object v0, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.READ_PHONE_STATE"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mPhone:Lcom/huawei/telephony/msim/HuaweiPhone;

    invoke-virtual {v0}, Lcom/huawei/telephony/msim/HuaweiPhone;->getEsn()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMin()Ljava/lang/String;
    .locals 3

    .prologue
    iget-object v0, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.READ_PHONE_STATE"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mPhone:Lcom/huawei/telephony/msim/HuaweiPhone;

    invoke-virtual {v0}, Lcom/huawei/telephony/msim/HuaweiPhone;->getMin()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSlotIdFromSubId(I)I
    .locals 2
    .parameter "subId"

    .prologue
    :try_start_0
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getInstance()Lcom/android/internal/telephony/msim/SubscriptionManager;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getSlotIdFromSubId(I)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    :goto_0
    return v1

    :catch_0
    move-exception v0

    .local v0, ex:Ljava/lang/Exception;
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public getSubidFromSlotId(I)I
    .locals 2
    .parameter "slotId"

    .prologue
    :try_start_0
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getInstance()Lcom/android/internal/telephony/msim/SubscriptionManager;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getSubidFromSlotId(I)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    :goto_0
    return v1

    :catch_0
    move-exception v0

    .local v0, ex:Ljava/lang/Exception;
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public isCTNationRoamingEnable()Z
    .locals 4

    .prologue
    :try_start_0
    invoke-static {}, Lcom/android/internal/telephony/uicc/UiccController;->getInstance()Lcom/android/internal/telephony/uicc/UiccController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/internal/telephony/uicc/UiccController;->isCTNationRoamingEnable()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    :goto_0
    return v1

    :catch_0
    move-exception v0

    .local v0, ex:Ljava/lang/Exception;
    const-string v1, "HuaweiPhoneService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isCTNationRoamingEnable Exception ="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x0

    goto :goto_0
.end method

.method public isCardPresent(I)Z
    .locals 3
    .parameter "slotId"

    .prologue
    const/4 v1, 0x0

    if-ltz p1, :cond_0

    const/4 v2, 0x2

    if-le p1, v2, :cond_1

    :cond_0
    :goto_0
    return v1

    :cond_1
    :try_start_0
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getInstance()Lcom/android/internal/telephony/msim/SubscriptionManager;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isCardPresent(I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    goto :goto_0

    :catch_0
    move-exception v0

    .local v0, ex:Ljava/lang/Exception;
    goto :goto_0
.end method

.method public isSubActive(I)Z
    .locals 5
    .parameter "subId"

    .prologue
    const/4 v1, 0x0

    .local v1, result:Z
    :try_start_0
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getInstance()Lcom/android/internal/telephony/msim/SubscriptionManager;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isSubActive(I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    :goto_0
    return v1

    :catch_0
    move-exception v0

    .local v0, ex:Ljava/lang/Exception;
    const-string v2, "HuaweiPhoneService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isSubActive Exception = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public setPhone(Lcom/android/internal/telephony/Phone;Landroid/content/Context;)V
    .locals 1
    .parameter "phone"
    .parameter "context"

    .prologue
    new-instance v0, Lcom/huawei/telephony/msim/HuaweiPhone;

    invoke-direct {v0, p1}, Lcom/huawei/telephony/msim/HuaweiPhone;-><init>(Lcom/android/internal/telephony/Phone;)V

    iput-object v0, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mPhone:Lcom/huawei/telephony/msim/HuaweiPhone;

    iput-object p2, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mContext:Landroid/content/Context;

    return-void
.end method

.method public setPhone([Lcom/android/internal/telephony/Phone;Landroid/content/Context;)V
    .locals 6
    .parameter "phones"
    .parameter "context"

    .prologue
    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/telephony/MSimTelephonyManager;->getPhoneCount()I

    move-result v2

    .local v2, numPhones:I
    new-array v3, v2, [Lcom/huawei/telephony/msim/HuaweiPhone;

    iput-object v3, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mPhones:[Lcom/huawei/telephony/msim/HuaweiPhone;

    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v2, :cond_0

    const-string v3, "HuaweiPhoneService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Creating huaweiphone sub = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v3, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mPhones:[Lcom/huawei/telephony/msim/HuaweiPhone;

    new-instance v4, Lcom/huawei/telephony/msim/HuaweiPhone;

    aget-object v5, p1, v1

    invoke-direct {v4, v5}, Lcom/huawei/telephony/msim/HuaweiPhone;-><init>(Lcom/android/internal/telephony/Phone;)V

    aput-object v4, v3, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    iget-object v3, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mPhones:[Lcom/huawei/telephony/msim/HuaweiPhone;

    const/4 v4, 0x0

    aget-object v3, v3, v4

    iput-object v3, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mPhone:Lcom/huawei/telephony/msim/HuaweiPhone;

    iput-object p2, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mContext:Landroid/content/Context;

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .local v0, filter:Landroid/content/IntentFilter;
    const-string v3, "android.intent.action.ACTION_RILD_START"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v3, v4, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method public setPreferredNetworkMode(II)V
    .locals 2
    .parameter "subscription"
    .parameter "nwMode"

    .prologue
    iget-object v0, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "preferred_network_mode"

    invoke-static {v0, v1, p1, p2}, Landroid/provider/Settings$Secure;->putIntAtIndex(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    return-void
.end method

.method public setPreferredNetworks(II)Z
    .locals 8
    .parameter "nPrefMode"
    .parameter "nDualMode"

    .prologue
    const/4 v7, 0x4

    const/4 v3, 0x1

    const-string v4, "HuaweiPhoneService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "setPreferredNetworks! nMode="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", Dual mode = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v4, "persist.radio.hw.ctmode"

    const/4 v5, 0x2

    invoke-static {v4, v5}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v2

    .local v2, nOrigMode:I
    iget-object v4, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .local v0, cr:Landroid/content/ContentResolver;
    const-string v4, "gsm_roming"

    const-string v5, "default"

    invoke-static {v0, v4, v5}, Landroid/provider/SettingsEx$Systemex;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    const-string v4, "persist.radio.hw.ctmode"

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    if-eq v7, p1, :cond_0

    const/4 v4, 0x7

    if-ne v4, p1, :cond_1

    :cond_0
    iput v7, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mPrefNet:I

    :goto_0
    iput v2, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mDualMode:I

    iget-object v4, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mMainHandler:Lcom/huawei/telephony/msim/HuaweiPhoneService$MainHandler;

    invoke-virtual {v4, v7}, Lcom/huawei/telephony/msim/HuaweiPhoneService$MainHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .local v1, msg:Landroid/os/Message;
    iget-object v4, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mPhone:Lcom/huawei/telephony/msim/HuaweiPhone;

    invoke-virtual {v4, p1, v1}, Lcom/huawei/telephony/msim/HuaweiPhone;->setPreferredNetworks(ILandroid/os/Message;)V

    .end local v1           #msg:Landroid/os/Message;
    :goto_1
    return v3

    :cond_1
    if-ne v3, p1, :cond_2

    iput v3, p0, Lcom/huawei/telephony/msim/HuaweiPhoneService;->mPrefNet:I

    goto :goto_0

    :cond_2
    const-string v3, "HuaweiPhoneService"

    const-string v4, "invalid value!"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v3, 0x0

    goto :goto_1
.end method
