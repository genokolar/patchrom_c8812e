.class Lcom/android/internal/telephony/gsm/GsmServiceStateTracker$Injector;
.super Ljava/lang/Object;
.source "GsmServiceStateTracker.java"


# annotations
.annotation build Landroid/annotation/MiuiHook;
    value = .enum Landroid/annotation/MiuiHook$MiuiHookType;->NEW_CLASS:Landroid/annotation/MiuiHook$MiuiHookType;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Injector"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getPlmn(Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "tracker"
    .parameter "operator"

    .prologue
    move-object v1, p0

    iget-object v1, v1, Lcom/android/internal/telephony/ServiceStateTracker;->mIccRecords:Lcom/android/internal/telephony/uicc/IccRecords;

    check-cast v1, Lcom/android/internal/telephony/uicc/SIMRecords;

    iget-object v1, v1, Lcom/android/internal/telephony/uicc/SIMRecords;->mSpnOverride:Lcom/android/internal/telephony/uicc/SpnOverride;

    iget-object v2, p0, Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;->ss:Landroid/telephony/ServiceState;

    invoke-virtual {v2}, Landroid/telephony/ServiceState;->getOperatorNumeric()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/internal/telephony/uicc/SpnOverride;->getSpn(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .local v0, plmn:Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .end local p1
    :goto_0
    return-object p1

    .restart local p1
    :cond_0
    move-object p1, v0

    goto :goto_0
.end method

.method static getSpn(Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "tracker"
    .parameter "serviceProviderName"

    .prologue
    move-object v1, p0

    iget-object v1, v1, Lcom/android/internal/telephony/ServiceStateTracker;->mIccRecords:Lcom/android/internal/telephony/uicc/IccRecords;

    check-cast v1, Lcom/android/internal/telephony/uicc/SIMRecords;

    iget-object v1, v1, Lcom/android/internal/telephony/uicc/SIMRecords;->mSpnOverride:Lcom/android/internal/telephony/uicc/SpnOverride;

    move-object v2, p0

    iget-object v2, v2, Lcom/android/internal/telephony/ServiceStateTracker;->mIccRecords:Lcom/android/internal/telephony/uicc/IccRecords;

    invoke-virtual {v2}, Lcom/android/internal/telephony/uicc/IccRecords;->getOperatorNumeric()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/internal/telephony/uicc/SpnOverride;->getSpn(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .local v0, spn:Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .end local p1
    :goto_0
    return-object p1

    .restart local p1
    :cond_0
    move-object p1, v0

    goto :goto_0
.end method
