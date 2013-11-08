.class public Lorg/simalliance/openmobileapi/Session;
.super Ljava/lang/Object;
.source "Session.java"


# instance fields
.field private mAtr:[B

.field private final mChannels:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/simalliance/openmobileapi/Channel;",
            ">;"
        }
    .end annotation
.end field

.field private mIsClosed:Z

.field private mName:Ljava/lang/String;

.field private mReader:Lorg/simalliance/openmobileapi/Reader;


# direct methods
.method constructor <init>(Ljava/lang/String;Lorg/simalliance/openmobileapi/Reader;)V
    .locals 1
    .parameter "name"
    .parameter "reader"

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/simalliance/openmobileapi/Session;->mChannels:Ljava/util/Set;

    invoke-virtual {p2}, Lorg/simalliance/openmobileapi/Reader;->getSEService()Lorg/simalliance/openmobileapi/SEService;

    move-result-object v0

    invoke-virtual {v0, p2}, Lorg/simalliance/openmobileapi/SEService;->getAtr(Lorg/simalliance/openmobileapi/Reader;)[B

    move-result-object v0

    iput-object v0, p0, Lorg/simalliance/openmobileapi/Session;->mAtr:[B

    iput-object p2, p0, Lorg/simalliance/openmobileapi/Session;->mReader:Lorg/simalliance/openmobileapi/Reader;

    iput-object p1, p0, Lorg/simalliance/openmobileapi/Session;->mName:Ljava/lang/String;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/simalliance/openmobileapi/Session;->mIsClosed:Z

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    iget-object v0, p0, Lorg/simalliance/openmobileapi/Session;->mReader:Lorg/simalliance/openmobileapi/Reader;

    invoke-virtual {v0, p0}, Lorg/simalliance/openmobileapi/Reader;->closeSession(Lorg/simalliance/openmobileapi/Session;)V

    return-void
.end method

.method closeChannel(Lorg/simalliance/openmobileapi/Channel;)V
    .locals 2
    .parameter "channel"

    .prologue
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "channel is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-object v1, p0, Lorg/simalliance/openmobileapi/Session;->mChannels:Ljava/util/Set;

    monitor-enter v1

    :try_start_0
    invoke-virtual {p1}, Lorg/simalliance/openmobileapi/Channel;->isClosed()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_1

    :try_start_1
    iget-object v0, p0, Lorg/simalliance/openmobileapi/Session;->mReader:Lorg/simalliance/openmobileapi/Reader;

    invoke-virtual {v0}, Lorg/simalliance/openmobileapi/Reader;->getSEService()Lorg/simalliance/openmobileapi/SEService;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/simalliance/openmobileapi/SEService;->closeChannel(Lorg/simalliance/openmobileapi/Channel;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :goto_0
    :try_start_2
    invoke-virtual {p1}, Lorg/simalliance/openmobileapi/Channel;->setClosed()V

    :cond_1
    iget-object v0, p0, Lorg/simalliance/openmobileapi/Session;->mChannels:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public closeChannels()V
    .locals 4

    .prologue
    iget-object v3, p0, Lorg/simalliance/openmobileapi/Session;->mChannels:Ljava/util/Set;

    monitor-enter v3

    :try_start_0
    iget-object v2, p0, Lorg/simalliance/openmobileapi/Session;->mChannels:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/simalliance/openmobileapi/Channel;

    .local v0, channel:Lorg/simalliance/openmobileapi/Channel;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/simalliance/openmobileapi/Channel;->isClosed()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    if-nez v2, :cond_0

    :try_start_1
    iget-object v2, p0, Lorg/simalliance/openmobileapi/Session;->mReader:Lorg/simalliance/openmobileapi/Reader;

    invoke-virtual {v2}, Lorg/simalliance/openmobileapi/Reader;->getSEService()Lorg/simalliance/openmobileapi/SEService;

    move-result-object v2

    invoke-virtual {v2, v0}, Lorg/simalliance/openmobileapi/SEService;->closeChannel(Lorg/simalliance/openmobileapi/Channel;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :goto_1
    :try_start_2
    invoke-virtual {v0}, Lorg/simalliance/openmobileapi/Channel;->setClosed()V

    goto :goto_0

    .end local v0           #channel:Lorg/simalliance/openmobileapi/Channel;
    .end local v1           #i$:Ljava/util/Iterator;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2

    .restart local v1       #i$:Ljava/util/Iterator;
    :cond_1
    :try_start_3
    iget-object v2, p0, Lorg/simalliance/openmobileapi/Session;->mChannels:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->clear()V

    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    return-void

    .restart local v0       #channel:Lorg/simalliance/openmobileapi/Channel;
    :catch_0
    move-exception v2

    goto :goto_1
.end method

.method public getATR()[B
    .locals 1

    .prologue
    iget-object v0, p0, Lorg/simalliance/openmobileapi/Session;->mAtr:[B

    return-object v0
.end method

.method public getReader()Lorg/simalliance/openmobileapi/Reader;
    .locals 1

    .prologue
    iget-object v0, p0, Lorg/simalliance/openmobileapi/Session;->mReader:Lorg/simalliance/openmobileapi/Reader;

    return-object v0
.end method

.method public isClosed()Z
    .locals 1

    .prologue
    iget-boolean v0, p0, Lorg/simalliance/openmobileapi/Session;->mIsClosed:Z

    return v0
.end method

.method public openBasicChannel([B)Lorg/simalliance/openmobileapi/Channel;
    .locals 3
    .parameter "aid"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-string v1, "liumeng"

    const-string v2, "openBasicChannel"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, p0, Lorg/simalliance/openmobileapi/Session;->mChannels:Ljava/util/Set;

    monitor-enter v2

    :try_start_0
    iget-object v1, p0, Lorg/simalliance/openmobileapi/Session;->mReader:Lorg/simalliance/openmobileapi/Reader;

    invoke-virtual {v1}, Lorg/simalliance/openmobileapi/Reader;->getSEService()Lorg/simalliance/openmobileapi/SEService;

    move-result-object v1

    invoke-virtual {v1, p0, p1}, Lorg/simalliance/openmobileapi/SEService;->openBasicChannel(Lorg/simalliance/openmobileapi/Session;[B)Lorg/simalliance/openmobileapi/Channel;

    move-result-object v0

    .local v0, basicChannel:Lorg/simalliance/openmobileapi/Channel;
    iget-object v1, p0, Lorg/simalliance/openmobileapi/Session;->mChannels:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    monitor-exit v2

    return-object v0

    .end local v0           #basicChannel:Lorg/simalliance/openmobileapi/Channel;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public openLogicalChannel([B)Lorg/simalliance/openmobileapi/Channel;
    .locals 4
    .parameter "aid"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-string v1, "liumeng"

    const-string v2, "openLogicalChannel"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, p0, Lorg/simalliance/openmobileapi/Session;->mChannels:Ljava/util/Set;

    monitor-enter v2

    :try_start_0
    const-string v1, "liumeng"

    const-string v3, "openLogicalChannel sync"

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lorg/simalliance/openmobileapi/Session;->mReader:Lorg/simalliance/openmobileapi/Reader;

    invoke-virtual {v1}, Lorg/simalliance/openmobileapi/Reader;->getSEService()Lorg/simalliance/openmobileapi/SEService;

    move-result-object v1

    invoke-virtual {v1, p0, p1}, Lorg/simalliance/openmobileapi/SEService;->openLogicalChannel(Lorg/simalliance/openmobileapi/Session;[B)Lorg/simalliance/openmobileapi/Channel;

    move-result-object v0

    .local v0, logicalChannel:Lorg/simalliance/openmobileapi/Channel;
    iget-object v1, p0, Lorg/simalliance/openmobileapi/Session;->mChannels:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    monitor-exit v2

    return-object v0

    .end local v0           #logicalChannel:Lorg/simalliance/openmobileapi/Channel;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method setClosed()V
    .locals 1

    .prologue
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/simalliance/openmobileapi/Session;->mIsClosed:Z

    return-void
.end method
