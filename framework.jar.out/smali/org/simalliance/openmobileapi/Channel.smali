.class public Lorg/simalliance/openmobileapi/Channel;
.super Ljava/lang/Object;
.source "Channel.java"


# instance fields
.field private mHChannel:J

.field private mIsClosed:Z

.field private mIsLogicalChannel:Z

.field private mSession:Lorg/simalliance/openmobileapi/Session;


# direct methods
.method constructor <init>(Lorg/simalliance/openmobileapi/Session;JZ)V
    .locals 1
    .parameter "session"
    .parameter "hChannel"
    .parameter "isLogicalChannel"

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/simalliance/openmobileapi/Channel;->mSession:Lorg/simalliance/openmobileapi/Session;

    iput-wide p2, p0, Lorg/simalliance/openmobileapi/Channel;->mHChannel:J

    iput-boolean p4, p0, Lorg/simalliance/openmobileapi/Channel;->mIsLogicalChannel:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/simalliance/openmobileapi/Channel;->mIsClosed:Z

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    invoke-virtual {p0}, Lorg/simalliance/openmobileapi/Channel;->isClosed()Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lorg/simalliance/openmobileapi/Channel;->mSession:Lorg/simalliance/openmobileapi/Session;

    invoke-virtual {v0, p0}, Lorg/simalliance/openmobileapi/Session;->closeChannel(Lorg/simalliance/openmobileapi/Channel;)V

    goto :goto_0
.end method

.method getHandle()J
    .locals 2

    .prologue
    iget-wide v0, p0, Lorg/simalliance/openmobileapi/Channel;->mHChannel:J

    return-wide v0
.end method

.method public getSelectResponse()[B
    .locals 2

    .prologue
    iget-object v1, p0, Lorg/simalliance/openmobileapi/Channel;->mSession:Lorg/simalliance/openmobileapi/Session;

    invoke-virtual {v1}, Lorg/simalliance/openmobileapi/Session;->getReader()Lorg/simalliance/openmobileapi/Reader;

    move-result-object v1

    invoke-virtual {v1}, Lorg/simalliance/openmobileapi/Reader;->getSEService()Lorg/simalliance/openmobileapi/SEService;

    move-result-object v1

    invoke-virtual {v1, p0}, Lorg/simalliance/openmobileapi/SEService;->getSelectResponse(Lorg/simalliance/openmobileapi/Channel;)[B

    move-result-object v0

    .local v0, response:[B
    if-eqz v0, :cond_0

    array-length v1, v0

    if-nez v1, :cond_0

    const/4 v0, 0x0

    :cond_0
    return-object v0
.end method

.method public getSession()Lorg/simalliance/openmobileapi/Session;
    .locals 1

    .prologue
    iget-object v0, p0, Lorg/simalliance/openmobileapi/Channel;->mSession:Lorg/simalliance/openmobileapi/Session;

    return-object v0
.end method

.method public isBasicChannel()Z
    .locals 1

    .prologue
    iget-boolean v0, p0, Lorg/simalliance/openmobileapi/Channel;->mIsLogicalChannel:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isClosed()Z
    .locals 1

    .prologue
    iget-boolean v0, p0, Lorg/simalliance/openmobileapi/Channel;->mIsClosed:Z

    return v0
.end method

.method setClosed()V
    .locals 1

    .prologue
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/simalliance/openmobileapi/Channel;->mIsClosed:Z

    return-void
.end method

.method public transmit([B)[B
    .locals 2
    .parameter "command"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    invoke-virtual {p0}, Lorg/simalliance/openmobileapi/Channel;->isClosed()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "channel is closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-object v0, p0, Lorg/simalliance/openmobileapi/Channel;->mSession:Lorg/simalliance/openmobileapi/Session;

    invoke-virtual {v0}, Lorg/simalliance/openmobileapi/Session;->getReader()Lorg/simalliance/openmobileapi/Reader;

    move-result-object v0

    invoke-virtual {v0}, Lorg/simalliance/openmobileapi/Reader;->getSEService()Lorg/simalliance/openmobileapi/SEService;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lorg/simalliance/openmobileapi/SEService;->transmit(Lorg/simalliance/openmobileapi/Channel;[B)[B

    move-result-object v0

    return-object v0
.end method
