.class final Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;
.super Lcom/android/internal/util/State;
.source "ConnectivityService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "FmcActiveState"
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

.field private wlanDefault:Landroid/net/RouteInfo;

.field private wwanFmc:Landroid/net/RouteInfo;


# direct methods
.method private constructor <init>(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)V
    .locals 1
    .parameter

    .prologue
    const/4 v0, 0x0

    iput-object p1, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    invoke-direct {p0}, Lcom/android/internal/util/State;-><init>()V

    iput-object v0, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->wlanDefault:Landroid/net/RouteInfo;

    iput-object v0, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->wwanFmc:Landroid/net/RouteInfo;

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;Lcom/android/server/ConnectivityService$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    invoke-direct {p0, p1}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;-><init>(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)V

    return-void
.end method

.method private addRoutes(Landroid/net/LinkProperties;)V
    .locals 5
    .parameter "lp"

    .prologue
    if-nez p1, :cond_1

    :cond_0
    return-void

    :cond_1
    invoke-virtual {p1}, Landroid/net/LinkProperties;->getRoutes()Ljava/util/Collection;

    move-result-object v1

    .local v1, newRoutes:Ljava/util/Collection;,"Ljava/util/Collection<Landroid/net/RouteInfo;>;"
    if-eqz v1, :cond_0

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/RouteInfo;

    .local v2, r:Landroid/net/RouteInfo;
    iget-object v3, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v3, v3, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    const/4 v4, 0x1

    #calls: Lcom/android/server/ConnectivityService;->addRoute(Landroid/net/LinkProperties;Landroid/net/RouteInfo;Z)Z
    invoke-static {v3, p1, v2, v4}, Lcom/android/server/ConnectivityService;->access$6800(Lcom/android/server/ConnectivityService;Landroid/net/LinkProperties;Landroid/net/RouteInfo;Z)Z

    goto :goto_0
.end method

.method private handleConnect(Landroid/os/Message;)Z
    .locals 8
    .parameter "msg"

    .prologue
    const/4 v7, 0x0

    iget-object v4, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v4, v4, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->getCurrentState()Lcom/android/internal/util/IState;
    invoke-static {v6}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$6900(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/internal/util/IState;

    move-result-object v6

    invoke-interface {v6}, Lcom/android/internal/util/IState;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " handle connect"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v4, v5}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Landroid/net/NetworkInfo;

    .local v1, info:Landroid/net/NetworkInfo;
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getType()I

    move-result v3

    .local v3, type:I
    iget-object v4, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v4, v4, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #setter for: Lcom/android/server/ConnectivityService;->mActiveDefaultNetwork:I
    invoke-static {v4, v3}, Lcom/android/server/ConnectivityService;->access$702(Lcom/android/server/ConnectivityService;I)I

    iget-object v4, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v4, v4, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #setter for: Lcom/android/server/ConnectivityService;->mDefaultInetConditionPublished:I
    invoke-static {v4, v7}, Lcom/android/server/ConnectivityService;->access$7002(Lcom/android/server/ConnectivityService;I)I

    iget-object v4, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v4, v4, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    invoke-static {v4}, Lcom/android/server/ConnectivityService;->access$7108(Lcom/android/server/ConnectivityService;)I

    iget-object v4, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v4, v4, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #setter for: Lcom/android/server/ConnectivityService;->mInetConditionChangeInFlight:Z
    invoke-static {v4, v7}, Lcom/android/server/ConnectivityService;->access$7202(Lcom/android/server/ConnectivityService;Z)Z

    iget-object v4, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v4, v4, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mNetTrackers:[Landroid/net/NetworkStateTracker;
    invoke-static {v4}, Lcom/android/server/ConnectivityService;->access$800(Lcom/android/server/ConnectivityService;)[Landroid/net/NetworkStateTracker;

    move-result-object v4

    aget-object v2, v4, v3

    .local v2, thisNet:Landroid/net/NetworkStateTracker;
    invoke-interface {v2, v7}, Landroid/net/NetworkStateTracker;->setTeardownRequested(Z)V

    iget-object v4, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v4, v4, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    invoke-virtual {v4, v2}, Lcom/android/server/ConnectivityService;->updateNetworkSettings(Landroid/net/NetworkStateTracker;)V

    iget-object v4, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v4, v4, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #calls: Lcom/android/server/ConnectivityService;->handleConnectivityChange(IZ)V
    invoke-static {v4, v3, v7}, Lcom/android/server/ConnectivityService;->access$1700(Lcom/android/server/ConnectivityService;IZ)V

    iget-object v4, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v4, v4, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v5, v5, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #calls: Lcom/android/server/ConnectivityService;->getConnectivityChangeDelay()I
    invoke-static {v5}, Lcom/android/server/ConnectivityService;->access$7300(Lcom/android/server/ConnectivityService;)I

    move-result v5

    #calls: Lcom/android/server/ConnectivityService;->sendConnectedBroadcastDelayed(Landroid/net/NetworkInfo;I)V
    invoke-static {v4, v1, v5}, Lcom/android/server/ConnectivityService;->access$7400(Lcom/android/server/ConnectivityService;Landroid/net/NetworkInfo;I)V

    invoke-interface {v2}, Landroid/net/NetworkStateTracker;->getLinkProperties()Landroid/net/LinkProperties;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/LinkProperties;->getInterfaceName()Ljava/lang/String;

    move-result-object v0

    .local v0, iface:Ljava/lang/String;
    if-eqz v0, :cond_0

    :try_start_0
    invoke-static {}, Lcom/android/server/am/BatteryStatsService;->getService()Lcom/android/internal/app/IBatteryStats;

    move-result-object v4

    invoke-interface {v4, v0, v3}, Lcom/android/internal/app/IBatteryStats;->noteNetworkInterfaceType(Ljava/lang/String;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    const/4 v4, 0x1

    return v4

    :catch_0
    move-exception v4

    goto :goto_0
.end method

.method private handleDisconnect(Landroid/os/Message;)Z
    .locals 6
    .parameter "msg"

    .prologue
    const/4 v3, 0x1

    iget-object v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v2, v2, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->getCurrentState()Lcom/android/internal/util/IState;
    invoke-static {v5}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$7500(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/internal/util/IState;

    move-result-object v5

    invoke-interface {v5}, Lcom/android/internal/util/IState;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " handle disconnect"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v2, v4}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/net/NetworkInfo;

    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getType()I

    move-result v1

    .local v1, type:I
    if-nez v1, :cond_0

    iget-object v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v2, v2, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mCurrentLinkProperties:[Landroid/net/LinkProperties;
    invoke-static {v2}, Lcom/android/server/ConnectivityService;->access$6300(Lcom/android/server/ConnectivityService;)[Landroid/net/LinkProperties;

    move-result-object v2

    aget-object v0, v2, v3

    .local v0, curLp:Landroid/net/LinkProperties;
    invoke-direct {p0, v0}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->addRoutes(Landroid/net/LinkProperties;)V

    iget-object v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v2, v2, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #setter for: Lcom/android/server/ConnectivityService;->mActiveDefaultNetwork:I
    invoke-static {v2, v3}, Lcom/android/server/ConnectivityService;->access$702(Lcom/android/server/ConnectivityService;I)I

    iget-object v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->deferMessage(Landroid/os/Message;)V
    invoke-static {v2, p1}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$7600(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;Landroid/os/Message;)V

    iget-object v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v4, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #getter for: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->mFmcInitialState:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcInitialState;
    invoke-static {v4}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$7700(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcInitialState;

    move-result-object v4

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->transitionTo(Lcom/android/internal/util/IState;)V
    invoke-static {v2, v4}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$7800(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;Lcom/android/internal/util/IState;)V

    move v2, v3

    .end local v0           #curLp:Landroid/net/LinkProperties;
    :goto_0
    return v2

    :cond_0
    if-ne v1, v3, :cond_1

    iget-object v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->deferMessage(Landroid/os/Message;)V
    invoke-static {v2, p1}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$7900(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;Landroid/os/Message;)V

    iget-object v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v4, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #getter for: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->mFmcInitialState:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcInitialState;
    invoke-static {v4}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$7700(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcInitialState;

    move-result-object v4

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->transitionTo(Lcom/android/internal/util/IState;)V
    invoke-static {v2, v4}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$8000(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;Lcom/android/internal/util/IState;)V

    move v2, v3

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private removeRoutes(Landroid/net/LinkProperties;)V
    .locals 5
    .parameter "lp"

    .prologue
    if-nez p1, :cond_1

    :cond_0
    return-void

    :cond_1
    invoke-virtual {p1}, Landroid/net/LinkProperties;->getRoutes()Ljava/util/Collection;

    move-result-object v0

    .local v0, curRoutes:Ljava/util/Collection;,"Ljava/util/Collection<Landroid/net/RouteInfo;>;"
    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/RouteInfo;

    .local v2, r:Landroid/net/RouteInfo;
    iget-object v3, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v3, v3, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    const/4 v4, 0x1

    #calls: Lcom/android/server/ConnectivityService;->removeRoute(Landroid/net/LinkProperties;Landroid/net/RouteInfo;Z)Z
    invoke-static {v3, p1, v2, v4}, Lcom/android/server/ConnectivityService;->access$6700(Lcom/android/server/ConnectivityService;Landroid/net/LinkProperties;Landroid/net/RouteInfo;Z)Z

    goto :goto_0
.end method


# virtual methods
.method public enter()V
    .locals 4

    .prologue
    iget-object v1, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v1, v1, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ConnectivityServiceHSM entering "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->getCurrentState()Lcom/android/internal/util/IState;
    invoke-static {v3}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$6200(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/internal/util/IState;

    move-result-object v3

    invoke-interface {v3}, Lcom/android/internal/util/IState;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v1, v2}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v1, v1, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mCurrentLinkProperties:[Landroid/net/LinkProperties;
    invoke-static {v1}, Lcom/android/server/ConnectivityService;->access$6300(Lcom/android/server/ConnectivityService;)[Landroid/net/LinkProperties;

    move-result-object v1

    const/4 v2, 0x1

    aget-object v0, v1, v2

    .local v0, curLp:Landroid/net/LinkProperties;
    invoke-direct {p0, v0}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->removeRoutes(Landroid/net/LinkProperties;)V

    return-void
.end method

.method public exit()V
    .locals 3

    .prologue
    iget-object v0, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ConnectivityServiceHSM leaving "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->getCurrentState()Lcom/android/internal/util/IState;
    invoke-static {v2}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$6400(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/internal/util/IState;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/util/IState;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    return-void
.end method

.method public processMessage(Landroid/os/Message;)Z
    .locals 4
    .parameter "msg"

    .prologue
    iget-object v1, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v1, v1, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->getCurrentState()Lcom/android/internal/util/IState;
    invoke-static {v3}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$6500(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/internal/util/IState;

    move-result-object v3

    invoke-interface {v3}, Lcom/android/internal/util/IState;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".processMessage what="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p1, Landroid/os/Message;->what:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v1, v2}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    const/4 v0, 0x0

    .local v0, ret:Z
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    iget-object v1, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v1, v1, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->getCurrentState()Lcom/android/internal/util/IState;
    invoke-static {v3}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$6600(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/internal/util/IState;

    move-result-object v3

    invoke-interface {v3}, Lcom/android/internal/util/IState;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " handle disconnect"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v1, v2}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    :goto_0
    return v0

    :pswitch_0
    invoke-direct {p0, p1}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->handleConnect(Landroid/os/Message;)Z

    move-result v0

    goto :goto_0

    :pswitch_1
    invoke-direct {p0, p1}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$FmcActiveState;->handleDisconnect(Landroid/os/Message;)Z

    move-result v0

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1389
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
