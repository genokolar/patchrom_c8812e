.class Lcom/android/internal/telephony/HWGlobalMode$1;
.super Landroid/content/BroadcastReceiver;
.source "HWGlobalMode.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/HWGlobalMode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/telephony/HWGlobalMode;


# direct methods
.method constructor <init>(Lcom/android/internal/telephony/HWGlobalMode;)V
    .locals 0
    .parameter

    .prologue
    iput-object p1, p0, Lcom/android/internal/telephony/HWGlobalMode$1;->this$0:Lcom/android/internal/telephony/HWGlobalMode;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .parameter "context"
    .parameter "intent"

    .prologue
    const-string v0, "android.intent.action.START_SEC_NET_SEL"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/HWGlobalMode$1;->this$0:Lcom/android/internal/telephony/HWGlobalMode;

    #getter for: Lcom/android/internal/telephony/HWGlobalMode;->LOG_TAG:Ljava/lang/String;
    invoke-static {v0}, Lcom/android/internal/telephony/HWGlobalMode;->access$000(Lcom/android/internal/telephony/HWGlobalMode;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "receive broadcast ACTION_START_SEC_NET_SEL"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/internal/telephony/HWGlobalMode$1;->this$0:Lcom/android/internal/telephony/HWGlobalMode;

    #calls: Lcom/android/internal/telephony/HWGlobalMode;->process2ndSelNetwork()V
    invoke-static {v0}, Lcom/android/internal/telephony/HWGlobalMode;->access$100(Lcom/android/internal/telephony/HWGlobalMode;)V

    :cond_0
    return-void
.end method
