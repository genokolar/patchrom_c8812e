.class public Landroid/net/wifi/p2p/WfdInfo;
.super Ljava/lang/Object;
.source "WfdInfo.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final COUPLED:I = 0x1

.field public static final CREATOR:Landroid/os/Parcelable$Creator; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Landroid/net/wifi/p2p/WfdInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final DEFAULT_SESSION_MGMT_CTRL_PORT:I = 0x1c44

.field public static final DEVICETYPE_INVALID:I = 0x4

.field public static final DEVICETYPE_PRIMARYSINK:I = 0x1

.field public static final DEVICETYPE_SECONDARYSINK:I = 0x2

.field public static final DEVICETYPE_SOURCE:I = 0x0

.field public static final DEVICETYPE_SOURCE_PRIMARYSINK:I = 0x3

.field public static final NOT_COUPLED_AVAILABLE:I = 0x0

.field public static final PC_P2P:I = 0x0

.field public static final PC_TDLS:I = 0x1

.field private static final TAG:Ljava/lang/String; = "WfdInfo"

.field public static final TEARDOWN_COUPLING:I = 0x2


# instance fields
.field public coupledDeviceAdress:Ljava/lang/String;

.field public coupledSinkStatus:I

.field public deviceType:I

.field public isAudioOnlySupportedAtSource:Z

.field public isAudioUnspportedAtPrimarySink:Z

.field public isAvailableForSession:Z

.field public isContentProtectionSupported:Z

.field public isCoupledSinkSupportedBySink:Z

.field public isCoupledSinkSupportedBySource:Z

.field public isServiceDiscoverySupported:Z

.field public isTDLSPersistentGroupIntended:Z

.field public isTDLSReInvokePersistentGroupReq:Z

.field public isTimeSynchronizationSupported:Z

.field public maxThroughput:I

.field public preferredConnectivity:I

.field public sessionMgmtCtrlPort:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    new-instance v0, Landroid/net/wifi/p2p/WfdInfo$1;

    invoke-direct {v0}, Landroid/net/wifi/p2p/WfdInfo$1;-><init>()V

    sput-object v0, Landroid/net/wifi/p2p/WfdInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x4

    iput v0, p0, Landroid/net/wifi/p2p/WfdInfo;->deviceType:I

    iput v1, p0, Landroid/net/wifi/p2p/WfdInfo;->preferredConnectivity:I

    iput v1, p0, Landroid/net/wifi/p2p/WfdInfo;->coupledSinkStatus:I

    const/16 v0, 0x1c44

    iput v0, p0, Landroid/net/wifi/p2p/WfdInfo;->sessionMgmtCtrlPort:I

    return-void
.end method

.method public constructor <init>(Landroid/net/wifi/p2p/WfdInfo;)V
    .locals 1
    .parameter "source"

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    iget v0, p1, Landroid/net/wifi/p2p/WfdInfo;->sessionMgmtCtrlPort:I

    iput v0, p0, Landroid/net/wifi/p2p/WfdInfo;->sessionMgmtCtrlPort:I

    iget v0, p1, Landroid/net/wifi/p2p/WfdInfo;->maxThroughput:I

    iput v0, p0, Landroid/net/wifi/p2p/WfdInfo;->maxThroughput:I

    iget v0, p1, Landroid/net/wifi/p2p/WfdInfo;->deviceType:I

    iput v0, p0, Landroid/net/wifi/p2p/WfdInfo;->deviceType:I

    iget v0, p1, Landroid/net/wifi/p2p/WfdInfo;->preferredConnectivity:I

    iput v0, p0, Landroid/net/wifi/p2p/WfdInfo;->preferredConnectivity:I

    iget v0, p1, Landroid/net/wifi/p2p/WfdInfo;->coupledSinkStatus:I

    iput v0, p0, Landroid/net/wifi/p2p/WfdInfo;->coupledSinkStatus:I

    iget-object v0, p1, Landroid/net/wifi/p2p/WfdInfo;->coupledDeviceAdress:Ljava/lang/String;

    iput-object v0, p0, Landroid/net/wifi/p2p/WfdInfo;->coupledDeviceAdress:Ljava/lang/String;

    iget-boolean v0, p1, Landroid/net/wifi/p2p/WfdInfo;->isCoupledSinkSupportedBySource:Z

    iput-boolean v0, p0, Landroid/net/wifi/p2p/WfdInfo;->isCoupledSinkSupportedBySource:Z

    iget-boolean v0, p1, Landroid/net/wifi/p2p/WfdInfo;->isCoupledSinkSupportedBySink:Z

    iput-boolean v0, p0, Landroid/net/wifi/p2p/WfdInfo;->isCoupledSinkSupportedBySink:Z

    iget-boolean v0, p1, Landroid/net/wifi/p2p/WfdInfo;->isAvailableForSession:Z

    iput-boolean v0, p0, Landroid/net/wifi/p2p/WfdInfo;->isAvailableForSession:Z

    iget-boolean v0, p1, Landroid/net/wifi/p2p/WfdInfo;->isCoupledSinkSupportedBySource:Z

    iput-boolean v0, p0, Landroid/net/wifi/p2p/WfdInfo;->isCoupledSinkSupportedBySource:Z

    iget-boolean v0, p1, Landroid/net/wifi/p2p/WfdInfo;->isContentProtectionSupported:Z

    iput-boolean v0, p0, Landroid/net/wifi/p2p/WfdInfo;->isContentProtectionSupported:Z

    iget-boolean v0, p1, Landroid/net/wifi/p2p/WfdInfo;->isTimeSynchronizationSupported:Z

    iput-boolean v0, p0, Landroid/net/wifi/p2p/WfdInfo;->isTimeSynchronizationSupported:Z

    iget-boolean v0, p1, Landroid/net/wifi/p2p/WfdInfo;->isAudioUnspportedAtPrimarySink:Z

    iput-boolean v0, p0, Landroid/net/wifi/p2p/WfdInfo;->isAudioUnspportedAtPrimarySink:Z

    iget-boolean v0, p1, Landroid/net/wifi/p2p/WfdInfo;->isAudioOnlySupportedAtSource:Z

    iput-boolean v0, p0, Landroid/net/wifi/p2p/WfdInfo;->isAudioOnlySupportedAtSource:Z

    iget-boolean v0, p1, Landroid/net/wifi/p2p/WfdInfo;->isTDLSPersistentGroupIntended:Z

    iput-boolean v0, p0, Landroid/net/wifi/p2p/WfdInfo;->isTDLSPersistentGroupIntended:Z

    iget-boolean v0, p1, Landroid/net/wifi/p2p/WfdInfo;->isTDLSReInvokePersistentGroupReq:Z

    iput-boolean v0, p0, Landroid/net/wifi/p2p/WfdInfo;->isTDLSReInvokePersistentGroupReq:Z

    :cond_0
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 8
    .parameter "deviceInfo"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    invoke-direct {p0}, Landroid/net/wifi/p2p/WfdInfo;-><init>()V

    if-nez p1, :cond_0

    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Malformed supplicant event"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_0
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/StringReader;

    invoke-direct {v5, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v4, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .local v4, reader:Ljava/io/BufferedReader;
    :cond_1
    :goto_0
    :try_start_0
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .local v3, line:Ljava/lang/String;
    if-eqz v3, :cond_20

    const-string v5, "wfd_device_type"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_6

    const-string v5, "="

    invoke-virtual {v3, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .local v1, devStr:Ljava/lang/String;
    const-string v5, "source"

    invoke-virtual {v1, v5}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_2

    const/4 v5, 0x0

    iput v5, p0, Landroid/net/wifi/p2p/WfdInfo;->deviceType:I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .end local v1           #devStr:Ljava/lang/String;
    .end local v3           #line:Ljava/lang/String;
    :catch_0
    move-exception v2

    .local v2, e:Ljava/io/IOException;
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Malformed supplicant event"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .end local v2           #e:Ljava/io/IOException;
    .restart local v1       #devStr:Ljava/lang/String;
    .restart local v3       #line:Ljava/lang/String;
    :cond_2
    :try_start_1
    const-string v5, "primary_sink"

    invoke-virtual {v1, v5}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_3

    const/4 v5, 0x1

    iput v5, p0, Landroid/net/wifi/p2p/WfdInfo;->deviceType:I

    goto :goto_0

    :cond_3
    const-string v5, "secondary_sink"

    invoke-virtual {v1, v5}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_4

    const/4 v5, 0x2

    iput v5, p0, Landroid/net/wifi/p2p/WfdInfo;->deviceType:I

    goto :goto_0

    :cond_4
    const-string v5, "source_primary_sink"

    invoke-virtual {v1, v5}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_5

    const/4 v5, 0x3

    iput v5, p0, Landroid/net/wifi/p2p/WfdInfo;->deviceType:I

    goto :goto_0

    :cond_5
    const/4 v5, 0x4

    iput v5, p0, Landroid/net/wifi/p2p/WfdInfo;->deviceType:I

    goto :goto_0

    .end local v1           #devStr:Ljava/lang/String;
    :cond_6
    const-string v5, "wfd_coupled_sink_supported_by_source"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_8

    const-string v5, "="

    invoke-virtual {v3, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .restart local v1       #devStr:Ljava/lang/String;
    const-string v5, "y"

    invoke-virtual {v1, v5}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_7

    const/4 v5, 0x1

    iput-boolean v5, p0, Landroid/net/wifi/p2p/WfdInfo;->isCoupledSinkSupportedBySource:Z

    goto :goto_0

    :cond_7
    const/4 v5, 0x0

    iput-boolean v5, p0, Landroid/net/wifi/p2p/WfdInfo;->isCoupledSinkSupportedBySource:Z

    goto/16 :goto_0

    .end local v1           #devStr:Ljava/lang/String;
    :cond_8
    const-string v5, "wfd_coupled_sink_supported_by_sink"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_a

    const-string v5, "="

    invoke-virtual {v3, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .restart local v1       #devStr:Ljava/lang/String;
    const-string v5, "y"

    invoke-virtual {v1, v5}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_9

    const/4 v5, 0x1

    iput-boolean v5, p0, Landroid/net/wifi/p2p/WfdInfo;->isCoupledSinkSupportedBySink:Z

    goto/16 :goto_0

    :cond_9
    const/4 v5, 0x0

    iput-boolean v5, p0, Landroid/net/wifi/p2p/WfdInfo;->isCoupledSinkSupportedBySink:Z

    goto/16 :goto_0

    .end local v1           #devStr:Ljava/lang/String;
    :cond_a
    const-string v5, "wfd_available_for_session"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_c

    const-string v5, "="

    invoke-virtual {v3, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .restart local v1       #devStr:Ljava/lang/String;
    const-string v5, "y"

    invoke-virtual {v1, v5}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_b

    const/4 v5, 0x1

    iput-boolean v5, p0, Landroid/net/wifi/p2p/WfdInfo;->isAvailableForSession:Z

    goto/16 :goto_0

    :cond_b
    const/4 v5, 0x0

    iput-boolean v5, p0, Landroid/net/wifi/p2p/WfdInfo;->isAvailableForSession:Z

    goto/16 :goto_0

    .end local v1           #devStr:Ljava/lang/String;
    :cond_c
    const-string v5, "wfd_service_discovery_supported"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_e

    const-string v5, "="

    invoke-virtual {v3, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .restart local v1       #devStr:Ljava/lang/String;
    const-string v5, "y"

    invoke-virtual {v1, v5}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_d

    const/4 v5, 0x1

    iput-boolean v5, p0, Landroid/net/wifi/p2p/WfdInfo;->isServiceDiscoverySupported:Z

    goto/16 :goto_0

    :cond_d
    const/4 v5, 0x0

    iput-boolean v5, p0, Landroid/net/wifi/p2p/WfdInfo;->isServiceDiscoverySupported:Z

    goto/16 :goto_0

    .end local v1           #devStr:Ljava/lang/String;
    :cond_e
    const-string v5, "wfd_preferred_connectivity"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_10

    const-string v5, "="

    invoke-virtual {v3, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    const-string v6, "p2p"

    invoke-virtual {v5, v6}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_f

    const/4 v5, 0x0

    iput v5, p0, Landroid/net/wifi/p2p/WfdInfo;->preferredConnectivity:I

    goto/16 :goto_0

    :cond_f
    const/4 v5, 0x1

    iput v5, p0, Landroid/net/wifi/p2p/WfdInfo;->preferredConnectivity:I

    goto/16 :goto_0

    :cond_10
    const-string v5, "wfd_content_protection_supported"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_12

    const-string v5, "="

    invoke-virtual {v3, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    const-string v6, "y"

    invoke-virtual {v5, v6}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_11

    const/4 v5, 0x1

    iput-boolean v5, p0, Landroid/net/wifi/p2p/WfdInfo;->isContentProtectionSupported:Z

    goto/16 :goto_0

    :cond_11
    const/4 v5, 0x0

    iput-boolean v5, p0, Landroid/net/wifi/p2p/WfdInfo;->isContentProtectionSupported:Z

    goto/16 :goto_0

    :cond_12
    const-string v5, "wfd_time_sync_supported"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_14

    const-string v5, "="

    invoke-virtual {v3, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    const-string v6, "y"

    invoke-virtual {v5, v6}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_13

    const/4 v5, 0x1

    iput-boolean v5, p0, Landroid/net/wifi/p2p/WfdInfo;->isTimeSynchronizationSupported:Z

    goto/16 :goto_0

    :cond_13
    const/4 v5, 0x0

    iput-boolean v5, p0, Landroid/net/wifi/p2p/WfdInfo;->isTimeSynchronizationSupported:Z

    goto/16 :goto_0

    :cond_14
    const-string v5, "wfd_primarysink_audio_notsupported"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_16

    const-string v5, "="

    invoke-virtual {v3, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    const-string v6, "y"

    invoke-virtual {v5, v6}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_15

    const/4 v5, 0x1

    iput-boolean v5, p0, Landroid/net/wifi/p2p/WfdInfo;->isAudioUnspportedAtPrimarySink:Z

    goto/16 :goto_0

    :cond_15
    const/4 v5, 0x0

    iput-boolean v5, p0, Landroid/net/wifi/p2p/WfdInfo;->isAudioUnspportedAtPrimarySink:Z

    goto/16 :goto_0

    :cond_16
    const-string v5, "wfd_source_audio_only_supported"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_18

    const-string v5, "="

    invoke-virtual {v3, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    const-string v6, "y"

    invoke-virtual {v5, v6}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_17

    const/4 v5, 0x1

    iput-boolean v5, p0, Landroid/net/wifi/p2p/WfdInfo;->isAudioOnlySupportedAtSource:Z

    goto/16 :goto_0

    :cond_17
    const/4 v5, 0x0

    iput-boolean v5, p0, Landroid/net/wifi/p2p/WfdInfo;->isAudioOnlySupportedAtSource:Z

    goto/16 :goto_0

    :cond_18
    const-string v5, "wfd_tdls_persistent_group_intended"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1a

    const-string v5, "="

    invoke-virtual {v3, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    const-string v6, "y"

    invoke-virtual {v5, v6}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_19

    const/4 v5, 0x1

    iput-boolean v5, p0, Landroid/net/wifi/p2p/WfdInfo;->isTDLSPersistentGroupIntended:Z

    goto/16 :goto_0

    :cond_19
    const/4 v5, 0x0

    iput-boolean v5, p0, Landroid/net/wifi/p2p/WfdInfo;->isTDLSPersistentGroupIntended:Z

    goto/16 :goto_0

    :cond_1a
    const-string v5, "wfd_tdls_persistent_group_reinvoke"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1c

    const-string v5, "="

    invoke-virtual {v3, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    const-string v6, "y"

    invoke-virtual {v5, v6}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_1b

    const/4 v5, 0x1

    iput-boolean v5, p0, Landroid/net/wifi/p2p/WfdInfo;->isTDLSReInvokePersistentGroupReq:Z

    goto/16 :goto_0

    :cond_1b
    const/4 v5, 0x0

    iput-boolean v5, p0, Landroid/net/wifi/p2p/WfdInfo;->isTDLSReInvokePersistentGroupReq:Z

    goto/16 :goto_0

    :cond_1c
    const-string v5, "wfd_session_management_control_port"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1d

    const-string v5, "="

    invoke-virtual {v3, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Landroid/net/wifi/p2p/WfdInfo;->sessionMgmtCtrlPort:I

    goto/16 :goto_0

    :cond_1d
    const-string v5, "wfd_coupled_sink_status"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    const-string v5, "="

    invoke-virtual {v3, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .local v0, cssStr:Ljava/lang/String;
    const-string v5, "not_coupled"

    invoke-virtual {v0, v5}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_1e

    const/4 v5, 0x0

    iput v5, p0, Landroid/net/wifi/p2p/WfdInfo;->coupledSinkStatus:I

    goto/16 :goto_0

    :cond_1e
    const-string v5, "coupled"

    invoke-virtual {v0, v5}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_1f

    const/4 v5, 0x1

    iput v5, p0, Landroid/net/wifi/p2p/WfdInfo;->coupledSinkStatus:I

    goto/16 :goto_0

    :cond_1f
    const/4 v5, 0x2

    iput v5, p0, Landroid/net/wifi/p2p/WfdInfo;->coupledSinkStatus:I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .end local v0           #cssStr:Ljava/lang/String;
    :cond_20
    const-string v5, "WfdInfo"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Created WfdInfo \n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Landroid/net/wifi/p2p/WfdInfo;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    const/4 v0, 0x0

    return v0
.end method

.method public isWFDDevice()Z
    .locals 2

    .prologue
    iget v0, p0, Landroid/net/wifi/p2p/WfdInfo;->deviceType:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .local v0, sbuf:Ljava/lang/StringBuffer;
    const-string v1, "Control Port: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Landroid/net/wifi/p2p/WfdInfo;->sessionMgmtCtrlPort:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string v1, "\n MaxThroughput: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Landroid/net/wifi/p2p/WfdInfo;->maxThroughput:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string v1, "\n DeviceType: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Landroid/net/wifi/p2p/WfdInfo;->deviceType:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string v1, "\n PreferredConnectivity: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Landroid/net/wifi/p2p/WfdInfo;->preferredConnectivity:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string v1, "\n CoupledSinkStatus: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Landroid/net/wifi/p2p/WfdInfo;->coupledSinkStatus:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string v1, "\n CoupledDeviceAddress: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Landroid/net/wifi/p2p/WfdInfo;->coupledDeviceAdress:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "\n IsCoupledSinkSupportedBySource: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-boolean v2, p0, Landroid/net/wifi/p2p/WfdInfo;->isCoupledSinkSupportedBySource:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    const-string v1, "\n IsCoupledSinkSupportedBySink: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-boolean v2, p0, Landroid/net/wifi/p2p/WfdInfo;->isCoupledSinkSupportedBySink:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    const-string v1, "\n IsAvailableForSession: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-boolean v2, p0, Landroid/net/wifi/p2p/WfdInfo;->isAvailableForSession:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    const-string v1, "\n IsCoupledSinkSupportedBySource: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-boolean v2, p0, Landroid/net/wifi/p2p/WfdInfo;->isCoupledSinkSupportedBySource:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    const-string v1, "\n IsContentProtectionSupported: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-boolean v2, p0, Landroid/net/wifi/p2p/WfdInfo;->isContentProtectionSupported:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    const-string v1, "\n IsTimeSynchronizationSupported: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-boolean v2, p0, Landroid/net/wifi/p2p/WfdInfo;->isTimeSynchronizationSupported:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    const-string v1, "\n IsAudioUnspportedAtPrimarySink: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-boolean v2, p0, Landroid/net/wifi/p2p/WfdInfo;->isAudioUnspportedAtPrimarySink:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    const-string v1, "\n IsAudioOnlySupportedAtSource: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-boolean v2, p0, Landroid/net/wifi/p2p/WfdInfo;->isAudioOnlySupportedAtSource:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    const-string v1, "\n IsTDLSPersistentGroupIntended: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-boolean v2, p0, Landroid/net/wifi/p2p/WfdInfo;->isTDLSPersistentGroupIntended:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    const-string v1, "\n IsTDLSReInvokePersistentGroupReq: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-boolean v2, p0, Landroid/net/wifi/p2p/WfdInfo;->isTDLSReInvokePersistentGroupReq:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 3
    .parameter "dest"
    .parameter "flags"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    iget v0, p0, Landroid/net/wifi/p2p/WfdInfo;->sessionMgmtCtrlPort:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Landroid/net/wifi/p2p/WfdInfo;->maxThroughput:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Landroid/net/wifi/p2p/WfdInfo;->deviceType:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Landroid/net/wifi/p2p/WfdInfo;->preferredConnectivity:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Landroid/net/wifi/p2p/WfdInfo;->coupledSinkStatus:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget-object v0, p0, Landroid/net/wifi/p2p/WfdInfo;->coupledDeviceAdress:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-boolean v0, p0, Landroid/net/wifi/p2p/WfdInfo;->isCoupledSinkSupportedBySource:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    iget-boolean v0, p0, Landroid/net/wifi/p2p/WfdInfo;->isCoupledSinkSupportedBySink:Z

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    iget-boolean v0, p0, Landroid/net/wifi/p2p/WfdInfo;->isAvailableForSession:Z

    if-eqz v0, :cond_2

    move v0, v1

    :goto_2
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    iget-boolean v0, p0, Landroid/net/wifi/p2p/WfdInfo;->isServiceDiscoverySupported:Z

    if-eqz v0, :cond_3

    move v0, v1

    :goto_3
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    iget-boolean v0, p0, Landroid/net/wifi/p2p/WfdInfo;->isContentProtectionSupported:Z

    if-eqz v0, :cond_4

    move v0, v1

    :goto_4
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    iget-boolean v0, p0, Landroid/net/wifi/p2p/WfdInfo;->isTimeSynchronizationSupported:Z

    if-eqz v0, :cond_5

    move v0, v1

    :goto_5
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    iget-boolean v0, p0, Landroid/net/wifi/p2p/WfdInfo;->isAudioUnspportedAtPrimarySink:Z

    if-eqz v0, :cond_6

    move v0, v1

    :goto_6
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    iget-boolean v0, p0, Landroid/net/wifi/p2p/WfdInfo;->isAudioOnlySupportedAtSource:Z

    if-eqz v0, :cond_7

    move v0, v1

    :goto_7
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    iget-boolean v0, p0, Landroid/net/wifi/p2p/WfdInfo;->isTDLSPersistentGroupIntended:Z

    if-eqz v0, :cond_8

    move v0, v1

    :goto_8
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    iget-boolean v0, p0, Landroid/net/wifi/p2p/WfdInfo;->isTDLSReInvokePersistentGroupReq:Z

    if-eqz v0, :cond_9

    :goto_9
    int-to-byte v0, v1

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    return-void

    :cond_0
    move v0, v2

    goto :goto_0

    :cond_1
    move v0, v2

    goto :goto_1

    :cond_2
    move v0, v2

    goto :goto_2

    :cond_3
    move v0, v2

    goto :goto_3

    :cond_4
    move v0, v2

    goto :goto_4

    :cond_5
    move v0, v2

    goto :goto_5

    :cond_6
    move v0, v2

    goto :goto_6

    :cond_7
    move v0, v2

    goto :goto_7

    :cond_8
    move v0, v2

    goto :goto_8

    :cond_9
    move v1, v2

    goto :goto_9
.end method
