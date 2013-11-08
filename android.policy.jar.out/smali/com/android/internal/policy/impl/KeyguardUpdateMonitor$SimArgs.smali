.class public Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimArgs;
.super Ljava/lang/Object;
.source "KeyguardUpdateMonitor.java"


# annotations
.annotation build Landroid/annotation/MiuiHook;
    value = .enum Landroid/annotation/MiuiHook$MiuiHookType;->CHANGE_CODE:Landroid/annotation/MiuiHook$MiuiHookType;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SimArgs"
.end annotation


# instance fields
.field public mRequirelock:Z

.field public mSubscription:I

.field public final simState:Lcom/android/internal/telephony/IccCard$State;


# direct methods
.method constructor <init>(Lcom/android/internal/telephony/IccCard$State;)V
    .locals 1
    .parameter "state"

    .prologue
    const/4 v0, 0x0

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    iput v0, p0, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimArgs;->mSubscription:I

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimArgs;->mRequirelock:Z

    iput-object p1, p0, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimArgs;->simState:Lcom/android/internal/telephony/IccCard$State;

    return-void
.end method

.method constructor <init>(Lcom/android/internal/telephony/IccCard$State;I)V
    .locals 1
    .parameter "state"
    .parameter "subscription"

    .prologue
    const/4 v0, 0x0

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    iput v0, p0, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimArgs;->mSubscription:I

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimArgs;->mRequirelock:Z

    iput-object p1, p0, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimArgs;->simState:Lcom/android/internal/telephony/IccCard$State;

    iput p2, p0, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimArgs;->mSubscription:I

    return-void
.end method

.method constructor <init>(Lcom/android/internal/telephony/IccCard$State;IZ)V
    .locals 1
    .parameter "state"
    .parameter "subscription"
    .parameter "requirelock"

    .prologue
    const/4 v0, 0x0

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    iput v0, p0, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimArgs;->mSubscription:I

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimArgs;->mRequirelock:Z

    iput-object p1, p0, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimArgs;->simState:Lcom/android/internal/telephony/IccCard$State;

    iput p2, p0, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimArgs;->mSubscription:I

    iput-boolean p3, p0, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimArgs;->mRequirelock:Z

    return-void
.end method

.method static fromIntent(Landroid/content/Intent;)Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimArgs;
    .locals 9
    .parameter "intent"

    .prologue
    const/4 v2, 0x0

    .local v2, requirelock:Z
    const-string v6, "android.intent.action.SIM_STATE_CHANGED"

    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "only handles intent ACTION_SIM_STATE_CHANGED"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    :cond_0
    const-string v6, "subscription"

    const/4 v7, 0x0

    invoke-virtual {p0, v6, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    .local v5, subscription:I
    const-string v6, "KeyguardUpdateMonitor"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "ACTION_SIM_STATE_CHANGED intent received on sub = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v6, "ss"

    invoke-virtual {p0, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .local v4, stateExtra:Ljava/lang/String;
    const-string v6, "ABSENT"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    const-string v6, "reason"

    invoke-virtual {p0, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .local v0, absentReason:Ljava/lang/String;
    const-string v6, "PERM_DISABLED"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    sget-object v3, Lcom/android/internal/telephony/IccCard$State;->PERM_DISABLED:Lcom/android/internal/telephony/IccCard$State;

    .end local v0           #absentReason:Ljava/lang/String;
    .local v3, state:Lcom/android/internal/telephony/IccCard$State;
    :goto_0
    new-instance v6, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimArgs;

    invoke-direct {v6, v3, v5, v2}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimArgs;-><init>(Lcom/android/internal/telephony/IccCard$State;IZ)V

    return-object v6

    .end local v3           #state:Lcom/android/internal/telephony/IccCard$State;
    .restart local v0       #absentReason:Ljava/lang/String;
    :cond_1
    sget-object v3, Lcom/android/internal/telephony/IccCard$State;->ABSENT:Lcom/android/internal/telephony/IccCard$State;

    .restart local v3       #state:Lcom/android/internal/telephony/IccCard$State;
    goto :goto_0

    .end local v0           #absentReason:Ljava/lang/String;
    .end local v3           #state:Lcom/android/internal/telephony/IccCard$State;
    :cond_2
    const-string v6, "READY"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    sget-object v3, Lcom/android/internal/telephony/IccCard$State;->READY:Lcom/android/internal/telephony/IccCard$State;

    .restart local v3       #state:Lcom/android/internal/telephony/IccCard$State;
    goto :goto_0

    .end local v3           #state:Lcom/android/internal/telephony/IccCard$State;
    :cond_3
    const-string v6, "REQUIRE_LOCKED"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    const/4 v2, 0x1

    sget-object v3, Lcom/android/internal/telephony/IccCard$State;->PUK_REQUIRED:Lcom/android/internal/telephony/IccCard$State;

    .restart local v3       #state:Lcom/android/internal/telephony/IccCard$State;
    goto :goto_0

    .end local v3           #state:Lcom/android/internal/telephony/IccCard$State;
    :cond_4
    const-string v6, "LOCKED"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8

    const-string v6, "reason"

    invoke-virtual {p0, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .local v1, lockedReason:Ljava/lang/String;
    const-string v6, "PIN"

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    sget-object v3, Lcom/android/internal/telephony/IccCard$State;->PIN_REQUIRED:Lcom/android/internal/telephony/IccCard$State;

    .restart local v3       #state:Lcom/android/internal/telephony/IccCard$State;
    goto :goto_0

    .end local v3           #state:Lcom/android/internal/telephony/IccCard$State;
    :cond_5
    const-string v6, "PUK"

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    sget-object v3, Lcom/android/internal/telephony/IccCard$State;->PUK_REQUIRED:Lcom/android/internal/telephony/IccCard$State;

    .restart local v3       #state:Lcom/android/internal/telephony/IccCard$State;
    goto :goto_0

    .end local v3           #state:Lcom/android/internal/telephony/IccCard$State;
    :cond_6
    const-string v6, "PERSO"

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7

    sget-object v3, Lcom/android/internal/telephony/IccCard$State;->PERSO_LOCKED:Lcom/android/internal/telephony/IccCard$State;

    .restart local v3       #state:Lcom/android/internal/telephony/IccCard$State;
    goto :goto_0

    .end local v3           #state:Lcom/android/internal/telephony/IccCard$State;
    :cond_7
    sget-object v3, Lcom/android/internal/telephony/IccCard$State;->UNKNOWN:Lcom/android/internal/telephony/IccCard$State;

    .restart local v3       #state:Lcom/android/internal/telephony/IccCard$State;
    goto :goto_0

    .end local v1           #lockedReason:Ljava/lang/String;
    .end local v3           #state:Lcom/android/internal/telephony/IccCard$State;
    :cond_8
    const-string v6, "CARD_IO_ERROR"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_9

    sget-object v3, Lcom/android/internal/telephony/IccCard$State;->CARD_IO_ERROR:Lcom/android/internal/telephony/IccCard$State;

    .restart local v3       #state:Lcom/android/internal/telephony/IccCard$State;
    goto :goto_0

    .end local v3           #state:Lcom/android/internal/telephony/IccCard$State;
    :cond_9
    const-string v6, "NOT_READY"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_a

    sget-object v3, Lcom/android/internal/telephony/IccCard$State;->NOT_READY:Lcom/android/internal/telephony/IccCard$State;

    .restart local v3       #state:Lcom/android/internal/telephony/IccCard$State;
    goto :goto_0

    .end local v3           #state:Lcom/android/internal/telephony/IccCard$State;
    :cond_a
    const-string v6, "DEACTIVED"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_b

    sget-object v3, Lcom/android/internal/telephony/IccCard$State;->DEACTIVED:Lcom/android/internal/telephony/IccCard$State;

    .restart local v3       #state:Lcom/android/internal/telephony/IccCard$State;
    goto :goto_0

    .end local v3           #state:Lcom/android/internal/telephony/IccCard$State;
    :cond_b
    invoke-static {v4}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$Injector;->getIccCardState(Ljava/lang/String;)Lcom/android/internal/telephony/IccCard$State;

    move-result-object v3

    .restart local v3       #state:Lcom/android/internal/telephony/IccCard$State;
    goto :goto_0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimArgs;->simState:Lcom/android/internal/telephony/IccCard$State;

    invoke-virtual {v0}, Lcom/android/internal/telephony/IccCard$State;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
