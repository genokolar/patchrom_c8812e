.class Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper$1;
.super Landroid/content/BroadcastReceiver;
.source "PhoneProxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;-><init>(Lcom/android/internal/telephony/PhoneProxy;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;

.field final synthetic val$this$0:Lcom/android/internal/telephony/PhoneProxy;


# direct methods
.method constructor <init>(Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;Lcom/android/internal/telephony/PhoneProxy;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    iput-object p1, p0, Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper$1;->this$1:Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;

    iput-object p2, p0, Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper$1;->val$this$0:Lcom/android/internal/telephony/PhoneProxy;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .parameter "context"
    .parameter "intent"

    .prologue
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    const-string v4, "android.intent.action.ACTION_CHECK_PRE_POST_PAY"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    const-string v3, "currentMccmnc"

    invoke-virtual {p2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .local v2, mccmnc:Ljava/lang/String;
    const-string v3, "currentImsi"

    invoke-virtual {p2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .local v1, imsi:Ljava/lang/String;
    iget-object v3, p0, Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper$1;->this$1:Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;

    #getter for: Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;->simUtils:Lcom/android/internal/telephony/SIMUtils;
    invoke-static {v3}, Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;->access$000(Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;)Lcom/android/internal/telephony/SIMUtils;

    move-result-object v3

    iget-object v4, p0, Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper$1;->this$1:Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;

    iget-object v4, v4, Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;->this$0:Lcom/android/internal/telephony/PhoneProxy;

    invoke-virtual {v4}, Lcom/android/internal/telephony/PhoneProxy;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v3, v2, v1, v4}, Lcom/android/internal/telephony/SIMUtils;->checkPrePostPay(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .end local v1           #imsi:Ljava/lang/String;
    .end local v2           #mccmnc:Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    const-string v4, "android.intent.action.ACTION_CHECK_GLOBAL_ECC_NUM_PARAM"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const-string v3, "currentMccmnc"

    invoke-virtual {p2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .restart local v2       #mccmnc:Ljava/lang/String;
    iget-object v3, p0, Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper$1;->this$1:Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;

    #getter for: Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;->simUtils:Lcom/android/internal/telephony/SIMUtils;
    invoke-static {v3}, Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;->access$000(Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;)Lcom/android/internal/telephony/SIMUtils;

    move-result-object v3

    iget-object v4, p0, Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper$1;->this$1:Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;

    iget-object v4, v4, Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;->this$0:Lcom/android/internal/telephony/PhoneProxy;

    invoke-virtual {v4}, Lcom/android/internal/telephony/PhoneProxy;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Lcom/android/internal/telephony/SIMUtils;->checkGlobalEccNum(Ljava/lang/String;Landroid/content/Context;)V

    goto :goto_0

    .end local v2           #mccmnc:Ljava/lang/String;
    :cond_2
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    const-string v4, "android.intent.action.ACTION_CHECK_GLOBAL_AUTO_MATCH_PARAM"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    const-string v3, "currentImsi"

    invoke-virtual {p2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .local v0, currentImsi:Ljava/lang/String;
    iget-object v3, p0, Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper$1;->this$1:Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;

    #getter for: Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;->simUtils:Lcom/android/internal/telephony/SIMUtils;
    invoke-static {v3}, Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;->access$000(Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;)Lcom/android/internal/telephony/SIMUtils;

    move-result-object v3

    iget-object v4, p0, Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper$1;->this$1:Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;

    iget-object v4, v4, Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;->this$0:Lcom/android/internal/telephony/PhoneProxy;

    invoke-virtual {v4}, Lcom/android/internal/telephony/PhoneProxy;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v3, v0, v4}, Lcom/android/internal/telephony/SIMUtils;->checkGlobalAutoMatchParam(Ljava/lang/String;Landroid/content/Context;)V

    goto :goto_0

    .end local v0           #currentImsi:Ljava/lang/String;
    :cond_3
    const-string v3, "android.intent.action.SIM_STATE_CHANGED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper$1;->this$1:Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;

    iget-object v3, v3, Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;->this$0:Lcom/android/internal/telephony/PhoneProxy;

    iget-object v3, v3, Lcom/android/internal/telephony/PhoneProxy;->mActivePhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v3}, Lcom/android/internal/telephony/Phone;->getSubscription()I

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper$1;->this$1:Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;

    iget-object v3, v3, Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;->this$0:Lcom/android/internal/telephony/PhoneProxy;

    iget-boolean v3, v3, Lcom/android/internal/telephony/PhoneProxy;->IS_CHINA_TELECOM:Z

    if-eqz v3, :cond_0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ACTION_SIM_STATE_CHANGED received by sub "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper$1;->this$1:Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;

    iget-object v4, v4, Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;->this$0:Lcom/android/internal/telephony/PhoneProxy;

    iget-object v4, v4, Lcom/android/internal/telephony/PhoneProxy;->mActivePhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getSubscription()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/android/internal/telephony/PhoneProxy;->logd(Ljava/lang/String;)V
    invoke-static {v3}, Lcom/android/internal/telephony/PhoneProxy;->access$100(Ljava/lang/String;)V

    const-string v3, "ss"

    invoke-virtual {p2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "READY"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ICC card ready, request the new voice technology for sub "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper$1;->this$1:Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;

    iget-object v4, v4, Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;->this$0:Lcom/android/internal/telephony/PhoneProxy;

    iget-object v4, v4, Lcom/android/internal/telephony/PhoneProxy;->mActivePhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getSubscription()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/android/internal/telephony/PhoneProxy;->logd(Ljava/lang/String;)V
    invoke-static {v3}, Lcom/android/internal/telephony/PhoneProxy;->access$100(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper$1;->this$1:Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;

    iget-object v3, v3, Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;->this$0:Lcom/android/internal/telephony/PhoneProxy;

    iget-object v3, v3, Lcom/android/internal/telephony/PhoneProxy;->mCommandsInterface:Lcom/android/internal/telephony/CommandsInterface;

    iget-object v4, p0, Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper$1;->this$1:Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;

    iget-object v4, v4, Lcom/android/internal/telephony/PhoneProxy$BroadcastHelper;->this$0:Lcom/android/internal/telephony/PhoneProxy;

    const/4 v5, 0x3

    invoke-virtual {v4, v5}, Lcom/android/internal/telephony/PhoneProxy;->obtainMessage(I)Landroid/os/Message;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/android/internal/telephony/CommandsInterface;->getVoiceRadioTechnology(Landroid/os/Message;)V

    goto/16 :goto_0
.end method
