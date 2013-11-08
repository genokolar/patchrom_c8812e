.class Lcom/android/internal/policy/impl/KeyguardStatusViewManager$IccText;
.super Ljava/lang/Object;
.source "KeyguardStatusViewManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/KeyguardStatusViewManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "IccText"
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

    iput v0, p0, Lcom/android/internal/policy/impl/KeyguardStatusViewManager$IccText;->iccMissingMessageShort:I

    iput v0, p0, Lcom/android/internal/policy/impl/KeyguardStatusViewManager$IccText;->iccMissingInstructions:I

    iput v0, p0, Lcom/android/internal/policy/impl/KeyguardStatusViewManager$IccText;->iccPinLockedMessage:I

    iput v0, p0, Lcom/android/internal/policy/impl/KeyguardStatusViewManager$IccText;->iccPukLockedMessage:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/internal/policy/impl/KeyguardStatusViewManager$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lcom/android/internal/policy/impl/KeyguardStatusViewManager$IccText;-><init>()V

    return-void
.end method
