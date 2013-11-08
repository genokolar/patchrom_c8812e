.class public Landroid/encrypt/PasswordEncrypter;
.super Ljava/lang/Object;
.source "PasswordEncrypter.java"


# static fields
.field public static final SECRET_KEY:Ljava/lang/String; = "PkmJygVfrDxsDeeD"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static decrypter(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .parameter "password"

    .prologue
    move-object v1, p0

    .local v1, string:Ljava/lang/String;
    :try_start_0
    new-instance v2, Ljava/lang/String;

    const-string v3, "PkmJygVfrDxsDeeD"

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {p0, v3, v4}, Landroid/encrypt/AES128_ECB_HEX;->decode(Ljava/lang/String;[BI)[B

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/String;-><init>([B)V
    :try_end_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/crypto/BadPaddingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_5

    .end local v1           #string:Ljava/lang/String;
    .local v2, string:Ljava/lang/String;
    move-object v1, v2

    .end local v2           #string:Ljava/lang/String;
    .restart local v1       #string:Ljava/lang/String;
    :goto_0
    return-object v1

    :catch_0
    move-exception v0

    .local v0, e:Ljava/security/InvalidKeyException;
    invoke-virtual {v0}, Ljava/security/InvalidKeyException;->printStackTrace()V

    goto :goto_0

    .end local v0           #e:Ljava/security/InvalidKeyException;
    :catch_1
    move-exception v0

    .local v0, e:Ljavax/crypto/BadPaddingException;
    invoke-virtual {v0}, Ljavax/crypto/BadPaddingException;->printStackTrace()V

    goto :goto_0

    .end local v0           #e:Ljavax/crypto/BadPaddingException;
    :catch_2
    move-exception v0

    .local v0, e:Ljavax/crypto/IllegalBlockSizeException;
    invoke-virtual {v0}, Ljavax/crypto/IllegalBlockSizeException;->printStackTrace()V

    goto :goto_0

    .end local v0           #e:Ljavax/crypto/IllegalBlockSizeException;
    :catch_3
    move-exception v0

    .local v0, e:Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v0}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    goto :goto_0

    .end local v0           #e:Ljava/security/NoSuchAlgorithmException;
    :catch_4
    move-exception v0

    .local v0, e:Ljavax/crypto/NoSuchPaddingException;
    invoke-virtual {v0}, Ljavax/crypto/NoSuchPaddingException;->printStackTrace()V

    goto :goto_0

    .end local v0           #e:Ljavax/crypto/NoSuchPaddingException;
    :catch_5
    move-exception v0

    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static encrypter(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .parameter "password"

    .prologue
    const/4 v1, 0x0

    .local v1, string:Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    const/4 v3, 0x0

    const-string v4, "PkmJygVfrDxsDeeD"

    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v2, v3, v4, v5}, Landroid/encrypt/AES128_ECB_HEX;->encode([BI[BI)Ljava/lang/String;
    :try_end_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/crypto/BadPaddingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_5

    move-result-object v1

    :goto_0
    return-object v1

    :catch_0
    move-exception v0

    .local v0, e:Ljava/security/InvalidKeyException;
    invoke-virtual {v0}, Ljava/security/InvalidKeyException;->printStackTrace()V

    goto :goto_0

    .end local v0           #e:Ljava/security/InvalidKeyException;
    :catch_1
    move-exception v0

    .local v0, e:Ljavax/crypto/BadPaddingException;
    invoke-virtual {v0}, Ljavax/crypto/BadPaddingException;->printStackTrace()V

    goto :goto_0

    .end local v0           #e:Ljavax/crypto/BadPaddingException;
    :catch_2
    move-exception v0

    .local v0, e:Ljavax/crypto/IllegalBlockSizeException;
    invoke-virtual {v0}, Ljavax/crypto/IllegalBlockSizeException;->printStackTrace()V

    goto :goto_0

    .end local v0           #e:Ljavax/crypto/IllegalBlockSizeException;
    :catch_3
    move-exception v0

    .local v0, e:Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v0}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    goto :goto_0

    .end local v0           #e:Ljava/security/NoSuchAlgorithmException;
    :catch_4
    move-exception v0

    .local v0, e:Ljavax/crypto/NoSuchPaddingException;
    invoke-virtual {v0}, Ljavax/crypto/NoSuchPaddingException;->printStackTrace()V

    goto :goto_0

    .end local v0           #e:Ljavax/crypto/NoSuchPaddingException;
    :catch_5
    move-exception v0

    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
