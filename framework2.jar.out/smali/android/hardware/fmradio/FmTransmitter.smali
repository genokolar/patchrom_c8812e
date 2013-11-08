.class public Landroid/hardware/fmradio/FmTransmitter;
.super Landroid/hardware/fmradio/FmTransceiver;
.source "FmTransmitter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/hardware/fmradio/FmTransmitter$TransmitterCallbacks;,
        Landroid/hardware/fmradio/FmTransmitter$FmPSFeatures;
    }
.end annotation


# static fields
.field public static final RDS_GRPS_TX_PAUSE:I = 0x0

.field public static final RDS_GRPS_TX_RESUME:I = 0x1

.field public static final RDS_GRPS_TX_STOP:I = 0x2


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    invoke-direct {p0}, Landroid/hardware/fmradio/FmTransceiver;-><init>()V

    new-instance v0, Landroid/hardware/fmradio/FmRxControls;

    invoke-direct {v0}, Landroid/hardware/fmradio/FmRxControls;-><init>()V

    iput-object v0, p0, Landroid/hardware/fmradio/FmTransceiver;->mControl:Landroid/hardware/fmradio/FmRxControls;

    new-instance v0, Landroid/hardware/fmradio/FmRxRdsData;

    sget v1, Landroid/hardware/fmradio/FmTransmitter;->sFd:I

    invoke-direct {v0, v1}, Landroid/hardware/fmradio/FmRxRdsData;-><init>(I)V

    iput-object v0, p0, Landroid/hardware/fmradio/FmTransceiver;->mRdsData:Landroid/hardware/fmradio/FmRxRdsData;

    new-instance v0, Landroid/hardware/fmradio/FmRxEventListner;

    invoke-direct {v0}, Landroid/hardware/fmradio/FmRxEventListner;-><init>()V

    iput-object v0, p0, Landroid/hardware/fmradio/FmTransceiver;->mRxEvents:Landroid/hardware/fmradio/FmRxEventListner;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/hardware/fmradio/FmRxEvCallbacksAdaptor;)V
    .locals 2
    .parameter "path"
    .parameter "callbacks"

    .prologue
    invoke-direct {p0}, Landroid/hardware/fmradio/FmTransceiver;-><init>()V

    invoke-virtual {p0, p1}, Landroid/hardware/fmradio/FmTransmitter;->acquire(Ljava/lang/String;)Z

    invoke-virtual {p0, p2}, Landroid/hardware/fmradio/FmTransmitter;->registerTransmitClient(Landroid/hardware/fmradio/FmRxEvCallbacks;)Z

    new-instance v0, Landroid/hardware/fmradio/FmRxControls;

    invoke-direct {v0}, Landroid/hardware/fmradio/FmRxControls;-><init>()V

    iput-object v0, p0, Landroid/hardware/fmradio/FmTransceiver;->mControl:Landroid/hardware/fmradio/FmRxControls;

    new-instance v0, Landroid/hardware/fmradio/FmRxRdsData;

    sget v1, Landroid/hardware/fmradio/FmTransmitter;->sFd:I

    invoke-direct {v0, v1}, Landroid/hardware/fmradio/FmRxRdsData;-><init>(I)V

    iput-object v0, p0, Landroid/hardware/fmradio/FmTransceiver;->mRdsData:Landroid/hardware/fmradio/FmRxRdsData;

    new-instance v0, Landroid/hardware/fmradio/FmRxEventListner;

    invoke-direct {v0}, Landroid/hardware/fmradio/FmRxEventListner;-><init>()V

    iput-object v0, p0, Landroid/hardware/fmradio/FmTransceiver;->mRxEvents:Landroid/hardware/fmradio/FmRxEventListner;

    return-void
.end method


# virtual methods
.method public disable()Z
    .locals 1

    .prologue
    invoke-super {p0}, Landroid/hardware/fmradio/FmTransceiver;->disable()Z

    move-result v0

    .local v0, status:Z
    return v0
.end method

.method public enable(Landroid/hardware/fmradio/FmConfig;)Z
    .locals 2
    .parameter "configSettings"

    .prologue
    const/4 v1, 0x2

    invoke-super {p0, p1, v1}, Landroid/hardware/fmradio/FmTransceiver;->enable(Landroid/hardware/fmradio/FmConfig;I)Z

    move-result v0

    .local v0, status:Z
    const/4 v1, 0x1

    return v1
.end method

.method public getPSFeatures()Landroid/hardware/fmradio/FmTransmitter$FmPSFeatures;
    .locals 2

    .prologue
    const/4 v1, 0x0

    new-instance v0, Landroid/hardware/fmradio/FmTransmitter$FmPSFeatures;

    invoke-direct {v0, p0}, Landroid/hardware/fmradio/FmTransmitter$FmPSFeatures;-><init>(Landroid/hardware/fmradio/FmTransmitter;)V

    .local v0, psFeatures:Landroid/hardware/fmradio/FmTransmitter$FmPSFeatures;
    iput v1, v0, Landroid/hardware/fmradio/FmTransmitter$FmPSFeatures;->maxPSCharacters:I

    iput v1, v0, Landroid/hardware/fmradio/FmTransmitter$FmPSFeatures;->maxPSStringRepeatCount:I

    return-object v0
.end method

.method public getRdsGroupBufSize()I
    .locals 1

    .prologue
    const/4 v0, 0x0

    return v0
.end method

.method isAntennaAvailable()Z
    .locals 1

    .prologue
    const/4 v0, 0x1

    return v0
.end method

.method public reset()Z
    .locals 1

    .prologue
    const/4 v0, 0x0

    .local v0, status:Z
    invoke-virtual {p0}, Landroid/hardware/fmradio/FmTransmitter;->unregisterTransmitClient()Z

    move-result v0

    return v0
.end method

.method public setPSInfo([Ljava/lang/String;IJ)Z
    .locals 1
    .parameter "psStr"
    .parameter "pty"
    .parameter "repeatCount"

    .prologue
    const/4 v0, 0x0

    .local v0, bStatus:Z
    return v0
.end method

.method public setPSRTProgramType(I)Z
    .locals 1
    .parameter "pty"

    .prologue
    const/4 v0, 0x0

    .local v0, bStatus:Z
    return v0
.end method

.method public setRTInfo(Ljava/lang/String;)Z
    .locals 1
    .parameter "rtStr"

    .prologue
    const/4 v0, 0x0

    .local v0, bStatus:Z
    return v0
.end method

.method public stopPSInfo()Z
    .locals 1

    .prologue
    const/4 v0, 0x0

    .local v0, bStatus:Z
    return v0
.end method

.method public stopRTInfo()Z
    .locals 1

    .prologue
    const/4 v0, 0x0

    .local v0, bStatus:Z
    return v0
.end method

.method public transmitRdsGroupControl(I)Z
    .locals 1
    .parameter "ctrlCmd"

    .prologue
    const/4 v0, 0x0

    .local v0, bStatus:Z
    return v0
.end method

.method public transmitRdsGroups([BJ)I
    .locals 1
    .parameter "rdsGroups"
    .parameter "numGroupsToTransmit"

    .prologue
    const/4 v0, -0x1

    return v0
.end method
