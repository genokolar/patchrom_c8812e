.class Landroid/media/AudioService$3;
.super Ljava/lang/Object;
.source "AudioService.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/media/AudioService;->createCEWarningDialog()Landroid/app/AlertDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/media/AudioService;


# direct methods
.method constructor <init>(Landroid/media/AudioService;)V
    .locals 0
    .parameter

    .prologue
    iput-object p1, p0, Landroid/media/AudioService$3;->this$0:Landroid/media/AudioService;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .parameter "dialoginterface"
    .parameter "i"

    .prologue
    const/4 v3, 0x0

    iget-object v0, p0, Landroid/media/AudioService$3;->this$0:Landroid/media/AudioService;

    #setter for: Landroid/media/AudioService;->mShowDialog:Z
    invoke-static {v0, v3}, Landroid/media/AudioService;->access$4002(Landroid/media/AudioService;Z)Z

    iget-object v0, p0, Landroid/media/AudioService$3;->this$0:Landroid/media/AudioService;

    #setter for: Landroid/media/AudioService;->mDialogShowing:Z
    invoke-static {v0, v3}, Landroid/media/AudioService;->access$7702(Landroid/media/AudioService;Z)Z

    iget-object v0, p0, Landroid/media/AudioService$3;->this$0:Landroid/media/AudioService;

    const/4 v1, 0x3

    iget-object v2, p0, Landroid/media/AudioService$3;->this$0:Landroid/media/AudioService;

    #getter for: Landroid/media/AudioService;->mRecordVolume:I
    invoke-static {v2}, Landroid/media/AudioService;->access$7100(Landroid/media/AudioService;)I

    move-result v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/media/AudioService;->setStreamVolume(III)V

    iget-object v0, p0, Landroid/media/AudioService$3;->this$0:Landroid/media/AudioService;

    #getter for: Landroid/media/AudioService;->mNotificationManager:Landroid/app/NotificationManager;
    invoke-static {v0}, Landroid/media/AudioService;->access$8000(Landroid/media/AudioService;)Landroid/app/NotificationManager;

    move-result-object v0

    const/16 v1, 0x7b

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    return-void
.end method
