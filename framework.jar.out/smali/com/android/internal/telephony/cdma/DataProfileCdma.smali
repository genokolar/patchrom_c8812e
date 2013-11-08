.class public Lcom/android/internal/telephony/cdma/DataProfileCdma;
.super Lcom/android/internal/telephony/DataProfile;
.source "DataProfileCdma.java"


# static fields
.field private static PROFILE_TYPE:Ljava/lang/String;


# instance fields
.field private mProfileId:I

.field public final mmsPort:Ljava/lang/String;

.field public final mmsProxy:Ljava/lang/String;

.field public final mmsc:Ljava/lang/String;

.field public final port:Ljava/lang/String;

.field public pppNumber:Ljava/lang/String;

.field public final proxy:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const-string v0, "CdmaNai"

    sput-object v0, Lcom/android/internal/telephony/cdma/DataProfileCdma;->PROFILE_TYPE:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 2
    .parameter "id"
    .parameter "numeric"
    .parameter "apn"
    .parameter "user"
    .parameter "password"
    .parameter "authType"
    .parameter "types"
    .parameter "protocol"
    .parameter "roamingProtocol"
    .parameter "bearer"

    .prologue
    const/4 v1, 0x0

    invoke-direct/range {p0 .. p10}, Lcom/android/internal/telephony/DataProfile;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/internal/telephony/cdma/DataProfileCdma;->mProfileId:I

    iput-object v1, p0, Lcom/android/internal/telephony/cdma/DataProfileCdma;->proxy:Ljava/lang/String;

    iput-object v1, p0, Lcom/android/internal/telephony/cdma/DataProfileCdma;->port:Ljava/lang/String;

    iput-object v1, p0, Lcom/android/internal/telephony/cdma/DataProfileCdma;->mmsc:Ljava/lang/String;

    iput-object v1, p0, Lcom/android/internal/telephony/cdma/DataProfileCdma;->mmsProxy:Ljava/lang/String;

    iput-object v1, p0, Lcom/android/internal/telephony/cdma/DataProfileCdma;->mmsPort:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 12
    .parameter "id"
    .parameter "numeric"
    .parameter "apn"
    .parameter "user"
    .parameter "password"
    .parameter "authType"
    .parameter "types"
    .parameter "protocol"
    .parameter "roamingProtocol"
    .parameter "bearer"
    .parameter "proxy"
    .parameter "port"
    .parameter "mmsc"
    .parameter "mmsProxy"
    .parameter "mmsPort"

    .prologue
    if-nez p3, :cond_0

    sget-object v4, Lcom/android/internal/telephony/cdma/DataProfileCdma;->PROFILE_TYPE:Ljava/lang/String;

    :goto_0
    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move/from16 v11, p10

    invoke-direct/range {v1 .. v11}, Lcom/android/internal/telephony/DataProfile;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x0

    iput v1, p0, Lcom/android/internal/telephony/cdma/DataProfileCdma;->mProfileId:I

    move-object/from16 v0, p11

    iput-object v0, p0, Lcom/android/internal/telephony/cdma/DataProfileCdma;->proxy:Ljava/lang/String;

    move-object/from16 v0, p12

    iput-object v0, p0, Lcom/android/internal/telephony/cdma/DataProfileCdma;->port:Ljava/lang/String;

    move-object/from16 v0, p13

    iput-object v0, p0, Lcom/android/internal/telephony/cdma/DataProfileCdma;->mmsc:Ljava/lang/String;

    move-object/from16 v0, p14

    iput-object v0, p0, Lcom/android/internal/telephony/cdma/DataProfileCdma;->mmsProxy:Ljava/lang/String;

    move-object/from16 v0, p15

    iput-object v0, p0, Lcom/android/internal/telephony/cdma/DataProfileCdma;->mmsPort:Ljava/lang/String;

    return-void

    :cond_0
    move-object v4, p3

    goto :goto_0
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 12
    .parameter "id"
    .parameter "numeric"
    .parameter "apn"
    .parameter "user"
    .parameter "password"
    .parameter "authType"
    .parameter "types"
    .parameter "protocol"
    .parameter "roamingProtocol"
    .parameter "bearer"
    .parameter "proxy"
    .parameter "port"
    .parameter "mmsc"
    .parameter "mmsProxy"
    .parameter "mmsPort"
    .parameter "pppNumber"

    .prologue
    if-nez p3, :cond_0

    sget-object v4, Lcom/android/internal/telephony/cdma/DataProfileCdma;->PROFILE_TYPE:Ljava/lang/String;

    :goto_0
    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move/from16 v11, p10

    invoke-direct/range {v1 .. v11}, Lcom/android/internal/telephony/DataProfile;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x0

    iput v1, p0, Lcom/android/internal/telephony/cdma/DataProfileCdma;->mProfileId:I

    move-object/from16 v0, p11

    iput-object v0, p0, Lcom/android/internal/telephony/cdma/DataProfileCdma;->proxy:Ljava/lang/String;

    move-object/from16 v0, p12

    iput-object v0, p0, Lcom/android/internal/telephony/cdma/DataProfileCdma;->port:Ljava/lang/String;

    move-object/from16 v0, p13

    iput-object v0, p0, Lcom/android/internal/telephony/cdma/DataProfileCdma;->mmsc:Ljava/lang/String;

    move-object/from16 v0, p14

    iput-object v0, p0, Lcom/android/internal/telephony/cdma/DataProfileCdma;->mmsProxy:Ljava/lang/String;

    move-object/from16 v0, p15

    iput-object v0, p0, Lcom/android/internal/telephony/cdma/DataProfileCdma;->mmsPort:Ljava/lang/String;

    move-object/from16 v0, p16

    iput-object v0, p0, Lcom/android/internal/telephony/cdma/DataProfileCdma;->pppNumber:Ljava/lang/String;

    return-void

    :cond_0
    move-object v4, p3

    goto :goto_0
.end method


# virtual methods
.method public canHandleType(Ljava/lang/String;)Z
    .locals 5
    .parameter "type"

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/DataProfile;->types:[Ljava/lang/String;

    .local v0, arr$:[Ljava/lang/String;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_2

    aget-object v3, v0, v1

    .local v3, t:Ljava/lang/String;
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, "*"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, "default"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    const-string v4, "hipri"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    :cond_0
    const/4 v4, 0x1

    .end local v3           #t:Ljava/lang/String;
    :goto_1
    return v4

    .restart local v3       #t:Ljava/lang/String;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .end local v3           #t:Ljava/lang/String;
    :cond_2
    const/4 v4, 0x0

    goto :goto_1
.end method

.method public getDataProfileType()Lcom/android/internal/telephony/DataProfile$DataProfileType;
    .locals 1

    .prologue
    sget-object v0, Lcom/android/internal/telephony/DataProfile$DataProfileType;->PROFILE_TYPE_CDMA:Lcom/android/internal/telephony/DataProfile$DataProfileType;

    return-object v0
.end method

.method public getProfileId()I
    .locals 1

    .prologue
    iget v0, p0, Lcom/android/internal/telephony/cdma/DataProfileCdma;->mProfileId:I

    return v0
.end method

.method public setProfileId(I)V
    .locals 0
    .parameter "profileId"

    .prologue
    iput p1, p0, Lcom/android/internal/telephony/cdma/DataProfileCdma;->mProfileId:I

    return-void
.end method

.method public toHash()Ljava/lang/String;
    .locals 1

    .prologue
    invoke-virtual {p0}, Lcom/android/internal/telephony/cdma/DataProfileCdma;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toShortString()Ljava/lang/String;
    .locals 1

    .prologue
    const-string v0, "DataProfileCdma"

    return-object v0
.end method
