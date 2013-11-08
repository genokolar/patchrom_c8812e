.class Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1$1;
.super Ljava/lang/Object;
.source "MSimSimUnlockScreen.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;->onSimLockChangedResponse(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;

.field final synthetic val$result:I


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    iput-object p1, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;

    iput p2, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1$1;->val$result:I

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .prologue
    const v14, 0x10402f3

    const/4 v13, 0x0

    const/4 v12, 0x1

    iget-object v7, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;

    iget-object v7, v7, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/MSimSimUnlockScreen;

    iget-object v7, v7, Lcom/android/internal/policy/impl/SimUnlockScreen;->mSimUnlockProgressDialog:Landroid/app/ProgressDialog;

    if-eqz v7, :cond_0

    iget-object v7, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;

    iget-object v7, v7, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/MSimSimUnlockScreen;

    iget-object v7, v7, Lcom/android/internal/policy/impl/SimUnlockScreen;->mSimUnlockProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v7}, Landroid/app/ProgressDialog;->hide()V

    :cond_0
    iget v7, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1$1;->val$result:I

    if-nez v7, :cond_1

    iget-object v7, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;

    iget-object v7, v7, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/MSimSimUnlockScreen;

    iget-object v7, v7, Lcom/android/internal/policy/impl/SimUnlockScreen;->mContext:Landroid/content/Context;

    invoke-static {v7}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    .local v3, inflater:Landroid/view/LayoutInflater;
    const v8, 0x10900bf

    iget-object v7, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;

    iget-object v7, v7, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/MSimSimUnlockScreen;

    const v9, 0x1020377

    invoke-virtual {v7, v9}, Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/view/ViewGroup;

    invoke-virtual {v3, v8, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    .local v4, layout:Landroid/view/View;
    const v7, 0x102000b

    invoke-virtual {v4, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .local v5, text:Landroid/widget/TextView;
    const v7, 0x1040530

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setText(I)V

    new-instance v6, Landroid/widget/Toast;

    iget-object v7, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;

    iget-object v7, v7, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/MSimSimUnlockScreen;

    iget-object v7, v7, Lcom/android/internal/policy/impl/SimUnlockScreen;->mContext:Landroid/content/Context;

    invoke-direct {v6, v7}, Landroid/widget/Toast;-><init>(Landroid/content/Context;)V

    .local v6, toast:Landroid/widget/Toast;
    invoke-virtual {v6, v12}, Landroid/widget/Toast;->setDuration(I)V

    const/16 v7, 0x10

    invoke-virtual {v6, v7, v13, v13}, Landroid/widget/Toast;->setGravity(III)V

    invoke-virtual {v6, v4}, Landroid/widget/Toast;->setView(Landroid/view/View;)V

    invoke-virtual {v6}, Landroid/widget/Toast;->show()V

    iget-object v7, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;

    iget-object v7, v7, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/MSimSimUnlockScreen;

    iget-object v7, v7, Lcom/android/internal/policy/impl/SimUnlockScreen;->mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

    iget-object v8, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;

    iget-object v8, v8, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/MSimSimUnlockScreen;

    #getter for: Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->mSubscription:I
    invoke-static {v8}, Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->access$100(Lcom/android/internal/policy/impl/MSimSimUnlockScreen;)I

    move-result v8

    invoke-virtual {v7, v8}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->reportSimUnlocked(I)V

    iget-object v7, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;

    iget-object v7, v7, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/MSimSimUnlockScreen;

    iget-object v7, v7, Lcom/android/internal/policy/impl/SimUnlockScreen;->mCallback:Lcom/android/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v7}, Lcom/android/internal/policy/impl/KeyguardScreenCallback;->goToUnlockScreen()V

    .end local v3           #inflater:Landroid/view/LayoutInflater;
    .end local v4           #layout:Landroid/view/View;
    .end local v5           #text:Landroid/widget/TextView;
    .end local v6           #toast:Landroid/widget/Toast;
    :goto_0
    iget-object v7, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;

    iget-object v7, v7, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/MSimSimUnlockScreen;

    iget-object v7, v7, Lcom/android/internal/policy/impl/SimUnlockScreen;->mCallback:Lcom/android/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v7}, Lcom/android/internal/policy/impl/KeyguardScreenCallback;->pokeWakelock()V

    return-void

    :cond_1
    iget v7, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1$1;->val$result:I

    if-ne v7, v12, :cond_3

    :try_start_0
    const-string v7, "phone_msim"

    invoke-static {v7}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v7

    invoke-static {v7}, Lcom/android/internal/telephony/msim/ITelephonyMSim$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/msim/ITelephonyMSim;

    move-result-object v7

    iget-object v8, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;

    iget-object v8, v8, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/MSimSimUnlockScreen;

    #getter for: Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->mSubscription:I
    invoke-static {v8}, Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->access$100(Lcom/android/internal/policy/impl/MSimSimUnlockScreen;)I

    move-result v8

    invoke-interface {v7, v8}, Lcom/android/internal/telephony/msim/ITelephonyMSim;->getIccPin1RetryCount(I)I

    move-result v0

    .local v0, attemptsRemaining:I
    if-ltz v0, :cond_2

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;

    iget-object v8, v8, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/MSimSimUnlockScreen;

    invoke-virtual {v8}, Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->getContext()Landroid/content/Context;

    move-result-object v8

    const v9, 0x10402f3

    invoke-virtual {v8, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;

    iget-object v8, v8, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/MSimSimUnlockScreen;

    invoke-virtual {v8}, Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->getContext()Landroid/content/Context;

    move-result-object v8

    const v9, 0x104052a

    invoke-virtual {v8, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .local v1, displayMessage:Ljava/lang/String;
    iget-object v7, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;

    iget-object v7, v7, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/MSimSimUnlockScreen;

    iget-object v7, v7, Lcom/android/internal/policy/impl/SimUnlockScreen;->mHeaderText:Landroid/widget/TextView;

    invoke-virtual {v7, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v0           #attemptsRemaining:I
    .end local v1           #displayMessage:Ljava/lang/String;
    :goto_1
    iget-object v7, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;

    iget-object v7, v7, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/MSimSimUnlockScreen;

    iget-object v7, v7, Lcom/android/internal/policy/impl/SimUnlockScreen;->mPinText:Landroid/widget/TextView;

    const-string v8, ""

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v7, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;

    iget-object v7, v7, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/MSimSimUnlockScreen;

    iput v13, v7, Lcom/android/internal/policy/impl/SimUnlockScreen;->mEnteredDigits:I

    goto :goto_0

    .restart local v0       #attemptsRemaining:I
    :cond_2
    :try_start_1
    iget-object v7, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;

    iget-object v7, v7, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/MSimSimUnlockScreen;

    iget-object v7, v7, Lcom/android/internal/policy/impl/SimUnlockScreen;->mHeaderText:Landroid/widget/TextView;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;

    iget-object v9, v9, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/MSimSimUnlockScreen;

    invoke-virtual {v9}, Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->getContext()Landroid/content/Context;

    move-result-object v9

    const v10, 0x10402f3

    invoke-virtual {v9, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;

    iget-object v9, v9, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/MSimSimUnlockScreen;

    const/4 v10, 0x1

    iget-object v11, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;

    iget-object v11, v11, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/MSimSimUnlockScreen;

    #getter for: Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->mSubscription:I
    invoke-static {v11}, Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->access$100(Lcom/android/internal/policy/impl/MSimSimUnlockScreen;)I

    move-result v11

    #calls: Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->getPinRetries(II)Ljava/lang/String;
    invoke-static {v9, v10, v11}, Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->access$200(Lcom/android/internal/policy/impl/MSimSimUnlockScreen;II)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .end local v0           #attemptsRemaining:I
    :catch_0
    move-exception v2

    .local v2, ex:Landroid/os/RemoteException;
    iget-object v7, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;

    iget-object v7, v7, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/MSimSimUnlockScreen;

    iget-object v7, v7, Lcom/android/internal/policy/impl/SimUnlockScreen;->mHeaderText:Landroid/widget/TextView;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;

    iget-object v9, v9, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/MSimSimUnlockScreen;

    invoke-virtual {v9}, Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v9, v14}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;

    iget-object v9, v9, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/MSimSimUnlockScreen;

    iget-object v10, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;

    iget-object v10, v10, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/MSimSimUnlockScreen;

    #getter for: Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->mSubscription:I
    invoke-static {v10}, Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->access$100(Lcom/android/internal/policy/impl/MSimSimUnlockScreen;)I

    move-result v10

    #calls: Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->getPinRetries(II)Ljava/lang/String;
    invoke-static {v9, v12, v10}, Lcom/android/internal/policy/impl/MSimSimUnlockScreen;->access$200(Lcom/android/internal/policy/impl/MSimSimUnlockScreen;II)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .end local v2           #ex:Landroid/os/RemoteException;
    :cond_3
    iget-object v7, p0, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;

    iget-object v7, v7, Lcom/android/internal/policy/impl/MSimSimUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/MSimSimUnlockScreen;

    iget-object v7, v7, Lcom/android/internal/policy/impl/SimUnlockScreen;->mHeaderText:Landroid/widget/TextView;

    const v8, 0x104052e

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(I)V

    goto/16 :goto_1
.end method
