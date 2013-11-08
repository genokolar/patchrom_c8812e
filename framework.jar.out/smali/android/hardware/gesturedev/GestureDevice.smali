.class public Landroid/hardware/gesturedev/GestureDevice;
.super Ljava/lang/Object;
.source "GestureDevice.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/hardware/gesturedev/GestureDevice$ErrorCallback;,
        Landroid/hardware/gesturedev/GestureDevice$GestureListener;,
        Landroid/hardware/gesturedev/GestureDevice$EventHandler;
    }
.end annotation


# static fields
.field public static final GESTURE_ERROR_SERVER_DIED:I = 0x64

.field public static final GESTURE_ERROR_UNKNOWN:I = 0x1

.field private static final GESTURE_MSG_ALL_MSGS:I = 0xfff

.field private static final GESTURE_MSG_ERROR:I = 0x1

.field private static final GESTURE_MSG_GESTURE:I = 0x2

.field private static final TAG:Ljava/lang/String; = "GestureDevice"

.field private static mDeviceList:[Landroid/hardware/gesturedev/GestureDevice;

.field private static mNumOfDevice:I

.field private static mRefCountList:[I


# instance fields
.field private mDeviceId:I

.field private mErrorCBList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/hardware/gesturedev/GestureDevice$ErrorCallback;",
            ">;"
        }
    .end annotation
.end field

.field private mEventHandler:Landroid/hardware/gesturedev/GestureDevice$EventHandler;

.field private mGestureRunning:Z

.field private mListenerList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/hardware/gesturedev/GestureDevice$GestureListener;",
            ">;"
        }
    .end annotation
.end field

.field private mNativeContext:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    sput-object v0, Landroid/hardware/gesturedev/GestureDevice;->mDeviceList:[Landroid/hardware/gesturedev/GestureDevice;

    sput-object v0, Landroid/hardware/gesturedev/GestureDevice;->mRefCountList:[I

    const/4 v0, 0x0

    sput v0, Landroid/hardware/gesturedev/GestureDevice;->mNumOfDevice:I

    return-void
.end method

.method private constructor <init>(I)V
    .locals 3
    .parameter "deviceId"

    .prologue
    const/4 v2, 0x0

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Landroid/hardware/gesturedev/GestureDevice;->mEventHandler:Landroid/hardware/gesturedev/GestureDevice$EventHandler;

    iput-object v2, p0, Landroid/hardware/gesturedev/GestureDevice;->mErrorCBList:Ljava/util/ArrayList;

    iput-object v2, p0, Landroid/hardware/gesturedev/GestureDevice;->mListenerList:Ljava/util/ArrayList;

    const/4 v1, 0x0

    iput-boolean v1, p0, Landroid/hardware/gesturedev/GestureDevice;->mGestureRunning:Z

    iput p1, p0, Landroid/hardware/gesturedev/GestureDevice;->mDeviceId:I

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    .local v0, looper:Landroid/os/Looper;
    if-eqz v0, :cond_0

    new-instance v1, Landroid/hardware/gesturedev/GestureDevice$EventHandler;

    invoke-direct {v1, p0, p0, v0}, Landroid/hardware/gesturedev/GestureDevice$EventHandler;-><init>(Landroid/hardware/gesturedev/GestureDevice;Landroid/hardware/gesturedev/GestureDevice;Landroid/os/Looper;)V

    iput-object v1, p0, Landroid/hardware/gesturedev/GestureDevice;->mEventHandler:Landroid/hardware/gesturedev/GestureDevice$EventHandler;

    :goto_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Landroid/hardware/gesturedev/GestureDevice;->mErrorCBList:Ljava/util/ArrayList;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Landroid/hardware/gesturedev/GestureDevice;->mListenerList:Ljava/util/ArrayList;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-direct {p0, v1, p1}, Landroid/hardware/gesturedev/GestureDevice;->native_setup(Ljava/lang/Object;I)V

    return-void

    :cond_0
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    if-eqz v0, :cond_1

    new-instance v1, Landroid/hardware/gesturedev/GestureDevice$EventHandler;

    invoke-direct {v1, p0, p0, v0}, Landroid/hardware/gesturedev/GestureDevice$EventHandler;-><init>(Landroid/hardware/gesturedev/GestureDevice;Landroid/hardware/gesturedev/GestureDevice;Landroid/os/Looper;)V

    iput-object v1, p0, Landroid/hardware/gesturedev/GestureDevice;->mEventHandler:Landroid/hardware/gesturedev/GestureDevice$EventHandler;

    goto :goto_0

    :cond_1
    iput-object v2, p0, Landroid/hardware/gesturedev/GestureDevice;->mEventHandler:Landroid/hardware/gesturedev/GestureDevice$EventHandler;

    goto :goto_0
.end method

.method static synthetic access$000(Landroid/hardware/gesturedev/GestureDevice;)Ljava/util/ArrayList;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Landroid/hardware/gesturedev/GestureDevice;->mListenerList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Landroid/hardware/gesturedev/GestureDevice;)Ljava/util/ArrayList;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Landroid/hardware/gesturedev/GestureDevice;->mErrorCBList:Ljava/util/ArrayList;

    return-object v0
.end method

.method public static declared-synchronized close(Landroid/hardware/gesturedev/GestureDevice;)V
    .locals 4
    .parameter "device"

    .prologue
    const-class v2, Landroid/hardware/gesturedev/GestureDevice;

    monitor-enter v2

    :try_start_0
    iget v0, p0, Landroid/hardware/gesturedev/GestureDevice;->mDeviceId:I

    .local v0, deviceId:I
    sget-object v1, Landroid/hardware/gesturedev/GestureDevice;->mRefCountList:[I

    if-eqz v1, :cond_0

    sget-object v1, Landroid/hardware/gesturedev/GestureDevice;->mDeviceList:[Landroid/hardware/gesturedev/GestureDevice;

    if-eqz v1, :cond_0

    sget-object v1, Landroid/hardware/gesturedev/GestureDevice;->mRefCountList:[I

    aget v3, v1, v0

    add-int/lit8 v3, v3, -0x1

    aput v3, v1, v0

    sget-object v1, Landroid/hardware/gesturedev/GestureDevice;->mRefCountList:[I

    aget v1, v1, v0

    if-nez v1, :cond_1

    invoke-direct {p0}, Landroid/hardware/gesturedev/GestureDevice;->release()V

    sget-object v1, Landroid/hardware/gesturedev/GestureDevice;->mDeviceList:[Landroid/hardware/gesturedev/GestureDevice;

    const/4 v3, 0x0

    aput-object v3, v1, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    :goto_0
    monitor-exit v2

    return-void

    :cond_1
    :try_start_1
    sget-object v1, Landroid/hardware/gesturedev/GestureDevice;->mRefCountList:[I

    aget v1, v1, v0

    if-gez v1, :cond_0

    sget-object v1, Landroid/hardware/gesturedev/GestureDevice;->mRefCountList:[I

    const/4 v3, 0x0

    aput v3, v1, v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .end local v0           #deviceId:I
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static native getNumberOfGestureDevices()I
.end method

.method private final native native_getParameters()Ljava/lang/String;
.end method

.method private final native native_release()V
.end method

.method private final native native_setParameters(Ljava/lang/String;)V
.end method

.method private final native native_setup(Ljava/lang/Object;I)V
.end method

.method private final native native_startGesture()V
.end method

.method private final native native_stopGesture()V
.end method

.method public static declared-synchronized open(I)Landroid/hardware/gesturedev/GestureDevice;
    .locals 3
    .parameter "deviceId"

    .prologue
    const-class v1, Landroid/hardware/gesturedev/GestureDevice;

    monitor-enter v1

    :try_start_0
    sget v0, Landroid/hardware/gesturedev/GestureDevice;->mNumOfDevice:I

    if-nez v0, :cond_0

    invoke-static {}, Landroid/hardware/gesturedev/GestureDevice;->getNumberOfGestureDevices()I

    move-result v0

    sput v0, Landroid/hardware/gesturedev/GestureDevice;->mNumOfDevice:I

    :cond_0
    sget-object v0, Landroid/hardware/gesturedev/GestureDevice;->mDeviceList:[Landroid/hardware/gesturedev/GestureDevice;

    if-nez v0, :cond_1

    sget v0, Landroid/hardware/gesturedev/GestureDevice;->mNumOfDevice:I

    if-lez v0, :cond_1

    sget v0, Landroid/hardware/gesturedev/GestureDevice;->mNumOfDevice:I

    new-array v0, v0, [Landroid/hardware/gesturedev/GestureDevice;

    sput-object v0, Landroid/hardware/gesturedev/GestureDevice;->mDeviceList:[Landroid/hardware/gesturedev/GestureDevice;

    sget v0, Landroid/hardware/gesturedev/GestureDevice;->mNumOfDevice:I

    new-array v0, v0, [I

    sput-object v0, Landroid/hardware/gesturedev/GestureDevice;->mRefCountList:[I

    :cond_1
    if-ltz p0, :cond_2

    sget v0, Landroid/hardware/gesturedev/GestureDevice;->mNumOfDevice:I

    if-lt p0, v0, :cond_3

    :cond_2
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v2, "Invalid device ID"

    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_3
    :try_start_1
    sget-object v0, Landroid/hardware/gesturedev/GestureDevice;->mDeviceList:[Landroid/hardware/gesturedev/GestureDevice;

    aget-object v0, v0, p0

    if-nez v0, :cond_4

    sget-object v0, Landroid/hardware/gesturedev/GestureDevice;->mDeviceList:[Landroid/hardware/gesturedev/GestureDevice;

    new-instance v2, Landroid/hardware/gesturedev/GestureDevice;

    invoke-direct {v2, p0}, Landroid/hardware/gesturedev/GestureDevice;-><init>(I)V

    aput-object v2, v0, p0

    sget-object v0, Landroid/hardware/gesturedev/GestureDevice;->mRefCountList:[I

    const/4 v2, 0x0

    aput v2, v0, p0

    :cond_4
    sget-object v0, Landroid/hardware/gesturedev/GestureDevice;->mRefCountList:[I

    aget v2, v0, p0

    add-int/lit8 v2, v2, 0x1

    aput v2, v0, p0

    sget-object v0, Landroid/hardware/gesturedev/GestureDevice;->mDeviceList:[Landroid/hardware/gesturedev/GestureDevice;

    aget-object v0, v0, p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v1

    return-object v0
.end method

.method private static postEventFromNative(Ljava/lang/Object;IIILjava/lang/Object;)V
    .locals 3
    .parameter "gesture_ref"
    .parameter "what"
    .parameter "arg1"
    .parameter "arg2"
    .parameter "obj"

    .prologue
    check-cast p0, Ljava/lang/ref/WeakReference;

    .end local p0
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/gesturedev/GestureDevice;

    .local v0, c:Landroid/hardware/gesturedev/GestureDevice;
    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v2, v0, Landroid/hardware/gesturedev/GestureDevice;->mEventHandler:Landroid/hardware/gesturedev/GestureDevice$EventHandler;

    if-eqz v2, :cond_0

    iget-object v2, v0, Landroid/hardware/gesturedev/GestureDevice;->mEventHandler:Landroid/hardware/gesturedev/GestureDevice$EventHandler;

    invoke-virtual {v2, p1, p2, p3, p4}, Landroid/hardware/gesturedev/GestureDevice$EventHandler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    .local v1, m:Landroid/os/Message;
    iget-object v2, v0, Landroid/hardware/gesturedev/GestureDevice;->mEventHandler:Landroid/hardware/gesturedev/GestureDevice$EventHandler;

    invoke-virtual {v2, v1}, Landroid/hardware/gesturedev/GestureDevice$EventHandler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0
.end method

.method private release()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    iget-object v0, p0, Landroid/hardware/gesturedev/GestureDevice;->mErrorCBList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/hardware/gesturedev/GestureDevice;->mErrorCBList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iput-object v1, p0, Landroid/hardware/gesturedev/GestureDevice;->mErrorCBList:Ljava/util/ArrayList;

    :cond_0
    iget-object v0, p0, Landroid/hardware/gesturedev/GestureDevice;->mListenerList:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/hardware/gesturedev/GestureDevice;->mListenerList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iput-object v1, p0, Landroid/hardware/gesturedev/GestureDevice;->mListenerList:Ljava/util/ArrayList;

    :cond_1
    invoke-direct {p0}, Landroid/hardware/gesturedev/GestureDevice;->native_release()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/hardware/gesturedev/GestureDevice;->mGestureRunning:Z

    return-void
.end method


# virtual methods
.method protected finalize()V
    .locals 0

    .prologue
    invoke-direct {p0}, Landroid/hardware/gesturedev/GestureDevice;->release()V

    return-void
.end method

.method public declared-synchronized getParameters()Landroid/hardware/gesturedev/GestureParameters;
    .locals 5

    .prologue
    monitor-enter p0

    :try_start_0
    new-instance v0, Landroid/hardware/gesturedev/GestureParameters;

    invoke-direct {v0}, Landroid/hardware/gesturedev/GestureParameters;-><init>()V

    .local v0, p:Landroid/hardware/gesturedev/GestureParameters;
    invoke-direct {p0}, Landroid/hardware/gesturedev/GestureDevice;->native_getParameters()Ljava/lang/String;

    move-result-object v1

    .local v1, s:Ljava/lang/String;
    const-string v2, "GestureDevice"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getParameter: ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0, v1}, Landroid/hardware/gesturedev/GestureParameters;->unflatten(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .end local v0           #p:Landroid/hardware/gesturedev/GestureParameters;
    .end local v1           #s:Ljava/lang/String;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized registerErrorCallback(Landroid/hardware/gesturedev/GestureDevice$ErrorCallback;Z)V
    .locals 1
    .parameter "cb"
    .parameter "reg"

    .prologue
    monitor-enter p0

    if-eqz p2, :cond_0

    :try_start_0
    iget-object v0, p0, Landroid/hardware/gesturedev/GestureDevice;->mErrorCBList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Landroid/hardware/gesturedev/GestureDevice;->mErrorCBList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized registerGestureListener(Landroid/hardware/gesturedev/GestureDevice$GestureListener;Z)V
    .locals 1
    .parameter "listener"
    .parameter "reg"

    .prologue
    monitor-enter p0

    if-eqz p2, :cond_0

    :try_start_0
    iget-object v0, p0, Landroid/hardware/gesturedev/GestureDevice;->mListenerList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Landroid/hardware/gesturedev/GestureDevice;->mListenerList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setParameters(Landroid/hardware/gesturedev/GestureParameters;)V
    .locals 1
    .parameter "params"

    .prologue
    monitor-enter p0

    :try_start_0
    invoke-virtual {p1}, Landroid/hardware/gesturedev/GestureParameters;->flatten()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/hardware/gesturedev/GestureDevice;->native_setParameters(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized startGesture()V
    .locals 2

    .prologue
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Landroid/hardware/gesturedev/GestureDevice;->mGestureRunning:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Gesture is already running"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_0
    :try_start_1
    invoke-direct {p0}, Landroid/hardware/gesturedev/GestureDevice;->native_startGesture()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/hardware/gesturedev/GestureDevice;->mGestureRunning:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void
.end method

.method public declared-synchronized stopGesture()V
    .locals 1

    .prologue
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Landroid/hardware/gesturedev/GestureDevice;->native_stopGesture()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/hardware/gesturedev/GestureDevice;->mGestureRunning:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
