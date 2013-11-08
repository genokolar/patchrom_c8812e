.class Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;
.super Ljava/lang/Object;
.source "MSimKeyguardStatusViewManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MSimIccText"
.end annotation


# instance fields
.field iccMissingInstructions:I

.field iccMissingMessageShort:I

.field iccPinLockedMessage:I

.field iccPukLockedMessage:I


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    iput v0, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;->iccMissingMessageShort:I

    iput v0, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;->iccMissingInstructions:I

    iput v0, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;->iccPinLockedMessage:I

    iput v0, p0, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;->iccPukLockedMessage:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MSimKeyguardStatusViewManager$MSimIccText;-><init>()V

    return-void
.end method
