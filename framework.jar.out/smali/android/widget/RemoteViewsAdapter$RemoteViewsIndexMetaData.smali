.class Landroid/widget/RemoteViewsAdapter$RemoteViewsIndexMetaData;
.super Ljava/lang/Object;
.source "RemoteViewsAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/widget/RemoteViewsAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RemoteViewsIndexMetaData"
.end annotation


# instance fields
.field isRequested:Z

.field itemId:J

.field final synthetic this$0:Landroid/widget/RemoteViewsAdapter;

.field typeId:I


# direct methods
.method public constructor <init>(Landroid/widget/RemoteViewsAdapter;Landroid/widget/RemoteViews;JZ)V
    .locals 0
    .parameter
    .parameter "v"
    .parameter "itemId"
    .parameter "requested"

    .prologue
    iput-object p1, p0, Landroid/widget/RemoteViewsAdapter$RemoteViewsIndexMetaData;->this$0:Landroid/widget/RemoteViewsAdapter;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, p2, p3, p4, p5}, Landroid/widget/RemoteViewsAdapter$RemoteViewsIndexMetaData;->set(Landroid/widget/RemoteViews;JZ)V

    return-void
.end method


# virtual methods
.method public set(Landroid/widget/RemoteViews;JZ)V
    .locals 1
    .parameter "v"
    .parameter "id"
    .parameter "requested"

    .prologue
    iput-wide p2, p0, Landroid/widget/RemoteViewsAdapter$RemoteViewsIndexMetaData;->itemId:J

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/widget/RemoteViews;->getLayoutId()I

    move-result v0

    iput v0, p0, Landroid/widget/RemoteViewsAdapter$RemoteViewsIndexMetaData;->typeId:I

    :goto_0
    iput-boolean p4, p0, Landroid/widget/RemoteViewsAdapter$RemoteViewsIndexMetaData;->isRequested:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Landroid/widget/RemoteViewsAdapter$RemoteViewsIndexMetaData;->typeId:I

    goto :goto_0
.end method
