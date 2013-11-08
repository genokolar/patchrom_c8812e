.class public Lcom/android/internal/policy/impl/MSimSimUnlockScreen;
.super Lcom/android/internal/policy/impl/SimUnlockScreen;
.source "MSimSimUnlockScreen.java"

# interfaces
.implements Lcom/android/internal/policy/impl/KeyguardScreen;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/policy/impl/MSimSimUnlockScreen$MSimTouchInput;,
        Lcom/android/internal/policy/impl/MSimSimUnlockScreen$CheckSimPin;
    }
.end annotation


# static fields
.field private static final DBG:Z = false

.field private static final PIN_INPUT:I = 0x1

.field private static final TAG:Ljava/lang/String; = "SIM_PIN"


# instance fields
.field private mSubscription:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/content/res/Configuration;Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;Lcom/android/internal/policy/impl/KeyguardScreenCallback;Lcom/android/internal/widget/LockPatternUtils;I)V
    .locals 7
    .parameter "context"
    .parameter "configuration"
    .parameter "updateMonitor"
    .parameter "callback"
    .parameter "lockpatternutils"
    .parameter "subscription"

    .prologue
    const/4 v5, 0x1

    invoke-direct/range {p0 .. p5}, Lcom/android/internal/policy/impl/SimUnlockScreen;-><init>(Landroid/content/Context;Landroid/content/res/Configuration;Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;Lcom/android/internal/policy/impl/KeyguardScreenCallback;Lcom/android/internal/widget/LockPatternUtils;)V

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->mSubscription:I

    invoke-virtual {p0, p1}, Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->layoutType(Landroid/content/Context;)V

    iput p6, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->mSubscription:I

    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/telephony/MSimTelephonyManager;->isMultiSimEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x104052b

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->mSubscription:I

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->mSubscription:I

    invoke-direct {p0, v5, v1}, Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->getPinRetries(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .local v6, displayText:Ljava/lang/String;
    iget-object v0, p0, Lcom/android/internal/policy/impl/SimUnlockScreen;->mHeaderText:Landroid/widget/TextView;

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .end local v6           #displayText:Ljava/lang/String;
    :goto_0
    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/telephony/MSimTelephonyManager;->isMultiSimEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;

    move-object v1, p0

    move-object v2, p3

    move-object v3, p5

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;-><init>(Landroid/view/View;Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;Lcom/android/internal/widget/LockPatternUtils;Lcom/android/internal/policy/impl/KeyguardScreenCallback;Z)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/SimUnlockScreen;->mKeyguardStatusViewManager:Lcom/android/internal/policy/impl/KeyguardStatusViewManager;

    :goto_1
    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/SimUnlockScreen;->mHeaderText:Landroid/widget/TextView;

    const v1, 0x10402ec

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    :cond_1
    new-instance v0, Lcom/android/internal/policy/impl/KeyguardStatusViewManager;

    move-object v1, p0

    move-object v2, p3

    move-object v3, p5

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/KeyguardStatusViewManager;-><init>(Landroid/view/View;Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;Lcom/android/internal/widget/LockPatternUtils;Lcom/android/internal/policy/impl/KeyguardScreenCallback;Z)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/SimUnlockScreen;->mKeyguardStatusViewManager:Lcom/android/internal/policy/impl/KeyguardStatusViewManager;

    goto :goto_1
.end method

.method static synthetic access$100(Lcom/android/internal/policy/impl/MSimSimUnlockScreen;)I
    .locals 1
    .parameter "x0"

    .prologue
    iget v0, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->mSubscription:I

    return v0
.end method

.method static synthetic access$200(Lcom/android/internal/policy/impl/MSimSimUnlockScreen;II)Ljava/lang/String;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->getPinRetries(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getPinRetries(II)Ljava/lang/String;
    .locals 3
    .parameter "pin"
    .parameter "subscription"

    .prologue
    const-string v0, ""

    .local v0, strPinRetryNum:Ljava/lang/String;
    packed-switch p1, :pswitch_data_0

    const-string v1, "SIM_PIN"

    const-string v2, "getPinRetries(): input error!"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, -0x1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_0
    const-string v0, ""

    :goto_1
    return-object v0

    :pswitch_0
    if-nez p2, :cond_1

    const-string v1, "gsm.slot1.num.pin1"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    const-string v1, "gsm.slot2.num.pin1"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method protected checkPin()V
    .locals 2

    .prologue
    iget v0, p0, Lcom/android/internal/policy/impl/SimUnlockScreen;->mEnteredDigits:I

    const/4 v1, 0x4

    if-ge v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/internal/policy/impl/SimUnlockScreen;->mHeaderText:Landroid/widget/TextView;

    const v1, 0x10400d2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/SimUnlockScreen;->mPinText:Landroid/widget/TextView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/internal/policy/impl/SimUnlockScreen;->mEnteredDigits:I

    iget-object v0, p0, Lcom/android/internal/policy/impl/SimUnlockScreen;->mCallback:Lcom/android/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v0}, Lcom/android/internal/policy/impl/KeyguardScreenCallback;->pokeWakelock()V

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->getSimUnlockProgressDialog()Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    new-instance v0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;

    iget-object v1, p0, Lcom/android/internal/policy/impl/SimUnlockScreen;->mPinText:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;-><init>(Lcom/android/internal/policy/impl/MSimSimUnlockScreen;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;->start()V

    goto :goto_0
.end method

.method protected layoutType(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    const/4 v2, 0x1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .local v0, inflater:Landroid/view/LayoutInflater;
    iget v1, p0, Lcom/android/internal/policy/impl/SimUnlockScreen;->mKeyboardHidden:I

    if-ne v1, v2, :cond_0

    const v1, 0x1090052

    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    :goto_0
    return-void

    :cond_0
    const v1, 0x1090053

    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    new-instance v1, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$MSimTouchInput;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$MSimTouchInput;-><init>(Lcom/android/internal/policy/impl/MSimSimUnlockScreen;Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;)V

    goto :goto_0
.end method

.method public onResume()V
    .locals 4

    .prologue
    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/telephony/MSimTelephonyManager;->isMultiSimEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x104052b

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->mSubscription:I

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x1

    iget v3, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->mSubscription:I

    invoke-direct {p0, v2, v3}, Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->getPinRetries(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .local v0, displayText:Ljava/lang/String;
    iget-object v1, p0, Lcom/android/internal/policy/impl/SimUnlockScreen;->mHeaderText:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .end local v0           #displayText:Ljava/lang/String;
    :goto_0
    iget-object v1, p0, Lcom/android/internal/policy/impl/SimUnlockScreen;->mPinText:Landroid/widget/TextView;

    const-string v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v1, 0x0

    iput v1, p0, Lcom/android/internal/policy/impl/SimUnlockScreen;->mEnteredDigits:I

    iget-object v1, p0, Lcom/android/internal/policy/impl/SimUnlockScreen;->mKeyguardStatusViewManager:Lcom/android/internal/policy/impl/KeyguardStatusViewManager;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/KeyguardStatusViewManager;->onResume()V

    return-void

    :cond_0
    iget-object v1, p0, Lcom/android/internal/policy/impl/SimUnlockScreen;->mHeaderText:Landroid/widget/TextView;

    const v2, 0x10402ec

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0
.end method

.method protected setUnlockProgressDialogMessage()V
    .locals 5

    .prologue
    iget-object v2, p0, Lcom/android/internal/policy/impl/SimUnlockScreen;->mSimUnlockProgressDialog:Landroid/app/ProgressDialog;

    if-eqz v2, :cond_0

    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v2

    iget v3, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->mSubscription:I

    invoke-virtual {v2, v3}, Landroid/telephony/MSimTelephonyManager;->getCurrentPhoneType(I)I

    move-result v0

    .local v0, activePhoneType:I
    const/4 v2, 0x2

    if-ne v2, v0, :cond_1

    const/4 v1, 0x1

    .local v1, isCdma:Z
    :goto_0
    iget-object v2, p0, Lcom/android/internal/policy/impl/SimUnlockScreen;->mSimUnlockProgressDialog:Landroid/app/ProgressDialog;

    iget-object v3, p0, Lcom/android/internal/policy/impl/SimUnlockScreen;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v1}, Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->getMessageByPhoneType(Z)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .end local v0           #activePhoneType:I
    .end local v1           #isCdma:Z
    :cond_0
    return-void

    .restart local v0       #activePhoneType:I
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method
