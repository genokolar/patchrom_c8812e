.class public Lcom/android/internal/telephony/PlmnConstants;
.super Ljava/lang/Object;
.source "PlmnConstants.java"


# static fields
.field static final LOG_TAG:Ljava/lang/String; = "GSM/CDMA"

.field static final mncAndMccTag:Ljava/lang/String; = "#"

.field static final plmnNumber:I = 0x3


# instance fields
.field private CarrierCfList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<[",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "data"

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/internal/telephony/PlmnConstants;->CarrierCfList:Ljava/util/ArrayList;

    invoke-direct {p0, p1}, Lcom/android/internal/telephony/PlmnConstants;->loadConfigFile(Ljava/lang/String;)V

    return-void
.end method

.method private loadConfigFile(Ljava/lang/String;)V
    .locals 5
    .parameter "data"

    .prologue
    if-eqz p1, :cond_1

    const-string v3, ";"

    invoke-virtual {p1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .local v0, dataToArray:[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_1

    aget-object v3, v0, v1

    if-eqz v3, :cond_0

    aget-object v3, v0, v1

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .local v2, result:[Ljava/lang/String;
    array-length v3, v2

    const/4 v4, 0x3

    if-ne v3, v4, :cond_0

    iget-object v3, p0, Lcom/android/internal/telephony/PlmnConstants;->CarrierCfList:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .end local v2           #result:[Ljava/lang/String;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .end local v0           #dataToArray:[Ljava/lang/String;
    .end local v1           #i:I
    :cond_1
    return-void
.end method


# virtual methods
.method public getPlmnValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .parameter "mncAndMccTemp"
    .parameter "contryCodeTemp"

    .prologue
    iget-object v6, p0, Lcom/android/internal/telephony/PlmnConstants;->CarrierCfList:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, iteratorTemp:Ljava/util/Iterator;,"Ljava/util/Iterator<[Ljava/lang/String;>;"
    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    .local v1, datas:[Ljava/lang/String;
    array-length v6, v1

    const/4 v7, 0x3

    if-ne v6, v7, :cond_0

    const/4 v6, 0x0

    aget-object v6, v1, v6

    const-string v7, "#"

    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .local v4, mncAndMcc:[Ljava/lang/String;
    const/4 v6, 0x1

    aget-object v0, v1, v6

    .local v0, contryCode:Ljava/lang/String;
    const/4 v6, 0x2

    aget-object v5, v1, v6

    .local v5, plmn:Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    array-length v6, v4

    if-ge v2, v6, :cond_0

    if-eqz p1, :cond_1

    aget-object v6, v4, v2

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    if-eqz p2, :cond_1

    invoke-virtual {p2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .end local v0           #contryCode:Ljava/lang/String;
    .end local v1           #datas:[Ljava/lang/String;
    .end local v2           #i:I
    .end local v4           #mncAndMcc:[Ljava/lang/String;
    .end local v5           #plmn:Ljava/lang/String;
    :goto_1
    return-object v5

    .restart local v0       #contryCode:Ljava/lang/String;
    .restart local v1       #datas:[Ljava/lang/String;
    .restart local v2       #i:I
    .restart local v4       #mncAndMcc:[Ljava/lang/String;
    .restart local v5       #plmn:Ljava/lang/String;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .end local v0           #contryCode:Ljava/lang/String;
    .end local v1           #datas:[Ljava/lang/String;
    .end local v2           #i:I
    .end local v4           #mncAndMcc:[Ljava/lang/String;
    .end local v5           #plmn:Ljava/lang/String;
    :cond_2
    const/4 v5, 0x0

    goto :goto_1
.end method
