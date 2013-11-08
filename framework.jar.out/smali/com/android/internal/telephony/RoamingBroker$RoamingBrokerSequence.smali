.class Lcom/android/internal/telephony/RoamingBroker$RoamingBrokerSequence;
.super Ljava/lang/Object;
.source "RoamingBroker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/RoamingBroker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RoamingBrokerSequence"
.end annotation


# static fields
.field static final RBSequenceLength:I = 0x3


# instance fields
.field before_rb_mccmnc:Ljava/lang/String;

.field name:Ljava/lang/String;

.field rb_mccmnc:Ljava/lang/String;

.field final synthetic this$0:Lcom/android/internal/telephony/RoamingBroker;


# direct methods
.method private constructor <init>(Lcom/android/internal/telephony/RoamingBroker;)V
    .locals 1
    .parameter

    .prologue
    iput-object p1, p0, Lcom/android/internal/telephony/RoamingBroker$RoamingBrokerSequence;->this$0:Lcom/android/internal/telephony/RoamingBroker;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/android/internal/telephony/RoamingBroker$RoamingBrokerSequence;->name:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/android/internal/telephony/RoamingBroker$RoamingBrokerSequence;->before_rb_mccmnc:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/android/internal/telephony/RoamingBroker$RoamingBrokerSequence;->rb_mccmnc:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/internal/telephony/RoamingBroker;Lcom/android/internal/telephony/RoamingBroker$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/RoamingBroker$RoamingBrokerSequence;-><init>(Lcom/android/internal/telephony/RoamingBroker;)V

    return-void
.end method
