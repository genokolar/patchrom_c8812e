.class public Lorg/simalliance/openmobileapi/SEService;
.super Ljava/lang/Object;
.source "SEService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/simalliance/openmobileapi/SEService$CallBack;
    }
.end annotation


# static fields
.field private static final SERVICE_TAG:Ljava/lang/String; = "SEService"


# instance fields
.field private final mCallback:Lorg/simalliance/openmobileapi/service/ISmartcardServiceCallback;

.field private mCallerCallback:Lorg/simalliance/openmobileapi/SEService$CallBack;

.field private mConnection:Landroid/content/ServiceConnection;

.field private final mContext:Landroid/content/Context;

.field private mReaders:[Lorg/simalliance/openmobileapi/Reader;

.field private volatile mSmartcardService:Lorg/simalliance/openmobileapi/service/ISmartcardService;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lorg/simalliance/openmobileapi/SEService$CallBack;)V
    .locals 5
    .parameter "context"
    .parameter "listener"

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Lorg/simalliance/openmobileapi/SEService$1;

    invoke-direct {v1, p0}, Lorg/simalliance/openmobileapi/SEService$1;-><init>(Lorg/simalliance/openmobileapi/SEService;)V

    iput-object v1, p0, Lorg/simalliance/openmobileapi/SEService;->mCallback:Lorg/simalliance/openmobileapi/service/ISmartcardServiceCallback;

    const-string v1, "U8666N"

    const-string v2, "SEService.."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-nez p1, :cond_0

    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "context must not be null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_0
    if-nez p2, :cond_1

    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "listener must not be null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_1
    iput-object p1, p0, Lorg/simalliance/openmobileapi/SEService;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lorg/simalliance/openmobileapi/SEService;->mCallerCallback:Lorg/simalliance/openmobileapi/SEService$CallBack;

    new-instance v1, Lorg/simalliance/openmobileapi/SEService$2;

    invoke-direct {v1, p0}, Lorg/simalliance/openmobileapi/SEService$2;-><init>(Lorg/simalliance/openmobileapi/SEService;)V

    iput-object v1, p0, Lorg/simalliance/openmobileapi/SEService;->mConnection:Landroid/content/ServiceConnection;

    iget-object v1, p0, Lorg/simalliance/openmobileapi/SEService;->mContext:Landroid/content/Context;

    new-instance v2, Landroid/content/Intent;

    const-class v3, Lorg/simalliance/openmobileapi/service/ISmartcardService;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lorg/simalliance/openmobileapi/SEService;->mConnection:Landroid/content/ServiceConnection;

    const/4 v4, 0x1

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v0

    .local v0, bindingSuccessful:Z
    if-eqz v0, :cond_2

    const-string v1, "SEService"

    const-string v2, "bindService successful"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    return-void
.end method

.method static synthetic access$002(Lorg/simalliance/openmobileapi/SEService;Lorg/simalliance/openmobileapi/service/ISmartcardService;)Lorg/simalliance/openmobileapi/service/ISmartcardService;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput-object p1, p0, Lorg/simalliance/openmobileapi/SEService;->mSmartcardService:Lorg/simalliance/openmobileapi/service/ISmartcardService;

    return-object p1
.end method

.method static synthetic access$100(Lorg/simalliance/openmobileapi/SEService;)Lorg/simalliance/openmobileapi/SEService$CallBack;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lorg/simalliance/openmobileapi/SEService;->mCallerCallback:Lorg/simalliance/openmobileapi/SEService$CallBack;

    return-object v0
.end method

.method static synthetic access$200(Lorg/simalliance/openmobileapi/SEService;)[Lorg/simalliance/openmobileapi/Reader;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lorg/simalliance/openmobileapi/SEService;->mReaders:[Lorg/simalliance/openmobileapi/Reader;

    return-object v0
.end method

.method private basicChannelInUse(Lorg/simalliance/openmobileapi/service/SmartcardError;)Z
    .locals 3
    .parameter "error"

    .prologue
    invoke-virtual {p1}, Lorg/simalliance/openmobileapi/service/SmartcardError;->createException()Ljava/lang/Exception;

    move-result-object v0

    .local v0, exp:Ljava/lang/Exception;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    .local v1, msg:Ljava/lang/String;
    if-eqz v1, :cond_0

    const-string v2, "basic channel in use"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    .end local v1           #msg:Ljava/lang/String;
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private channelCannotBeEstablished(Lorg/simalliance/openmobileapi/service/SmartcardError;)Z
    .locals 4
    .parameter "error"

    .prologue
    const/4 v2, 0x1

    invoke-virtual {p1}, Lorg/simalliance/openmobileapi/service/SmartcardError;->createException()Ljava/lang/Exception;

    move-result-object v0

    .local v0, exp:Ljava/lang/Exception;
    if-eqz v0, :cond_2

    instance-of v3, v0, Ljava/util/MissingResourceException;

    if-eqz v3, :cond_1

    :cond_0
    :goto_0
    return v2

    :cond_1
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    .local v1, msg:Ljava/lang/String;
    if-eqz v1, :cond_2

    const-string v3, "channel in use"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "open channel failed"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "out of channels"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "MANAGE CHANNEL"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .end local v1           #msg:Ljava/lang/String;
    :cond_2
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private checkForException(Lorg/simalliance/openmobileapi/service/SmartcardError;)V
    .locals 3
    .parameter "error"

    .prologue
    :try_start_0
    invoke-virtual {p1}, Lorg/simalliance/openmobileapi/service/SmartcardError;->throwException()V
    :try_end_0
    .catch Lorg/simalliance/openmobileapi/service/CardException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/AccessControlException; {:try_start_0 .. :try_end_0} :catch_1

    return-void

    :catch_0
    move-exception v0

    .local v0, exp:Lorg/simalliance/openmobileapi/service/CardException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-virtual {v0}, Lorg/simalliance/openmobileapi/service/CardException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .end local v0           #exp:Lorg/simalliance/openmobileapi/service/CardException;
    :catch_1
    move-exception v0

    .local v0, exp:Ljava/security/AccessControlException;
    new-instance v1, Ljava/lang/SecurityException;

    invoke-virtual {v0}, Ljava/security/AccessControlException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private checkIfAppletAvailable(Lorg/simalliance/openmobileapi/service/SmartcardError;)V
    .locals 3
    .parameter "error"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/NoSuchElementException;
        }
    .end annotation

    .prologue
    invoke-virtual {p1}, Lorg/simalliance/openmobileapi/service/SmartcardError;->createException()Ljava/lang/Exception;

    move-result-object v0

    .local v0, exp:Ljava/lang/Exception;
    if-eqz v0, :cond_0

    instance-of v1, v0, Ljava/util/NoSuchElementException;

    if-eqz v1, :cond_0

    new-instance v1, Ljava/util/NoSuchElementException;

    const-string v2, "Applet with the defined aid does not exist in the SE"

    invoke-direct {v1, v2}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_0
    return-void
.end method

.method private isDefaultApplicationSelected(Lorg/simalliance/openmobileapi/service/SmartcardError;)Z
    .locals 3
    .parameter "error"

    .prologue
    invoke-virtual {p1}, Lorg/simalliance/openmobileapi/service/SmartcardError;->createException()Ljava/lang/Exception;

    move-result-object v0

    .local v0, exp:Ljava/lang/Exception;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    .local v1, msg:Ljava/lang/String;
    if-eqz v1, :cond_0

    const-string v2, "default application is not selected"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x0

    .end local v1           #msg:Ljava/lang/String;
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x1

    goto :goto_0
.end method


# virtual methods
.method closeChannel(Lorg/simalliance/openmobileapi/Channel;)V
    .locals 5
    .parameter "channel"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    iget-object v2, p0, Lorg/simalliance/openmobileapi/SEService;->mSmartcardService:Lorg/simalliance/openmobileapi/service/ISmartcardService;

    if-nez v2, :cond_0

    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "service not connected to system"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_0
    if-nez p1, :cond_1

    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "channel must not be null"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_1
    invoke-virtual {p1}, Lorg/simalliance/openmobileapi/Channel;->isClosed()Z

    move-result v2

    if-eqz v2, :cond_2

    :goto_0
    return-void

    :cond_2
    new-instance v1, Lorg/simalliance/openmobileapi/service/SmartcardError;

    invoke-direct {v1}, Lorg/simalliance/openmobileapi/service/SmartcardError;-><init>()V

    .local v1, error:Lorg/simalliance/openmobileapi/service/SmartcardError;
    :try_start_0
    iget-object v2, p0, Lorg/simalliance/openmobileapi/SEService;->mSmartcardService:Lorg/simalliance/openmobileapi/service/ISmartcardService;

    invoke-virtual {p1}, Lorg/simalliance/openmobileapi/Channel;->getHandle()J

    move-result-wide v3

    invoke-interface {v2, v3, v4, v1}, Lorg/simalliance/openmobileapi/service/ISmartcardService;->closeChannel(JLorg/simalliance/openmobileapi/service/SmartcardError;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    invoke-direct {p0, v1}, Lorg/simalliance/openmobileapi/SEService;->checkForException(Lorg/simalliance/openmobileapi/service/SmartcardError;)V

    goto :goto_0

    :catch_0
    move-exception v0

    .local v0, e:Ljava/lang/Exception;
    new-instance v2, Ljava/io/IOException;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method getAtr(Lorg/simalliance/openmobileapi/Reader;)[B
    .locals 5
    .parameter "reader"

    .prologue
    if-nez p1, :cond_0

    new-instance v3, Ljava/lang/NullPointerException;

    const-string v4, "reader must not be null"

    invoke-direct {v3, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_0
    iget-object v3, p0, Lorg/simalliance/openmobileapi/SEService;->mSmartcardService:Lorg/simalliance/openmobileapi/service/ISmartcardService;

    if-nez v3, :cond_1

    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "service not connected to system"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_1
    new-instance v2, Lorg/simalliance/openmobileapi/service/SmartcardError;

    invoke-direct {v2}, Lorg/simalliance/openmobileapi/service/SmartcardError;-><init>()V

    .local v2, error:Lorg/simalliance/openmobileapi/service/SmartcardError;
    :try_start_0
    iget-object v3, p0, Lorg/simalliance/openmobileapi/SEService;->mSmartcardService:Lorg/simalliance/openmobileapi/service/ISmartcardService;

    invoke-virtual {p1}, Lorg/simalliance/openmobileapi/Reader;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4, v2}, Lorg/simalliance/openmobileapi/service/ISmartcardService;->getAtr(Ljava/lang/String;Lorg/simalliance/openmobileapi/service/SmartcardError;)[B

    move-result-object v0

    .local v0, atr:[B
    invoke-direct {p0, v2}, Lorg/simalliance/openmobileapi/SEService;->checkForException(Lorg/simalliance/openmobileapi/service/SmartcardError;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v0           #atr:[B
    :goto_0
    return-object v0

    :catch_0
    move-exception v1

    .local v1, e:Ljava/lang/Exception;
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getReaders()[Lorg/simalliance/openmobileapi/Reader;
    .locals 10

    .prologue
    iget-object v8, p0, Lorg/simalliance/openmobileapi/SEService;->mSmartcardService:Lorg/simalliance/openmobileapi/service/ISmartcardService;

    if-nez v8, :cond_0

    new-instance v8, Ljava/lang/IllegalStateException;

    const-string v9, "service not connected to system"

    invoke-direct {v8, v9}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v8

    :cond_0
    new-instance v2, Lorg/simalliance/openmobileapi/service/SmartcardError;

    invoke-direct {v2}, Lorg/simalliance/openmobileapi/service/SmartcardError;-><init>()V

    .local v2, error:Lorg/simalliance/openmobileapi/service/SmartcardError;
    :try_start_0
    iget-object v8, p0, Lorg/simalliance/openmobileapi/SEService;->mSmartcardService:Lorg/simalliance/openmobileapi/service/ISmartcardService;

    invoke-interface {v8, v2}, Lorg/simalliance/openmobileapi/service/ISmartcardService;->getReaders(Lorg/simalliance/openmobileapi/service/SmartcardError;)[Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .local v7, readerNames:[Ljava/lang/String;
    invoke-direct {p0, v2}, Lorg/simalliance/openmobileapi/SEService;->checkForException(Lorg/simalliance/openmobileapi/service/SmartcardError;)V

    array-length v8, v7

    new-array v8, v8, [Lorg/simalliance/openmobileapi/Reader;

    iput-object v8, p0, Lorg/simalliance/openmobileapi/SEService;->mReaders:[Lorg/simalliance/openmobileapi/Reader;

    const/4 v3, 0x0

    .local v3, i:I
    move-object v0, v7

    .local v0, arr$:[Ljava/lang/String;
    array-length v5, v0

    .local v5, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_0
    if-ge v4, v5, :cond_1

    aget-object v6, v0, v4

    .local v6, readerName:Ljava/lang/String;
    iget-object v8, p0, Lorg/simalliance/openmobileapi/SEService;->mReaders:[Lorg/simalliance/openmobileapi/Reader;

    new-instance v9, Lorg/simalliance/openmobileapi/Reader;

    invoke-direct {v9, v6, p0}, Lorg/simalliance/openmobileapi/Reader;-><init>(Ljava/lang/String;Lorg/simalliance/openmobileapi/SEService;)V

    aput-object v9, v8, v3

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .end local v0           #arr$:[Ljava/lang/String;
    .end local v3           #i:I
    .end local v4           #i$:I
    .end local v5           #len$:I
    .end local v6           #readerName:Ljava/lang/String;
    .end local v7           #readerNames:[Ljava/lang/String;
    :catch_0
    move-exception v1

    .local v1, e:Ljava/lang/Exception;
    new-instance v8, Ljava/lang/IllegalStateException;

    invoke-direct {v8, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v8

    .end local v1           #e:Ljava/lang/Exception;
    .restart local v0       #arr$:[Ljava/lang/String;
    .restart local v3       #i:I
    .restart local v4       #i$:I
    .restart local v5       #len$:I
    .restart local v7       #readerNames:[Ljava/lang/String;
    :cond_1
    iget-object v8, p0, Lorg/simalliance/openmobileapi/SEService;->mReaders:[Lorg/simalliance/openmobileapi/Reader;

    return-object v8
.end method

.method getSelectResponse(Lorg/simalliance/openmobileapi/Channel;)[B
    .locals 6
    .parameter "channel"

    .prologue
    iget-object v3, p0, Lorg/simalliance/openmobileapi/SEService;->mSmartcardService:Lorg/simalliance/openmobileapi/service/ISmartcardService;

    if-nez v3, :cond_0

    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "service not connected to system"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_0
    if-nez p1, :cond_1

    new-instance v3, Ljava/lang/NullPointerException;

    const-string v4, "channel must not be null"

    invoke-direct {v3, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_1
    invoke-virtual {p1}, Lorg/simalliance/openmobileapi/Channel;->isClosed()Z

    move-result v3

    if-eqz v3, :cond_2

    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "channel is closed"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_2
    new-instance v1, Lorg/simalliance/openmobileapi/service/SmartcardError;

    invoke-direct {v1}, Lorg/simalliance/openmobileapi/service/SmartcardError;-><init>()V

    .local v1, error:Lorg/simalliance/openmobileapi/service/SmartcardError;
    :try_start_0
    iget-object v3, p0, Lorg/simalliance/openmobileapi/SEService;->mSmartcardService:Lorg/simalliance/openmobileapi/service/ISmartcardService;

    invoke-virtual {p1}, Lorg/simalliance/openmobileapi/Channel;->getHandle()J

    move-result-wide v4

    invoke-interface {v3, v4, v5, v1}, Lorg/simalliance/openmobileapi/service/ISmartcardService;->getSelectResponse(JLorg/simalliance/openmobileapi/service/SmartcardError;)[B

    move-result-object v2

    .local v2, response:[B
    invoke-direct {p0, v1}, Lorg/simalliance/openmobileapi/SEService;->checkForException(Lorg/simalliance/openmobileapi/service/SmartcardError;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    invoke-direct {p0, v1}, Lorg/simalliance/openmobileapi/SEService;->checkForException(Lorg/simalliance/openmobileapi/service/SmartcardError;)V

    return-object v2

    .end local v2           #response:[B
    :catch_0
    move-exception v0

    .local v0, e:Ljava/lang/Exception;
    const/4 v3, 0x0

    throw v3
.end method

.method public isConnected()Z
    .locals 1

    .prologue
    iget-object v0, p0, Lorg/simalliance/openmobileapi/SEService;->mSmartcardService:Lorg/simalliance/openmobileapi/service/ISmartcardService;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method isSecureElementPresent(Lorg/simalliance/openmobileapi/Reader;)Z
    .locals 5
    .parameter "reader"

    .prologue
    if-nez p1, :cond_0

    new-instance v3, Ljava/lang/NullPointerException;

    const-string v4, "reader must not be null"

    invoke-direct {v3, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_0
    iget-object v3, p0, Lorg/simalliance/openmobileapi/SEService;->mSmartcardService:Lorg/simalliance/openmobileapi/service/ISmartcardService;

    if-nez v3, :cond_1

    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "service not connected to system"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_1
    new-instance v1, Lorg/simalliance/openmobileapi/service/SmartcardError;

    invoke-direct {v1}, Lorg/simalliance/openmobileapi/service/SmartcardError;-><init>()V

    .local v1, error:Lorg/simalliance/openmobileapi/service/SmartcardError;
    :try_start_0
    iget-object v3, p0, Lorg/simalliance/openmobileapi/SEService;->mSmartcardService:Lorg/simalliance/openmobileapi/service/ISmartcardService;

    invoke-virtual {p1}, Lorg/simalliance/openmobileapi/Reader;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4, v1}, Lorg/simalliance/openmobileapi/service/ISmartcardService;->isCardPresent(Ljava/lang/String;Lorg/simalliance/openmobileapi/service/SmartcardError;)Z

    move-result v2

    .local v2, isPresent:Z
    invoke-direct {p0, v1}, Lorg/simalliance/openmobileapi/SEService;->checkForException(Lorg/simalliance/openmobileapi/service/SmartcardError;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v2           #isPresent:Z
    :goto_0
    return v2

    :catch_0
    move-exception v0

    .local v0, e:Ljava/lang/Exception;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method openBasicChannel(Lorg/simalliance/openmobileapi/Session;[B)Lorg/simalliance/openmobileapi/Channel;
    .locals 8
    .parameter "session"
    .parameter "aid"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    if-nez p1, :cond_0

    new-instance v5, Ljava/lang/NullPointerException;

    const-string v6, "session must not be null"

    invoke-direct {v5, v6}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_0
    invoke-virtual {p1}, Lorg/simalliance/openmobileapi/Session;->getReader()Lorg/simalliance/openmobileapi/Reader;

    move-result-object v5

    if-nez v5, :cond_1

    new-instance v5, Ljava/lang/NullPointerException;

    const-string v6, "reader must not be null"

    invoke-direct {v5, v6}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_1
    iget-object v5, p0, Lorg/simalliance/openmobileapi/SEService;->mSmartcardService:Lorg/simalliance/openmobileapi/service/ISmartcardService;

    if-nez v5, :cond_2

    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "service not connected to system"

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_2
    invoke-virtual {p1}, Lorg/simalliance/openmobileapi/Session;->isClosed()Z

    move-result v5

    if-eqz v5, :cond_3

    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "session is closed"

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_3
    new-instance v2, Lorg/simalliance/openmobileapi/service/SmartcardError;

    invoke-direct {v2}, Lorg/simalliance/openmobileapi/service/SmartcardError;-><init>()V

    .local v2, error:Lorg/simalliance/openmobileapi/service/SmartcardError;
    :try_start_0
    iget-object v5, p0, Lorg/simalliance/openmobileapi/SEService;->mSmartcardService:Lorg/simalliance/openmobileapi/service/ISmartcardService;

    invoke-virtual {p1}, Lorg/simalliance/openmobileapi/Session;->getReader()Lorg/simalliance/openmobileapi/Reader;

    move-result-object v6

    invoke-virtual {v6}, Lorg/simalliance/openmobileapi/Reader;->getName()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lorg/simalliance/openmobileapi/SEService;->mCallback:Lorg/simalliance/openmobileapi/service/ISmartcardServiceCallback;

    invoke-interface {v5, v6, p2, v7, v2}, Lorg/simalliance/openmobileapi/service/ISmartcardService;->openBasicChannelAid(Ljava/lang/String;[BLorg/simalliance/openmobileapi/service/ISmartcardServiceCallback;Lorg/simalliance/openmobileapi/service/SmartcardError;)J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v3

    .local v3, hChannel:J
    invoke-direct {p0, v2}, Lorg/simalliance/openmobileapi/SEService;->basicChannelInUse(Lorg/simalliance/openmobileapi/service/SmartcardError;)Z

    move-result v5

    if-eqz v5, :cond_5

    :cond_4
    :goto_0
    return-object v0

    .end local v3           #hChannel:J
    :catch_0
    move-exception v1

    .local v1, e:Ljava/lang/Exception;
    new-instance v5, Ljava/io/IOException;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .end local v1           #e:Ljava/lang/Exception;
    .restart local v3       #hChannel:J
    :cond_5
    invoke-direct {p0, v2}, Lorg/simalliance/openmobileapi/SEService;->channelCannotBeEstablished(Lorg/simalliance/openmobileapi/service/SmartcardError;)Z

    move-result v5

    if-nez v5, :cond_4

    if-eqz p2, :cond_6

    array-length v5, p2

    if-nez v5, :cond_7

    :cond_6
    invoke-direct {p0, v2}, Lorg/simalliance/openmobileapi/SEService;->isDefaultApplicationSelected(Lorg/simalliance/openmobileapi/service/SmartcardError;)Z

    move-result v5

    if-eqz v5, :cond_4

    :cond_7
    invoke-direct {p0, v2}, Lorg/simalliance/openmobileapi/SEService;->checkIfAppletAvailable(Lorg/simalliance/openmobileapi/service/SmartcardError;)V

    invoke-direct {p0, v2}, Lorg/simalliance/openmobileapi/SEService;->checkForException(Lorg/simalliance/openmobileapi/service/SmartcardError;)V

    new-instance v0, Lorg/simalliance/openmobileapi/Channel;

    const/4 v5, 0x0

    invoke-direct {v0, p1, v3, v4, v5}, Lorg/simalliance/openmobileapi/Channel;-><init>(Lorg/simalliance/openmobileapi/Session;JZ)V

    .local v0, basicChannel:Lorg/simalliance/openmobileapi/Channel;
    goto :goto_0
.end method

.method openLogicalChannel(Lorg/simalliance/openmobileapi/Session;[B)Lorg/simalliance/openmobileapi/Channel;
    .locals 8
    .parameter "session"
    .parameter "aid"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-string v5, "liumeng"

    const-string v6, "openLogicalChannel"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-nez p1, :cond_0

    const-string v5, "liumeng"

    const-string v6, "openLogicalChannel 1"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v5, Ljava/lang/NullPointerException;

    const-string v6, "session must not be null"

    invoke-direct {v5, v6}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_0
    invoke-virtual {p1}, Lorg/simalliance/openmobileapi/Session;->getReader()Lorg/simalliance/openmobileapi/Reader;

    move-result-object v5

    if-nez v5, :cond_1

    const-string v5, "liumeng"

    const-string v6, "openLogicalChannel 2"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v5, Ljava/lang/NullPointerException;

    const-string v6, "reader must not be null"

    invoke-direct {v5, v6}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_1
    iget-object v5, p0, Lorg/simalliance/openmobileapi/SEService;->mSmartcardService:Lorg/simalliance/openmobileapi/service/ISmartcardService;

    if-nez v5, :cond_2

    const-string v5, "liumeng"

    const-string v6, "openLogicalChannel 3"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "service not connected to system"

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_2
    invoke-virtual {p1}, Lorg/simalliance/openmobileapi/Session;->isClosed()Z

    move-result v5

    if-eqz v5, :cond_3

    const-string v5, "liumeng"

    const-string v6, "openLogicalChannel 4"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "session is closed"

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_3
    new-instance v1, Lorg/simalliance/openmobileapi/service/SmartcardError;

    invoke-direct {v1}, Lorg/simalliance/openmobileapi/service/SmartcardError;-><init>()V

    .local v1, error:Lorg/simalliance/openmobileapi/service/SmartcardError;
    :try_start_0
    iget-object v5, p0, Lorg/simalliance/openmobileapi/SEService;->mSmartcardService:Lorg/simalliance/openmobileapi/service/ISmartcardService;

    invoke-virtual {p1}, Lorg/simalliance/openmobileapi/Session;->getReader()Lorg/simalliance/openmobileapi/Reader;

    move-result-object v6

    invoke-virtual {v6}, Lorg/simalliance/openmobileapi/Reader;->getName()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lorg/simalliance/openmobileapi/SEService;->mCallback:Lorg/simalliance/openmobileapi/service/ISmartcardServiceCallback;

    invoke-interface {v5, v6, p2, v7, v1}, Lorg/simalliance/openmobileapi/service/ISmartcardService;->openLogicalChannel(Ljava/lang/String;[BLorg/simalliance/openmobileapi/service/ISmartcardServiceCallback;Lorg/simalliance/openmobileapi/service/SmartcardError;)J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    .local v2, hChannel:J
    invoke-direct {p0, v1}, Lorg/simalliance/openmobileapi/SEService;->channelCannotBeEstablished(Lorg/simalliance/openmobileapi/service/SmartcardError;)Z

    move-result v5

    if-eqz v5, :cond_4

    const/4 v4, 0x0

    :goto_0
    return-object v4

    .end local v2           #hChannel:J
    :catch_0
    move-exception v0

    .local v0, e:Ljava/lang/Exception;
    new-instance v5, Ljava/io/IOException;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .end local v0           #e:Ljava/lang/Exception;
    .restart local v2       #hChannel:J
    :cond_4
    invoke-direct {p0, v1}, Lorg/simalliance/openmobileapi/SEService;->checkIfAppletAvailable(Lorg/simalliance/openmobileapi/service/SmartcardError;)V

    invoke-direct {p0, v1}, Lorg/simalliance/openmobileapi/SEService;->checkForException(Lorg/simalliance/openmobileapi/service/SmartcardError;)V

    new-instance v4, Lorg/simalliance/openmobileapi/Channel;

    const/4 v5, 0x1

    invoke-direct {v4, p1, v2, v3, v5}, Lorg/simalliance/openmobileapi/Channel;-><init>(Lorg/simalliance/openmobileapi/Session;JZ)V

    .local v4, logicalChannel:Lorg/simalliance/openmobileapi/Channel;
    goto :goto_0
.end method

.method public shutdown()V
    .locals 7

    .prologue
    iget-object v5, p0, Lorg/simalliance/openmobileapi/SEService;->mConnection:Landroid/content/ServiceConnection;

    monitor-enter v5

    :try_start_0
    iget-object v4, p0, Lorg/simalliance/openmobileapi/SEService;->mSmartcardService:Lorg/simalliance/openmobileapi/service/ISmartcardService;

    if-eqz v4, :cond_1

    iget-object v4, p0, Lorg/simalliance/openmobileapi/SEService;->mReaders:[Lorg/simalliance/openmobileapi/Reader;

    if-eqz v4, :cond_1

    iget-object v6, p0, Lorg/simalliance/openmobileapi/SEService;->mReaders:[Lorg/simalliance/openmobileapi/Reader;

    monitor-enter v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object v0, p0, Lorg/simalliance/openmobileapi/SEService;->mReaders:[Lorg/simalliance/openmobileapi/Reader;

    .local v0, arr$:[Lorg/simalliance/openmobileapi/Reader;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .local v3, reader:Lorg/simalliance/openmobileapi/Reader;
    :try_start_2
    invoke-virtual {v3}, Lorg/simalliance/openmobileapi/Reader;->closeSessions()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .end local v3           #reader:Lorg/simalliance/openmobileapi/Reader;
    :cond_0
    :try_start_3
    monitor-exit v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .end local v0           #arr$:[Lorg/simalliance/openmobileapi/Reader;
    .end local v1           #i$:I
    .end local v2           #len$:I
    :cond_1
    :try_start_4
    iget-object v4, p0, Lorg/simalliance/openmobileapi/SEService;->mContext:Landroid/content/Context;

    iget-object v6, p0, Lorg/simalliance/openmobileapi/SEService;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v4, v6}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_4 .. :try_end_4} :catch_1

    :goto_2
    :try_start_5
    monitor-exit v5
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    return-void

    :catchall_0
    move-exception v4

    :try_start_6
    monitor-exit v6
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :try_start_7
    throw v4

    :catchall_1
    move-exception v4

    monitor-exit v5
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    throw v4

    .restart local v0       #arr$:[Lorg/simalliance/openmobileapi/Reader;
    .restart local v1       #i$:I
    .restart local v2       #len$:I
    .restart local v3       #reader:Lorg/simalliance/openmobileapi/Reader;
    :catch_0
    move-exception v4

    goto :goto_1

    .end local v0           #arr$:[Lorg/simalliance/openmobileapi/Reader;
    .end local v1           #i$:I
    .end local v2           #len$:I
    .end local v3           #reader:Lorg/simalliance/openmobileapi/Reader;
    :catch_1
    move-exception v4

    goto :goto_2
.end method

.method transmit(Lorg/simalliance/openmobileapi/Channel;[B)[B
    .locals 6
    .parameter "channel"
    .parameter "command"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    if-nez p2, :cond_0

    new-instance v3, Ljava/lang/NullPointerException;

    const-string v4, "command must not be null"

    invoke-direct {v3, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_0
    array-length v3, p2

    const/4 v4, 0x4

    if-ge v3, v4, :cond_1

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "command must have at least 4 bytes"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_1
    iget-object v3, p0, Lorg/simalliance/openmobileapi/SEService;->mSmartcardService:Lorg/simalliance/openmobileapi/service/ISmartcardService;

    if-nez v3, :cond_2

    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "service not connected to system"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_2
    if-nez p1, :cond_3

    new-instance v3, Ljava/lang/NullPointerException;

    const-string v4, "channel must not be null"

    invoke-direct {v3, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_3
    invoke-virtual {p1}, Lorg/simalliance/openmobileapi/Channel;->isClosed()Z

    move-result v3

    if-eqz v3, :cond_4

    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "channel is closed"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_4
    new-instance v1, Lorg/simalliance/openmobileapi/service/SmartcardError;

    invoke-direct {v1}, Lorg/simalliance/openmobileapi/service/SmartcardError;-><init>()V

    .local v1, error:Lorg/simalliance/openmobileapi/service/SmartcardError;
    :try_start_0
    iget-object v3, p0, Lorg/simalliance/openmobileapi/SEService;->mSmartcardService:Lorg/simalliance/openmobileapi/service/ISmartcardService;

    invoke-virtual {p1}, Lorg/simalliance/openmobileapi/Channel;->getHandle()J

    move-result-wide v4

    invoke-interface {v3, v4, v5, p2, v1}, Lorg/simalliance/openmobileapi/service/ISmartcardService;->transmit(J[BLorg/simalliance/openmobileapi/service/SmartcardError;)[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .local v2, response:[B
    invoke-direct {p0, v1}, Lorg/simalliance/openmobileapi/SEService;->checkForException(Lorg/simalliance/openmobileapi/service/SmartcardError;)V

    return-object v2

    .end local v2           #response:[B
    :catch_0
    move-exception v0

    .local v0, e:Ljava/lang/Exception;
    new-instance v3, Ljava/io/IOException;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
.end method
