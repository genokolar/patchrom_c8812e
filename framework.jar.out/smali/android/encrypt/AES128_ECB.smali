.class public final Landroid/encrypt/AES128_ECB;
.super Ljava/lang/Object;
.source "AES128_ECB.java"


# static fields
.field private static final AES_128_KEY_LEN:I = 0x10


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static decode([BI[BI)[B
    .locals 1
    .parameter "btCipher"
    .parameter "iLen"
    .parameter "btKey"
    .parameter "iKeyLen"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/BadPaddingException;,
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljavax/crypto/NoSuchPaddingException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, p3, v0}, Landroid/encrypt/AES128_ECB;->encode_decode([BI[BII)[B

    move-result-object v0

    return-object v0
.end method

.method public static encode([BI[BI)[B
    .locals 1
    .parameter "btPlain"
    .parameter "iLen"
    .parameter "btKey"
    .parameter "iKeyLen"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/BadPaddingException;,
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljavax/crypto/NoSuchPaddingException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Landroid/encrypt/AES128_ECB;->encode_decode([BI[BII)[B

    move-result-object v0

    return-object v0
.end method

.method private static encode_decode([BI[BII)[B
    .locals 8
    .parameter "btData"
    .parameter "iLen"
    .parameter "btKey"
    .parameter "iKeyLen"
    .parameter "iFlag"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/BadPaddingException;,
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljavax/crypto/NoSuchPaddingException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    const/16 v6, 0x10

    const/4 v1, 0x0

    .local v1, l_btKey:[B
    const/4 v3, 0x0

    .local v3, l_oCipher:Ljavax/crypto/Cipher;
    if-eqz p0, :cond_0

    if-nez p2, :cond_1

    :cond_0
    const/4 v4, 0x0

    :goto_0
    return-object v4

    :cond_1
    if-lez p1, :cond_2

    array-length v4, p0

    if-le p1, v4, :cond_3

    :cond_2
    array-length p1, p0

    :cond_3
    if-lez p3, :cond_4

    array-length v4, p2

    if-le p3, v4, :cond_5

    :cond_4
    array-length p3, p2

    :cond_5
    if-le p3, v6, :cond_6

    const/16 p3, 0x10

    :cond_6
    new-array v1, v6, [B

    const/4 v0, 0x0

    .local v0, ii:I
    :goto_1
    if-ge v0, v6, :cond_7

    aput-byte v7, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_7
    const/4 v0, 0x0

    :goto_2
    if-ge v0, p3, :cond_8

    aget-byte v4, p2, v0

    aput-byte v4, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_8
    const-string v4, "AES/ECB/PKCS5Padding"

    invoke-static {v4}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v3

    if-nez p4, :cond_9

    const/4 v2, 0x1

    .local v2, l_iMode:I
    :goto_3
    new-instance v4, Ljavax/crypto/spec/SecretKeySpec;

    const-string v5, "AES"

    invoke-direct {v4, v1, v7, v6, v5}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BIILjava/lang/String;)V

    invoke-virtual {v3, v2, v4}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    invoke-virtual {v3, p0, v7, p1}, Ljavax/crypto/Cipher;->doFinal([BII)[B

    move-result-object v4

    goto :goto_0

    .end local v2           #l_iMode:I
    :cond_9
    const/4 v2, 0x2

    .restart local v2       #l_iMode:I
    goto :goto_3
.end method
