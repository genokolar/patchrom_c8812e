.class public Landroid/webkit/HTML5VideoView;
.super Ljava/lang/Object;
.source "HTML5VideoView.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnPreparedListener;
.implements Landroid/widget/MediaController$MediaPlayerControl;
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;
.implements Landroid/media/MediaPlayer$OnVideoSizeChangedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/webkit/HTML5VideoView$TimeupdateTask;
    }
.end annotation


# static fields
#the value of this static final field might be set in the static constructor
.field static final synthetic $assertionsDisabled:Z = false

.field private static final COOKIE:Ljava/lang/String; = "Cookie"

.field private static final HIDE_URL_LOGS:Ljava/lang/String; = "x-hide-urls-from-log"

.field private static final LOGTAG:Ljava/lang/String; = "HTML5VideoView"

.field static final STATE_BUFFERING:I = 0x5

.field static final STATE_DETACHED:I = 0x6

.field static final STATE_INITIALIZED:I = 0x1

.field static final STATE_PLAYING:I = 0x4

.field static final STATE_PREPARED:I = 0x3

.field static final STATE_PREPARING:I = 0x2

.field static final STATE_RELEASED:I = 0x0

.field private static final SURFACE_TEXTURE_STATE_ATTACHED_FULLSCREEN:I = 0x1

.field private static final SURFACE_TEXTURE_STATE_ATTACHED_INLINE:I = 0x0

.field private static final SURFACE_TEXTURE_STATE_DETACHED:I = 0x2

.field private static final TIMEUPDATE_PERIOD:I = 0xfa


# instance fields
.field private mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

.field private mCanPause:Z

.field private mCanSeekBack:Z

.field private mCanSeekForward:Z

.field private mCurrentBufferPercentage:I

.field private mCurrentState:I

.field private mDuration:I

.field private mHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected mPauseDuringPreparing:Z

.field private mPlayer:Landroid/media/MediaPlayer;

.field private mPlayerBuffering:Z

.field private mProxy:Landroid/webkit/HTML5VideoViewProxy;

.field private mSaveSeekTime:I

.field private mStartWhenPrepared:Z

.field private mSurfaceTexture:Landroid/graphics/SurfaceTexture;

.field private mSurfaceTextureState:I

.field private mTextureNames:[I

.field private mTimer:Ljava/util/Timer;

.field private mUri:Landroid/net/Uri;

.field private mVideoHeight:I

.field private mVideoWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const-class v0, Landroid/webkit/HTML5VideoView;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Landroid/webkit/HTML5VideoView;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>(Landroid/webkit/HTML5VideoViewProxy;I)V
    .locals 2
    .parameter "proxy"
    .parameter "position"

    .prologue
    const/4 v1, 0x0

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    iput-boolean v1, p0, Landroid/webkit/HTML5VideoView;->mPlayerBuffering:Z

    iput-boolean v1, p0, Landroid/webkit/HTML5VideoView;->mStartWhenPrepared:Z

    new-instance v0, Landroid/webkit/HTML5VideoView$1;

    invoke-direct {v0, p0}, Landroid/webkit/HTML5VideoView$1;-><init>(Landroid/webkit/HTML5VideoView;)V

    iput-object v0, p0, Landroid/webkit/HTML5VideoView;->mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v0, p0, Landroid/webkit/HTML5VideoView;->mPlayer:Landroid/media/MediaPlayer;

    const/4 v0, 0x1

    iput v0, p0, Landroid/webkit/HTML5VideoView;->mCurrentState:I

    iput-object p1, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    iput p2, p0, Landroid/webkit/HTML5VideoView;->mSaveSeekTime:I

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/webkit/HTML5VideoView;->mTimer:Ljava/util/Timer;

    iput-boolean v1, p0, Landroid/webkit/HTML5VideoView;->mPauseDuringPreparing:Z

    return-void
.end method

.method static synthetic access$002(Landroid/webkit/HTML5VideoView;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput p1, p0, Landroid/webkit/HTML5VideoView;->mCurrentBufferPercentage:I

    return p1
.end method

.method private attachMediaController()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x1

    iget-object v1, p0, Landroid/webkit/HTML5VideoView;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1, v2, v2}, Landroid/media/MediaPlayer;->getMetadata(ZZ)Landroid/media/Metadata;

    move-result-object v0

    .local v0, data:Landroid/media/Metadata;
    if-eqz v0, :cond_6

    invoke-virtual {v0, v3}, Landroid/media/Metadata;->has(I)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0, v3}, Landroid/media/Metadata;->getBoolean(I)Z

    move-result v1

    if-eqz v1, :cond_4

    :cond_0
    move v1, v3

    :goto_0
    iput-boolean v1, p0, Landroid/webkit/HTML5VideoView;->mCanPause:Z

    invoke-virtual {v0, v4}, Landroid/media/Metadata;->has(I)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0, v4}, Landroid/media/Metadata;->getBoolean(I)Z

    move-result v1

    if-eqz v1, :cond_5

    :cond_1
    move v1, v3

    :goto_1
    iput-boolean v1, p0, Landroid/webkit/HTML5VideoView;->mCanSeekBack:Z

    invoke-virtual {v0, v5}, Landroid/media/Metadata;->has(I)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {v0, v5}, Landroid/media/Metadata;->getBoolean(I)Z

    move-result v1

    if-eqz v1, :cond_3

    :cond_2
    move v2, v3

    :cond_3
    iput-boolean v2, p0, Landroid/webkit/HTML5VideoView;->mCanSeekForward:Z

    :goto_2
    invoke-static {}, Landroid/webkit/HTML5VideoFullscreen;->instance()Landroid/webkit/HTML5VideoFullscreen;

    move-result-object v1

    iget-object v2, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    invoke-virtual {v1, v2, p0}, Landroid/webkit/HTML5VideoFullscreen;->attachMediaController(Landroid/webkit/HTML5VideoViewProxy;Landroid/widget/MediaController$MediaPlayerControl;)V

    return-void

    :cond_4
    move v1, v2

    goto :goto_0

    :cond_5
    move v1, v2

    goto :goto_1

    :cond_6
    iput-boolean v3, p0, Landroid/webkit/HTML5VideoView;->mCanSeekForward:Z

    iput-boolean v3, p0, Landroid/webkit/HTML5VideoView;->mCanSeekBack:Z

    iput-boolean v3, p0, Landroid/webkit/HTML5VideoView;->mCanPause:Z

    goto :goto_2
.end method

.method private detachInlineGLContext()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    iget-object v1, p0, Landroid/webkit/HTML5VideoView;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    if-eqz v1, :cond_0

    iget v1, p0, Landroid/webkit/HTML5VideoView;->mSurfaceTextureState:I

    if-nez v1, :cond_0

    :try_start_0
    iget-object v1, p0, Landroid/webkit/HTML5VideoView;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v1}, Landroid/graphics/SurfaceTexture;->detachFromGLContext()V

    const/4 v1, 0x1

    new-array v1, v1, [I

    iput-object v1, p0, Landroid/webkit/HTML5VideoView;->mTextureNames:[I

    const/4 v1, 0x1

    iget-object v2, p0, Landroid/webkit/HTML5VideoView;->mTextureNames:[I

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    const/4 v1, 0x2

    iput v1, p0, Landroid/webkit/HTML5VideoView;->mSurfaceTextureState:I

    iget-object v1, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    invoke-virtual {v1}, Landroid/webkit/HTML5VideoViewProxy;->updateVideoLayerPlayerState()V

    const/4 v1, 0x0

    invoke-direct {p0, v1}, Landroid/webkit/HTML5VideoView;->setInlineFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    .local v0, e:Ljava/lang/RuntimeException;
    iput v4, p0, Landroid/webkit/HTML5VideoView;->mSurfaceTextureState:I

    invoke-virtual {v0}, Ljava/lang/RuntimeException;->printStackTrace()V

    goto :goto_0
.end method

.method private static generateHeaders(Ljava/lang/String;Landroid/webkit/HTML5VideoViewProxy;)Ljava/util/Map;
    .locals 5
    .parameter "url"
    .parameter "proxy"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/webkit/HTML5VideoViewProxy;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    invoke-virtual {p1}, Landroid/webkit/HTML5VideoViewProxy;->getWebView()Landroid/webkit/WebViewClassic;

    move-result-object v3

    invoke-virtual {v3}, Landroid/webkit/WebViewClassic;->isPrivateBrowsingEnabled()Z

    move-result v2

    .local v2, isPrivate:Z
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v3

    invoke-virtual {v3, p0, v2}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .local v0, cookieValue:Ljava/lang/String;
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .local v1, headers:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v0, :cond_0

    const-string v3, "Cookie"

    invoke-interface {v1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    if-eqz v2, :cond_1

    const-string v3, "x-hide-urls-from-log"

    const-string v4, "true"

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    return-object v1
.end method

.method private isFullscreen()Z
    .locals 1

    .prologue
    invoke-static {}, Landroid/webkit/HTML5VideoFullscreen;->instance()Landroid/webkit/HTML5VideoFullscreen;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/HTML5VideoFullscreen;->isFullscreenView()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    invoke-virtual {v0}, Landroid/webkit/HTML5VideoViewProxy;->isFullscreen()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private prepareDataCommon(Landroid/webkit/HTML5VideoViewProxy;)V
    .locals 5
    .parameter "proxy"

    .prologue
    const/4 v1, 0x1

    :try_start_0
    iput v1, p0, Landroid/webkit/HTML5VideoView;->mCurrentState:I

    iget-object v1, p0, Landroid/webkit/HTML5VideoView;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->reset()V

    iget-object v1, p0, Landroid/webkit/HTML5VideoView;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {p1}, Landroid/webkit/HTML5VideoViewProxy;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Landroid/webkit/HTML5VideoView;->mUri:Landroid/net/Uri;

    iget-object v4, p0, Landroid/webkit/HTML5VideoView;->mHeaders:Ljava/util/Map;

    invoke-virtual {v1, v2, v3, v4}, Landroid/media/MediaPlayer;->setDataSource(Landroid/content/Context;Landroid/net/Uri;Ljava/util/Map;)V

    iget-object v1, p0, Landroid/webkit/HTML5VideoView;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->prepareAsync()V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    :goto_0
    const/4 v1, 0x2

    iput v1, p0, Landroid/webkit/HTML5VideoView;->mCurrentState:I

    return-void

    :catch_0
    move-exception v0

    .local v0, e:Ljava/lang/IllegalArgumentException;
    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    goto :goto_0

    .end local v0           #e:Ljava/lang/IllegalArgumentException;
    :catch_1
    move-exception v0

    .local v0, e:Ljava/lang/IllegalStateException;
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    goto :goto_0

    .end local v0           #e:Ljava/lang/IllegalStateException;
    :catch_2
    move-exception v0

    .local v0, e:Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method private setInlineFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V
    .locals 1
    .parameter "listener"

    .prologue
    invoke-virtual {p0}, Landroid/webkit/HTML5VideoView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    return-void
.end method


# virtual methods
.method public attachInlineGlContextIfNeeded()V
    .locals 3

    .prologue
    const/4 v2, 0x2

    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    if-eqz v0, :cond_1

    iget v0, p0, Landroid/webkit/HTML5VideoView;->mSurfaceTextureState:I

    if-ne v0, v2, :cond_1

    invoke-direct {p0}, Landroid/webkit/HTML5VideoView;->isFullscreen()Z

    move-result v0

    if-nez v0, :cond_1

    iget v0, p0, Landroid/webkit/HTML5VideoView;->mCurrentState:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    iget v0, p0, Landroid/webkit/HTML5VideoView;->mCurrentState:I

    if-eq v0, v2, :cond_0

    iget v0, p0, Landroid/webkit/HTML5VideoView;->mCurrentState:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_1

    :cond_0
    :try_start_0
    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {p0}, Landroid/webkit/HTML5VideoView;->getTextureName()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/SurfaceTexture;->attachToGLContext(I)V

    const/4 v0, 0x0

    iput v0, p0, Landroid/webkit/HTML5VideoView;->mSurfaceTextureState:I

    invoke-direct {p0, p0}, Landroid/webkit/HTML5VideoView;->setInlineFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    invoke-virtual {v0}, Landroid/webkit/HTML5VideoViewProxy;->updateVideoLayerPlayerState()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public canPause()Z
    .locals 1

    .prologue
    iget-boolean v0, p0, Landroid/webkit/HTML5VideoView;->mCanPause:Z

    return v0
.end method

.method public canSeekBackward()Z
    .locals 1

    .prologue
    iget-boolean v0, p0, Landroid/webkit/HTML5VideoView;->mCanSeekBack:Z

    return v0
.end method

.method public canSeekForward()Z
    .locals 1

    .prologue
    iget-boolean v0, p0, Landroid/webkit/HTML5VideoView;->mCanSeekForward:Z

    return v0
.end method

.method public decideDisplayMode()V
    .locals 3

    .prologue
    invoke-virtual {p0}, Landroid/webkit/HTML5VideoView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v1

    .local v1, surfaceTexture:Landroid/graphics/SurfaceTexture;
    new-instance v0, Landroid/view/Surface;

    invoke-direct {v0, v1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .local v0, surface:Landroid/view/Surface;
    iget-object v2, p0, Landroid/webkit/HTML5VideoView;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v2, v0}, Landroid/media/MediaPlayer;->setSurface(Landroid/view/Surface;)V

    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    return-void
.end method

.method public enterFullscreenVideoState(Landroid/webkit/WebViewClassic;FFFF)V
    .locals 9
    .parameter "webView"
    .parameter "x"
    .parameter "y"
    .parameter "w"
    .parameter "h"

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    invoke-direct {p0}, Landroid/webkit/HTML5VideoView;->detachInlineGLContext()V

    iget v0, p0, Landroid/webkit/HTML5VideoView;->mSurfaceTextureState:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    const-string v0, "HTML5VideoView"

    const-string v1, "Unable to enter Fullscreen at this time"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void

    :cond_0
    iput v8, p0, Landroid/webkit/HTML5VideoView;->mCurrentBufferPercentage:I

    invoke-static {}, Landroid/webkit/HTML5VideoFullscreen;->instance()Landroid/webkit/HTML5VideoFullscreen;

    move-result-object v0

    iget-object v1, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    invoke-virtual {p0}, Landroid/webkit/HTML5VideoView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v2

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-virtual/range {v0 .. v6}, Landroid/webkit/HTML5VideoFullscreen;->enterFullscreen(Landroid/webkit/HTML5VideoViewProxy;Landroid/graphics/SurfaceTexture;FFFF)V

    invoke-static {}, Landroid/webkit/HTML5VideoFullscreen;->instance()Landroid/webkit/HTML5VideoFullscreen;

    move-result-object v0

    iget-object v1, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    iget v2, p0, Landroid/webkit/HTML5VideoView;->mVideoWidth:I

    iget v3, p0, Landroid/webkit/HTML5VideoView;->mVideoHeight:I

    invoke-virtual {v0, v1, v2, v3}, Landroid/webkit/HTML5VideoFullscreen;->setVideoSize(Landroid/webkit/HTML5VideoViewProxy;II)V

    invoke-static {}, Landroid/webkit/HTML5VideoFullscreen;->instance()Landroid/webkit/HTML5VideoFullscreen;

    move-result-object v1

    iget-object v2, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    iget v0, p0, Landroid/webkit/HTML5VideoView;->mCurrentState:I

    const/4 v3, 0x3

    if-eq v0, v3, :cond_1

    move v0, v7

    :goto_1
    invoke-virtual {v1, v2, v0}, Landroid/webkit/HTML5VideoFullscreen;->switchProgressView(Landroid/webkit/HTML5VideoViewProxy;Z)V

    iput v7, p0, Landroid/webkit/HTML5VideoView;->mSurfaceTextureState:I

    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p0, Landroid/webkit/HTML5VideoView;->mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnBufferingUpdateListener(Landroid/media/MediaPlayer$OnBufferingUpdateListener;)V

    goto :goto_0

    :cond_1
    move v0, v8

    goto :goto_1
.end method

.method public exitFullscreenVideoState(FFFF)V
    .locals 6
    .parameter "x"
    .parameter "y"
    .parameter "w"
    .parameter "h"

    .prologue
    invoke-direct {p0}, Landroid/webkit/HTML5VideoView;->isFullscreen()Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0}, Landroid/webkit/HTML5VideoView;->pause()V

    invoke-static {}, Landroid/webkit/HTML5VideoFullscreen;->instance()Landroid/webkit/HTML5VideoFullscreen;

    move-result-object v0

    iget-object v1, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Landroid/webkit/HTML5VideoFullscreen;->exitFullscreen(Landroid/webkit/HTML5VideoViewProxy;FFFF)V

    goto :goto_0
.end method

.method public getBufferPercentage()I
    .locals 1

    .prologue
    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    iget v0, p0, Landroid/webkit/HTML5VideoView;->mCurrentBufferPercentage:I

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getCurrentPosition()I
    .locals 2

    .prologue
    iget v0, p0, Landroid/webkit/HTML5VideoView;->mCurrentState:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getCurrentState()I
    .locals 1

    .prologue
    invoke-virtual {p0}, Landroid/webkit/HTML5VideoView;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    :goto_0
    return v0

    :cond_0
    iget v0, p0, Landroid/webkit/HTML5VideoView;->mCurrentState:I

    goto :goto_0
.end method

.method public getDuration()I
    .locals 2

    .prologue
    iget v0, p0, Landroid/webkit/HTML5VideoView;->mCurrentState:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, -0x1

    goto :goto_0
.end method

.method public getPauseDuringPreparing()Z
    .locals 1

    .prologue
    iget-boolean v0, p0, Landroid/webkit/HTML5VideoView;->mPauseDuringPreparing:Z

    return v0
.end method

.method public getPlayerBuffering()Z
    .locals 1

    .prologue
    iget-boolean v0, p0, Landroid/webkit/HTML5VideoView;->mPlayerBuffering:Z

    return v0
.end method

.method public getStartWhenPrepared()Z
    .locals 1

    .prologue
    iget-boolean v0, p0, Landroid/webkit/HTML5VideoView;->mStartWhenPrepared:Z

    return v0
.end method

.method public getSurfaceTexture()Landroid/graphics/SurfaceTexture;
    .locals 3

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    if-nez v0, :cond_1

    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mTextureNames:[I

    if-nez v0, :cond_0

    new-array v0, v1, [I

    iput-object v0, p0, Landroid/webkit/HTML5VideoView;->mTextureNames:[I

    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mTextureNames:[I

    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    :cond_0
    new-instance v0, Landroid/graphics/SurfaceTexture;

    iget-object v1, p0, Landroid/webkit/HTML5VideoView;->mTextureNames:[I

    aget v1, v1, v2

    invoke-direct {v0, v1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    iput-object v0, p0, Landroid/webkit/HTML5VideoView;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    iput v2, p0, Landroid/webkit/HTML5VideoView;->mSurfaceTextureState:I

    :cond_1
    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    return-object v0
.end method

.method public getTextureName()I
    .locals 2

    .prologue
    const/4 v0, 0x0

    iget-object v1, p0, Landroid/webkit/HTML5VideoView;->mTextureNames:[I

    if-eqz v1, :cond_0

    iget-object v1, p0, Landroid/webkit/HTML5VideoView;->mTextureNames:[I

    aget v0, v1, v0

    :cond_0
    return v0
.end method

.method public isInlineVideoConfigured()Z
    .locals 1

    .prologue
    iget v0, p0, Landroid/webkit/HTML5VideoView;->mSurfaceTextureState:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isPlaying()Z
    .locals 2

    .prologue
    iget v0, p0, Landroid/webkit/HTML5VideoView;->mCurrentState:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onEnterFullscreen()V
    .locals 3

    .prologue
    iget v0, p0, Landroid/webkit/HTML5VideoView;->mCurrentState:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    invoke-direct {p0}, Landroid/webkit/HTML5VideoView;->attachMediaController()V

    invoke-static {}, Landroid/webkit/HTML5VideoFullscreen;->instance()Landroid/webkit/HTML5VideoFullscreen;

    move-result-object v1

    iget-object v2, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    invoke-virtual {p0}, Landroid/webkit/HTML5VideoView;->isPlaying()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v2, v0}, Landroid/webkit/HTML5VideoFullscreen;->showMediaControls(Landroid/webkit/HTML5VideoViewProxy;Z)V

    :cond_0
    return-void

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 1
    .parameter "surfaceTexture"

    .prologue
    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    invoke-virtual {v0}, Landroid/webkit/HTML5VideoViewProxy;->getWebView()Landroid/webkit/WebViewClassic;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebViewClassic;->invalidate()V

    return-void
.end method

.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 5
    .parameter "mp"

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x3

    iput v2, p0, Landroid/webkit/HTML5VideoView;->mCurrentState:I

    iget v2, p0, Landroid/webkit/HTML5VideoView;->mSaveSeekTime:I

    invoke-virtual {p0, v2}, Landroid/webkit/HTML5VideoView;->seekTo(I)V

    iget-object v2, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    if-eqz v2, :cond_0

    iget-object v2, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    invoke-virtual {v2, p1}, Landroid/webkit/HTML5VideoViewProxy;->onPrepared(Landroid/media/MediaPlayer;)V

    :cond_0
    invoke-direct {p0}, Landroid/webkit/HTML5VideoView;->isFullscreen()Z

    move-result v2

    if-eqz v2, :cond_3

    iget v2, p0, Landroid/webkit/HTML5VideoView;->mSurfaceTextureState:I

    if-eq v2, v0, :cond_2

    invoke-direct {p0}, Landroid/webkit/HTML5VideoView;->detachInlineGLContext()V

    sget-boolean v2, Landroid/webkit/HTML5VideoView;->$assertionsDisabled:Z

    if-nez v2, :cond_1

    iget v2, p0, Landroid/webkit/HTML5VideoView;->mSurfaceTextureState:I

    const/4 v3, 0x2

    if-eq v2, v3, :cond_1

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_1
    invoke-static {}, Landroid/webkit/HTML5VideoFullscreen;->instance()Landroid/webkit/HTML5VideoFullscreen;

    move-result-object v2

    iget-object v3, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    invoke-virtual {p0}, Landroid/webkit/HTML5VideoView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/webkit/HTML5VideoFullscreen;->setSurfaceTextureToFullscreen(Landroid/webkit/HTML5VideoViewProxy;Landroid/graphics/SurfaceTexture;)V

    iput v0, p0, Landroid/webkit/HTML5VideoView;->mSurfaceTextureState:I

    :cond_2
    invoke-direct {p0}, Landroid/webkit/HTML5VideoView;->attachMediaController()V

    iget-object v2, p0, Landroid/webkit/HTML5VideoView;->mPlayer:Landroid/media/MediaPlayer;

    iget-object v3, p0, Landroid/webkit/HTML5VideoView;->mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setOnBufferingUpdateListener(Landroid/media/MediaPlayer$OnBufferingUpdateListener;)V

    invoke-static {}, Landroid/webkit/HTML5VideoFullscreen;->instance()Landroid/webkit/HTML5VideoFullscreen;

    move-result-object v2

    iget-object v3, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    invoke-virtual {v2, v3, v1}, Landroid/webkit/HTML5VideoFullscreen;->switchProgressView(Landroid/webkit/HTML5VideoViewProxy;Z)V

    invoke-static {}, Landroid/webkit/HTML5VideoFullscreen;->instance()Landroid/webkit/HTML5VideoFullscreen;

    move-result-object v2

    iget-object v3, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    invoke-virtual {p0}, Landroid/webkit/HTML5VideoView;->getStartWhenPrepared()Z

    move-result v4

    if-nez v4, :cond_5

    :goto_0
    invoke-virtual {v2, v3, v0}, Landroid/webkit/HTML5VideoFullscreen;->showMediaControls(Landroid/webkit/HTML5VideoViewProxy;Z)V

    :cond_3
    iget-boolean v0, p0, Landroid/webkit/HTML5VideoView;->mPauseDuringPreparing:Z

    if-nez v0, :cond_4

    invoke-virtual {p0}, Landroid/webkit/HTML5VideoView;->getStartWhenPrepared()Z

    move-result v0

    if-nez v0, :cond_6

    :cond_4
    iput-boolean v1, p0, Landroid/webkit/HTML5VideoView;->mPauseDuringPreparing:Z

    :goto_1
    return-void

    :cond_5
    move v0, v1

    goto :goto_0

    :cond_6
    invoke-virtual {p0}, Landroid/webkit/HTML5VideoView;->start()V

    goto :goto_1
.end method

.method public onStopFullscreen()V
    .locals 1

    .prologue
    const/4 v0, 0x2

    iput v0, p0, Landroid/webkit/HTML5VideoView;->mSurfaceTextureState:I

    invoke-virtual {p0}, Landroid/webkit/HTML5VideoView;->attachInlineGlContextIfNeeded()V

    return-void
.end method

.method public onVideoSizeChanged(Landroid/media/MediaPlayer;II)V
    .locals 2
    .parameter "mp"
    .parameter "width"
    .parameter "height"

    .prologue
    iput p2, p0, Landroid/webkit/HTML5VideoView;->mVideoWidth:I

    iput p3, p0, Landroid/webkit/HTML5VideoView;->mVideoHeight:I

    invoke-direct {p0}, Landroid/webkit/HTML5VideoView;->isFullscreen()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Landroid/webkit/HTML5VideoFullscreen;->instance()Landroid/webkit/HTML5VideoFullscreen;

    move-result-object v0

    iget-object v1, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    invoke-virtual {v0, v1, p2, p3}, Landroid/webkit/HTML5VideoFullscreen;->setVideoSize(Landroid/webkit/HTML5VideoViewProxy;II)V

    :cond_0
    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    invoke-virtual {v0, p1, p2, p3}, Landroid/webkit/HTML5VideoViewProxy;->onVideoSizeChanged(Landroid/media/MediaPlayer;II)V

    :cond_1
    return-void
.end method

.method public pause()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    invoke-virtual {p0}, Landroid/webkit/HTML5VideoView;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    :cond_0
    :goto_0
    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    invoke-virtual {v0}, Landroid/webkit/HTML5VideoViewProxy;->dispatchOnPaused()V

    invoke-direct {p0}, Landroid/webkit/HTML5VideoView;->isFullscreen()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Landroid/webkit/HTML5VideoFullscreen;->instance()Landroid/webkit/HTML5VideoFullscreen;

    move-result-object v0

    iget-object v1, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    invoke-virtual {v0, v1, v2}, Landroid/webkit/HTML5VideoFullscreen;->showMediaControls(Landroid/webkit/HTML5VideoViewProxy;Z)V

    :cond_1
    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mTimer:Ljava/util/Timer;

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->purge()I

    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/webkit/HTML5VideoView;->mTimer:Ljava/util/Timer;

    :cond_2
    return-void

    :cond_3
    iget v0, p0, Landroid/webkit/HTML5VideoView;->mCurrentState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iput-boolean v2, p0, Landroid/webkit/HTML5VideoView;->mPauseDuringPreparing:Z

    goto :goto_0
.end method

.method public prepareDataAndDisplayMode()V
    .locals 3

    .prologue
    invoke-virtual {p0}, Landroid/webkit/HTML5VideoView;->decideDisplayMode()V

    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnInfoListener(Landroid/media/MediaPlayer$OnInfoListener;)V

    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnVideoSizeChangedListener(Landroid/media/MediaPlayer$OnVideoSizeChangedListener;)V

    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    invoke-direct {p0, v0}, Landroid/webkit/HTML5VideoView;->prepareDataCommon(Landroid/webkit/HTML5VideoViewProxy;)V

    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    invoke-virtual {v0}, Landroid/webkit/HTML5VideoViewProxy;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "android.permission.WAKE_LOCK"

    invoke-virtual {v0, v1}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    invoke-virtual {v1}, Landroid/webkit/HTML5VideoViewProxy;->getContext()Landroid/content/Context;

    move-result-object v1

    const/16 v2, 0x1a

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaPlayer;->setWakeMode(Landroid/content/Context;I)V

    :cond_0
    invoke-direct {p0}, Landroid/webkit/HTML5VideoView;->isFullscreen()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Landroid/webkit/HTML5VideoFullscreen;->instance()Landroid/webkit/HTML5VideoFullscreen;

    move-result-object v0

    iget-object v1, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/webkit/HTML5VideoFullscreen;->switchProgressView(Landroid/webkit/HTML5VideoViewProxy;Z)V

    :cond_1
    :goto_0
    return-void

    :cond_2
    iget v0, p0, Landroid/webkit/HTML5VideoView;->mSurfaceTextureState:I

    if-nez v0, :cond_1

    invoke-direct {p0, p0}, Landroid/webkit/HTML5VideoView;->setInlineFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    goto :goto_0
.end method

.method public release()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    iget v0, p0, Landroid/webkit/HTML5VideoView;->mCurrentState:I

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Landroid/webkit/HTML5VideoView;->stopPlayback()V

    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    invoke-direct {p0}, Landroid/webkit/HTML5VideoView;->isFullscreen()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Landroid/webkit/HTML5VideoFullscreen;->instance()Landroid/webkit/HTML5VideoFullscreen;

    move-result-object v0

    iget-object v1, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    invoke-virtual {v0, v1}, Landroid/webkit/HTML5VideoFullscreen;->clearSurfaceTexture(Landroid/webkit/HTML5VideoViewProxy;)V

    :cond_0
    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    iput-object v2, p0, Landroid/webkit/HTML5VideoView;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    iput-object v2, p0, Landroid/webkit/HTML5VideoView;->mTextureNames:[I

    :cond_1
    const/4 v0, 0x0

    iput v0, p0, Landroid/webkit/HTML5VideoView;->mCurrentState:I

    return-void
.end method

.method public retrieveMetadata(Landroid/webkit/HTML5VideoViewProxy;)V
    .locals 5
    .parameter "proxy"

    .prologue
    new-instance v1, Landroid/media/MediaMetadataRetriever;

    invoke-direct {v1}, Landroid/media/MediaMetadataRetriever;-><init>()V

    .local v1, retriever:Landroid/media/MediaMetadataRetriever;
    :try_start_0
    iget-object v2, p0, Landroid/webkit/HTML5VideoView;->mUri:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Landroid/webkit/HTML5VideoView;->mHeaders:Ljava/util/Map;

    invoke-virtual {v1, v2, v3}, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;Ljava/util/Map;)V

    const/16 v2, 0x12

    invoke-virtual {v1, v2}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Landroid/webkit/HTML5VideoView;->mVideoWidth:I

    const/16 v2, 0x13

    invoke-virtual {v1, v2}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Landroid/webkit/HTML5VideoView;->mVideoHeight:I

    const/16 v2, 0x9

    invoke-virtual {v1, v2}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Landroid/webkit/HTML5VideoView;->mDuration:I

    iget v2, p0, Landroid/webkit/HTML5VideoView;->mVideoWidth:I

    iget v3, p0, Landroid/webkit/HTML5VideoView;->mVideoHeight:I

    iget v4, p0, Landroid/webkit/HTML5VideoView;->mDuration:I

    invoke-virtual {p1, v2, v3, v4}, Landroid/webkit/HTML5VideoViewProxy;->updateSizeAndDuration(III)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    invoke-virtual {v1}, Landroid/media/MediaMetadataRetriever;->release()V

    :goto_0
    return-void

    :catch_0
    move-exception v0

    .local v0, e:Ljava/lang/IllegalArgumentException;
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-virtual {v1}, Landroid/media/MediaMetadataRetriever;->release()V

    goto :goto_0

    .end local v0           #e:Ljava/lang/IllegalArgumentException;
    :catch_1
    move-exception v2

    invoke-virtual {v1}, Landroid/media/MediaMetadataRetriever;->release()V

    goto :goto_0

    :catchall_0
    move-exception v2

    invoke-virtual {v1}, Landroid/media/MediaMetadataRetriever;->release()V

    throw v2
.end method

.method public seekTo(I)V
    .locals 2
    .parameter "pos"

    .prologue
    iget v0, p0, Landroid/webkit/HTML5VideoView;->mCurrentState:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->seekTo(I)V

    :goto_0
    return-void

    :cond_0
    iput p1, p0, Landroid/webkit/HTML5VideoView;->mSaveSeekTime:I

    goto :goto_0
.end method

.method public setOnCompletionListener(Landroid/webkit/HTML5VideoViewProxy;)V
    .locals 1
    .parameter "proxy"

    .prologue
    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    return-void
.end method

.method public setPlayerBuffering(Z)V
    .locals 2
    .parameter "playerBuffering"

    .prologue
    iput-boolean p1, p0, Landroid/webkit/HTML5VideoView;->mPlayerBuffering:Z

    invoke-direct {p0}, Landroid/webkit/HTML5VideoView;->isFullscreen()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Landroid/webkit/HTML5VideoFullscreen;->instance()Landroid/webkit/HTML5VideoFullscreen;

    move-result-object v0

    iget-object v1, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    invoke-virtual {v0, v1, p1}, Landroid/webkit/HTML5VideoFullscreen;->switchProgressView(Landroid/webkit/HTML5VideoViewProxy;Z)V

    :cond_0
    return-void
.end method

.method public setStartWhenPrepared(Z)V
    .locals 0
    .parameter "willPlay"

    .prologue
    iput-boolean p1, p0, Landroid/webkit/HTML5VideoView;->mStartWhenPrepared:Z

    return-void
.end method

.method public setVideoURI(Ljava/lang/String;)V
    .locals 1
    .parameter "uri"

    .prologue
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Landroid/webkit/HTML5VideoView;->mUri:Landroid/net/Uri;

    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    invoke-static {p1, v0}, Landroid/webkit/HTML5VideoView;->generateHeaders(Ljava/lang/String;Landroid/webkit/HTML5VideoViewProxy;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Landroid/webkit/HTML5VideoView;->mHeaders:Ljava/util/Map;

    return-void
.end method

.method public setVolume(F)V
    .locals 1
    .parameter "volume"

    .prologue
    iget v0, p0, Landroid/webkit/HTML5VideoView;->mCurrentState:I

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1, p1}, Landroid/media/MediaPlayer;->setVolume(FF)V

    :cond_0
    return-void
.end method

.method public start()V
    .locals 7

    .prologue
    const-wide/16 v2, 0xfa

    const/4 v6, 0x0

    iget v0, p0, Landroid/webkit/HTML5VideoView;->mCurrentState:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_2

    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mTimer:Ljava/util/Timer;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Landroid/webkit/HTML5VideoView;->mTimer:Ljava/util/Timer;

    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mTimer:Ljava/util/Timer;

    new-instance v1, Landroid/webkit/HTML5VideoView$TimeupdateTask;

    iget-object v4, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    invoke-direct {v1, p0, v4}, Landroid/webkit/HTML5VideoView$TimeupdateTask;-><init>(Landroid/webkit/HTML5VideoView;Landroid/webkit/HTML5VideoViewProxy;)V

    move-wide v4, v2

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    :cond_0
    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    invoke-virtual {v0}, Landroid/webkit/HTML5VideoViewProxy;->dispatchOnPlaying()V

    invoke-direct {p0}, Landroid/webkit/HTML5VideoView;->isFullscreen()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Landroid/webkit/HTML5VideoFullscreen;->instance()Landroid/webkit/HTML5VideoFullscreen;

    move-result-object v0

    iget-object v1, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    invoke-virtual {v0, v1, v6}, Landroid/webkit/HTML5VideoFullscreen;->switchProgressView(Landroid/webkit/HTML5VideoViewProxy;Z)V

    invoke-static {}, Landroid/webkit/HTML5VideoFullscreen;->instance()Landroid/webkit/HTML5VideoFullscreen;

    move-result-object v0

    iget-object v1, p0, Landroid/webkit/HTML5VideoView;->mProxy:Landroid/webkit/HTML5VideoViewProxy;

    invoke-virtual {v0, v1, v6}, Landroid/webkit/HTML5VideoFullscreen;->showMediaControls(Landroid/webkit/HTML5VideoViewProxy;Z)V

    :cond_1
    :goto_0
    return-void

    :cond_2
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/webkit/HTML5VideoView;->setStartWhenPrepared(Z)V

    goto :goto_0
.end method

.method public stopPlayback()V
    .locals 2

    .prologue
    iget v0, p0, Landroid/webkit/HTML5VideoView;->mCurrentState:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Landroid/webkit/HTML5VideoView;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    :cond_0
    return-void
.end method
