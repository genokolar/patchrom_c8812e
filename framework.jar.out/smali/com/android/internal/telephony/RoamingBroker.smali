.class public Lcom/android/internal/telephony/RoamingBroker;
.super Ljava/lang/Object;
.source "RoamingBroker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/RoamingBroker$1;,
        Lcom/android/internal/telephony/RoamingBroker$RoamingBrokerSequence;
    }
.end annotation


# static fields
.field private static final DBG:Z = true

.field private static final LOG_TAG:Ljava/lang/String; = "GSM"

.field public static final PreviousIccId:Ljava/lang/String; = "persist.radio.previousiccid"

.field public static final PreviousOperator:Ljava/lang/String; = "persist.radio.previousopcode"

.field public static final RBActivated:Ljava/lang/String; = "gsm.RBActivated"

.field private static final RBActivated_flag_on:Ljava/lang/String; = "true"

.field private static mRBSequenceList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/internal/telephony/RoamingBroker$RoamingBrokerSequence;",
            ">;"
        }
    .end annotation
.end field

.field private static mRoamingBroker:Lcom/android/internal/telephony/RoamingBroker;


# instance fields
.field private mCurrentIccid:Ljava/lang/String;

.field private mCurrentOp:Ljava/lang/String;

.field private mPreviousIccid:Ljava/lang/String;

.field private mPreviousOp:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    sput-object v0, Lcom/android/internal/telephony/RoamingBroker;->mRoamingBroker:Lcom/android/internal/telephony/RoamingBroker;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/internal/telephony/RoamingBroker;->mRBSequenceList:Ljava/util/ArrayList;

    return-void
.end method

.method private constructor <init>()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v0, 0x0

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/internal/telephony/RoamingBroker;->mPreviousIccid:Ljava/lang/String;

    iput-object v0, p0, Lcom/android/internal/telephony/RoamingBroker;->mPreviousOp:Ljava/lang/String;

    iput-object v0, p0, Lcom/android/internal/telephony/RoamingBroker;->mCurrentIccid:Ljava/lang/String;

    iput-object v0, p0, Lcom/android/internal/telephony/RoamingBroker;->mCurrentOp:Ljava/lang/String;

    const-string v0, "persist.radio.previousopcode"

    const-string v1, ""

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/telephony/RoamingBroker;->mPreviousOp:Ljava/lang/String;

    const-string v0, "Previously saved operator code is %s"

    new-array v1, v4, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/android/internal/telephony/RoamingBroker;->mPreviousOp:Ljava/lang/String;

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/internal/telephony/RoamingBroker;->log(Ljava/lang/String;)V

    const-string v0, "persist.radio.previousiccid"

    const-string v1, ""

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/telephony/RoamingBroker;->mPreviousIccid:Ljava/lang/String;

    const-string v0, "Previously saved Iccid is %s"

    new-array v1, v4, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/android/internal/telephony/RoamingBroker;->mPreviousIccid:Ljava/lang/String;

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/internal/telephony/RoamingBroker;->log(Ljava/lang/String;)V

    return-void
.end method

.method public static getDefault()Lcom/android/internal/telephony/RoamingBroker;
    .locals 1

    .prologue
    sget-object v0, Lcom/android/internal/telephony/RoamingBroker;->mRoamingBroker:Lcom/android/internal/telephony/RoamingBroker;

    if-nez v0, :cond_0

    new-instance v0, Lcom/android/internal/telephony/RoamingBroker;

    invoke-direct {v0}, Lcom/android/internal/telephony/RoamingBroker;-><init>()V

    sput-object v0, Lcom/android/internal/telephony/RoamingBroker;->mRoamingBroker:Lcom/android/internal/telephony/RoamingBroker;

    :cond_0
    sget-object v0, Lcom/android/internal/telephony/RoamingBroker;->mRoamingBroker:Lcom/android/internal/telephony/RoamingBroker;

    return-object v0
.end method

.method public static getRBOperatorNumeric()Ljava/lang/String;
    .locals 1

    .prologue
    invoke-static {}, Lcom/android/internal/telephony/RoamingBroker;->getDefault()Lcom/android/internal/telephony/RoamingBroker;

    move-result-object v0

    iget-object v0, v0, Lcom/android/internal/telephony/RoamingBroker;->mPreviousOp:Ljava/lang/String;

    return-object v0
.end method

.method public static isRoamingBrokerActivated()Z
    .locals 3

    .prologue
    const-string v1, "true"

    const-string v2, "gsm.RBActivated"

    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .local v0, result:Z
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "isRoamingBrokerActivated returns "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/android/internal/telephony/RoamingBroker;->log(Ljava/lang/String;)V

    return v0
.end method

.method private isValidRBSequence()Z
    .locals 5

    .prologue
    const/4 v2, 0x0

    .local v2, result:Z
    iget-object v3, p0, Lcom/android/internal/telephony/RoamingBroker;->mPreviousOp:Ljava/lang/String;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/android/internal/telephony/RoamingBroker;->mCurrentOp:Ljava/lang/String;

    if-eqz v3, :cond_2

    invoke-direct {p0}, Lcom/android/internal/telephony/RoamingBroker;->loadRBSequenceMap()V

    sget-object v3, Lcom/android/internal/telephony/RoamingBroker;->mRBSequenceList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/RoamingBroker$RoamingBrokerSequence;

    .local v1, rbs:Lcom/android/internal/telephony/RoamingBroker$RoamingBrokerSequence;
    iget-object v3, p0, Lcom/android/internal/telephony/RoamingBroker;->mCurrentOp:Ljava/lang/String;

    iget-object v4, v1, Lcom/android/internal/telephony/RoamingBroker$RoamingBrokerSequence;->rb_mccmnc:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/android/internal/telephony/RoamingBroker;->mPreviousOp:Ljava/lang/String;

    iget-object v4, v1, Lcom/android/internal/telephony/RoamingBroker$RoamingBrokerSequence;->before_rb_mccmnc:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, v1, Lcom/android/internal/telephony/RoamingBroker$RoamingBrokerSequence;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " Roaming broker is activated"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/android/internal/telephony/RoamingBroker;->log(Ljava/lang/String;)V

    .end local v1           #rbs:Lcom/android/internal/telephony/RoamingBroker$RoamingBrokerSequence;
    :cond_1
    invoke-direct {p0}, Lcom/android/internal/telephony/RoamingBroker;->unloadRBSequenceMap()V

    .end local v0           #i$:Ljava/util/Iterator;
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isValidRBSequence: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/android/internal/telephony/RoamingBroker;->log(Ljava/lang/String;)V

    return v2
.end method

.method private loadRBSequenceMap()V
    .locals 11

    .prologue
    sget-object v9, Lcom/android/internal/telephony/RoamingBroker;->mRBSequenceList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V

    :try_start_0
    invoke-static {}, Lcom/android/internal/telephony/PhoneFactory;->getDefaultPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v9

    invoke-interface {v9}, Lcom/android/internal/telephony/Phone;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v9

    const-string v10, "roamingBrokerSequenceList"

    invoke-static {v9, v10}, Landroid/provider/SettingsEx$Systemex;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .local v2, data:Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "get raw RB list "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/android/internal/telephony/RoamingBroker;->log(Ljava/lang/String;)V

    if-eqz v2, :cond_1

    const-string v9, "\\|"

    invoke-virtual {v2, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .local v1, buffer:[Ljava/lang/String;
    move-object v0, v1

    .local v0, arr$:[Ljava/lang/String;
    array-length v5, v0

    .local v5, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_0
    if-ge v4, v5, :cond_1

    aget-object v7, v0, v4

    .local v7, s:Ljava/lang/String;
    if-eqz v7, :cond_0

    const-string v9, ","

    invoke-virtual {v7, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .local v8, tmp:[Ljava/lang/String;
    array-length v9, v8

    const/4 v10, 0x3

    if-ne v9, v10, :cond_0

    new-instance v6, Lcom/android/internal/telephony/RoamingBroker$RoamingBrokerSequence;

    const/4 v9, 0x0

    invoke-direct {v6, p0, v9}, Lcom/android/internal/telephony/RoamingBroker$RoamingBrokerSequence;-><init>(Lcom/android/internal/telephony/RoamingBroker;Lcom/android/internal/telephony/RoamingBroker$1;)V

    .local v6, rbs:Lcom/android/internal/telephony/RoamingBroker$RoamingBrokerSequence;
    const/4 v9, 0x0

    aget-object v9, v8, v9

    iput-object v9, v6, Lcom/android/internal/telephony/RoamingBroker$RoamingBrokerSequence;->name:Ljava/lang/String;

    const/4 v9, 0x1

    aget-object v9, v8, v9

    iput-object v9, v6, Lcom/android/internal/telephony/RoamingBroker$RoamingBrokerSequence;->before_rb_mccmnc:Ljava/lang/String;

    const/4 v9, 0x2

    aget-object v9, v8, v9

    iput-object v9, v6, Lcom/android/internal/telephony/RoamingBroker$RoamingBrokerSequence;->rb_mccmnc:Ljava/lang/String;

    sget-object v9, Lcom/android/internal/telephony/RoamingBroker;->mRBSequenceList:Ljava/util/ArrayList;

    invoke-virtual {v9, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v6           #rbs:Lcom/android/internal/telephony/RoamingBroker$RoamingBrokerSequence;
    .end local v8           #tmp:[Ljava/lang/String;
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .end local v0           #arr$:[Ljava/lang/String;
    .end local v1           #buffer:[Ljava/lang/String;
    .end local v2           #data:Ljava/lang/String;
    .end local v4           #i$:I
    .end local v5           #len$:I
    .end local v7           #s:Ljava/lang/String;
    :catch_0
    move-exception v3

    .local v3, e:Ljava/lang/Exception;
    const-string v9, "Failed to load RB Sequence list. "

    invoke-static {v9, v3}, Lcom/android/internal/telephony/RoamingBroker;->loge(Ljava/lang/String;Ljava/lang/Exception;)V

    .end local v3           #e:Ljava/lang/Exception;
    :cond_1
    return-void
.end method

.method private static log(Ljava/lang/String;)V
    .locals 3
    .parameter "text"

    .prologue
    const-string v0, "GSM"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[RoamingBroker] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private static loge(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 3
    .parameter "text"
    .parameter "e"

    .prologue
    const-string v0, "GSM"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[RoamingBroker] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private setData()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/android/internal/telephony/RoamingBroker;->mCurrentIccid:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/RoamingBroker;->mCurrentOp:Ljava/lang/String;

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    const-string v0, "gsm.RBActivated"

    const-string v1, ""

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/internal/telephony/RoamingBroker;->mCurrentOp:Ljava/lang/String;

    iget-object v1, p0, Lcom/android/internal/telephony/RoamingBroker;->mPreviousOp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/RoamingBroker;->mCurrentIccid:Ljava/lang/String;

    iget-object v1, p0, Lcom/android/internal/telephony/RoamingBroker;->mPreviousIccid:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "persist.radio.previousopcode"

    iget-object v1, p0, Lcom/android/internal/telephony/RoamingBroker;->mCurrentOp:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "persist.radio.previousiccid"

    iget-object v1, p0, Lcom/android/internal/telephony/RoamingBroker;->mCurrentIccid:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "different sim card. Set operatorCode: %s, iccId: %s for roaming broker"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/android/internal/telephony/RoamingBroker;->mCurrentOp:Ljava/lang/String;

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/android/internal/telephony/RoamingBroker;->mCurrentIccid:Ljava/lang/String;

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/internal/telephony/RoamingBroker;->log(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    invoke-direct {p0}, Lcom/android/internal/telephony/RoamingBroker;->isValidRBSequence()Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "persist.radio.previousopcode"

    iget-object v1, p0, Lcom/android/internal/telephony/RoamingBroker;->mCurrentOp:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "same sim card. Set operatorCode: %s for roaming broker"

    new-array v1, v4, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/android/internal/telephony/RoamingBroker;->mCurrentOp:Ljava/lang/String;

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/internal/telephony/RoamingBroker;->log(Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    const-string v0, "gsm.RBActivated"

    const-string v1, "true"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private unloadRBSequenceMap()V
    .locals 1

    .prologue
    sget-object v0, Lcom/android/internal/telephony/RoamingBroker;->mRBSequenceList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method public static updateSelectionForRoamingBroker(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "selection"

    .prologue
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updateSelection for: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/android/internal/telephony/RoamingBroker;->log(Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "numeric[ ]*=[ ]*[\"|\']"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lcom/android/internal/telephony/RoamingBroker;->getDefault()Lcom/android/internal/telephony/RoamingBroker;

    move-result-object v2

    iget-object v2, v2, Lcom/android/internal/telephony/RoamingBroker;->mCurrentOp:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "[\"|\']"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "numeric=\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Lcom/android/internal/telephony/RoamingBroker;->getDefault()Lcom/android/internal/telephony/RoamingBroker;

    move-result-object v3

    iget-object v3, v3, Lcom/android/internal/telephony/RoamingBroker;->mPreviousOp:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .local v0, result:Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updated Selection: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/android/internal/telephony/RoamingBroker;->log(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public setIccId(Ljava/lang/String;)V
    .locals 2
    .parameter "IccId"

    .prologue
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "received IccId of value: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/internal/telephony/RoamingBroker;->log(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/android/internal/telephony/RoamingBroker;->mCurrentIccid:Ljava/lang/String;

    invoke-direct {p0}, Lcom/android/internal/telephony/RoamingBroker;->setData()V

    return-void
.end method

.method public setOperator(Ljava/lang/String;)V
    .locals 2
    .parameter "operatorCode"

    .prologue
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "received operatorCode of value: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/internal/telephony/RoamingBroker;->log(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/android/internal/telephony/RoamingBroker;->mCurrentOp:Ljava/lang/String;

    invoke-direct {p0}, Lcom/android/internal/telephony/RoamingBroker;->setData()V

    return-void
.end method
