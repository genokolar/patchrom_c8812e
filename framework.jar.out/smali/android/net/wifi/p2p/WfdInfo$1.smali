.class final Landroid/net/wifi/p2p/WfdInfo$1;
.super Ljava/lang/Object;
.source "WfdInfo.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/net/wifi/p2p/WfdInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Landroid/net/wifi/p2p/WfdInfo;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Landroid/net/wifi/p2p/WfdInfo;
    .locals 4
    .parameter "in"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    new-instance v0, Landroid/net/wifi/p2p/WfdInfo;

    invoke-direct {v0}, Landroid/net/wifi/p2p/WfdInfo;-><init>()V

    .local v0, wfdInfo:Landroid/net/wifi/p2p/WfdInfo;
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, v0, Landroid/net/wifi/p2p/WfdInfo;->sessionMgmtCtrlPort:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, v0, Landroid/net/wifi/p2p/WfdInfo;->maxThroughput:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, v0, Landroid/net/wifi/p2p/WfdInfo;->deviceType:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, v0, Landroid/net/wifi/p2p/WfdInfo;->preferredConnectivity:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, v0, Landroid/net/wifi/p2p/WfdInfo;->coupledSinkStatus:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Landroid/net/wifi/p2p/WfdInfo;->coupledDeviceAdress:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_0

    move v1, v2

    :goto_0
    iput-boolean v1, v0, Landroid/net/wifi/p2p/WfdInfo;->isCoupledSinkSupportedBySource:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_1

    move v1, v2

    :goto_1
    iput-boolean v1, v0, Landroid/net/wifi/p2p/WfdInfo;->isCoupledSinkSupportedBySink:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_2

    move v1, v2

    :goto_2
    iput-boolean v1, v0, Landroid/net/wifi/p2p/WfdInfo;->isAvailableForSession:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_3

    move v1, v2

    :goto_3
    iput-boolean v1, v0, Landroid/net/wifi/p2p/WfdInfo;->isCoupledSinkSupportedBySource:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_4

    move v1, v2

    :goto_4
    iput-boolean v1, v0, Landroid/net/wifi/p2p/WfdInfo;->isContentProtectionSupported:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_5

    move v1, v2

    :goto_5
    iput-boolean v1, v0, Landroid/net/wifi/p2p/WfdInfo;->isTimeSynchronizationSupported:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_6

    move v1, v2

    :goto_6
    iput-boolean v1, v0, Landroid/net/wifi/p2p/WfdInfo;->isAudioUnspportedAtPrimarySink:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_7

    move v1, v2

    :goto_7
    iput-boolean v1, v0, Landroid/net/wifi/p2p/WfdInfo;->isAudioOnlySupportedAtSource:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_8

    move v1, v2

    :goto_8
    iput-boolean v1, v0, Landroid/net/wifi/p2p/WfdInfo;->isTDLSPersistentGroupIntended:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_9

    :goto_9
    iput-boolean v2, v0, Landroid/net/wifi/p2p/WfdInfo;->isTDLSReInvokePersistentGroupReq:Z

    return-object v0

    :cond_0
    move v1, v3

    goto :goto_0

    :cond_1
    move v1, v3

    goto :goto_1

    :cond_2
    move v1, v3

    goto :goto_2

    :cond_3
    move v1, v3

    goto :goto_3

    :cond_4
    move v1, v3

    goto :goto_4

    :cond_5
    move v1, v3

    goto :goto_5

    :cond_6
    move v1, v3

    goto :goto_6

    :cond_7
    move v1, v3

    goto :goto_7

    :cond_8
    move v1, v3

    goto :goto_8

    :cond_9
    move v2, v3

    goto :goto_9
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    invoke-virtual {p0, p1}, Landroid/net/wifi/p2p/WfdInfo$1;->createFromParcel(Landroid/os/Parcel;)Landroid/net/wifi/p2p/WfdInfo;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Landroid/net/wifi/p2p/WfdInfo;
    .locals 1
    .parameter "size"

    .prologue
    new-array v0, p1, [Landroid/net/wifi/p2p/WfdInfo;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    invoke-virtual {p0, p1}, Landroid/net/wifi/p2p/WfdInfo$1;->newArray(I)[Landroid/net/wifi/p2p/WfdInfo;

    move-result-object v0

    return-object v0
.end method
