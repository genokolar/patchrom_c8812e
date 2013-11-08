.class Lcom/android/server/ConnectivityService$2;
.super Landroid/content/BroadcastReceiver;
.source "ConnectivityService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/ConnectivityService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/ConnectivityService;


# direct methods
.method constructor <init>(Lcom/android/server/ConnectivityService;)V
    .locals 0
    .parameter

    .prologue
    iput-object p1, p0, Lcom/android/server/ConnectivityService$2;->this$0:Lcom/android/server/ConnectivityService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 11
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v9, 0x1

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .local v0, action:Ljava/lang/String;
    const-string v8, "android.intent.action.SCREEN_ON"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    iget-object v8, p0, Lcom/android/server/ConnectivityService$2;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mPowerSavingLock:Ljava/lang/Object;
    invoke-static {v8}, Lcom/android/server/ConnectivityService;->access$14200(Lcom/android/server/ConnectivityService;)Ljava/lang/Object;

    move-result-object v9

    monitor-enter v9

    :try_start_0
    iget-object v8, p0, Lcom/android/server/ConnectivityService$2;->this$0:Lcom/android/server/ConnectivityService;

    const-string v10, "receive screen on intent!"

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v8, v10}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    iget-object v8, p0, Lcom/android/server/ConnectivityService$2;->this$0:Lcom/android/server/ConnectivityService;

    iget-boolean v8, v8, Lcom/android/server/ConnectivityService;->mStartPowerSaving:Z

    if-eqz v8, :cond_0

    iget-object v8, p0, Lcom/android/server/ConnectivityService$2;->this$0:Lcom/android/server/ConnectivityService;

    const-string v10, "stop powersaving action!"

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v8, v10}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    iget-object v8, p0, Lcom/android/server/ConnectivityService$2;->this$0:Lcom/android/server/ConnectivityService;

    #calls: Lcom/android/server/ConnectivityService;->cancelPowerSaving()V
    invoke-static {v8}, Lcom/android/server/ConnectivityService;->access$14300(Lcom/android/server/ConnectivityService;)V

    iget-object v8, p0, Lcom/android/server/ConnectivityService$2;->this$0:Lcom/android/server/ConnectivityService;

    const/4 v10, 0x0

    iput-boolean v10, v8, Lcom/android/server/ConnectivityService;->mStartPowerSaving:Z

    :cond_0
    monitor-exit v9

    :cond_1
    :goto_0
    return-void

    :catchall_0
    move-exception v8

    monitor-exit v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v8

    :cond_2
    const-string v8, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_7

    iget-object v8, p0, Lcom/android/server/ConnectivityService$2;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mPowerSavingLock:Ljava/lang/Object;
    invoke-static {v8}, Lcom/android/server/ConnectivityService;->access$14200(Lcom/android/server/ConnectivityService;)Ljava/lang/Object;

    move-result-object v9

    monitor-enter v9

    :try_start_1
    iget-object v8, p0, Lcom/android/server/ConnectivityService$2;->this$0:Lcom/android/server/ConnectivityService;

    const-string v10, "receive screen off intent!"

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v8, v10}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    const/4 v3, 0x0

    .local v3, isDataConnected:Z
    iget-object v8, p0, Lcom/android/server/ConnectivityService$2;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mNetTrackers:[Landroid/net/NetworkStateTracker;
    invoke-static {v8}, Lcom/android/server/ConnectivityService;->access$800(Lcom/android/server/ConnectivityService;)[Landroid/net/NetworkStateTracker;

    move-result-object v1

    .local v1, arr$:[Landroid/net/NetworkStateTracker;
    array-length v4, v1

    .local v4, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_1
    if-ge v2, v4, :cond_5

    aget-object v6, v1, v2

    .local v6, nt:Landroid/net/NetworkStateTracker;
    if-nez v6, :cond_4

    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_4
    invoke-interface {v6}, Landroid/net/NetworkStateTracker;->getNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v8

    invoke-virtual {v8}, Landroid/net/NetworkInfo;->getType()I

    move-result v5

    .local v5, netType:I
    iget-object v8, p0, Lcom/android/server/ConnectivityService$2;->this$0:Lcom/android/server/ConnectivityService;

    iget-object v8, v8, Lcom/android/server/ConnectivityService;->mNetConfigs:[Landroid/net/NetworkConfig;

    aget-object v8, v8, v5

    iget v8, v8, Landroid/net/NetworkConfig;->radio:I

    if-nez v8, :cond_3

    invoke-interface {v6}, Landroid/net/NetworkStateTracker;->isAvailable()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-interface {v6}, Landroid/net/NetworkStateTracker;->getNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v8

    invoke-virtual {v8}, Landroid/net/NetworkInfo;->isConnectedOrConnecting()Z

    move-result v8

    if-eqz v8, :cond_3

    const/4 v3, 0x1

    iget-object v8, p0, Lcom/android/server/ConnectivityService$2;->this$0:Lcom/android/server/ConnectivityService;

    const-string v10, "mobile data connected!"

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v8, v10}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    .end local v5           #netType:I
    .end local v6           #nt:Landroid/net/NetworkStateTracker;
    :cond_5
    iget-object v8, p0, Lcom/android/server/ConnectivityService$2;->this$0:Lcom/android/server/ConnectivityService;

    invoke-virtual {v8}, Lcom/android/server/ConnectivityService;->getMobileDataEnabled()Z

    move-result v8

    if-eqz v8, :cond_6

    iget-object v8, p0, Lcom/android/server/ConnectivityService$2;->this$0:Lcom/android/server/ConnectivityService;

    #calls: Lcom/android/server/ConnectivityService;->getPowerSavingState()Z
    invoke-static {v8}, Lcom/android/server/ConnectivityService;->access$14400(Lcom/android/server/ConnectivityService;)Z

    move-result v8

    if-eqz v8, :cond_6

    if-eqz v3, :cond_6

    iget-object v8, p0, Lcom/android/server/ConnectivityService$2;->this$0:Lcom/android/server/ConnectivityService;

    iget-boolean v8, v8, Lcom/android/server/ConnectivityService;->mStartPowerSaving:Z

    if-nez v8, :cond_6

    iget-object v8, p0, Lcom/android/server/ConnectivityService$2;->this$0:Lcom/android/server/ConnectivityService;

    const-string v10, "start powersaving action!"

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v8, v10}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    iget-object v8, p0, Lcom/android/server/ConnectivityService$2;->this$0:Lcom/android/server/ConnectivityService;

    #calls: Lcom/android/server/ConnectivityService;->tryPowerSaving()V
    invoke-static {v8}, Lcom/android/server/ConnectivityService;->access$14500(Lcom/android/server/ConnectivityService;)V

    iget-object v8, p0, Lcom/android/server/ConnectivityService$2;->this$0:Lcom/android/server/ConnectivityService;

    const/4 v10, 0x1

    iput-boolean v10, v8, Lcom/android/server/ConnectivityService;->mStartPowerSaving:Z

    :cond_6
    monitor-exit v9

    goto :goto_0

    .end local v1           #arr$:[Landroid/net/NetworkStateTracker;
    .end local v2           #i$:I
    .end local v3           #isDataConnected:Z
    .end local v4           #len$:I
    :catchall_1
    move-exception v8

    monitor-exit v9
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw v8

    :cond_7
    const-string v8, "android.telephony.turnoff_DC"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    sget-boolean v8, Lcom/android/server/ConnectivityService;->useCtrlSocket:Z

    if-eqz v8, :cond_8

    const/16 v8, 0x64

    invoke-static {v8, v9}, Ldalvik/system/Zygote;->ctrlSockets(II)I

    move-result v7

    .local v7, retVal:I
    const-string v8, "ConnectivityService"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "INTENT_TURNOFF_DC retVal: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-nez v7, :cond_1

    const-string v8, "ConnectivityService"

    const-string v9, "turn off Data Connection!"

    invoke-static {v8, v9}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v8, p0, Lcom/android/server/ConnectivityService$2;->this$0:Lcom/android/server/ConnectivityService;

    #calls: Lcom/android/server/ConnectivityService;->turnoffDC()V
    invoke-static {v8}, Lcom/android/server/ConnectivityService;->access$14600(Lcom/android/server/ConnectivityService;)V

    goto/16 :goto_0

    .end local v7           #retVal:I
    :cond_8
    iget-object v8, p0, Lcom/android/server/ConnectivityService$2;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mPowerSavingLock:Ljava/lang/Object;
    invoke-static {v8}, Lcom/android/server/ConnectivityService;->access$14200(Lcom/android/server/ConnectivityService;)Ljava/lang/Object;

    move-result-object v9

    monitor-enter v9

    :try_start_2
    iget-object v8, p0, Lcom/android/server/ConnectivityService$2;->this$0:Lcom/android/server/ConnectivityService;

    iget-boolean v8, v8, Lcom/android/server/ConnectivityService;->mStartPowerSaving:Z

    if-eqz v8, :cond_9

    const-string v8, "ConnectivityService"

    const-string v10, "turn off Data Connection!"

    invoke-static {v8, v10}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v8, p0, Lcom/android/server/ConnectivityService$2;->this$0:Lcom/android/server/ConnectivityService;

    #calls: Lcom/android/server/ConnectivityService;->turnoffDC()V
    invoke-static {v8}, Lcom/android/server/ConnectivityService;->access$14600(Lcom/android/server/ConnectivityService;)V

    :cond_9
    monitor-exit v9

    goto/16 :goto_0

    :catchall_2
    move-exception v8

    monitor-exit v9
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    throw v8
.end method
