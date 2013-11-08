.class public Lcom/android/internal/policy/impl/HwThemeUnlockScreenWallpaper;
.super Ljava/lang/Object;
.source "HwThemeUnlockScreenWallpaper.java"


# static fields
.field private static sInstance:Lcom/android/internal/policy/impl/HwThemeUnlockScreenWallpaper;


# instance fields
.field private mLayout:Ljava/lang/String;

.field private mStyle:Ljava/lang/String;

.field private mWallpaper:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    sput-object v0, Lcom/android/internal/policy/impl/HwThemeUnlockScreenWallpaper;->sInstance:Lcom/android/internal/policy/impl/HwThemeUnlockScreenWallpaper;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clear()V
    .locals 1

    .prologue
    sget-object v0, Lcom/android/internal/policy/impl/HwThemeUnlockScreenWallpaper;->sInstance:Lcom/android/internal/policy/impl/HwThemeUnlockScreenWallpaper;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    sput-object v0, Lcom/android/internal/policy/impl/HwThemeUnlockScreenWallpaper;->sInstance:Lcom/android/internal/policy/impl/HwThemeUnlockScreenWallpaper;

    :cond_0
    return-void
.end method

.method public static getInstance()Lcom/android/internal/policy/impl/HwThemeUnlockScreenWallpaper;
    .locals 1

    .prologue
    sget-object v0, Lcom/android/internal/policy/impl/HwThemeUnlockScreenWallpaper;->sInstance:Lcom/android/internal/policy/impl/HwThemeUnlockScreenWallpaper;

    if-nez v0, :cond_0

    new-instance v0, Lcom/android/internal/policy/impl/HwThemeUnlockScreenWallpaper;

    invoke-direct {v0}, Lcom/android/internal/policy/impl/HwThemeUnlockScreenWallpaper;-><init>()V

    sput-object v0, Lcom/android/internal/policy/impl/HwThemeUnlockScreenWallpaper;->sInstance:Lcom/android/internal/policy/impl/HwThemeUnlockScreenWallpaper;

    :cond_0
    sget-object v0, Lcom/android/internal/policy/impl/HwThemeUnlockScreenWallpaper;->sInstance:Lcom/android/internal/policy/impl/HwThemeUnlockScreenWallpaper;

    return-object v0
.end method

.method public static getLayoutXML(Ljava/lang/String;)Lorg/w3c/dom/Document;
    .locals 5
    .parameter "path"

    .prologue
    const/4 v2, 0x0

    .local v2, document:Lorg/w3c/dom/Document;
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v1

    .local v1, builderFactory:Ljavax/xml/parsers/DocumentBuilderFactory;
    :try_start_0
    invoke-virtual {v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    .local v0, builder:Ljavax/xml/parsers/DocumentBuilder;
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v4}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/File;)Lorg/w3c/dom/Document;
    :try_end_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    move-result-object v2

    .end local v0           #builder:Ljavax/xml/parsers/DocumentBuilder;
    :goto_0
    return-object v2

    :catch_0
    move-exception v3

    .local v3, e:Ljavax/xml/parsers/ParserConfigurationException;
    invoke-virtual {v3}, Ljavax/xml/parsers/ParserConfigurationException;->printStackTrace()V

    goto :goto_0

    .end local v3           #e:Ljavax/xml/parsers/ParserConfigurationException;
    :catch_1
    move-exception v3

    .local v3, e:Lorg/xml/sax/SAXException;
    invoke-virtual {v3}, Lorg/xml/sax/SAXException;->printStackTrace()V

    goto :goto_0

    .end local v3           #e:Lorg/xml/sax/SAXException;
    :catch_2
    move-exception v3

    .local v3, e:Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .end local v3           #e:Ljava/io/IOException;
    :catch_3
    move-exception v3

    .local v3, e:Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static getWallpaper()Landroid/graphics/drawable/Drawable;
    .locals 5

    .prologue
    invoke-static {}, Lcom/android/internal/policy/impl/HwThemeUnlockScreenWallpaper;->getInstance()Lcom/android/internal/policy/impl/HwThemeUnlockScreenWallpaper;

    move-result-object v1

    .local v1, themeParser:Lcom/android/internal/policy/impl/HwThemeUnlockScreenWallpaper;
    const-string v3, "/data/skin/unlock/theme.xml"

    invoke-virtual {v1, v3}, Lcom/android/internal/policy/impl/HwThemeUnlockScreenWallpaper;->parseThemeFromXml(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/HwThemeUnlockScreenWallpaper;->getWallpaperPath()Ljava/lang/String;

    move-result-object v2

    .local v2, wallpaper:Ljava/lang/String;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_1

    :cond_0
    const-string v2, "unlock_wallpaper_0.jpg"

    :cond_1
    const/4 v0, 0x0

    .local v0, drawable:Landroid/graphics/drawable/Drawable;
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "/data/skin/wallpaper/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/graphics/drawable/Drawable;->createFromPath(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :cond_2
    invoke-static {}, Lcom/android/internal/policy/impl/HwThemeUnlockScreenWallpaper;->clear()V

    return-object v0
.end method


# virtual methods
.method public getLayout()Ljava/lang/String;
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/HwThemeUnlockScreenWallpaper;->mLayout:Ljava/lang/String;

    return-object v0
.end method

.method public getStyle()Ljava/lang/String;
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/HwThemeUnlockScreenWallpaper;->mStyle:Ljava/lang/String;

    return-object v0
.end method

.method public getWallpaperPath()Ljava/lang/String;
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/HwThemeUnlockScreenWallpaper;->mWallpaper:Ljava/lang/String;

    return-object v0
.end method

.method public parseThemeFromXml(Ljava/lang/String;)V
    .locals 11
    .parameter "filePath"

    .prologue
    invoke-static {p1}, Lcom/android/internal/policy/impl/HwThemeUnlockScreenWallpaper;->getLayoutXML(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v1

    .local v1, document:Lorg/w3c/dom/Document;
    if-nez v1, :cond_1

    :cond_0
    return-void

    :cond_1
    invoke-interface {v1}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v8

    .local v8, rootElement:Lorg/w3c/dom/Element;
    if-eqz v8, :cond_0

    invoke-interface {v8}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v5

    .local v5, itemNodes:Lorg/w3c/dom/NodeList;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    invoke-interface {v5}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v10

    if-ge v2, v10, :cond_0

    invoke-interface {v5, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    .local v4, itemNode:Lorg/w3c/dom/Node;
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v3

    .local v3, itemName:Ljava/lang/String;
    const-string v10, "item"

    invoke-virtual {v10, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v0

    .local v0, attrs:Lorg/w3c/dom/NamedNodeMap;
    const/4 v6, 0x0

    .local v6, j:I
    :goto_1
    invoke-interface {v0}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v10

    if-ge v6, v10, :cond_5

    invoke-interface {v0, v6}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v10

    invoke-interface {v10}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v7

    .local v7, name:Ljava/lang/String;
    invoke-interface {v0, v6}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v10

    invoke-interface {v10}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v9

    .local v9, value:Ljava/lang/String;
    const-string v10, "style"

    invoke-virtual {v10, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_3

    iput-object v9, p0, Lcom/android/internal/policy/impl/HwThemeUnlockScreenWallpaper;->mStyle:Ljava/lang/String;

    :cond_2
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_3
    const-string v10, "wallpaper"

    invoke-virtual {v10, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_4

    iput-object v9, p0, Lcom/android/internal/policy/impl/HwThemeUnlockScreenWallpaper;->mWallpaper:Ljava/lang/String;

    goto :goto_2

    :cond_4
    const-string v10, "layout"

    invoke-virtual {v10, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2

    iput-object v9, p0, Lcom/android/internal/policy/impl/HwThemeUnlockScreenWallpaper;->mLayout:Ljava/lang/String;

    goto :goto_2

    .end local v0           #attrs:Lorg/w3c/dom/NamedNodeMap;
    .end local v6           #j:I
    .end local v7           #name:Ljava/lang/String;
    .end local v9           #value:Ljava/lang/String;
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method
