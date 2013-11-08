.class Landroid/hardware/fmradio/FmRxEventListner$1;
.super Ljava/lang/Thread;
.source "FmRxEventListner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/hardware/fmradio/FmRxEventListner;->startListner(ILandroid/hardware/fmradio/FmRxEvCallbacks;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/hardware/fmradio/FmRxEventListner;

.field final synthetic val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

.field final synthetic val$fd:I


# direct methods
.method constructor <init>(Landroid/hardware/fmradio/FmRxEventListner;ILandroid/hardware/fmradio/FmRxEvCallbacks;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    iput-object p1, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->this$0:Landroid/hardware/fmradio/FmRxEventListner;

    iput p2, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$fd:I

    iput-object p3, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    const/16 v5, 0x80

    new-array v0, v5, [B

    .local v0, buff:[B
    const-string v5, "FMRadio"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Starting listener "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$fd:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :goto_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v5

    if-nez v5, :cond_1

    const/4 v3, 0x0

    .local v3, index:I
    const/4 v4, 0x0

    .local v4, state:I
    const/4 v5, 0x0

    :try_start_0
    invoke-static {v0, v5}, Ljava/util/Arrays;->fill([BB)V

    iget v5, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$fd:I

    const/4 v6, 0x1

    invoke-static {v5, v0, v6}, Landroid/hardware/fmradio/FmReceiverJNI;->getBufferNative(I[BI)I

    move-result v1

    .local v1, eventCount:I
    const-string v5, "FMRadio"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Received event. Count: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v3, 0x0

    :goto_1
    if-ge v3, v1, :cond_0

    const-string v5, "FMRadio"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Received <"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-byte v7, v0, v3

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ">"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    aget-byte v5, v0, v3

    packed-switch v5, :pswitch_data_0

    const-string v5, "FMRadio"

    const-string v6, "Unknown event"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :pswitch_0
    const-string v5, "FMRadio"

    const-string v6, "Got READY_EVENT"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v5, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    invoke-interface {v5}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvEnableReceiver()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .end local v1           #eventCount:I
    :catch_0
    move-exception v2

    .local v2, ex:Ljava/lang/Exception;
    const-string v5, "FMRadio"

    const-string v6, "RunningThread InterruptedException"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .end local v2           #ex:Ljava/lang/Exception;
    .restart local v1       #eventCount:I
    :pswitch_1
    :try_start_1
    const-string v5, "FMRadio"

    const-string v6, "Got TUNE_EVENT"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v5, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    iget v6, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$fd:I

    invoke-static {v6}, Landroid/hardware/fmradio/FmReceiverJNI;->getFreqNative(I)I

    move-result v6

    invoke-interface {v5, v6}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvRadioTuneStatus(I)V

    goto :goto_2

    :pswitch_2
    const-string v5, "FMRadio"

    const-string v6, "Got SEEK_COMPLETE_EVENT"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v5, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    iget v6, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$fd:I

    invoke-static {v6}, Landroid/hardware/fmradio/FmReceiverJNI;->getFreqNative(I)I

    move-result v6

    invoke-interface {v5, v6}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvSearchComplete(I)V

    goto :goto_2

    :pswitch_3
    const-string v5, "FMRadio"

    const-string v6, "Got SCAN_NEXT_EVENT"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v5, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    invoke-interface {v5}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvSearchInProgress()V

    goto :goto_2

    :pswitch_4
    const-string v5, "FMRadio"

    const-string v6, "Got RAW_RDS_EVENT"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v5, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    invoke-interface {v5}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvRdsGroupData()V

    goto :goto_2

    :pswitch_5
    const-string v5, "FMRadio"

    const-string v6, "Got RT_EVENT"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v5, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    invoke-interface {v5}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvRdsRtInfo()V

    goto :goto_2

    :pswitch_6
    const-string v5, "FMRadio"

    const-string v6, "Got PS_EVENT"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v5, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    invoke-interface {v5}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvRdsPsInfo()V

    goto :goto_2

    :pswitch_7
    const-string v5, "FMRadio"

    const-string v6, "Got ERROR_EVENT"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    :pswitch_8
    const-string v5, "FMRadio"

    const-string v6, "Got BELOW_TH_EVENT"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v5, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    const/4 v6, 0x0

    invoke-interface {v5, v6}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvServiceAvailable(Z)V

    goto/16 :goto_2

    :pswitch_9
    const-string v5, "FMRadio"

    const-string v6, "Got ABOVE_TH_EVENT"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v5, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    const/4 v6, 0x1

    invoke-interface {v5, v6}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvServiceAvailable(Z)V

    goto/16 :goto_2

    :pswitch_a
    const-string v5, "FMRadio"

    const-string v6, "Got STEREO_EVENT"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v5, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    const/4 v6, 0x1

    invoke-interface {v5, v6}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvStereoStatus(Z)V

    goto/16 :goto_2

    :pswitch_b
    const-string v5, "FMRadio"

    const-string v6, "Got MONO_EVENT"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v5, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    const/4 v6, 0x0

    invoke-interface {v5, v6}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvStereoStatus(Z)V

    goto/16 :goto_2

    :pswitch_c
    const-string v5, "FMRadio"

    const-string v6, "Got RDS_AVAL_EVENT"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v5, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    const/4 v6, 0x1

    invoke-interface {v5, v6}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvRdsLockStatus(Z)V

    goto/16 :goto_2

    :pswitch_d
    const-string v5, "FMRadio"

    const-string v6, "Got RDS_NOT_AVAL_EVENT"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v5, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    const/4 v6, 0x0

    invoke-interface {v5, v6}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvRdsLockStatus(Z)V

    goto/16 :goto_2

    :pswitch_e
    const-string v5, "FMRadio"

    const-string v6, "Got NEW_SRCH_LIST"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v5, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    invoke-interface {v5}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvSearchListComplete()V

    goto/16 :goto_2

    :pswitch_f
    const-string v5, "FMRadio"

    const-string v6, "Got NEW_AF_LIST"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v5, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    invoke-interface {v5}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvRdsAfInfo()V

    goto/16 :goto_2

    :pswitch_10
    const-string v5, "FMRadio"

    const-string v6, "Got SIGNAL_UPDATE_EVENT"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v5, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    invoke-interface {v5}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvSignalUpdate()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_2

    .end local v1           #eventCount:I
    .end local v3           #index:I
    .end local v4           #state:I
    :cond_1
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
    .end packed-switch
.end method
