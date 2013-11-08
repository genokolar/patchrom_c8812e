.class abstract Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;
.super Lcom/android/internal/util/State;
.source "ConnectivityService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "DualConnectivityState"
.end annotation


# instance fields
.field protected mOtherDefaultConnectionSequence:I

.field protected mOtherDefaultInetCondition:I

.field protected mOtherDefaultInetConditionPublished:I

.field protected mOtherInetConditionChangeInFlight:Z

.field protected myDefaultNet:I

.field protected otherDefaultNet:I

.field final synthetic this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;


# direct methods
.method private constructor <init>(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)V
    .locals 1
    .parameter

    .prologue
    const/4 v0, 0x0

    iput-object p1, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    invoke-direct {p0}, Lcom/android/internal/util/State;-><init>()V

    iput v0, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->mOtherDefaultInetCondition:I

    iput v0, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->mOtherDefaultInetConditionPublished:I

    iput v0, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->mOtherDefaultConnectionSequence:I

    iput-boolean v0, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->mOtherInetConditionChangeInFlight:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;Lcom/android/server/ConnectivityService$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    invoke-direct {p0, p1}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;-><init>(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)V

    return-void
.end method

.method private handleConnectivityChange(IZ)V
    .locals 13
    .parameter "netType"
    .parameter "doReset"

    .prologue
    iget-object v10, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v10, v10, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v12, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->getCurrentState()Lcom/android/internal/util/IState;
    invoke-static {v12}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$13100(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/internal/util/IState;

    move-result-object v12

    invoke-interface {v12}, Lcom/android/internal/util/IState;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " handleConnectivityChange"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v10, v11}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    if-eqz p2, :cond_3

    const/4 v9, 0x3

    .local v9, resetMask:I
    :goto_0
    invoke-virtual {p0, p1}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->handleDnsConfigurationChange(I)V

    iget-object v10, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v10, v10, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mCurrentLinkProperties:[Landroid/net/LinkProperties;
    invoke-static {v10}, Lcom/android/server/ConnectivityService;->access$6300(Lcom/android/server/ConnectivityService;)[Landroid/net/LinkProperties;

    move-result-object v10

    aget-object v1, v10, p1

    .local v1, curLp:Landroid/net/LinkProperties;
    const/4 v7, 0x0

    .local v7, newLp:Landroid/net/LinkProperties;
    iget-object v10, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v10, v10, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mNetTrackers:[Landroid/net/NetworkStateTracker;
    invoke-static {v10}, Lcom/android/server/ConnectivityService;->access$800(Lcom/android/server/ConnectivityService;)[Landroid/net/NetworkStateTracker;

    move-result-object v10

    aget-object v10, v10, p1

    invoke-interface {v10}, Landroid/net/NetworkStateTracker;->getNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v10

    invoke-virtual {v10}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v10

    if-eqz v10, :cond_d

    iget-object v10, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v10, v10, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mNetTrackers:[Landroid/net/NetworkStateTracker;
    invoke-static {v10}, Lcom/android/server/ConnectivityService;->access$800(Lcom/android/server/ConnectivityService;)[Landroid/net/NetworkStateTracker;

    move-result-object v10

    aget-object v10, v10, p1

    invoke-interface {v10}, Landroid/net/NetworkStateTracker;->getLinkProperties()Landroid/net/LinkProperties;

    move-result-object v7

    iget-object v10, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v10, v10, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "handleConnectivityChange: changed linkProperty["

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "]:"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " doReset="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " resetMask="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "\n   curLp="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "\n   newLp="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v10, v11}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    if-eqz v1, :cond_5

    invoke-virtual {v1, v7}, Landroid/net/LinkProperties;->isIdenticalInterfaceName(Landroid/net/LinkProperties;)Z

    move-result v10

    if-eqz v10, :cond_c

    invoke-virtual {v1, v7}, Landroid/net/LinkProperties;->compareAddresses(Landroid/net/LinkProperties;)Landroid/net/LinkProperties$CompareResult;

    move-result-object v0

    .local v0, car:Landroid/net/LinkProperties$CompareResult;,"Landroid/net/LinkProperties$CompareResult<Landroid/net/LinkAddress;>;"
    iget-object v10, v0, Landroid/net/LinkProperties$CompareResult;->removed:Ljava/util/Collection;

    invoke-interface {v10}, Ljava/util/Collection;->size()I

    move-result v10

    if-nez v10, :cond_0

    iget-object v10, v0, Landroid/net/LinkProperties$CompareResult;->added:Ljava/util/Collection;

    invoke-interface {v10}, Ljava/util/Collection;->size()I

    move-result v10

    if-eqz v10, :cond_b

    :cond_0
    iget-object v10, v0, Landroid/net/LinkProperties$CompareResult;->removed:Ljava/util/Collection;

    invoke-interface {v10}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/net/LinkAddress;

    .local v5, linkAddr:Landroid/net/LinkAddress;
    invoke-virtual {v5}, Landroid/net/LinkAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v10

    instance-of v10, v10, Ljava/net/Inet4Address;

    if-eqz v10, :cond_2

    or-int/lit8 v9, v9, 0x1

    :cond_2
    invoke-virtual {v5}, Landroid/net/LinkAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v10

    instance-of v10, v10, Ljava/net/Inet6Address;

    if-eqz v10, :cond_1

    or-int/lit8 v9, v9, 0x2

    goto :goto_1

    .end local v0           #car:Landroid/net/LinkProperties$CompareResult;,"Landroid/net/LinkProperties$CompareResult<Landroid/net/LinkAddress;>;"
    .end local v1           #curLp:Landroid/net/LinkProperties;
    .end local v3           #i$:Ljava/util/Iterator;
    .end local v5           #linkAddr:Landroid/net/LinkAddress;
    .end local v7           #newLp:Landroid/net/LinkProperties;
    .end local v9           #resetMask:I
    :cond_3
    const/4 v9, 0x0

    goto/16 :goto_0

    .restart local v0       #car:Landroid/net/LinkProperties$CompareResult;,"Landroid/net/LinkProperties$CompareResult<Landroid/net/LinkAddress;>;"
    .restart local v1       #curLp:Landroid/net/LinkProperties;
    .restart local v3       #i$:Ljava/util/Iterator;
    .restart local v7       #newLp:Landroid/net/LinkProperties;
    .restart local v9       #resetMask:I
    :cond_4
    iget-object v10, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v10, v10, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "handleConnectivityChange: addresses changed linkProperty["

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "]:"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " resetMask="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "\n   car="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v10, v11}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    .end local v0           #car:Landroid/net/LinkProperties$CompareResult;,"Landroid/net/LinkProperties$CompareResult<Landroid/net/LinkAddress;>;"
    .end local v3           #i$:Ljava/util/Iterator;
    :cond_5
    :goto_2
    iget-object v10, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v10, v10, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    iget-object v10, v10, Lcom/android/server/ConnectivityService;->mNetConfigs:[Landroid/net/NetworkConfig;

    aget-object v10, v10, p1

    invoke-virtual {v10}, Landroid/net/NetworkConfig;->isDefault()Z

    move-result v10

    if-eqz v10, :cond_6

    iget-object v10, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v10, v10, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    invoke-virtual {v7}, Landroid/net/LinkProperties;->getHttpProxy()Landroid/net/ProxyProperties;

    move-result-object v11

    #calls: Lcom/android/server/ConnectivityService;->handleApplyDefaultProxy(Landroid/net/ProxyProperties;)V
    invoke-static {v10, v11}, Lcom/android/server/ConnectivityService;->access$13200(Lcom/android/server/ConnectivityService;Landroid/net/ProxyProperties;)V

    :cond_6
    :goto_3
    iget-object v10, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v10, v10, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mCurrentLinkProperties:[Landroid/net/LinkProperties;
    invoke-static {v10}, Lcom/android/server/ConnectivityService;->access$6300(Lcom/android/server/ConnectivityService;)[Landroid/net/LinkProperties;

    move-result-object v10

    aput-object v7, v10, p1

    iget-object v10, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v10, v10, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    iget-object v10, v10, Lcom/android/server/ConnectivityService;->mNetConfigs:[Landroid/net/NetworkConfig;

    aget-object v10, v10, p1

    invoke-virtual {v10}, Landroid/net/NetworkConfig;->isDefault()Z

    move-result v10

    iget-object v11, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v11, v11, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mRouteAttributes:[Lcom/android/server/ConnectivityService$RouteAttributes;
    invoke-static {v11}, Lcom/android/server/ConnectivityService;->access$8200(Lcom/android/server/ConnectivityService;)[Lcom/android/server/ConnectivityService$RouteAttributes;

    move-result-object v11

    aget-object v11, v11, p1

    invoke-virtual {p0, v7, v1, v10, v11}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->updateRoutes(Landroid/net/LinkProperties;Landroid/net/LinkProperties;ZLcom/android/server/ConnectivityService$RouteAttributes;)Z

    move-result v8

    .local v8, resetDns:Z
    if-nez v9, :cond_7

    if-eqz v8, :cond_9

    :cond_7
    iget-object v10, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v10, v10, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mNetTrackers:[Landroid/net/NetworkStateTracker;
    invoke-static {v10}, Lcom/android/server/ConnectivityService;->access$800(Lcom/android/server/ConnectivityService;)[Landroid/net/NetworkStateTracker;

    move-result-object v10

    aget-object v10, v10, p1

    invoke-interface {v10}, Landroid/net/NetworkStateTracker;->getLinkProperties()Landroid/net/LinkProperties;

    move-result-object v6

    .local v6, linkProperties:Landroid/net/LinkProperties;
    if-eqz v6, :cond_9

    invoke-virtual {v6}, Landroid/net/LinkProperties;->getInterfaceName()Ljava/lang/String;

    move-result-object v4

    .local v4, iface:Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_9

    if-eqz v9, :cond_8

    iget-object v10, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v10, v10, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "resetConnections("

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ", "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ")"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v10, v11}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    invoke-static {v4, v9}, Landroid/net/NetworkUtils;->resetConnections(Ljava/lang/String;I)I

    and-int/lit8 v10, v9, 0x1

    if-eqz v10, :cond_8

    iget-object v10, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v10, v10, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mVpn:Lcom/android/server/connectivity/Vpn;
    invoke-static {v10}, Lcom/android/server/ConnectivityService;->access$13300(Lcom/android/server/ConnectivityService;)Lcom/android/server/connectivity/Vpn;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual {v10, v4, v11}, Lcom/android/server/connectivity/Vpn;->interfaceStatusChanged(Ljava/lang/String;Z)V

    :cond_8
    if-eqz v8, :cond_9

    iget-object v10, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v10, v10, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "resetting DNS cache for "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v10, v11}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    :try_start_0
    iget-object v10, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v10, v10, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mNetd:Landroid/os/INetworkManagementService;
    invoke-static {v10}, Lcom/android/server/ConnectivityService;->access$11700(Lcom/android/server/ConnectivityService;)Landroid/os/INetworkManagementService;

    move-result-object v10

    invoke-interface {v10, v4}, Landroid/os/INetworkManagementService;->flushInterfaceDnsCache(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v4           #iface:Ljava/lang/String;
    .end local v6           #linkProperties:Landroid/net/LinkProperties;
    :cond_9
    :goto_4
    iget-object v10, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v10, v10, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mNetTrackers:[Landroid/net/NetworkStateTracker;
    invoke-static {v10}, Lcom/android/server/ConnectivityService;->access$800(Lcom/android/server/ConnectivityService;)[Landroid/net/NetworkStateTracker;

    move-result-object v10

    aget-object v10, v10, p1

    invoke-interface {v10}, Landroid/net/NetworkStateTracker;->getNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v10

    invoke-virtual {v10}, Landroid/net/NetworkInfo;->getReason()Ljava/lang/String;

    move-result-object v10

    const-string v11, "linkPropertiesChanged"

    invoke-static {v10, v11}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_a

    iget-object v10, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v10, v10, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    invoke-virtual {v10}, Lcom/android/server/ConnectivityService;->isTetheringSupported()Z

    move-result v10

    if-eqz v10, :cond_a

    iget-object v10, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v10, v10, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mTethering:Lcom/android/server/connectivity/Tethering;
    invoke-static {v10}, Lcom/android/server/ConnectivityService;->access$13400(Lcom/android/server/ConnectivityService;)Lcom/android/server/connectivity/Tethering;

    move-result-object v10

    iget-object v11, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v11, v11, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mNetTrackers:[Landroid/net/NetworkStateTracker;
    invoke-static {v11}, Lcom/android/server/ConnectivityService;->access$800(Lcom/android/server/ConnectivityService;)[Landroid/net/NetworkStateTracker;

    move-result-object v11

    aget-object v11, v11, p1

    invoke-interface {v11}, Landroid/net/NetworkStateTracker;->getNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/android/server/connectivity/Tethering;->handleTetherIfaceChange(Landroid/net/NetworkInfo;)V

    :cond_a
    return-void

    .end local v8           #resetDns:Z
    .restart local v0       #car:Landroid/net/LinkProperties$CompareResult;,"Landroid/net/LinkProperties$CompareResult<Landroid/net/LinkAddress;>;"
    :cond_b
    iget-object v10, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v10, v10, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "handleConnectivityChange: address are the  same reset per doReset linkProperty["

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "]: resetMask="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v10, v11}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    goto/16 :goto_2

    .end local v0           #car:Landroid/net/LinkProperties$CompareResult;,"Landroid/net/LinkProperties$CompareResult<Landroid/net/LinkAddress;>;"
    :cond_c
    const/4 v9, 0x3

    iget-object v10, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v10, v10, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "handleConnectivityChange: interface not equivalent reset both linkProperty["

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "]: resetMask="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v10, v11}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    goto/16 :goto_2

    :cond_d
    iget-object v10, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v10, v10, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "handleConnectivityChange: changed linkProperty["

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "]:"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " doReset="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " resetMask="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "\n  curLp="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "\n  newLp= null"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v10, v11}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    goto/16 :goto_3

    .restart local v4       #iface:Ljava/lang/String;
    .restart local v6       #linkProperties:Landroid/net/LinkProperties;
    .restart local v8       #resetDns:Z
    :catch_0
    move-exception v2

    .local v2, e:Ljava/lang/Exception;
    iget-object v10, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v10, v10, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Exception resetting dns cache: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    #calls: Lcom/android/server/ConnectivityService;->loge(Ljava/lang/String;)V
    invoke-static {v10, v11}, Lcom/android/server/ConnectivityService;->access$5400(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    goto/16 :goto_4
.end method

.method private updateDns(Ljava/lang/String;Ljava/util/Collection;)Z
    .locals 16
    .parameter "iface"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
            "Ljava/net/InetAddress;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p2, netDnses:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/net/InetAddress;>;"
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v13, v13, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->getCurrentState()Lcom/android/internal/util/IState;
    invoke-static {v15}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$11400(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/internal/util/IState;

    move-result-object v15

    invoke-interface {v15}, Lcom/android/internal/util/IState;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " updateDns"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v13, v14}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    const/4 v1, 0x0

    .local v1, changed:Z
    const/4 v9, 0x0

    .local v9, last:I
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .local v4, dnses:Ljava/util/List;,"Ljava/util/List<Ljava/net/InetAddress;>;"
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v13, v13, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mNetTrackers:[Landroid/net/NetworkStateTracker;
    invoke-static {v13}, Lcom/android/server/ConnectivityService;->access$800(Lcom/android/server/ConnectivityService;)[Landroid/net/NetworkStateTracker;

    move-result-object v13

    move-object/from16 v0, p0

    iget v14, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->myDefaultNet:I

    aget-object v13, v13, v14

    invoke-interface {v13}, Landroid/net/NetworkStateTracker;->getLinkProperties()Landroid/net/LinkProperties;

    move-result-object v10

    .local v10, mlp:Landroid/net/LinkProperties;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v13, v13, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mNetTrackers:[Landroid/net/NetworkStateTracker;
    invoke-static {v13}, Lcom/android/server/ConnectivityService;->access$800(Lcom/android/server/ConnectivityService;)[Landroid/net/NetworkStateTracker;

    move-result-object v13

    move-object/from16 v0, p0

    iget v14, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->otherDefaultNet:I

    aget-object v13, v13, v14

    invoke-interface {v13}, Landroid/net/NetworkStateTracker;->getLinkProperties()Landroid/net/LinkProperties;

    move-result-object v11

    .local v11, olp:Landroid/net/LinkProperties;
    if-eqz v10, :cond_0

    invoke-virtual {v10}, Landroid/net/LinkProperties;->getDnses()Ljava/util/Collection;

    move-result-object v13

    invoke-interface {v4, v13}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_0
    if-eqz v11, :cond_1

    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->otherDefaultNet:I

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #getter for: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->myDefaultDnsNet:I
    invoke-static {v14}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$8300(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)I

    move-result v14

    if-ne v13, v14, :cond_3

    const/4 v13, 0x0

    invoke-virtual {v11}, Landroid/net/LinkProperties;->getDnses()Ljava/util/Collection;

    move-result-object v14

    invoke-interface {v4, v13, v14}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    :cond_1
    :goto_0
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v13

    if-nez v13, :cond_4

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v13, v13, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mDefaultDns:Ljava/net/InetAddress;
    invoke-static {v13}, Lcom/android/server/ConnectivityService;->access$11500(Lcom/android/server/ConnectivityService;)Ljava/net/InetAddress;

    move-result-object v13

    if-eqz v13, :cond_4

    add-int/lit8 v9, v9, 0x1

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v13, v13, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mDefaultDns:Ljava/net/InetAddress;
    invoke-static {v13}, Lcom/android/server/ConnectivityService;->access$11500(Lcom/android/server/ConnectivityService;)Ljava/net/InetAddress;

    move-result-object v13

    invoke-virtual {v13}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v12

    .local v12, value:Ljava/lang/String;
    const-string v13, "net.dns1"

    invoke-static {v13}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_2

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v13, v13, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "no dns provided - using "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    #calls: Lcom/android/server/ConnectivityService;->loge(Ljava/lang/String;)V
    invoke-static {v13, v14}, Lcom/android/server/ConnectivityService;->access$5400(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    const/4 v1, 0x1

    const-string v13, "net.dns1"

    invoke-static {v13, v12}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .end local v12           #value:Ljava/lang/String;
    :cond_2
    add-int/lit8 v6, v9, 0x1

    .local v6, i:I
    :goto_1
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v13, v13, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mNumDnsEntries:I
    invoke-static {v13}, Lcom/android/server/ConnectivityService;->access$11600(Lcom/android/server/ConnectivityService;)I

    move-result v13

    if-gt v6, v13, :cond_7

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "net.dns"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .local v8, key:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v13, v13, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "erasing "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v13, v14}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    const/4 v1, 0x1

    const-string v13, ""

    invoke-static {v8, v13}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .end local v6           #i:I
    .end local v8           #key:Ljava/lang/String;
    :cond_3
    invoke-virtual {v11}, Landroid/net/LinkProperties;->getDnses()Ljava/util/Collection;

    move-result-object v13

    invoke-interface {v4, v13}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto/16 :goto_0

    :cond_4
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, i$:Ljava/util/Iterator;
    :cond_5
    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/net/InetAddress;

    .local v3, dns:Ljava/net/InetAddress;
    add-int/lit8 v9, v9, 0x1

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "net.dns"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .restart local v8       #key:Ljava/lang/String;
    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v12

    .restart local v12       #value:Ljava/lang/String;
    if-nez v1, :cond_6

    invoke-static {v8}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_5

    :cond_6
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v13, v13, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "adding dns "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v13, v14}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    const/4 v1, 0x1

    invoke-static {v8, v12}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .end local v3           #dns:Ljava/net/InetAddress;
    .end local v7           #i$:Ljava/util/Iterator;
    .end local v8           #key:Ljava/lang/String;
    .end local v12           #value:Ljava/lang/String;
    .restart local v6       #i:I
    :cond_7
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v13, v13, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #setter for: Lcom/android/server/ConnectivityService;->mNumDnsEntries:I
    invoke-static {v13, v9}, Lcom/android/server/ConnectivityService;->access$11602(Lcom/android/server/ConnectivityService;I)I

    if-eqz v1, :cond_a

    if-eqz p1, :cond_8

    if-eqz p2, :cond_8

    :try_start_0
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v13, v13, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mNetd:Landroid/os/INetworkManagementService;
    invoke-static {v13}, Lcom/android/server/ConnectivityService;->access$11700(Lcom/android/server/ConnectivityService;)Landroid/os/INetworkManagementService;

    move-result-object v13

    invoke-static/range {p2 .. p2}, Landroid/net/NetworkUtils;->makeStrings(Ljava/util/Collection;)[Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p1

    invoke-interface {v13, v0, v14}, Landroid/os/INetworkManagementService;->setDnsServersForInterface(Ljava/lang/String;[Ljava/lang/String;)V

    :cond_8
    const/4 v2, 0x0

    .local v2, defDnsIface:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #getter for: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->myDefaultDnsNet:I
    invoke-static {v13}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$8300(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)I

    move-result v13

    move-object/from16 v0, p0

    iget v14, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->myDefaultNet:I

    if-ne v13, v14, :cond_b

    if-eqz v10, :cond_b

    invoke-virtual {v10}, Landroid/net/LinkProperties;->getInterfaceName()Ljava/lang/String;

    move-result-object v2

    :cond_9
    :goto_3
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_a

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v13, v13, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mNetd:Landroid/os/INetworkManagementService;
    invoke-static {v13}, Lcom/android/server/ConnectivityService;->access$11700(Lcom/android/server/ConnectivityService;)Landroid/os/INetworkManagementService;

    move-result-object v13

    invoke-interface {v13, v2}, Landroid/os/INetworkManagementService;->setDefaultInterfaceForDns(Ljava/lang/String;)V

    .end local v2           #defDnsIface:Ljava/lang/String;
    :cond_a
    :goto_4
    return v1

    .restart local v2       #defDnsIface:Ljava/lang/String;
    :cond_b
    if-eqz v11, :cond_9

    invoke-virtual {v11}, Landroid/net/LinkProperties;->getInterfaceName()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_3

    .end local v2           #defDnsIface:Ljava/lang/String;
    :catch_0
    move-exception v5

    .local v5, e:Ljava/lang/Exception;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v13, v13, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "exception setting default dns interface: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    #calls: Lcom/android/server/ConnectivityService;->loge(Ljava/lang/String;)V
    invoke-static {v13, v14}, Lcom/android/server/ConnectivityService;->access$5400(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    goto :goto_4
.end method


# virtual methods
.method protected addRoute(Landroid/net/LinkProperties;Landroid/net/RouteInfo;II)Z
    .locals 8
    .parameter "lp"
    .parameter "r"
    .parameter "cycleCount"
    .parameter "defaultRouteMetric"

    .prologue
    const/4 v4, 0x0

    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v5, v5, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->getCurrentState()Lcom/android/internal/util/IState;
    invoke-static {v7}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$13700(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/internal/util/IState;

    move-result-object v7

    invoke-interface {v7}, Lcom/android/internal/util/IState;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " addRoute"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v5, v6}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    const/4 v3, 0x0

    .local v3, metric:I
    invoke-virtual {p1}, Landroid/net/LinkProperties;->getInterfaceName()Ljava/lang/String;

    move-result-object v2

    .local v2, ifaceName:Ljava/lang/String;
    if-eqz v2, :cond_0

    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    :cond_0
    :goto_0
    return v4

    :cond_1
    const/16 v5, 0xa

    if-le p3, v5, :cond_2

    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v5, v5, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    const-string v6, "Error adding route - too much recursion"

    #calls: Lcom/android/server/ConnectivityService;->loge(Ljava/lang/String;)V
    invoke-static {v5, v6}, Lcom/android/server/ConnectivityService;->access$5400(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    invoke-virtual {p2}, Landroid/net/RouteInfo;->isHostRoute()Z

    move-result v5

    if-nez v5, :cond_3

    move v3, p4

    invoke-virtual {p1}, Landroid/net/LinkProperties;->getRoutes()Ljava/util/Collection;

    move-result-object v5

    invoke-virtual {p2}, Landroid/net/RouteInfo;->getGateway()Ljava/net/InetAddress;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/net/RouteInfo;->selectBestRoute(Ljava/util/Collection;Ljava/net/InetAddress;)Landroid/net/RouteInfo;

    move-result-object v0

    .local v0, bestRoute:Landroid/net/RouteInfo;
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/net/RouteInfo;->getGateway()Ljava/net/InetAddress;

    move-result-object v5

    invoke-virtual {p2}, Landroid/net/RouteInfo;->getGateway()Ljava/net/InetAddress;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/net/InetAddress;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-virtual {p2}, Landroid/net/RouteInfo;->getGateway()Ljava/net/InetAddress;

    move-result-object v5

    invoke-static {v5}, Landroid/net/RouteInfo;->makeHostRoute(Ljava/net/InetAddress;)Landroid/net/RouteInfo;

    move-result-object v0

    :goto_1
    add-int/lit8 v5, p3, 0x1

    invoke-virtual {p0, p1, v0, v5, v3}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->addRoute(Landroid/net/LinkProperties;Landroid/net/RouteInfo;II)Z

    .end local v0           #bestRoute:Landroid/net/RouteInfo;
    :cond_3
    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v5, v5, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Adding "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " with metric "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " for interface "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v5, v6}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    :try_start_0
    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v5, v5, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mAddedRoutes:Ljava/util/Collection;
    invoke-static {v5}, Lcom/android/server/ConnectivityService;->access$13800(Lcom/android/server/ConnectivityService;)Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5, p2}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4

    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v5, v5, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mAddedRoutes:Ljava/util/Collection;
    invoke-static {v5}, Lcom/android/server/ConnectivityService;->access$13800(Lcom/android/server/ConnectivityService;)Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5, p2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :cond_4
    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v5, v5, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Routes in main table - [ "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v7, v7, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mAddedRoutes:Ljava/util/Collection;
    invoke-static {v7}, Lcom/android/server/ConnectivityService;->access$13800(Lcom/android/server/ConnectivityService;)Ljava/util/Collection;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " ]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v5, v6}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v5, v5, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mNetd:Landroid/os/INetworkManagementService;
    invoke-static {v5}, Lcom/android/server/ConnectivityService;->access$11700(Lcom/android/server/ConnectivityService;)Landroid/os/INetworkManagementService;

    move-result-object v5

    invoke-interface {v5, v2, v3, p2}, Landroid/os/INetworkManagementService;->addRouteWithMetric(Ljava/lang/String;ILandroid/net/RouteInfo;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v4, 0x1

    goto/16 :goto_0

    .restart local v0       #bestRoute:Landroid/net/RouteInfo;
    :cond_5
    invoke-virtual {p2}, Landroid/net/RouteInfo;->getGateway()Ljava/net/InetAddress;

    move-result-object v5

    invoke-virtual {v0}, Landroid/net/RouteInfo;->getGateway()Ljava/net/InetAddress;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/net/RouteInfo;->makeHostRoute(Ljava/net/InetAddress;Ljava/net/InetAddress;)Landroid/net/RouteInfo;

    move-result-object v0

    goto/16 :goto_1

    .end local v0           #bestRoute:Landroid/net/RouteInfo;
    :catch_0
    move-exception v1

    .local v1, e:Ljava/lang/Exception;
    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v5, v5, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Exception trying to add a Metric Route: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    #calls: Lcom/android/server/ConnectivityService;->loge(Ljava/lang/String;)V
    invoke-static {v5, v6}, Lcom/android/server/ConnectivityService;->access$5400(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method protected handleConnect(Landroid/net/NetworkInfo;)I
    .locals 8
    .parameter "info"

    .prologue
    const/4 v4, 0x0

    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v5, v5, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->getCurrentState()Lcom/android/internal/util/IState;
    invoke-static {v7}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$12600(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/internal/util/IState;

    move-result-object v7

    invoke-interface {v7}, Lcom/android/internal/util/IState;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " handleConnect"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v5, v6}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/net/NetworkInfo;->getType()I

    move-result v3

    .local v3, type:I
    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v5, v5, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mNetTrackers:[Landroid/net/NetworkStateTracker;
    invoke-static {v5}, Lcom/android/server/ConnectivityService;->access$800(Lcom/android/server/ConnectivityService;)[Landroid/net/NetworkStateTracker;

    move-result-object v5

    aget-object v2, v5, v3

    .local v2, thisNet:Landroid/net/NetworkStateTracker;
    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v5, v5, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    iget-object v5, v5, Lcom/android/server/ConnectivityService;->mNetConfigs:[Landroid/net/NetworkConfig;

    aget-object v5, v5, v3

    invoke-virtual {v5}, Landroid/net/NetworkConfig;->isDefault()Z

    move-result v5

    if-nez v5, :cond_1

    const/4 v4, -0x1

    :cond_0
    :goto_0
    return v4

    :cond_1
    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #getter for: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->mConnectedDefaultNetworks:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;
    invoke-static {v5}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$8500(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;

    move-result-object v5

    invoke-virtual {v5, v3}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;->contains(I)Z

    move-result v5

    if-nez v5, :cond_2

    invoke-virtual {p0, v3}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->isHigherPriorityNet(I)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v4, -0x2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    .local v0, causedBy:Ljava/lang/String;
    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v5, v5, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    monitor-enter v5

    :try_start_0
    iget-object v6, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v6, v6, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mNetTransitionWakeLock:Landroid/os/PowerManager$WakeLock;
    invoke-static {v6}, Lcom/android/server/ConnectivityService;->access$1900(Lcom/android/server/ConnectivityService;)Landroid/os/PowerManager$WakeLock;

    move-result-object v6

    invoke-virtual {v6}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v6

    if-eqz v6, :cond_3

    iget-object v6, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v6, v6, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mNetTransitionWakeLock:Landroid/os/PowerManager$WakeLock;
    invoke-static {v6}, Lcom/android/server/ConnectivityService;->access$1900(Lcom/android/server/ConnectivityService;)Landroid/os/PowerManager$WakeLock;

    move-result-object v6

    invoke-virtual {v6}, Landroid/os/PowerManager$WakeLock;->release()V

    iget-object v6, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v6, v6, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mNetTransitionWakeLockCausedBy:Ljava/lang/String;
    invoke-static {v6}, Lcom/android/server/ConnectivityService;->access$2000(Lcom/android/server/ConnectivityService;)Ljava/lang/String;

    move-result-object v0

    :cond_3
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_4

    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v5, v5, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "NetTransition Wakelock for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " released because of connect"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v5, v6}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    :cond_4
    iget v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->myDefaultNet:I

    if-ne v3, v5, :cond_6

    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v5, v5, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #setter for: Lcom/android/server/ConnectivityService;->mDefaultInetConditionPublished:I
    invoke-static {v5, v4}, Lcom/android/server/ConnectivityService;->access$7002(Lcom/android/server/ConnectivityService;I)I

    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v5, v5, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    invoke-static {v5}, Lcom/android/server/ConnectivityService;->access$7108(Lcom/android/server/ConnectivityService;)I

    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v5, v5, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #setter for: Lcom/android/server/ConnectivityService;->mInetConditionChangeInFlight:Z
    invoke-static {v5, v4}, Lcom/android/server/ConnectivityService;->access$7202(Lcom/android/server/ConnectivityService;Z)Z

    :goto_1
    invoke-interface {v2, v4}, Landroid/net/NetworkStateTracker;->setTeardownRequested(Z)V

    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v5, v5, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    invoke-virtual {v5, v2}, Lcom/android/server/ConnectivityService;->updateNetworkSettings(Landroid/net/NetworkStateTracker;)V

    invoke-direct {p0, v3, v4}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->handleConnectivityChange(IZ)V

    iget v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->otherDefaultNet:I

    if-eq v3, v5, :cond_5

    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v5, v5, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    iget-object v6, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v6, v6, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #calls: Lcom/android/server/ConnectivityService;->getConnectivityChangeDelay()I
    invoke-static {v6}, Lcom/android/server/ConnectivityService;->access$7300(Lcom/android/server/ConnectivityService;)I

    move-result v6

    #calls: Lcom/android/server/ConnectivityService;->sendConnectedBroadcastDelayed(Landroid/net/NetworkInfo;I)V
    invoke-static {v5, p1, v6}, Lcom/android/server/ConnectivityService;->access$7400(Lcom/android/server/ConnectivityService;Landroid/net/NetworkInfo;I)V

    :cond_5
    invoke-interface {v2}, Landroid/net/NetworkStateTracker;->getLinkProperties()Landroid/net/LinkProperties;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/LinkProperties;->getInterfaceName()Ljava/lang/String;

    move-result-object v1

    .local v1, iface:Ljava/lang/String;
    if-eqz v1, :cond_0

    :try_start_1
    invoke-static {}, Lcom/android/server/am/BatteryStatsService;->getService()Lcom/android/internal/app/IBatteryStats;

    move-result-object v5

    invoke-interface {v5, v1, v3}, Lcom/android/internal/app/IBatteryStats;->noteNetworkInterfaceType(Ljava/lang/String;I)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    :catch_0
    move-exception v5

    goto/16 :goto_0

    .end local v1           #iface:Ljava/lang/String;
    :catchall_0
    move-exception v4

    :try_start_2
    monitor-exit v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v4

    :cond_6
    iput v4, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->mOtherDefaultInetConditionPublished:I

    iget v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->mOtherDefaultConnectionSequence:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->mOtherDefaultConnectionSequence:I

    iput-boolean v4, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->mOtherInetConditionChangeInFlight:Z

    goto :goto_1
.end method

.method protected handleConnectivitySwitch(ILjava/lang/String;)Z
    .locals 5
    .parameter "netType"
    .parameter "reason"

    .prologue
    iget-object v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v2, v2, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->getCurrentState()Lcom/android/internal/util/IState;
    invoke-static {v4}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$11300(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/internal/util/IState;

    move-result-object v4

    invoke-interface {v4}, Lcom/android/internal/util/IState;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " handleConnectivitySwitch"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    const/4 v0, 0x1

    .local v0, ret:Z
    iget-object v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #getter for: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->mConnectedDefaultNetworks:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;
    invoke-static {v2}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$8500(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;->contains(I)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v2, v2, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " Network "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " not supported for default connectivity"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/android/server/ConnectivityService;->logw(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/android/server/ConnectivityService;->access$10900(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    move v1, v0

    .end local v0           #ret:Z
    .local v1, ret:I
    :goto_0
    return v1

    .end local v1           #ret:I
    .restart local v0       #ret:Z
    :cond_0
    iget-object v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v2, v2, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mActiveDefaultNetwork:I
    invoke-static {v2}, Lcom/android/server/ConnectivityService;->access$700(Lcom/android/server/ConnectivityService;)I

    move-result v2

    if-ne v2, p1, :cond_1

    iget-object v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v2, v2, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " Network"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " is already default"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/android/server/ConnectivityService;->logw(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/android/server/ConnectivityService;->access$10900(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    move v1, v0

    .restart local v1       #ret:I
    goto :goto_0

    .end local v1           #ret:I
    :cond_1
    iget v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->myDefaultNet:I

    if-ne v2, p1, :cond_2

    iget-object v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v2, v2, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    iget v3, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->myDefaultNet:I

    #setter for: Lcom/android/server/ConnectivityService;->mActiveDefaultNetwork:I
    invoke-static {v2, v3}, Lcom/android/server/ConnectivityService;->access$702(Lcom/android/server/ConnectivityService;I)I

    iget v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->otherDefaultNet:I

    invoke-virtual {p0, v2}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->updateDefaultRouteMetric(I)V

    invoke-virtual {p0, p2}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->sendConnectivitySwitchBroadcast(Ljava/lang/String;)V

    :goto_1
    move v1, v0

    .restart local v1       #ret:I
    goto :goto_0

    .end local v1           #ret:I
    :cond_2
    iget v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->myDefaultNet:I

    invoke-virtual {p0, v2}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->removeDefaultRoutes(I)V

    const/4 v0, 0x0

    goto :goto_1
.end method

.method protected handleDisconnect(Landroid/net/NetworkInfo;)I
    .locals 18
    .parameter "info"

    .prologue
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v15, v15, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    move-object/from16 v17, v0

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->getCurrentState()Lcom/android/internal/util/IState;
    invoke-static/range {v17 .. v17}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$12200(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/internal/util/IState;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Lcom/android/internal/util/IState;->getName()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " handleDisconnect"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static/range {v15 .. v16}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    invoke-virtual/range {p1 .. p1}, Landroid/net/NetworkInfo;->getType()I

    move-result v14

    .local v14, type:I
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v15, v15, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    iget-object v15, v15, Lcom/android/server/ConnectivityService;->mNetConfigs:[Landroid/net/NetworkConfig;

    aget-object v15, v15, v14

    invoke-virtual {v15}, Landroid/net/NetworkConfig;->isDefault()Z

    move-result v15

    if-eqz v15, :cond_0

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #getter for: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->mConnectedDefaultNetworks:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;
    invoke-static {v15}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$8500(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;

    move-result-object v15

    invoke-virtual {v15, v14}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;->contains(I)Z

    move-result v15

    if-nez v15, :cond_1

    :cond_0
    const/4 v15, 0x0

    :goto_0
    return v15

    :cond_1
    move-object/from16 v0, p0

    iget v15, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->myDefaultNet:I

    if-ne v14, v15, :cond_3

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #getter for: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->myDefaultDnsNet:I
    invoke-static {v15}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$8300(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)I

    move-result v15

    if-ne v15, v14, :cond_2

    move-object/from16 v0, p0

    iget v15, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->otherDefaultNet:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->handleDnsReprioritization(I)V

    :cond_2
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #getter for: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->mConnectedDefaultNetworks:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;
    invoke-static {v15}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$8500(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;

    move-result-object v15

    invoke-virtual {v15, v14}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;->remove(I)Z

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v15, v15, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->otherDefaultNet:I

    move/from16 v16, v0

    #setter for: Lcom/android/server/ConnectivityService;->mActiveDefaultNetwork:I
    invoke-static/range {v15 .. v16}, Lcom/android/server/ConnectivityService;->access$702(Lcom/android/server/ConnectivityService;I)I

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v15, v15, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->otherDefaultNet:I

    move/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Lcom/android/server/ConnectivityService;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v13

    .local v13, otherInfo:Landroid/net/NetworkInfo;
    const/4 v15, 0x1

    invoke-virtual {v13, v15}, Landroid/net/NetworkInfo;->setFailover(Z)V

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v15, v15, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #calls: Lcom/android/server/ConnectivityService;->sendConnectedBroadcast(Landroid/net/NetworkInfo;)V
    invoke-static {v15, v13}, Lcom/android/server/ConnectivityService;->access$900(Lcom/android/server/ConnectivityService;Landroid/net/NetworkInfo;)V

    const/4 v15, -0x1

    goto :goto_0

    .end local v13           #otherInfo:Landroid/net/NetworkInfo;
    :cond_3
    const/4 v2, 0x0

    .local v2, causedBy:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v0, v15, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    move-object/from16 v16, v0

    monitor-enter v16

    :try_start_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v15, v15, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mNetTransitionWakeLock:Landroid/os/PowerManager$WakeLock;
    invoke-static {v15}, Lcom/android/server/ConnectivityService;->access$1900(Lcom/android/server/ConnectivityService;)Landroid/os/PowerManager$WakeLock;

    move-result-object v15

    invoke-virtual {v15}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v15

    if-eqz v15, :cond_4

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v15, v15, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mNetTransitionWakeLock:Landroid/os/PowerManager$WakeLock;
    invoke-static {v15}, Lcom/android/server/ConnectivityService;->access$1900(Lcom/android/server/ConnectivityService;)Landroid/os/PowerManager$WakeLock;

    move-result-object v15

    invoke-virtual {v15}, Landroid/os/PowerManager$WakeLock;->release()V

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v15, v15, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mNetTransitionWakeLockCausedBy:Ljava/lang/String;
    invoke-static {v15}, Lcom/android/server/ConnectivityService;->access$2000(Lcom/android/server/ConnectivityService;)Ljava/lang/String;

    move-result-object v2

    :cond_4
    monitor-exit v16
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_5

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v15, v15, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "NetTransition Wakelock for "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " released because of disconnect"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static/range {v15 .. v16}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    :cond_5
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v15, v15, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mNetTrackers:[Landroid/net/NetworkStateTracker;
    invoke-static {v15}, Lcom/android/server/ConnectivityService;->access$800(Lcom/android/server/ConnectivityService;)[Landroid/net/NetworkStateTracker;

    move-result-object v15

    aget-object v15, v15, v14

    const/16 v16, 0x0

    invoke-interface/range {v15 .. v16}, Landroid/net/NetworkStateTracker;->setTeardownRequested(Z)V

    new-instance v6, Landroid/content/Intent;

    const-string v15, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {v6, v15}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .local v6, intent:Landroid/content/Intent;
    const-string v15, "networkInfo"

    move-object/from16 v0, p1

    invoke-virtual {v6, v15, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    invoke-virtual/range {p1 .. p1}, Landroid/net/NetworkInfo;->isFailover()Z

    move-result v15

    if-eqz v15, :cond_6

    const-string v15, "isFailover"

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v6, v15, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const/4 v15, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Landroid/net/NetworkInfo;->setFailover(Z)V

    :cond_6
    invoke-virtual/range {p1 .. p1}, Landroid/net/NetworkInfo;->getReason()Ljava/lang/String;

    move-result-object v15

    if-eqz v15, :cond_7

    const-string v15, "reason"

    invoke-virtual/range {p1 .. p1}, Landroid/net/NetworkInfo;->getReason()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v6, v15, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_7
    invoke-virtual/range {p1 .. p1}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    move-result-object v15

    if-eqz v15, :cond_8

    const-string v15, "extraInfo"

    invoke-virtual/range {p1 .. p1}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v6, v15, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_8
    const-string v15, "otherNetwork"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->myDefaultNet:I

    move/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Lcom/android/server/ConnectivityService;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v6, v15, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string v15, "inetCondition"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    move-object/from16 v16, v0

    #getter for: Lcom/android/server/ConnectivityService;->mDefaultInetConditionPublished:I
    invoke-static/range {v16 .. v16}, Lcom/android/server/ConnectivityService;->access$7000(Lcom/android/server/ConnectivityService;)I

    move-result v16

    move/from16 v0, v16

    invoke-virtual {v6, v15, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const/4 v3, 0x1

    .local v3, doReset:Z
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v15, v15, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mNetTrackers:[Landroid/net/NetworkStateTracker;
    invoke-static {v15}, Lcom/android/server/ConnectivityService;->access$800(Lcom/android/server/ConnectivityService;)[Landroid/net/NetworkStateTracker;

    move-result-object v15

    aget-object v15, v15, v14

    invoke-interface {v15}, Landroid/net/NetworkStateTracker;->getLinkProperties()Landroid/net/LinkProperties;

    move-result-object v9

    .local v9, linkProperties:Landroid/net/LinkProperties;
    if-eqz v9, :cond_b

    invoke-virtual {v9}, Landroid/net/LinkProperties;->getInterfaceName()Ljava/lang/String;

    move-result-object v12

    .local v12, oldIface:Ljava/lang/String;
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v15

    if-nez v15, :cond_b

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v15, v15, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mNetTrackers:[Landroid/net/NetworkStateTracker;
    invoke-static {v15}, Lcom/android/server/ConnectivityService;->access$800(Lcom/android/server/ConnectivityService;)[Landroid/net/NetworkStateTracker;

    move-result-object v1

    .local v1, arr$:[Landroid/net/NetworkStateTracker;
    array-length v8, v1

    .local v8, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_1
    if-ge v4, v8, :cond_b

    aget-object v11, v1, v4

    .local v11, networkStateTracker:Landroid/net/NetworkStateTracker;
    if-nez v11, :cond_a

    :cond_9
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .end local v1           #arr$:[Landroid/net/NetworkStateTracker;
    .end local v3           #doReset:Z
    .end local v4           #i$:I
    .end local v6           #intent:Landroid/content/Intent;
    .end local v8           #len$:I
    .end local v9           #linkProperties:Landroid/net/LinkProperties;
    .end local v11           #networkStateTracker:Landroid/net/NetworkStateTracker;
    .end local v12           #oldIface:Ljava/lang/String;
    :catchall_0
    move-exception v15

    :try_start_1
    monitor-exit v16
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v15

    .restart local v1       #arr$:[Landroid/net/NetworkStateTracker;
    .restart local v3       #doReset:Z
    .restart local v4       #i$:I
    .restart local v6       #intent:Landroid/content/Intent;
    .restart local v8       #len$:I
    .restart local v9       #linkProperties:Landroid/net/LinkProperties;
    .restart local v11       #networkStateTracker:Landroid/net/NetworkStateTracker;
    .restart local v12       #oldIface:Ljava/lang/String;
    :cond_a
    invoke-interface {v11}, Landroid/net/NetworkStateTracker;->getNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v10

    .local v10, networkInfo:Landroid/net/NetworkInfo;
    invoke-virtual {v10}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v15

    if-eqz v15, :cond_9

    invoke-virtual {v10}, Landroid/net/NetworkInfo;->getType()I

    move-result v15

    if-eq v15, v14, :cond_9

    invoke-interface {v11}, Landroid/net/NetworkStateTracker;->getLinkProperties()Landroid/net/LinkProperties;

    move-result-object v7

    .local v7, l:Landroid/net/LinkProperties;
    if-eqz v7, :cond_9

    invoke-virtual {v7}, Landroid/net/LinkProperties;->getInterfaceName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v12, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_9

    const/4 v3, 0x0

    .end local v1           #arr$:[Landroid/net/NetworkStateTracker;
    .end local v4           #i$:I
    .end local v7           #l:Landroid/net/LinkProperties;
    .end local v8           #len$:I
    .end local v10           #networkInfo:Landroid/net/NetworkInfo;
    .end local v11           #networkStateTracker:Landroid/net/NetworkStateTracker;
    .end local v12           #oldIface:Ljava/lang/String;
    :cond_b
    move-object/from16 v0, p0

    invoke-direct {v0, v14, v3}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->handleConnectivityChange(IZ)V

    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5, v6}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .local v5, immediateIntent:Landroid/content/Intent;
    const-string v15, "android.net.conn.CONNECTIVITY_CHANGE_IMMEDIATE"

    invoke-virtual {v5, v15}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v15, v15, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #calls: Lcom/android/server/ConnectivityService;->sendStickyBroadcast(Landroid/content/Intent;)V
    invoke-static {v15, v5}, Lcom/android/server/ConnectivityService;->access$2800(Lcom/android/server/ConnectivityService;Landroid/content/Intent;)V

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v15, v15, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    move-object/from16 v16, v0

    #calls: Lcom/android/server/ConnectivityService;->getConnectivityChangeDelay()I
    invoke-static/range {v16 .. v16}, Lcom/android/server/ConnectivityService;->access$7300(Lcom/android/server/ConnectivityService;)I

    move-result v16

    move/from16 v0, v16

    #calls: Lcom/android/server/ConnectivityService;->sendStickyBroadcastDelayed(Landroid/content/Intent;I)V
    invoke-static {v15, v6, v0}, Lcom/android/server/ConnectivityService;->access$12300(Lcom/android/server/ConnectivityService;Landroid/content/Intent;I)V

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #getter for: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->myDefaultDnsNet:I
    invoke-static {v15}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$8300(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)I

    move-result v15

    if-ne v15, v14, :cond_c

    move-object/from16 v0, p0

    iget v15, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->myDefaultNet:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->handleDnsReprioritization(I)V

    :cond_c
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #getter for: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->mConnectedDefaultNetworks:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;
    invoke-static {v15}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$8500(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;

    move-result-object v15

    invoke-virtual {v15, v14}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;->remove(I)Z

    const/4 v15, -0x2

    goto/16 :goto_0
.end method

.method protected handleDnsConfigurationChange(I)V
    .locals 12
    .parameter "netType"

    .prologue
    iget-object v9, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v9, v9, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v11, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->getCurrentState()Lcom/android/internal/util/IState;
    invoke-static {v11}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$11900(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/internal/util/IState;

    move-result-object v11

    invoke-interface {v11}, Lcom/android/internal/util/IState;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " handleDnsConfigurationChange"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v9, v10}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    iget-object v9, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v9, v9, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mNetTrackers:[Landroid/net/NetworkStateTracker;
    invoke-static {v9}, Lcom/android/server/ConnectivityService;->access$800(Lcom/android/server/ConnectivityService;)[Landroid/net/NetworkStateTracker;

    move-result-object v9

    aget-object v4, v9, p1

    .local v4, nt:Landroid/net/NetworkStateTracker;
    if-eqz v4, :cond_0

    invoke-interface {v4}, Landroid/net/NetworkStateTracker;->getNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v9

    invoke-virtual {v9}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-interface {v4}, Landroid/net/NetworkStateTracker;->isTeardownRequested()Z

    move-result v9

    if-nez v9, :cond_0

    invoke-interface {v4}, Landroid/net/NetworkStateTracker;->getLinkProperties()Landroid/net/LinkProperties;

    move-result-object v5

    .local v5, p:Landroid/net/LinkProperties;
    if-nez v5, :cond_1

    .end local v5           #p:Landroid/net/LinkProperties;
    :cond_0
    :goto_0
    return-void

    .restart local v5       #p:Landroid/net/LinkProperties;
    :cond_1
    invoke-virtual {v5}, Landroid/net/LinkProperties;->getDnses()Ljava/util/Collection;

    move-result-object v1

    .local v1, dnses:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/net/InetAddress;>;"
    const/4 v0, 0x0

    .local v0, changed:Z
    iget-object v9, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v9, v9, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    iget-object v9, v9, Lcom/android/server/ConnectivityService;->mNetConfigs:[Landroid/net/NetworkConfig;

    aget-object v9, v9, p1

    invoke-virtual {v9}, Landroid/net/NetworkConfig;->isDefault()Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-interface {v4}, Landroid/net/NetworkStateTracker;->getNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v9

    invoke-virtual {v9}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v3

    .local v3, network:Ljava/lang/String;
    iget-object v9, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v9, v9, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mDnsLock:Ljava/lang/Object;
    invoke-static {v9}, Lcom/android/server/ConnectivityService;->access$3000(Lcom/android/server/ConnectivityService;)Ljava/lang/Object;

    move-result-object v10

    monitor-enter v10

    :try_start_0
    iget-object v9, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v9, v9, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mDnsOverridden:Z
    invoke-static {v9}, Lcom/android/server/ConnectivityService;->access$3200(Lcom/android/server/ConnectivityService;)Z

    move-result v9

    if-nez v9, :cond_2

    invoke-virtual {v5}, Landroid/net/LinkProperties;->getInterfaceName()Ljava/lang/String;

    move-result-object v9

    invoke-direct {p0, v9, v1}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->updateDns(Ljava/lang/String;Ljava/util/Collection;)Z

    move-result v0

    :cond_2
    monitor-exit v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v3           #network:Ljava/lang/String;
    :cond_3
    if-eqz v0, :cond_0

    iget-object v9, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v9, v9, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #calls: Lcom/android/server/ConnectivityService;->bumpDns()V
    invoke-static {v9}, Lcom/android/server/ConnectivityService;->access$3300(Lcom/android/server/ConnectivityService;)V

    goto :goto_0

    .restart local v3       #network:Ljava/lang/String;
    :catchall_0
    move-exception v9

    :try_start_1
    monitor-exit v10
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v9

    .end local v3           #network:Ljava/lang/String;
    :cond_4
    :try_start_2
    iget-object v9, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v9, v9, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mNetd:Landroid/os/INetworkManagementService;
    invoke-static {v9}, Lcom/android/server/ConnectivityService;->access$11700(Lcom/android/server/ConnectivityService;)Landroid/os/INetworkManagementService;

    move-result-object v9

    invoke-virtual {v5}, Landroid/net/LinkProperties;->getInterfaceName()Ljava/lang/String;

    move-result-object v10

    invoke-static {v1}, Landroid/net/NetworkUtils;->makeStrings(Ljava/util/Collection;)[Ljava/lang/String;

    move-result-object v11

    invoke-interface {v9, v10, v11}, Landroid/os/INetworkManagementService;->setDnsServersForInterface(Ljava/lang/String;[Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :goto_1
    iget-object v9, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v9, v9, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mNetRequestersPids:[Ljava/util/List;
    invoke-static {v9}, Lcom/android/server/ConnectivityService;->access$12000(Lcom/android/server/ConnectivityService;)[Ljava/util/List;

    move-result-object v9

    aget-object v7, v9, p1

    .local v7, pids:Ljava/util/List;
    const/4 v8, 0x0

    .local v8, y:I
    :goto_2
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v9

    if-ge v8, v9, :cond_3

    invoke-interface {v7, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    .local v6, pid:Ljava/lang/Integer;
    iget-object v9, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v9, v9, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v10

    #calls: Lcom/android/server/ConnectivityService;->writePidDns(Ljava/util/Collection;I)Z
    invoke-static {v9, v1, v10}, Lcom/android/server/ConnectivityService;->access$12100(Lcom/android/server/ConnectivityService;Ljava/util/Collection;I)Z

    move-result v0

    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .end local v6           #pid:Ljava/lang/Integer;
    .end local v7           #pids:Ljava/util/List;
    .end local v8           #y:I
    :catch_0
    move-exception v2

    .local v2, e:Ljava/lang/Exception;
    iget-object v9, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v9, v9, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "exception setting dns servers: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    #calls: Lcom/android/server/ConnectivityService;->loge(Ljava/lang/String;)V
    invoke-static {v9, v10}, Lcom/android/server/ConnectivityService;->access$5400(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    goto :goto_1
.end method

.method protected handleDnsReprioritization(I)V
    .locals 3
    .parameter "netType"

    .prologue
    iget-object v0, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->getCurrentState()Lcom/android/internal/util/IState;
    invoke-static {v2}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$11800(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/internal/util/IState;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/util/IState;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " handleDnsReprioritization"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #getter for: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->mConnectedDefaultNetworks:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;
    invoke-static {v0}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$8500(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;->contains(I)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot prioritize dns for unsupported type"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/android/server/ConnectivityService;->logw(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/android/server/ConnectivityService;->access$10900(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Prioritizing Dns for network "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mDnsLock:Ljava/lang/Object;
    invoke-static {v0}, Lcom/android/server/ConnectivityService;->access$3000(Lcom/android/server/ConnectivityService;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #setter for: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->myDefaultDnsNet:I
    invoke-static {v0, p1}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$8302(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;I)I

    iget-object v0, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mDnsOverridden:Z
    invoke-static {v0}, Lcom/android/server/ConnectivityService;->access$3200(Lcom/android/server/ConnectivityService;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, v0, v2}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->updateDns(Ljava/lang/String;Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #calls: Lcom/android/server/ConnectivityService;->bumpDns()V
    invoke-static {v0}, Lcom/android/server/ConnectivityService;->access$3300(Lcom/android/server/ConnectivityService;)V

    :cond_1
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected handleInetConditionChange(II)Z
    .locals 7
    .parameter "netType"
    .parameter "condition"

    .prologue
    const/4 v1, 0x1

    iget-object v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v2, v2, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->getCurrentState()Lcom/android/internal/util/IState;
    invoke-static {v4}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$12700(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/internal/util/IState;

    move-result-object v4

    invoke-interface {v4}, Lcom/android/internal/util/IState;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " handleInetConditionChange"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    iget v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->otherDefaultNet:I

    if-eq p1, v2, :cond_0

    const/4 v1, 0x0

    :goto_0
    return v1

    :cond_0
    iget-object v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v2, v2, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "handleInetConditionChange: net="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", condition="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", for other active default Network="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    iput p2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->mOtherDefaultInetCondition:I

    iget-boolean v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->mOtherInetConditionChangeInFlight:Z

    if-nez v2, :cond_2

    iget-object v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v2, v2, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    const-string v3, "handleInetConditionChange: starting a change hold"

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    iget v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->mOtherDefaultInetCondition:I

    const/16 v3, 0x32

    if-le v2, v3, :cond_1

    iget-object v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v2, v2, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mContext:Landroid/content/Context;
    invoke-static {v2}, Lcom/android/server/ConnectivityService;->access$12800(Lcom/android/server/ConnectivityService;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "inet_condition_debounce_up_delay"

    const/16 v4, 0x1f4

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .local v0, delay:I
    :goto_1
    iput-boolean v1, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->mOtherInetConditionChangeInFlight:Z

    iget-object v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v3, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    const/16 v4, 0x69

    iget v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->otherDefaultNet:I

    iget v6, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->mOtherDefaultConnectionSequence:I

    invoke-virtual {v3, v4, v5, v6}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->obtainMessage(III)Landroid/os/Message;

    move-result-object v3

    int-to-long v4, v0

    invoke-virtual {v2, v3, v4, v5}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->sendMessageDelayed(Landroid/os/Message;J)V

    goto :goto_0

    .end local v0           #delay:I
    :cond_1
    iget-object v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v2, v2, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mContext:Landroid/content/Context;
    invoke-static {v2}, Lcom/android/server/ConnectivityService;->access$12800(Lcom/android/server/ConnectivityService;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "inet_condition_debounce_down_delay"

    const/16 v4, 0xbb8

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .restart local v0       #delay:I
    goto :goto_1

    .end local v0           #delay:I
    :cond_2
    iget-object v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v2, v2, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    const-string v3, "handleInetConditionChange: currently in hold - not setting new end evt"

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method protected handleInetConditionHoldEnd(II)Z
    .locals 6
    .parameter "netType"
    .parameter "sequence"

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v3, v3, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->getCurrentState()Lcom/android/internal/util/IState;
    invoke-static {v5}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$12900(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/internal/util/IState;

    move-result-object v5

    invoke-interface {v5}, Lcom/android/internal/util/IState;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " handleInetConditionHoldEnd"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v3, v4}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    iget v3, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->otherDefaultNet:I

    if-eq p1, v3, :cond_0

    :goto_0
    return v1

    :cond_0
    iget-object v3, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v3, v3, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "handleInetConditionHoldEnd: net="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", condition="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->mOtherDefaultInetCondition:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", published condition="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->mOtherDefaultInetConditionPublished:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v3, v4}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    iput-boolean v1, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->mOtherInetConditionChangeInFlight:Z

    iget v1, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->mOtherDefaultConnectionSequence:I

    if-eq v1, p2, :cond_1

    iget-object v1, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v1, v1, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    const-string v3, "handleInetConditionHoldEnd: event hold for obsolete network - ignoring"

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v1, v3}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    move v1, v2

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v1, v1, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mNetTrackers:[Landroid/net/NetworkStateTracker;
    invoke-static {v1}, Lcom/android/server/ConnectivityService;->access$800(Lcom/android/server/ConnectivityService;)[Landroid/net/NetworkStateTracker;

    move-result-object v1

    iget v3, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->otherDefaultNet:I

    aget-object v1, v1, v3

    invoke-interface {v1}, Landroid/net/NetworkStateTracker;->getNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .local v0, networkInfo:Landroid/net/NetworkInfo;
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v1, v1, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "handleInetConditionHoldEnd: default network "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " not connected - ignoring"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v1, v3}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    move v1, v2

    goto :goto_0

    :cond_2
    iget v1, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->mOtherDefaultInetCondition:I

    iput v1, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->mOtherDefaultInetConditionPublished:I

    iget-object v1, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v1, v1, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #calls: Lcom/android/server/ConnectivityService;->sendInetConditionBroadcast(Landroid/net/NetworkInfo;)V
    invoke-static {v1, v0}, Lcom/android/server/ConnectivityService;->access$13000(Lcom/android/server/ConnectivityService;Landroid/net/NetworkInfo;)V

    move v1, v2

    goto/16 :goto_0
.end method

.method protected isHigherPriorityNet(I)Z
    .locals 4
    .parameter "type"

    .prologue
    iget-object v1, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v1, v1, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->getCurrentState()Lcom/android/internal/util/IState;
    invoke-static {v3}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$12400(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/internal/util/IState;

    move-result-object v3

    invoke-interface {v3}, Lcom/android/internal/util/IState;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " isHigherPriorityNet"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v1, v2}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    const/4 v0, 0x0

    .local v0, ret:Z
    iget-object v1, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #getter for: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->mConnectedDefaultNetworks:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;
    invoke-static {v1}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$8500(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;->isHigherPriorityNetwork(I)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v1, v1, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    iget-object v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v2, v2, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mNetTrackers:[Landroid/net/NetworkStateTracker;
    invoke-static {v2}, Lcom/android/server/ConnectivityService;->access$800(Lcom/android/server/ConnectivityService;)[Landroid/net/NetworkStateTracker;

    move-result-object v2

    iget v3, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->otherDefaultNet:I

    aget-object v2, v2, v3

    #calls: Lcom/android/server/ConnectivityService;->teardown(Landroid/net/NetworkStateTracker;)Z
    invoke-static {v1, v2}, Lcom/android/server/ConnectivityService;->access$12500(Lcom/android/server/ConnectivityService;Landroid/net/NetworkStateTracker;)Z

    iget-object v1, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #getter for: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->mConnectedDefaultNetworks:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;
    invoke-static {v1}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$8500(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;

    move-result-object v1

    iget v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->otherDefaultNet:I

    invoke-virtual {v1, v2}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;->remove(I)Z

    iget-object v1, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v1, v1, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    iget-object v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v2, v2, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mNetTrackers:[Landroid/net/NetworkStateTracker;
    invoke-static {v2}, Lcom/android/server/ConnectivityService;->access$800(Lcom/android/server/ConnectivityService;)[Landroid/net/NetworkStateTracker;

    move-result-object v2

    iget v3, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->myDefaultNet:I

    aget-object v2, v2, v3

    #calls: Lcom/android/server/ConnectivityService;->teardown(Landroid/net/NetworkStateTracker;)Z
    invoke-static {v1, v2}, Lcom/android/server/ConnectivityService;->access$12500(Lcom/android/server/ConnectivityService;Landroid/net/NetworkStateTracker;)Z

    iget-object v1, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #getter for: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->mConnectedDefaultNetworks:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;
    invoke-static {v1}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$8500(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;

    move-result-object v1

    iget v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->myDefaultNet:I

    invoke-virtual {v1, v2}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;->remove(I)Z

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    iget-object v1, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v1, v1, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    iget-object v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v2, v2, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mNetTrackers:[Landroid/net/NetworkStateTracker;
    invoke-static {v2}, Lcom/android/server/ConnectivityService;->access$800(Lcom/android/server/ConnectivityService;)[Landroid/net/NetworkStateTracker;

    move-result-object v2

    aget-object v2, v2, p1

    #calls: Lcom/android/server/ConnectivityService;->teardown(Landroid/net/NetworkStateTracker;)Z
    invoke-static {v1, v2}, Lcom/android/server/ConnectivityService;->access$12500(Lcom/android/server/ConnectivityService;Landroid/net/NetworkStateTracker;)Z

    goto :goto_0
.end method

.method public processMessage(Landroid/os/Message;)Z
    .locals 13
    .parameter "msg"

    .prologue
    const/4 v1, 0x1

    const/4 v12, -0x1

    iget-object v9, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v9, v9, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v11, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->getCurrentState()Lcom/android/internal/util/IState;
    invoke-static {v11}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$10100(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/internal/util/IState;

    move-result-object v11

    invoke-interface {v11}, Lcom/android/internal/util/IState;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ".processMessage what="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget v11, p1, Landroid/os/Message;->what:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v9, v10}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    const/4 v6, 0x0

    .local v6, ret:Z
    iget v9, p1, Landroid/os/Message;->what:I

    packed-switch v9, :pswitch_data_0

    const/4 v6, 0x0

    iget-object v9, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v9, v9, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v11, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->getCurrentState()Lcom/android/internal/util/IState;
    invoke-static {v11}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$11000(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/internal/util/IState;

    move-result-object v11

    invoke-interface {v11}, Lcom/android/internal/util/IState;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ": no handler for message="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget v11, p1, Landroid/os/Message;->what:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v9, v10}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    :cond_0
    :goto_0
    :pswitch_0
    return v6

    :pswitch_1
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/net/NetworkInfo;

    .local v2, info:Landroid/net/NetworkInfo;
    invoke-virtual {p0, v2}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->handleConnect(Landroid/net/NetworkInfo;)I

    move-result v4

    .local v4, r:I
    if-nez v4, :cond_1

    const/4 v6, 0x1

    goto :goto_0

    :cond_1
    if-ne v4, v12, :cond_2

    const/4 v6, 0x0

    goto :goto_0

    :cond_2
    iget-object v9, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->deferMessage(Landroid/os/Message;)V
    invoke-static {v9, p1}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$10200(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;Landroid/os/Message;)V

    iget-object v9, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v10, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #getter for: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->mSmartConnectivityState:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$SmartConnectivityState;
    invoke-static {v10}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$10300(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$SmartConnectivityState;

    move-result-object v10

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->transitionTo(Lcom/android/internal/util/IState;)V
    invoke-static {v9, v10}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$10400(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;Lcom/android/internal/util/IState;)V

    const/4 v6, 0x1

    goto :goto_0

    .end local v2           #info:Landroid/net/NetworkInfo;
    .end local v4           #r:I
    :pswitch_2
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/net/NetworkInfo;

    .restart local v2       #info:Landroid/net/NetworkInfo;
    invoke-virtual {p0, v2}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->handleDisconnect(Landroid/net/NetworkInfo;)I

    move-result v4

    .restart local v4       #r:I
    if-nez v4, :cond_3

    const/4 v6, 0x0

    goto :goto_0

    :cond_3
    if-ne v4, v12, :cond_4

    iget-object v9, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->deferMessage(Landroid/os/Message;)V
    invoke-static {v9, p1}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$10500(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;Landroid/os/Message;)V

    iget-object v9, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v10, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #getter for: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->mSmartConnectivityState:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$SmartConnectivityState;
    invoke-static {v10}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$10300(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$SmartConnectivityState;

    move-result-object v10

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->transitionTo(Lcom/android/internal/util/IState;)V
    invoke-static {v9, v10}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$10600(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;Lcom/android/internal/util/IState;)V

    const/4 v6, 0x1

    goto :goto_0

    :cond_4
    iget-object v9, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v10, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #getter for: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->mSmartConnectivityState:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$SmartConnectivityState;
    invoke-static {v10}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$10300(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$SmartConnectivityState;

    move-result-object v10

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->transitionTo(Lcom/android/internal/util/IState;)V
    invoke-static {v9, v10}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$10700(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;Lcom/android/internal/util/IState;)V

    const/4 v6, 0x1

    goto :goto_0

    .end local v2           #info:Landroid/net/NetworkInfo;
    .end local v4           #r:I
    :pswitch_3
    iget v8, p1, Landroid/os/Message;->arg1:I

    .local v8, type:I
    iget v9, p1, Landroid/os/Message;->arg2:I

    if-ne v9, v1, :cond_5

    .local v1, doReset:Z
    :goto_1
    invoke-direct {p0, v8, v1}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->handleConnectivityChange(IZ)V

    const/4 v6, 0x1

    goto :goto_0

    .end local v1           #doReset:Z
    :cond_5
    const/4 v1, 0x0

    goto :goto_1

    .end local v8           #type:I
    :pswitch_4
    iget v8, p1, Landroid/os/Message;->arg1:I

    .restart local v8       #type:I
    invoke-virtual {p0, v8}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->handleDnsConfigurationChange(I)V

    const/4 v6, 0x1

    goto :goto_0

    .end local v8           #type:I
    :pswitch_5
    iget v3, p1, Landroid/os/Message;->arg1:I

    .local v3, netType:I
    iget v0, p1, Landroid/os/Message;->arg2:I

    .local v0, condition:I
    invoke-virtual {p0, v3, v0}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->handleInetConditionChange(II)Z

    move-result v9

    if-eqz v9, :cond_0

    const/4 v6, 0x1

    goto :goto_0

    .end local v0           #condition:I
    .end local v3           #netType:I
    :pswitch_6
    iget v3, p1, Landroid/os/Message;->arg1:I

    .restart local v3       #netType:I
    iget v7, p1, Landroid/os/Message;->arg2:I

    .local v7, sequence:I
    invoke-virtual {p0, v3, v7}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->handleInetConditionHoldEnd(II)Z

    move-result v9

    if-eqz v9, :cond_0

    const/4 v6, 0x1

    goto :goto_0

    .end local v3           #netType:I
    .end local v7           #sequence:I
    :pswitch_7
    iget-object v9, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v9, v9, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    const-string v10, "enforcing network preference not allowed in dual connectivity state"

    #calls: Lcom/android/server/ConnectivityService;->loge(Ljava/lang/String;)V
    invoke-static {v9, v10}, Lcom/android/server/ConnectivityService;->access$5400(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    const/4 v6, 0x1

    goto/16 :goto_0

    :pswitch_8
    iget-object v9, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #getter for: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->myDefaultDnsNet:I
    invoke-static {v9}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$8300(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)I

    move-result v9

    invoke-virtual {p0, v9}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->handleDnsConfigurationChange(I)V

    const/4 v6, 0x1

    goto/16 :goto_0

    :pswitch_9
    iget-object v5, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v5, Ljava/lang/String;

    .local v5, reason:Ljava/lang/String;
    iget v8, p1, Landroid/os/Message;->arg1:I

    .restart local v8       #type:I
    invoke-virtual {p0, v8, v5}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->handleConnectivitySwitch(ILjava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_6

    iget-object v9, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->deferMessage(Landroid/os/Message;)V
    invoke-static {v9, p1}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$10800(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;Landroid/os/Message;)V

    invoke-virtual {p0}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->transitionToOther()V

    :cond_6
    const/4 v6, 0x1

    goto/16 :goto_0

    .end local v5           #reason:Ljava/lang/String;
    .end local v8           #type:I
    :pswitch_a
    iget v8, p1, Landroid/os/Message;->arg1:I

    .restart local v8       #type:I
    iget-object v9, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #getter for: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->myDefaultDnsNet:I
    invoke-static {v9}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$8300(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)I

    move-result v9

    if-eq v8, v9, :cond_7

    invoke-virtual {p0, v8}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->handleDnsReprioritization(I)V

    :goto_2
    const/4 v6, 0x1

    goto/16 :goto_0

    :cond_7
    iget-object v9, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v9, v9, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Dns is already prioritized for network "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    #calls: Lcom/android/server/ConnectivityService;->logw(Ljava/lang/String;)V
    invoke-static {v9, v10}, Lcom/android/server/ConnectivityService;->access$10900(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    goto :goto_2

    nop

    :pswitch_data_0
    .packed-switch 0x1389
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_0
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_a
        :pswitch_9
    .end packed-switch
.end method

.method protected removeDefaultRoutes(I)V
    .locals 9
    .parameter "netType"

    .prologue
    const/4 v8, 0x1

    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v5, v5, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->getCurrentState()Lcom/android/internal/util/IState;
    invoke-static {v7}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$13600(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/internal/util/IState;

    move-result-object v7

    invoke-interface {v7}, Lcom/android/internal/util/IState;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " removeDefaultRoutes"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v5, v6}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    const/4 v5, -0x1

    if-ne p1, v5, :cond_2

    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v5, v5, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    const-string v6, "removing default routes for all networks"

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v5, v6}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #getter for: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->mConnectedDefaultNetworks:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;
    invoke-static {v5}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$8500(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;->getActiveDefaults()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    .local v4, type:Ljava/lang/Integer;
    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v5, v5, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mCurrentLinkProperties:[Landroid/net/LinkProperties;
    invoke-static {v5}, Lcom/android/server/ConnectivityService;->access$6300(Lcom/android/server/ConnectivityService;)[Landroid/net/LinkProperties;

    move-result-object v5

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v6

    aget-object v2, v5, v6

    .local v2, p:Landroid/net/LinkProperties;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Landroid/net/LinkProperties;->getRoutes()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/RouteInfo;

    .local v3, r:Landroid/net/RouteInfo;
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Landroid/net/RouteInfo;->isDefaultRoute()Z

    move-result v5

    if-eqz v5, :cond_1

    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v5, v5, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #calls: Lcom/android/server/ConnectivityService;->removeRoute(Landroid/net/LinkProperties;Landroid/net/RouteInfo;Z)Z
    invoke-static {v5, v2, v3, v8}, Lcom/android/server/ConnectivityService;->access$6700(Lcom/android/server/ConnectivityService;Landroid/net/LinkProperties;Landroid/net/RouteInfo;Z)Z

    goto :goto_0

    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #p:Landroid/net/LinkProperties;
    .end local v3           #r:Landroid/net/RouteInfo;
    .end local v4           #type:Ljava/lang/Integer;
    :cond_2
    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #getter for: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->mConnectedDefaultNetworks:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;
    invoke-static {v5}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$8500(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;

    move-result-object v5

    invoke-virtual {v5, p1}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$ConnectedDefaultNetworkSet;->contains(I)Z

    move-result v5

    if-eqz v5, :cond_3

    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v5, v5, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "removing default routes for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v5, v6}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v5, v5, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mCurrentLinkProperties:[Landroid/net/LinkProperties;
    invoke-static {v5}, Lcom/android/server/ConnectivityService;->access$6300(Lcom/android/server/ConnectivityService;)[Landroid/net/LinkProperties;

    move-result-object v5

    aget-object v2, v5, p1

    .restart local v2       #p:Landroid/net/LinkProperties;
    if-nez v2, :cond_4

    .end local v2           #p:Landroid/net/LinkProperties;
    :cond_3
    return-void

    .restart local v2       #p:Landroid/net/LinkProperties;
    :cond_4
    invoke-virtual {v2}, Landroid/net/LinkProperties;->getRoutes()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_5
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/RouteInfo;

    .restart local v3       #r:Landroid/net/RouteInfo;
    if-eqz v3, :cond_5

    invoke-virtual {v3}, Landroid/net/RouteInfo;->isDefaultRoute()Z

    move-result v5

    if-eqz v5, :cond_5

    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v5, v5, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #calls: Lcom/android/server/ConnectivityService;->removeRoute(Landroid/net/LinkProperties;Landroid/net/RouteInfo;Z)Z
    invoke-static {v5, v2, v3, v8}, Lcom/android/server/ConnectivityService;->access$6700(Lcom/android/server/ConnectivityService;Landroid/net/LinkProperties;Landroid/net/RouteInfo;Z)Z

    goto :goto_1
.end method

.method protected runOnEnter()V
    .locals 3

    .prologue
    iget-object v0, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->getCurrentState()Lcom/android/internal/util/IState;
    invoke-static {v2}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$11100(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/internal/util/IState;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/util/IState;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " runOnEnter"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mRouteAttributes:[Lcom/android/server/ConnectivityService$RouteAttributes;
    invoke-static {v0}, Lcom/android/server/ConnectivityService;->access$8200(Lcom/android/server/ConnectivityService;)[Lcom/android/server/ConnectivityService$RouteAttributes;

    move-result-object v0

    iget v1, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->myDefaultNet:I

    aget-object v0, v0, v1

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/server/ConnectivityService$RouteAttributes;->setMetric(I)V

    iget-object v0, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mRouteAttributes:[Lcom/android/server/ConnectivityService$RouteAttributes;
    invoke-static {v0}, Lcom/android/server/ConnectivityService;->access$8200(Lcom/android/server/ConnectivityService;)[Lcom/android/server/ConnectivityService$RouteAttributes;

    move-result-object v0

    iget v1, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->otherDefaultNet:I

    aget-object v0, v0, v1

    const/16 v1, 0x14

    invoke-virtual {v0, v1}, Lcom/android/server/ConnectivityService$RouteAttributes;->setMetric(I)V

    iget v0, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->myDefaultNet:I

    invoke-virtual {p0, v0}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->updateDefaultRouteMetric(I)V

    return-void
.end method

.method protected sendConnectivitySwitchBroadcast(Ljava/lang/String;)V
    .locals 6
    .parameter "reason"

    .prologue
    iget-object v3, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v3, v3, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->getCurrentState()Lcom/android/internal/util/IState;
    invoke-static {v5}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$11200(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/internal/util/IState;

    move-result-object v5

    invoke-interface {v5}, Lcom/android/internal/util/IState;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " sendConnectivitySwitchBroadcast"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v3, v4}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    iget-object v3, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v3, v3, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    iget v4, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->myDefaultNet:I

    invoke-virtual {v3, v4}, Lcom/android/server/ConnectivityService;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v2

    .local v2, newNetInfo:Landroid/net/NetworkInfo;
    new-instance v1, Landroid/content/Intent;

    const-string v3, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .local v1, intent:Landroid/content/Intent;
    const-string v3, "networkInfo"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_0

    const-string v3, "reason"

    invoke-virtual {v1, v3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_0
    const-string v3, "isFailover"

    const/4 v4, 0x1

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v3, "inetCondition"

    iget-object v4, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v4, v4, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mDefaultInetConditionPublished:I
    invoke-static {v4}, Lcom/android/server/ConnectivityService;->access$7000(Lcom/android/server/ConnectivityService;)I

    move-result v4

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .local v0, immediateIntent:Landroid/content/Intent;
    const-string v3, "android.net.conn.CONNECTIVITY_CHANGE_IMMEDIATE"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v3, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v3, v3, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #calls: Lcom/android/server/ConnectivityService;->sendStickyBroadcast(Landroid/content/Intent;)V
    invoke-static {v3, v0}, Lcom/android/server/ConnectivityService;->access$2800(Lcom/android/server/ConnectivityService;Landroid/content/Intent;)V

    iget-object v3, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v3, v3, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #calls: Lcom/android/server/ConnectivityService;->sendStickyBroadcast(Landroid/content/Intent;)V
    invoke-static {v3, v1}, Lcom/android/server/ConnectivityService;->access$2800(Lcom/android/server/ConnectivityService;Landroid/content/Intent;)V

    return-void
.end method

.method protected abstract transitionToOther()V
.end method

.method protected updateDefaultRouteMetric(I)V
    .locals 6
    .parameter "type"

    .prologue
    iget-object v3, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v3, v3, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->getCurrentState()Lcom/android/internal/util/IState;
    invoke-static {v5}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$13500(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/internal/util/IState;

    move-result-object v5

    invoke-interface {v5}, Lcom/android/internal/util/IState;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " updateDefaultRouteMetric"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v3, v4}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    iget-object v3, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v3, v3, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mCurrentLinkProperties:[Landroid/net/LinkProperties;
    invoke-static {v3}, Lcom/android/server/ConnectivityService;->access$6300(Lcom/android/server/ConnectivityService;)[Landroid/net/LinkProperties;

    move-result-object v3

    aget-object v1, v3, p1

    .local v1, lp:Landroid/net/LinkProperties;
    if-nez v1, :cond_1

    :cond_0
    return-void

    :cond_1
    invoke-virtual {v1}, Landroid/net/LinkProperties;->getRoutes()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_2
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/RouteInfo;

    .local v2, r:Landroid/net/RouteInfo;
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Landroid/net/RouteInfo;->isHostRoute()Z

    move-result v3

    if-nez v3, :cond_2

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    iget-object v4, v4, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    #getter for: Lcom/android/server/ConnectivityService;->mRouteAttributes:[Lcom/android/server/ConnectivityService$RouteAttributes;
    invoke-static {v4}, Lcom/android/server/ConnectivityService;->access$8200(Lcom/android/server/ConnectivityService;)[Lcom/android/server/ConnectivityService$RouteAttributes;

    move-result-object v4

    aget-object v4, v4, p1

    invoke-virtual {v4}, Lcom/android/server/ConnectivityService$RouteAttributes;->getMetric()I

    move-result v4

    invoke-virtual {p0, v1, v2, v3, v4}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->addRoute(Landroid/net/LinkProperties;Landroid/net/RouteInfo;II)Z

    goto :goto_0
.end method

.method protected updateRoutes(Landroid/net/LinkProperties;Landroid/net/LinkProperties;ZLcom/android/server/ConnectivityService$RouteAttributes;)Z
    .locals 22
    .parameter "newLp"
    .parameter "curLp"
    .parameter "isLinkDefault"
    .parameter "ra"

    .prologue
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    move-object/from16 v18, v0

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    move-object/from16 v20, v0

    #calls: Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->getCurrentState()Lcom/android/internal/util/IState;
    invoke-static/range {v20 .. v20}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->access$13900(Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;)Lcom/android/internal/util/IState;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Lcom/android/internal/util/IState;->getName()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " updateRoutes"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static/range {v18 .. v19}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    const/16 v17, 0x0

    .local v17, routesToAdd:Ljava/util/Collection;,"Ljava/util/Collection<Landroid/net/RouteInfo;>;"
    new-instance v4, Landroid/net/LinkProperties$CompareResult;

    invoke-direct {v4}, Landroid/net/LinkProperties$CompareResult;-><init>()V

    .local v4, dnsDiff:Landroid/net/LinkProperties$CompareResult;,"Landroid/net/LinkProperties$CompareResult<Ljava/net/InetAddress;>;"
    new-instance v15, Landroid/net/LinkProperties$CompareResult;

    invoke-direct {v15}, Landroid/net/LinkProperties$CompareResult;-><init>()V

    .local v15, routeDiff:Landroid/net/LinkProperties$CompareResult;,"Landroid/net/LinkProperties$CompareResult<Landroid/net/RouteInfo;>;"
    new-instance v11, Landroid/net/LinkProperties$CompareResult;

    invoke-direct {v11}, Landroid/net/LinkProperties$CompareResult;-><init>()V

    .local v11, localAddrDiff:Landroid/net/LinkProperties$CompareResult;,"Landroid/net/LinkProperties$CompareResult<Landroid/net/LinkAddress;>;"
    if-eqz p2, :cond_5

    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/net/LinkProperties;->compareRoutes(Landroid/net/LinkProperties;)Landroid/net/LinkProperties$CompareResult;

    move-result-object v15

    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/net/LinkProperties;->compareDnses(Landroid/net/LinkProperties;)Landroid/net/LinkProperties$CompareResult;

    move-result-object v4

    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/net/LinkProperties;->compareAddresses(Landroid/net/LinkProperties;)Landroid/net/LinkProperties$CompareResult;

    move-result-object v11

    :cond_0
    :goto_0
    iget-object v0, v15, Landroid/net/LinkProperties$CompareResult;->removed:Ljava/util/Collection;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/Collection;->size()I

    move-result v18

    if-nez v18, :cond_1

    iget-object v0, v15, Landroid/net/LinkProperties$CompareResult;->added:Ljava/util/Collection;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/Collection;->size()I

    move-result v18

    if-eqz v18, :cond_6

    :cond_1
    const/16 v16, 0x1

    .local v16, routesChanged:Z
    :goto_1
    iget-object v0, v15, Landroid/net/LinkProperties$CompareResult;->removed:Ljava/util/Collection;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, i$:Ljava/util/Iterator;
    :cond_2
    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_7

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/net/RouteInfo;

    .local v14, r:Landroid/net/RouteInfo;
    if-nez p3, :cond_3

    invoke-virtual {v14}, Landroid/net/RouteInfo;->isDefaultRoute()Z

    move-result v18

    if-nez v18, :cond_4

    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    move/from16 v2, v19

    #calls: Lcom/android/server/ConnectivityService;->removeRoute(Landroid/net/LinkProperties;Landroid/net/RouteInfo;Z)Z
    invoke-static {v0, v1, v14, v2}, Lcom/android/server/ConnectivityService;->access$6700(Lcom/android/server/ConnectivityService;Landroid/net/LinkProperties;Landroid/net/RouteInfo;Z)Z

    :cond_4
    if-nez p3, :cond_2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    move/from16 v2, v19

    #calls: Lcom/android/server/ConnectivityService;->removeRoute(Landroid/net/LinkProperties;Landroid/net/RouteInfo;Z)Z
    invoke-static {v0, v1, v14, v2}, Lcom/android/server/ConnectivityService;->access$6700(Lcom/android/server/ConnectivityService;Landroid/net/LinkProperties;Landroid/net/RouteInfo;Z)Z

    goto :goto_2

    .end local v8           #i$:Ljava/util/Iterator;
    .end local v14           #r:Landroid/net/RouteInfo;
    .end local v16           #routesChanged:Z
    :cond_5
    if-eqz p1, :cond_0

    invoke-virtual/range {p1 .. p1}, Landroid/net/LinkProperties;->getRoutes()Ljava/util/Collection;

    move-result-object v18

    move-object/from16 v0, v18

    iput-object v0, v15, Landroid/net/LinkProperties$CompareResult;->added:Ljava/util/Collection;

    invoke-virtual/range {p1 .. p1}, Landroid/net/LinkProperties;->getDnses()Ljava/util/Collection;

    move-result-object v18

    move-object/from16 v0, v18

    iput-object v0, v4, Landroid/net/LinkProperties$CompareResult;->added:Ljava/util/Collection;

    invoke-virtual/range {p1 .. p1}, Landroid/net/LinkProperties;->getLinkAddresses()Ljava/util/Collection;

    move-result-object v18

    move-object/from16 v0, v18

    iput-object v0, v11, Landroid/net/LinkProperties$CompareResult;->added:Ljava/util/Collection;

    goto :goto_0

    :cond_6
    const/16 v16, 0x0

    goto :goto_1

    .restart local v8       #i$:Ljava/util/Iterator;
    .restart local v16       #routesChanged:Z
    :cond_7
    iget-object v0, v15, Landroid/net/LinkProperties$CompareResult;->added:Ljava/util/Collection;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_8
    :goto_3
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_b

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/net/RouteInfo;

    .restart local v14       #r:Landroid/net/RouteInfo;
    if-nez p3, :cond_9

    invoke-virtual {v14}, Landroid/net/RouteInfo;->isDefaultRoute()Z

    move-result v18

    if-nez v18, :cond_a

    :cond_9
    const/16 v18, 0x0

    invoke-virtual/range {p4 .. p4}, Lcom/android/server/ConnectivityService$RouteAttributes;->getMetric()I

    move-result v19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v18

    move/from16 v3, v19

    invoke-virtual {v0, v1, v14, v2, v3}, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->addRoute(Landroid/net/LinkProperties;Landroid/net/RouteInfo;II)Z

    goto :goto_3

    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    move/from16 v2, v19

    #calls: Lcom/android/server/ConnectivityService;->addRoute(Landroid/net/LinkProperties;Landroid/net/RouteInfo;Z)Z
    invoke-static {v0, v1, v14, v2}, Lcom/android/server/ConnectivityService;->access$6800(Lcom/android/server/ConnectivityService;Landroid/net/LinkProperties;Landroid/net/RouteInfo;Z)Z

    invoke-virtual/range {p1 .. p1}, Landroid/net/LinkProperties;->getInterfaceName()Ljava/lang/String;

    move-result-object v9

    .local v9, ifaceName:Ljava/lang/String;
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v18

    if-nez v18, :cond_8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    move-object/from16 v18, v0

    #getter for: Lcom/android/server/ConnectivityService;->mAddedRoutes:Ljava/util/Collection;
    invoke-static/range {v18 .. v18}, Lcom/android/server/ConnectivityService;->access$13800(Lcom/android/server/ConnectivityService;)Ljava/util/Collection;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v0, v14}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    move-object/from16 v18, v0

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Removing "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " for interface "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static/range {v18 .. v19}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    move-object/from16 v18, v0

    #getter for: Lcom/android/server/ConnectivityService;->mNetd:Landroid/os/INetworkManagementService;
    invoke-static/range {v18 .. v18}, Lcom/android/server/ConnectivityService;->access$11700(Lcom/android/server/ConnectivityService;)Landroid/os/INetworkManagementService;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v0, v9, v14}, Landroid/os/INetworkManagementService;->removeRoute(Ljava/lang/String;Landroid/net/RouteInfo;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_3

    :catch_0
    move-exception v5

    .local v5, e:Ljava/lang/Exception;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    move-object/from16 v18, v0

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Exception trying to remove a route: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    #calls: Lcom/android/server/ConnectivityService;->loge(Ljava/lang/String;)V
    invoke-static/range {v18 .. v19}, Lcom/android/server/ConnectivityService;->access$5400(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    goto/16 :goto_3

    .end local v5           #e:Ljava/lang/Exception;
    .end local v9           #ifaceName:Ljava/lang/String;
    .end local v14           #r:Landroid/net/RouteInfo;
    :cond_b
    iget-object v0, v11, Landroid/net/LinkProperties$CompareResult;->removed:Ljava/util/Collection;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/Collection;->size()I

    move-result v18

    if-eqz v18, :cond_c

    iget-object v0, v11, Landroid/net/LinkProperties$CompareResult;->removed:Ljava/util/Collection;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_4
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_c

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/net/LinkAddress;

    .local v10, la:Landroid/net/LinkAddress;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    move-object/from16 v18, v0

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Removing src route for:"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual {v10}, Landroid/net/LinkAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    #calls: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static/range {v18 .. v19}, Lcom/android/server/ConnectivityService;->access$200(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    move-object/from16 v18, v0

    #getter for: Lcom/android/server/ConnectivityService;->mNetd:Landroid/os/INetworkManagementService;
    invoke-static/range {v18 .. v18}, Lcom/android/server/ConnectivityService;->access$11700(Lcom/android/server/ConnectivityService;)Landroid/os/INetworkManagementService;

    move-result-object v18

    invoke-virtual {v10}, Landroid/net/LinkAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v19

    invoke-virtual/range {p4 .. p4}, Lcom/android/server/ConnectivityService$RouteAttributes;->getTableId()I

    move-result v20

    invoke-interface/range {v18 .. v20}, Landroid/os/INetworkManagementService;->delSrcRoute([BI)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_4

    :catch_1
    move-exception v5

    .restart local v5       #e:Ljava/lang/Exception;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    move-object/from16 v18, v0

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Exception while trying to remove src route: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    #calls: Lcom/android/server/ConnectivityService;->loge(Ljava/lang/String;)V
    invoke-static/range {v18 .. v19}, Lcom/android/server/ConnectivityService;->access$5400(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    goto :goto_4

    .end local v5           #e:Ljava/lang/Exception;
    .end local v10           #la:Landroid/net/LinkAddress;
    :cond_c
    iget-object v0, v11, Landroid/net/LinkProperties$CompareResult;->added:Ljava/util/Collection;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/Collection;->size()I

    move-result v18

    if-eqz v18, :cond_11

    const/4 v6, 0x0

    .local v6, gw4Addr:Ljava/net/InetAddress;
    const/4 v7, 0x0

    .local v7, gw6Addr:Ljava/net/InetAddress;
    invoke-virtual/range {p1 .. p1}, Landroid/net/LinkProperties;->getInterfaceName()Ljava/lang/String;

    move-result-object v9

    .restart local v9       #ifaceName:Ljava/lang/String;
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v18

    if-nez v18, :cond_11

    invoke-virtual/range {p1 .. p1}, Landroid/net/LinkProperties;->getRoutes()Ljava/util/Collection;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_d
    :goto_5
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_f

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/net/RouteInfo;

    .restart local v14       #r:Landroid/net/RouteInfo;
    invoke-virtual {v14}, Landroid/net/RouteInfo;->isDefaultRoute()Z

    move-result v18

    if-eqz v18, :cond_d

    invoke-virtual {v14}, Landroid/net/RouteInfo;->getGateway()Ljava/net/InetAddress;

    move-result-object v18

    move-object/from16 v0, v18

    instance-of v0, v0, Ljava/net/Inet4Address;

    move/from16 v18, v0

    if-eqz v18, :cond_e

    invoke-virtual {v14}, Landroid/net/RouteInfo;->getGateway()Ljava/net/InetAddress;

    move-result-object v6

    goto :goto_5

    :cond_e
    invoke-virtual {v14}, Landroid/net/RouteInfo;->getGateway()Ljava/net/InetAddress;

    move-result-object v7

    goto :goto_5

    .end local v14           #r:Landroid/net/RouteInfo;
    :cond_f
    iget-object v0, v11, Landroid/net/LinkProperties$CompareResult;->added:Ljava/util/Collection;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_6
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_11

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/net/LinkAddress;

    .restart local v10       #la:Landroid/net/LinkAddress;
    :try_start_2
    invoke-virtual {v10}, Landroid/net/LinkAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v18

    move-object/from16 v0, v18

    instance-of v0, v0, Ljava/net/Inet4Address;

    move/from16 v18, v0

    if-eqz v18, :cond_10

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    move-object/from16 v18, v0

    #getter for: Lcom/android/server/ConnectivityService;->mNetd:Landroid/os/INetworkManagementService;
    invoke-static/range {v18 .. v18}, Lcom/android/server/ConnectivityService;->access$11700(Lcom/android/server/ConnectivityService;)Landroid/os/INetworkManagementService;

    move-result-object v18

    invoke-virtual {v10}, Landroid/net/LinkAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v19

    invoke-virtual {v6}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v20

    invoke-virtual/range {p4 .. p4}, Lcom/android/server/ConnectivityService$RouteAttributes;->getTableId()I

    move-result v21

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    move/from16 v3, v21

    invoke-interface {v0, v9, v1, v2, v3}, Landroid/os/INetworkManagementService;->replaceSrcRoute(Ljava/lang/String;[B[BI)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_6

    :catch_2
    move-exception v5

    .restart local v5       #e:Ljava/lang/Exception;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    move-object/from16 v18, v0

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Exception while trying to add src route: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    #calls: Lcom/android/server/ConnectivityService;->loge(Ljava/lang/String;)V
    invoke-static/range {v18 .. v19}, Lcom/android/server/ConnectivityService;->access$5400(Lcom/android/server/ConnectivityService;Ljava/lang/String;)V

    goto :goto_6

    .end local v5           #e:Ljava/lang/Exception;
    :cond_10
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    move-object/from16 v18, v0

    #getter for: Lcom/android/server/ConnectivityService;->mNetd:Landroid/os/INetworkManagementService;
    invoke-static/range {v18 .. v18}, Lcom/android/server/ConnectivityService;->access$11700(Lcom/android/server/ConnectivityService;)Landroid/os/INetworkManagementService;

    move-result-object v18

    invoke-virtual {v10}, Landroid/net/LinkAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v19

    invoke-virtual {v7}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v20

    invoke-virtual/range {p4 .. p4}, Lcom/android/server/ConnectivityService$RouteAttributes;->getTableId()I

    move-result v21

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    move/from16 v3, v21

    invoke-interface {v0, v9, v1, v2, v3}, Landroid/os/INetworkManagementService;->replaceSrcRoute(Ljava/lang/String;[B[BI)Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto/16 :goto_6

    .end local v6           #gw4Addr:Ljava/net/InetAddress;
    .end local v7           #gw6Addr:Ljava/net/InetAddress;
    .end local v9           #ifaceName:Ljava/lang/String;
    .end local v10           #la:Landroid/net/LinkAddress;
    :cond_11
    if-eqz v16, :cond_13

    if-eqz p2, :cond_12

    invoke-virtual/range {p2 .. p2}, Landroid/net/LinkProperties;->getDnses()Ljava/util/Collection;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_7
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_12

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/net/InetAddress;

    .local v13, oldDns:Ljava/net/InetAddress;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    #calls: Lcom/android/server/ConnectivityService;->removeRouteToAddress(Landroid/net/LinkProperties;Ljava/net/InetAddress;)Z
    invoke-static {v0, v1, v13}, Lcom/android/server/ConnectivityService;->access$14000(Lcom/android/server/ConnectivityService;Landroid/net/LinkProperties;Ljava/net/InetAddress;)Z

    goto :goto_7

    .end local v13           #oldDns:Ljava/net/InetAddress;
    :cond_12
    if-eqz p1, :cond_15

    invoke-virtual/range {p1 .. p1}, Landroid/net/LinkProperties;->getDnses()Ljava/util/Collection;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_8
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_15

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/net/InetAddress;

    .local v12, newDns:Ljava/net/InetAddress;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    #calls: Lcom/android/server/ConnectivityService;->addRouteToAddress(Landroid/net/LinkProperties;Ljava/net/InetAddress;)Z
    invoke-static {v0, v1, v12}, Lcom/android/server/ConnectivityService;->access$14100(Lcom/android/server/ConnectivityService;Landroid/net/LinkProperties;Ljava/net/InetAddress;)Z

    goto :goto_8

    .end local v12           #newDns:Ljava/net/InetAddress;
    :cond_13
    iget-object v0, v4, Landroid/net/LinkProperties$CompareResult;->removed:Ljava/util/Collection;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_9
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_14

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/net/InetAddress;

    .restart local v13       #oldDns:Ljava/net/InetAddress;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    #calls: Lcom/android/server/ConnectivityService;->removeRouteToAddress(Landroid/net/LinkProperties;Ljava/net/InetAddress;)Z
    invoke-static {v0, v1, v13}, Lcom/android/server/ConnectivityService;->access$14000(Lcom/android/server/ConnectivityService;Landroid/net/LinkProperties;Ljava/net/InetAddress;)Z

    goto :goto_9

    .end local v13           #oldDns:Ljava/net/InetAddress;
    :cond_14
    iget-object v0, v4, Landroid/net/LinkProperties$CompareResult;->added:Ljava/util/Collection;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_a
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_15

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/net/InetAddress;

    .restart local v12       #newDns:Ljava/net/InetAddress;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM$DualConnectivityState;->this$1:Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/android/server/ConnectivityService$ConnectivityServiceHSM;->this$0:Lcom/android/server/ConnectivityService;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    #calls: Lcom/android/server/ConnectivityService;->addRouteToAddress(Landroid/net/LinkProperties;Ljava/net/InetAddress;)Z
    invoke-static {v0, v1, v12}, Lcom/android/server/ConnectivityService;->access$14100(Lcom/android/server/ConnectivityService;Landroid/net/LinkProperties;Ljava/net/InetAddress;)Z

    goto :goto_a

    .end local v12           #newDns:Ljava/net/InetAddress;
    :cond_15
    return v16
.end method
