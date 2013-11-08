.class Lcom/android/server/WifiService$1;
.super Landroid/content/BroadcastReceiver;
.source "WifiService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/WifiService;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/WifiService;


# direct methods
.method constructor <init>(Lcom/android/server/WifiService;)V
    .locals 0
    .parameter

    .prologue
    iput-object p1, p0, Lcom/android/server/WifiService$1;->this$0:Lcom/android/server/WifiService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .parameter "context"
    .parameter "intent"

    .prologue
    iget-object v1, p0, Lcom/android/server/WifiService$1;->this$0:Lcom/android/server/WifiService;

    #getter for: Lcom/android/server/WifiService;->mAirplaneModeOn:Ljava/util/concurrent/atomic/AtomicBoolean;
    invoke-static {v1}, Lcom/android/server/WifiService;->access$900(Lcom/android/server/WifiService;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/WifiService$1;->this$0:Lcom/android/server/WifiService;

    #calls: Lcom/android/server/WifiService;->isAirplaneModeOn()Z
    invoke-static {v2}, Lcom/android/server/WifiService;->access$800(Lcom/android/server/WifiService;)Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v1, p0, Lcom/android/server/WifiService$1;->this$0:Lcom/android/server/WifiService;

    iget-object v2, p0, Lcom/android/server/WifiService$1;->this$0:Lcom/android/server/WifiService;

    #getter for: Lcom/android/server/WifiService;->mAirplaneModeOn:Ljava/util/concurrent/atomic/AtomicBoolean;
    invoke-static {v2}, Lcom/android/server/WifiService;->access$900(Lcom/android/server/WifiService;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    #calls: Lcom/android/server/WifiService;->handleAirplaneModeToggled(Z)V
    invoke-static {v1, v2}, Lcom/android/server/WifiService;->access$1000(Lcom/android/server/WifiService;Z)V

    const-string v1, "state"

    const/4 v2, 0x0

    invoke-virtual {p2, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "dz"

    const-string v2, "ro.config.cplusw.solution"

    const-string v3, "unknown"

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/server/WifiService$1;->this$0:Lcom/android/server/WifiService;

    #getter for: Lcom/android/server/WifiService;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/android/server/WifiService;->access$200(Lcom/android/server/WifiService;)Landroid/content/Context;

    move-result-object v1

    const-string v2, "wifi"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiManager;

    .local v0, mWifiManager:Landroid/net/wifi/WifiManager;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->requestCpluswStop()V

    .end local v0           #mWifiManager:Landroid/net/wifi/WifiManager;
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/android/server/WifiService$1;->this$0:Lcom/android/server/WifiService;

    #calls: Lcom/android/server/WifiService;->updateWifiState()V
    invoke-static {v1}, Lcom/android/server/WifiService;->access$1100(Lcom/android/server/WifiService;)V

    return-void

    :cond_1
    iget-object v1, p0, Lcom/android/server/WifiService$1;->this$0:Lcom/android/server/WifiService;

    invoke-virtual {v1}, Lcom/android/server/WifiService;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    move-result-object v1

    const-string v2, "16"

    invoke-static {v1, v2}, Landroid/net/wifi/WifiManager;->ctcApSendCmd2Cpwd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
