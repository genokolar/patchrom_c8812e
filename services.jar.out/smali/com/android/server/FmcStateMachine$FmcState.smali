.class abstract Lcom/android/server/FmcStateMachine$FmcState;
.super Lcom/android/internal/util/State;
.source "FmcStateMachine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/FmcStateMachine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x400
    name = "FmcState"
.end annotation


# instance fields
.field protected final TAG:Ljava/lang/String;

.field final synthetic this$0:Lcom/android/server/FmcStateMachine;

.field protected timeout:I


# direct methods
.method protected constructor <init>(Lcom/android/server/FmcStateMachine;)V
    .locals 2
    .parameter

    .prologue
    iput-object p1, p0, Lcom/android/server/FmcStateMachine$FmcState;->this$0:Lcom/android/server/FmcStateMachine;

    invoke-direct {p0}, Lcom/android/internal/util/State;-><init>()V

    const-string v0, "FmcState"

    iput-object v0, p0, Lcom/android/server/FmcStateMachine$FmcState;->TAG:Ljava/lang/String;

    const/16 v0, 0x4e20

    iput v0, p0, Lcom/android/server/FmcStateMachine$FmcState;->timeout:I

    invoke-virtual {p0}, Lcom/android/server/FmcStateMachine$FmcState;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "constructor"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method


# virtual methods
.method protected final handleActiveRouting([B)V
    .locals 4
    .parameter "hostRoutingIpAddr"

    .prologue
    :try_start_0
    invoke-virtual {p0}, Lcom/android/server/FmcStateMachine$FmcState;->getName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "handleActiveRouting hostRoutingIpAddr="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    :try_start_1
    invoke-virtual {p0}, Lcom/android/server/FmcStateMachine$FmcState;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Creating a host route"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v1, Lcom/android/server/FmcStateMachine;->mConnSvc:Lcom/android/server/ConnectivityService;

    const/4 v2, 0x1

    invoke-virtual {v1, v2, p1}, Lcom/android/server/ConnectivityService;->requestRouteToHostAddress(I[B)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p0}, Lcom/android/server/FmcStateMachine$FmcState;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "failed to requestRouteToHostAddress"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :cond_0
    :goto_1
    return-void

    :catch_0
    move-exception v0

    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {p0}, Lcom/android/server/FmcStateMachine$FmcState;->getName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "handleActiveRouting Exception="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .end local v0           #e:Ljava/lang/Exception;
    :catch_1
    move-exception v0

    .restart local v0       #e:Ljava/lang/Exception;
    invoke-virtual {p0}, Lcom/android/server/FmcStateMachine$FmcState;->getName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "handleActiveRouting Exception="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method protected final sendDisableData()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/android/server/FmcStateMachine$FmcState;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "sendDisableData"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0, v2}, Lcom/android/server/FmcStateMachine$FmcState;->setDataReadiness(Z)V

    sget-object v0, Lcom/android/server/FmcStateMachine;->mConnSvc:Lcom/android/server/ConnectivityService;

    invoke-virtual {v0, v2}, Lcom/android/server/ConnectivityService;->bringDownRat(I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/server/FmcStateMachine$FmcState;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "sendDisableData bringDownRat true"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/server/FmcStateMachine$FmcState;->this$0:Lcom/android/server/FmcStateMachine;

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Lcom/android/server/FmcStateMachine;->sendMessage(I)V

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/android/server/FmcStateMachine$FmcState;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "sendDisableData bringDownRat false"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method protected final sendDisableFmc()V
    .locals 2

    .prologue
    invoke-virtual {p0}, Lcom/android/server/FmcStateMachine$FmcState;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "sendDisableFmc"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/server/FmcStateMachine$FmcState;->sendFmc(I)V

    const-string v0, "FmcState"

    const-string v1, "sendDisableFmc (exit)"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method protected final sendEnableData()V
    .locals 2

    .prologue
    invoke-virtual {p0}, Lcom/android/server/FmcStateMachine$FmcState;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "sendEnableData"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/server/FmcStateMachine$FmcState;->setDataReadiness(Z)V

    sget-object v0, Lcom/android/server/FmcStateMachine;->mConnSvc:Lcom/android/server/ConnectivityService;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/server/ConnectivityService;->bringUpRat(I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/server/FmcStateMachine$FmcState;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "sendEnableData bringUpRat true"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/android/server/FmcStateMachine$FmcState;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "sendEnableData bringUpRat false"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/server/FmcStateMachine$FmcState;->this$0:Lcom/android/server/FmcStateMachine;

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Lcom/android/server/FmcStateMachine;->sendMessage(I)V

    goto :goto_0
.end method

.method protected final sendEnableFmc()V
    .locals 2

    .prologue
    invoke-virtual {p0}, Lcom/android/server/FmcStateMachine$FmcState;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "sendEnableFmc"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/server/FmcStateMachine$FmcState;->sendFmc(I)V

    const-string v0, "FmcState"

    const-string v1, "sendEnableFmc (exit)"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method protected final sendFmc(I)V
    .locals 4
    .parameter "command"

    .prologue
    invoke-virtual {p0}, Lcom/android/server/FmcStateMachine$FmcState;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "sendFmc"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v1, Lcom/android/server/FmcStateMachine;->fmcComSendThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->isAlive()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p0}, Lcom/android/server/FmcStateMachine$FmcState;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "sendFmc fmcComSendThread not active"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void

    :cond_0
    :try_start_0
    sget-object v1, Lcom/android/server/FmcStateMachine;->sendQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/concurrent/BlockingQueue;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    const-string v1, "FmcState"

    const-string v2, "sendFmc (exit)"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :catch_0
    move-exception v0

    .local v0, e:Ljava/lang/IllegalStateException;
    invoke-virtual {p0}, Lcom/android/server/FmcStateMachine$FmcState;->getName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sendFmc IllegalStateException="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method protected final setDataReadiness(Z)V
    .locals 5
    .parameter "bypass"

    .prologue
    invoke-virtual {p0}, Lcom/android/server/FmcStateMachine$FmcState;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "setDataReadiness"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v2, "phone"

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/ITelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ITelephony;

    move-result-object v1

    .local v1, phone:Lcom/android/internal/telephony/ITelephony;
    if-eqz p1, :cond_0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    :try_start_0
    invoke-interface {v1, v2, v3, v4}, Lcom/android/internal/telephony/ITelephony;->setDataReadinessChecks(ZZZ)V

    :goto_0
    return-void

    :cond_0
    const/4 v2, 0x1

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-interface {v1, v2, v3, v4}, Lcom/android/internal/telephony/ITelephony;->setDataReadinessChecks(ZZZ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {p0}, Lcom/android/server/FmcStateMachine$FmcState;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "remoteException while calling setDataReadinessChecks"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method protected setStatus(I)V
    .locals 4
    .parameter "status"

    .prologue
    invoke-virtual {p0}, Lcom/android/server/FmcStateMachine$FmcState;->getName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setStatus status="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p1}, Lcom/android/server/FmcStateMachine;->access$302(I)I

    sget-object v1, Lcom/android/server/FmcStateMachine;->mListener:Landroid/net/IFmcEventListener;

    if-eqz v1, :cond_0

    :try_start_0
    sget-object v1, Lcom/android/server/FmcStateMachine;->mListener:Landroid/net/IFmcEventListener;

    invoke-interface {v1, p1}, Landroid/net/IFmcEventListener;->onFmcStatus(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    .local v0, e:Landroid/os/RemoteException;
    invoke-virtual {p0}, Lcom/android/server/FmcStateMachine$FmcState;->getName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setStatus RemoteException="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .end local v0           #e:Landroid/os/RemoteException;
    :cond_0
    invoke-virtual {p0}, Lcom/android/server/FmcStateMachine$FmcState;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "setStatus mListener is null"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method protected final startStateTimer(Ljava/lang/String;I)V
    .locals 5
    .parameter "prop"
    .parameter "defaultTimeout"

    .prologue
    invoke-virtual {p0}, Lcom/android/server/FmcStateMachine$FmcState;->getName()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "startStateTimer prop="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .local v1, sTimeout:Ljava/lang/String;
    if-eqz v1, :cond_0

    :try_start_0
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/android/server/FmcStateMachine$FmcState;->timeout:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    invoke-virtual {p0}, Lcom/android/server/FmcStateMachine$FmcState;->getName()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "startStateTimer timeout="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/android/server/FmcStateMachine$FmcState;->timeout:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v2, Lcom/android/server/FmcStateMachine;->fmcTimer:Lcom/android/server/FmcTimer;

    new-instance v3, Lcom/android/server/FmcStateMachine$FmcTimerCallback;

    iget-object v4, p0, Lcom/android/server/FmcStateMachine$FmcState;->this$0:Lcom/android/server/FmcStateMachine;

    invoke-direct {v3, v4}, Lcom/android/server/FmcStateMachine$FmcTimerCallback;-><init>(Lcom/android/server/FmcStateMachine;)V

    iget v4, p0, Lcom/android/server/FmcStateMachine$FmcState;->timeout:I

    invoke-virtual {v2, v3, v4}, Lcom/android/server/FmcTimer;->startTimer(Ljava/util/TimerTask;I)Z

    return-void

    :catch_0
    move-exception v0

    .local v0, e:Ljava/lang/NumberFormatException;
    const-string v2, "FmcState"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "startStateTimer NumberFormatException="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput p2, p0, Lcom/android/server/FmcStateMachine$FmcState;->timeout:I

    goto :goto_0

    .end local v0           #e:Ljava/lang/NumberFormatException;
    :cond_0
    invoke-virtual {p0}, Lcom/android/server/FmcStateMachine$FmcState;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "startStateTimer default timeout"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput p2, p0, Lcom/android/server/FmcStateMachine$FmcState;->timeout:I

    goto :goto_0
.end method

.method protected final transitionToState(Lcom/android/internal/util/IState;)V
    .locals 3
    .parameter "destState"

    .prologue
    invoke-virtual {p0}, Lcom/android/server/FmcStateMachine$FmcState;->getName()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "transitionToState "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p1}, Lcom/android/internal/util/IState;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/android/server/FmcStateMachine;->fmcTimer:Lcom/android/server/FmcTimer;

    invoke-virtual {v0}, Lcom/android/server/FmcTimer;->clearTimer()Z

    iget-object v0, p0, Lcom/android/server/FmcStateMachine$FmcState;->this$0:Lcom/android/server/FmcStateMachine;

    #calls: Lcom/android/server/FmcStateMachine;->transitionTo(Lcom/android/internal/util/IState;)V
    invoke-static {v0, p1}, Lcom/android/server/FmcStateMachine;->access$200(Lcom/android/server/FmcStateMachine;Lcom/android/internal/util/IState;)V

    return-void
.end method
