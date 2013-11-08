.class Landroid/server/BluetoothAdapterStateMachine$HotOff;
.super Lcom/android/internal/util/State;
.source "BluetoothAdapterStateMachine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/server/BluetoothAdapterStateMachine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HotOff"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/server/BluetoothAdapterStateMachine;


# direct methods
.method private constructor <init>(Landroid/server/BluetoothAdapterStateMachine;)V
    .locals 0
    .parameter

    .prologue
    iput-object p1, p0, Landroid/server/BluetoothAdapterStateMachine$HotOff;->this$0:Landroid/server/BluetoothAdapterStateMachine;

    invoke-direct {p0}, Lcom/android/internal/util/State;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroid/server/BluetoothAdapterStateMachine;Landroid/server/BluetoothAdapterStateMachine$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    invoke-direct {p0, p1}, Landroid/server/BluetoothAdapterStateMachine$HotOff;-><init>(Landroid/server/BluetoothAdapterStateMachine;)V

    return-void
.end method


# virtual methods
.method public enter()V
    .locals 0

    .prologue
    return-void
.end method

.method public processMessage(Landroid/os/Message;)Z
    .locals 7
    .parameter "message"

    .prologue
    const/16 v6, 0xb

    const/4 v3, 0x0

    const/4 v5, 0x1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "HotOff process message: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v4, p1, Landroid/os/Message;->what:I

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Landroid/server/BluetoothAdapterStateMachine;->log(Ljava/lang/String;)V
    invoke-static {v2}, Landroid/server/BluetoothAdapterStateMachine;->access$600(Ljava/lang/String;)V

    const/4 v1, 0x1

    .local v1, retValue:Z
    iget v2, p1, Landroid/os/Message;->what:I

    sparse-switch v2, :sswitch_data_0

    move v1, v3

    .end local v1           #retValue:Z
    :cond_0
    :goto_0
    :sswitch_0
    return v1

    .restart local v1       #retValue:Z
    :sswitch_1
    iget-object v2, p0, Landroid/server/BluetoothAdapterStateMachine$HotOff;->this$0:Landroid/server/BluetoothAdapterStateMachine;

    #calls: Landroid/server/BluetoothAdapterStateMachine;->broadcastState(I)V
    invoke-static {v2, v6}, Landroid/server/BluetoothAdapterStateMachine;->access$700(Landroid/server/BluetoothAdapterStateMachine;I)V

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Landroid/server/BluetoothAdapterStateMachine$HotOff;->this$0:Landroid/server/BluetoothAdapterStateMachine;

    #calls: Landroid/server/BluetoothAdapterStateMachine;->persistSwitchSetting(Z)V
    invoke-static {v2, v5}, Landroid/server/BluetoothAdapterStateMachine;->access$1000(Landroid/server/BluetoothAdapterStateMachine;Z)V

    :cond_1
    :sswitch_2
    const-string v2, "bluetooth.isEnabled"

    const-string v3, "true"

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    const-wide/16 v2, 0xc8

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    iget-object v2, p0, Landroid/server/BluetoothAdapterStateMachine$HotOff;->this$0:Landroid/server/BluetoothAdapterStateMachine;

    #getter for: Landroid/server/BluetoothAdapterStateMachine;->mBluetoothService:Landroid/server/BluetoothService;
    invoke-static {v2}, Landroid/server/BluetoothAdapterStateMachine;->access$2400(Landroid/server/BluetoothAdapterStateMachine;)Landroid/server/BluetoothService;

    move-result-object v2

    invoke-virtual {v2, v5}, Landroid/server/BluetoothService;->switchConnectable(Z)V

    iget-object v2, p0, Landroid/server/BluetoothAdapterStateMachine$HotOff;->this$0:Landroid/server/BluetoothAdapterStateMachine;

    iget-object v3, p0, Landroid/server/BluetoothAdapterStateMachine$HotOff;->this$0:Landroid/server/BluetoothAdapterStateMachine;

    #getter for: Landroid/server/BluetoothAdapterStateMachine;->mSwitching:Landroid/server/BluetoothAdapterStateMachine$Switching;
    invoke-static {v3}, Landroid/server/BluetoothAdapterStateMachine;->access$3300(Landroid/server/BluetoothAdapterStateMachine;)Landroid/server/BluetoothAdapterStateMachine$Switching;

    move-result-object v3

    #calls: Landroid/server/BluetoothAdapterStateMachine;->transitionTo(Lcom/android/internal/util/IState;)V
    invoke-static {v2, v3}, Landroid/server/BluetoothAdapterStateMachine;->access$3400(Landroid/server/BluetoothAdapterStateMachine;Lcom/android/internal/util/IState;)V

    goto :goto_0

    :catch_0
    move-exception v0

    .local v0, e:Ljava/lang/InterruptedException;
    const-string v2, "Sleep interrupted: BTC is not yet up, might miss some of the events"

    #calls: Landroid/server/BluetoothAdapterStateMachine;->log(Ljava/lang/String;)V
    invoke-static {v2}, Landroid/server/BluetoothAdapterStateMachine;->access$600(Ljava/lang/String;)V

    goto :goto_1

    .end local v0           #e:Ljava/lang/InterruptedException;
    :sswitch_3
    iget-object v2, p0, Landroid/server/BluetoothAdapterStateMachine$HotOff;->this$0:Landroid/server/BluetoothAdapterStateMachine;

    #calls: Landroid/server/BluetoothAdapterStateMachine;->shutoffBluetooth()V
    invoke-static {v2}, Landroid/server/BluetoothAdapterStateMachine;->access$3000(Landroid/server/BluetoothAdapterStateMachine;)V

    iget-object v2, p0, Landroid/server/BluetoothAdapterStateMachine$HotOff;->this$0:Landroid/server/BluetoothAdapterStateMachine;

    const/16 v3, 0x6a

    const-wide/16 v4, 0x14

    invoke-virtual {v2, v3, v4, v5}, Landroid/server/BluetoothAdapterStateMachine;->sendMessageDelayed(IJ)V

    goto :goto_0

    :sswitch_4
    iget-object v2, p0, Landroid/server/BluetoothAdapterStateMachine$HotOff;->this$0:Landroid/server/BluetoothAdapterStateMachine;

    iget-object v3, p0, Landroid/server/BluetoothAdapterStateMachine$HotOff;->this$0:Landroid/server/BluetoothAdapterStateMachine;

    #getter for: Landroid/server/BluetoothAdapterStateMachine;->mPowerOff:Landroid/server/BluetoothAdapterStateMachine$PowerOff;
    invoke-static {v3}, Landroid/server/BluetoothAdapterStateMachine;->access$1200(Landroid/server/BluetoothAdapterStateMachine;)Landroid/server/BluetoothAdapterStateMachine$PowerOff;

    move-result-object v3

    #calls: Landroid/server/BluetoothAdapterStateMachine;->transitionTo(Lcom/android/internal/util/IState;)V
    invoke-static {v2, v3}, Landroid/server/BluetoothAdapterStateMachine;->access$3500(Landroid/server/BluetoothAdapterStateMachine;Lcom/android/internal/util/IState;)V

    iget-object v2, p0, Landroid/server/BluetoothAdapterStateMachine$HotOff;->this$0:Landroid/server/BluetoothAdapterStateMachine;

    #getter for: Landroid/server/BluetoothAdapterStateMachine;->mDelayBroadcastStateOff:Z
    invoke-static {v2}, Landroid/server/BluetoothAdapterStateMachine;->access$2900(Landroid/server/BluetoothAdapterStateMachine;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Landroid/server/BluetoothAdapterStateMachine$HotOff;->this$0:Landroid/server/BluetoothAdapterStateMachine;

    const/16 v3, 0xa

    #calls: Landroid/server/BluetoothAdapterStateMachine;->broadcastState(I)V
    invoke-static {v2, v3}, Landroid/server/BluetoothAdapterStateMachine;->access$700(Landroid/server/BluetoothAdapterStateMachine;I)V

    goto :goto_0

    :sswitch_5
    iget-object v2, p0, Landroid/server/BluetoothAdapterStateMachine$HotOff;->this$0:Landroid/server/BluetoothAdapterStateMachine;

    #calls: Landroid/server/BluetoothAdapterStateMachine;->getBluetoothPersistedSetting()Z
    invoke-static {v2}, Landroid/server/BluetoothAdapterStateMachine;->access$1500(Landroid/server/BluetoothAdapterStateMachine;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Landroid/server/BluetoothAdapterStateMachine$HotOff;->this$0:Landroid/server/BluetoothAdapterStateMachine;

    #calls: Landroid/server/BluetoothAdapterStateMachine;->broadcastState(I)V
    invoke-static {v2, v6}, Landroid/server/BluetoothAdapterStateMachine;->access$700(Landroid/server/BluetoothAdapterStateMachine;I)V

    iget-object v2, p0, Landroid/server/BluetoothAdapterStateMachine$HotOff;->this$0:Landroid/server/BluetoothAdapterStateMachine;

    iget-object v3, p0, Landroid/server/BluetoothAdapterStateMachine$HotOff;->this$0:Landroid/server/BluetoothAdapterStateMachine;

    #getter for: Landroid/server/BluetoothAdapterStateMachine;->mSwitching:Landroid/server/BluetoothAdapterStateMachine$Switching;
    invoke-static {v3}, Landroid/server/BluetoothAdapterStateMachine;->access$3300(Landroid/server/BluetoothAdapterStateMachine;)Landroid/server/BluetoothAdapterStateMachine$Switching;

    move-result-object v3

    #calls: Landroid/server/BluetoothAdapterStateMachine;->transitionTo(Lcom/android/internal/util/IState;)V
    invoke-static {v2, v3}, Landroid/server/BluetoothAdapterStateMachine;->access$3600(Landroid/server/BluetoothAdapterStateMachine;Lcom/android/internal/util/IState;)V

    iget-object v2, p0, Landroid/server/BluetoothAdapterStateMachine$HotOff;->this$0:Landroid/server/BluetoothAdapterStateMachine;

    #getter for: Landroid/server/BluetoothAdapterStateMachine;->mBluetoothService:Landroid/server/BluetoothService;
    invoke-static {v2}, Landroid/server/BluetoothAdapterStateMachine;->access$2400(Landroid/server/BluetoothAdapterStateMachine;)Landroid/server/BluetoothService;

    move-result-object v2

    invoke-virtual {v2, v5}, Landroid/server/BluetoothService;->switchConnectable(Z)V

    goto/16 :goto_0

    :sswitch_6
    iget-object v2, p0, Landroid/server/BluetoothAdapterStateMachine$HotOff;->this$0:Landroid/server/BluetoothAdapterStateMachine;

    iget-object v3, p0, Landroid/server/BluetoothAdapterStateMachine$HotOff;->this$0:Landroid/server/BluetoothAdapterStateMachine;

    #getter for: Landroid/server/BluetoothAdapterStateMachine;->mPerProcessState:Landroid/server/BluetoothAdapterStateMachine$PerProcessState;
    invoke-static {v3}, Landroid/server/BluetoothAdapterStateMachine;->access$3700(Landroid/server/BluetoothAdapterStateMachine;)Landroid/server/BluetoothAdapterStateMachine$PerProcessState;

    move-result-object v3

    #calls: Landroid/server/BluetoothAdapterStateMachine;->transitionTo(Lcom/android/internal/util/IState;)V
    invoke-static {v2, v3}, Landroid/server/BluetoothAdapterStateMachine;->access$3800(Landroid/server/BluetoothAdapterStateMachine;Lcom/android/internal/util/IState;)V

    iget-object v2, p0, Landroid/server/BluetoothAdapterStateMachine$HotOff;->this$0:Landroid/server/BluetoothAdapterStateMachine;

    #calls: Landroid/server/BluetoothAdapterStateMachine;->deferMessage(Landroid/os/Message;)V
    invoke-static {v2, p1}, Landroid/server/BluetoothAdapterStateMachine;->access$3900(Landroid/server/BluetoothAdapterStateMachine;Landroid/os/Message;)V

    iget-object v2, p0, Landroid/server/BluetoothAdapterStateMachine$HotOff;->this$0:Landroid/server/BluetoothAdapterStateMachine;

    #getter for: Landroid/server/BluetoothAdapterStateMachine;->mBluetoothService:Landroid/server/BluetoothService;
    invoke-static {v2}, Landroid/server/BluetoothAdapterStateMachine;->access$2400(Landroid/server/BluetoothAdapterStateMachine;)Landroid/server/BluetoothService;

    move-result-object v2

    invoke-virtual {v2, v5}, Landroid/server/BluetoothService;->switchConnectable(Z)V

    goto/16 :goto_0

    :sswitch_7
    iget-object v4, p0, Landroid/server/BluetoothAdapterStateMachine$HotOff;->this$0:Landroid/server/BluetoothAdapterStateMachine;

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/bluetooth/IBluetoothStateChangeCallback;

    #calls: Landroid/server/BluetoothAdapterStateMachine;->perProcessCallback(ZLandroid/bluetooth/IBluetoothStateChangeCallback;)V
    invoke-static {v4, v3, v2}, Landroid/server/BluetoothAdapterStateMachine;->access$2300(Landroid/server/BluetoothAdapterStateMachine;ZLandroid/bluetooth/IBluetoothStateChangeCallback;)V

    goto/16 :goto_0

    :sswitch_8
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Landroid/server/BluetoothAdapterStateMachine$HotOff;->this$0:Landroid/server/BluetoothAdapterStateMachine;

    const/4 v3, 0x5

    const/4 v4, 0x0

    #calls: Landroid/server/BluetoothAdapterStateMachine;->recoverStateMachine(ILjava/lang/Object;)V
    invoke-static {v2, v3, v4}, Landroid/server/BluetoothAdapterStateMachine;->access$4000(Landroid/server/BluetoothAdapterStateMachine;ILjava/lang/Object;)V

    goto/16 :goto_0

    :sswitch_9
    iget-object v2, p0, Landroid/server/BluetoothAdapterStateMachine$HotOff;->this$0:Landroid/server/BluetoothAdapterStateMachine;

    #calls: Landroid/server/BluetoothAdapterStateMachine;->deferMessage(Landroid/os/Message;)V
    invoke-static {v2, p1}, Landroid/server/BluetoothAdapterStateMachine;->access$4100(Landroid/server/BluetoothAdapterStateMachine;Landroid/os/Message;)V

    goto/16 :goto_0

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_1
        0x2 -> :sswitch_0
        0x3 -> :sswitch_6
        0x4 -> :sswitch_7
        0x5 -> :sswitch_9
        0x36 -> :sswitch_8
        0x37 -> :sswitch_3
        0x38 -> :sswitch_5
        0x65 -> :sswitch_2
        0x66 -> :sswitch_3
        0x6a -> :sswitch_4
    .end sparse-switch
.end method
