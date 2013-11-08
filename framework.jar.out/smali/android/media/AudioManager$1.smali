.class Landroid/media/AudioManager$1;
.super Landroid/os/Handler;
.source "AudioManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/media/AudioManager;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/media/AudioManager;


# direct methods
.method constructor <init>(Landroid/media/AudioManager;Landroid/os/Looper;)V
    .locals 0
    .parameter
    .parameter "x0"

    .prologue
    iput-object p1, p0, Landroid/media/AudioManager$1;->this$0:Landroid/media/AudioManager;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 10
    .parameter "msg"

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x0

    const/4 v7, 0x1

    invoke-static {}, Landroid/media/AudioManager;->access$000()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "what = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p1, Landroid/os/Message;->what:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", arg1 = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", arg2 = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p1, Landroid/os/Message;->arg2:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v4, p1, Landroid/os/Message;->what:I

    packed-switch v4, :pswitch_data_0

    :pswitch_0
    invoke-static {}, Landroid/media/AudioManager;->access$000()Ljava/lang/String;

    move-result-object v4

    const-string v5, "default branch, nothing to do"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :goto_0
    return-void

    :pswitch_1
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    invoke-static {}, Landroid/telephony/TelephonyManager;->isMultiSimEnabled()Z

    move-result v4

    if-eqz v4, :cond_0

    iget v4, p1, Landroid/os/Message;->arg1:I

    if-nez v4, :cond_0

    iget-object v4, p0, Landroid/media/AudioManager$1;->this$0:Landroid/media/AudioManager;

    invoke-virtual {v4, v8}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v1

    .local v1, currentVolume:I
    invoke-static {}, Landroid/media/AudioManager;->access$000()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "currentVolume1: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget v4, p1, Landroid/os/Message;->arg2:I

    add-int/2addr v1, v4

    invoke-static {}, Landroid/media/AudioManager;->access$000()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "currentVolume2: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    if-lt v1, v7, :cond_0

    const/4 v4, 0x5

    if-gt v1, v4, :cond_0

    const/4 v4, 0x3

    const/4 v5, 0x1

    :try_start_0
    invoke-static {v5}, Lcom/huawei/atcommand/HuaweiATUtils$ATCmdType;->fromInt(I)Lcom/huawei/atcommand/HuaweiATUtils$ATCmdType;

    move-result-object v5

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/huawei/atcommand/HuaweiATCmds;->huaweiATResponse(ILcom/huawei/atcommand/HuaweiATUtils$ATCmdType;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v3

    .local v3, e:Ljava/lang/Exception;
    invoke-static {}, Landroid/media/AudioManager;->access$000()Ljava/lang/String;

    move-result-object v4

    const-string v5, "huaweiATResponse"

    invoke-static {v4, v5, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .end local v1           #currentVolume:I
    .end local v3           #e:Ljava/lang/Exception;
    :pswitch_2
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    invoke-static {}, Landroid/telephony/TelephonyManager;->isMultiSimEnabled()Z

    move-result v4

    if-eqz v4, :cond_0

    iget v4, p1, Landroid/os/Message;->arg1:I

    if-nez v4, :cond_0

    iget v4, p1, Landroid/os/Message;->arg2:I

    if-lt v4, v7, :cond_0

    iget v4, p1, Landroid/os/Message;->arg2:I

    const/4 v5, 0x5

    if-gt v4, v5, :cond_0

    const/4 v4, 0x3

    const/4 v5, 0x1

    :try_start_1
    invoke-static {v5}, Lcom/huawei/atcommand/HuaweiATUtils$ATCmdType;->fromInt(I)Lcom/huawei/atcommand/HuaweiATUtils$ATCmdType;

    move-result-object v5

    iget v6, p1, Landroid/os/Message;->arg2:I

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/huawei/atcommand/HuaweiATCmds;->huaweiATResponse(ILcom/huawei/atcommand/HuaweiATUtils$ATCmdType;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_0

    :catch_1
    move-exception v3

    .restart local v3       #e:Ljava/lang/Exception;
    invoke-static {}, Landroid/media/AudioManager;->access$000()Ljava/lang/String;

    move-result-object v4

    const-string v5, "huaweiATResponse"

    invoke-static {v4, v5, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_0

    .end local v3           #e:Ljava/lang/Exception;
    :pswitch_3
    const/4 v4, 0x2

    const/4 v5, 0x1

    :try_start_2
    invoke-static {v5}, Lcom/huawei/atcommand/HuaweiATUtils$ATCmdType;->fromInt(I)Lcom/huawei/atcommand/HuaweiATUtils$ATCmdType;

    move-result-object v5

    const/4 v6, 0x3

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/huawei/atcommand/HuaweiATCmds;->huaweiATResponse(ILcom/huawei/atcommand/HuaweiATUtils$ATCmdType;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_0

    :catch_2
    move-exception v3

    .restart local v3       #e:Ljava/lang/Exception;
    invoke-static {}, Landroid/media/AudioManager;->access$000()Ljava/lang/String;

    move-result-object v4

    const-string v5, "huaweiATResponse"

    invoke-static {v4, v5, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_0

    .end local v3           #e:Ljava/lang/Exception;
    :pswitch_4
    :try_start_3
    invoke-static {}, Landroid/media/AudioManager;->access$000()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "currentDeviceType = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Landroid/media/AudioManager$1;->this$0:Landroid/media/AudioManager;

    #getter for: Landroid/media/AudioManager;->currentDeviceType:I
    invoke-static {v6}, Landroid/media/AudioManager;->access$100(Landroid/media/AudioManager;)I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v4, 0x2

    const/4 v5, 0x1

    invoke-static {v5}, Lcom/huawei/atcommand/HuaweiATUtils$ATCmdType;->fromInt(I)Lcom/huawei/atcommand/HuaweiATUtils$ATCmdType;

    move-result-object v5

    iget-object v6, p0, Landroid/media/AudioManager$1;->this$0:Landroid/media/AudioManager;

    #getter for: Landroid/media/AudioManager;->currentDeviceType:I
    invoke-static {v6}, Landroid/media/AudioManager;->access$100(Landroid/media/AudioManager;)I

    move-result v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/huawei/atcommand/HuaweiATCmds;->huaweiATResponse(ILcom/huawei/atcommand/HuaweiATUtils$ATCmdType;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    goto/16 :goto_0

    :catch_3
    move-exception v3

    .restart local v3       #e:Ljava/lang/Exception;
    invoke-static {}, Landroid/media/AudioManager;->access$000()Ljava/lang/String;

    move-result-object v4

    const-string v5, "huaweiATResponse"

    invoke-static {v4, v5, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_0

    .end local v3           #e:Ljava/lang/Exception;
    :pswitch_5
    const/4 v4, 0x2

    const/4 v5, 0x1

    :try_start_4
    invoke-static {v5}, Lcom/huawei/atcommand/HuaweiATUtils$ATCmdType;->fromInt(I)Lcom/huawei/atcommand/HuaweiATUtils$ATCmdType;

    move-result-object v5

    const/4 v6, 0x4

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/huawei/atcommand/HuaweiATCmds;->huaweiATResponse(ILcom/huawei/atcommand/HuaweiATUtils$ATCmdType;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    goto/16 :goto_0

    :catch_4
    move-exception v3

    .restart local v3       #e:Ljava/lang/Exception;
    invoke-static {}, Landroid/media/AudioManager;->access$000()Ljava/lang/String;

    move-result-object v4

    const-string v5, "huaweiATResponse"

    invoke-static {v4, v5, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_0

    .end local v3           #e:Ljava/lang/Exception;
    :pswitch_6
    iget-object v4, p0, Landroid/media/AudioManager$1;->this$0:Landroid/media/AudioManager;

    invoke-virtual {v4, v8}, Landroid/media/AudioManager;->getDevicesForStream(I)I

    move-result v2

    .local v2, deviceType:I
    const/4 v0, 0x1

    .local v0, atType:I
    if-ne v9, v2, :cond_1

    const/4 v0, 0x2

    :cond_1
    const/4 v4, 0x2

    const/4 v5, 0x1

    :try_start_5
    invoke-static {v5}, Lcom/huawei/atcommand/HuaweiATUtils$ATCmdType;->fromInt(I)Lcom/huawei/atcommand/HuaweiATUtils$ATCmdType;

    move-result-object v5

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/huawei/atcommand/HuaweiATCmds;->huaweiATResponse(ILcom/huawei/atcommand/HuaweiATUtils$ATCmdType;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    goto/16 :goto_0

    :catch_5
    move-exception v3

    .restart local v3       #e:Ljava/lang/Exception;
    invoke-static {}, Landroid/media/AudioManager;->access$000()Ljava/lang/String;

    move-result-object v4

    const-string v5, "huaweiATResponse"

    invoke-static {v4, v5, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method
