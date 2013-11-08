.class Lcom/android/server/NotificationManagerService$2;
.super Landroid/content/BroadcastReceiver;
.source "NotificationManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/NotificationManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/NotificationManagerService;


# direct methods
.method constructor <init>(Lcom/android/server/NotificationManagerService;)V
    .locals 0
    .parameter

    .prologue
    iput-object p1, p0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 22
    .parameter "context"
    .parameter "intent"

    .prologue
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    .local v5, action:Ljava/lang/String;
    const/4 v15, 0x0

    .local v15, queryRestart:Z
    const/4 v12, 0x0

    .local v12, packageChanged:Z
    const-string v18, "android.intent.action.PACKAGE_REMOVED"

    move-object/from16 v0, v18

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_0

    const-string v18, "android.intent.action.PACKAGE_RESTARTED"

    move-object/from16 v0, v18

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_0

    const-string v18, "android.intent.action.PACKAGE_CHANGED"

    move-object/from16 v0, v18

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_0

    const-string v18, "android.intent.action.QUERY_PACKAGE_RESTART"

    move-object/from16 v0, v18

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_0

    const-string v18, "android.intent.action.EXTERNAL_APPLICATIONS_UNAVAILABLE"

    move-object/from16 v0, v18

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_7

    :cond_0
    const/4 v13, 0x0

    .local v13, pkgList:[Ljava/lang/String;
    const-string v18, "android.intent.action.EXTERNAL_APPLICATIONS_UNAVAILABLE"

    move-object/from16 v0, v18

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_1

    const-string v18, "android.intent.extra.changed_package_list"

    move-object/from16 v0, p2

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v13

    :goto_0
    if-eqz v13, :cond_8

    array-length v0, v13

    move/from16 v18, v0

    if-lez v18, :cond_8

    move-object v6, v13

    .local v6, arr$:[Ljava/lang/String;
    array-length v11, v6

    .local v11, len$:I
    const/4 v9, 0x0

    .local v9, i$:I
    :goto_1
    if-ge v9, v11, :cond_8

    aget-object v14, v6, v9

    .local v14, pkgName:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    const/16 v21, 0x0

    if-nez v15, :cond_6

    const/16 v18, 0x1

    :goto_2
    move-object/from16 v0, v19

    move/from16 v1, v20

    move/from16 v2, v21

    move/from16 v3, v18

    invoke-virtual {v0, v14, v1, v2, v3}, Lcom/android/server/NotificationManagerService;->cancelAllNotificationsInt(Ljava/lang/String;IIZ)Z

    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .end local v6           #arr$:[Ljava/lang/String;
    .end local v9           #i$:I
    .end local v11           #len$:I
    .end local v14           #pkgName:Ljava/lang/String;
    :cond_1
    if-eqz v15, :cond_2

    const-string v18, "android.intent.extra.PACKAGES"

    move-object/from16 v0, p2

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v13

    goto :goto_0

    :cond_2
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v17

    .local v17, uri:Landroid/net/Uri;
    if-nez v17, :cond_4

    .end local v13           #pkgList:[Ljava/lang/String;
    .end local v17           #uri:Landroid/net/Uri;
    :cond_3
    :goto_3
    return-void

    .restart local v13       #pkgList:[Ljava/lang/String;
    .restart local v17       #uri:Landroid/net/Uri;
    :cond_4
    invoke-virtual/range {v17 .. v17}, Landroid/net/Uri;->getSchemeSpecificPart()Ljava/lang/String;

    move-result-object v14

    .restart local v14       #pkgName:Ljava/lang/String;
    if-eqz v14, :cond_3

    if-eqz v12, :cond_5

    const/4 v7, 0x0

    .local v7, enabled:I
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/android/server/NotificationManagerService;->mContext:Landroid/content/Context;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Landroid/content/pm/PackageManager;->getApplicationEnabledSetting(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v7

    const/16 v18, 0x1

    move/from16 v0, v18

    if-eq v7, v0, :cond_3

    if-eqz v7, :cond_3

    .end local v7           #enabled:I
    :cond_5
    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v13, v0, [Ljava/lang/String;

    .end local v13           #pkgList:[Ljava/lang/String;
    const/16 v18, 0x0

    aput-object v14, v13, v18

    .restart local v13       #pkgList:[Ljava/lang/String;
    goto :goto_0

    .restart local v7       #enabled:I
    :catch_0
    move-exception v10

    .local v10, ignored:Ljava/lang/IllegalArgumentException;
    const-string v18, "NotificationService"

    const-string v19, "Unknown package failed to install"

    invoke-static/range {v18 .. v19}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .end local v7           #enabled:I
    .end local v10           #ignored:Ljava/lang/IllegalArgumentException;
    .end local v17           #uri:Landroid/net/Uri;
    .restart local v6       #arr$:[Ljava/lang/String;
    .restart local v9       #i$:I
    .restart local v11       #len$:I
    :cond_6
    const/16 v18, 0x0

    goto :goto_2

    .end local v6           #arr$:[Ljava/lang/String;
    .end local v9           #i$:I
    .end local v11           #len$:I
    .end local v13           #pkgList:[Ljava/lang/String;
    .end local v14           #pkgName:Ljava/lang/String;
    :cond_7
    const-string v18, "android.intent.action.SCREEN_ON"

    move-object/from16 v0, v18

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_a

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    #setter for: Lcom/android/server/NotificationManagerService;->mScreenOn:Z
    invoke-static/range {v18 .. v19}, Lcom/android/server/NotificationManagerService;->access$1102(Lcom/android/server/NotificationManagerService;Z)Z

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v18, v0

    #calls: Lcom/android/server/NotificationManagerService;->updateNotificationPulse()V
    invoke-static/range {v18 .. v18}, Lcom/android/server/NotificationManagerService;->access$1200(Lcom/android/server/NotificationManagerService;)V

    :cond_8
    :goto_4
    const-string v18, "true"

    const-string v19, "ro.config.hw_quickpoweron"

    invoke-static/range {v19 .. v19}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_3

    const-string v18, "android.intent.action.ACTION_SHUTDOWN"

    move-object/from16 v0, v18

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v18, v0

    #getter for: Lcom/android/server/NotificationManagerService;->mNotificationList:Ljava/util/ArrayList;
    invoke-static/range {v18 .. v18}, Lcom/android/server/NotificationManagerService;->access$100(Lcom/android/server/NotificationManagerService;)Ljava/util/ArrayList;

    move-result-object v19

    monitor-enter v19

    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v18, v0

    #getter for: Lcom/android/server/NotificationManagerService;->mNotificationList:Ljava/util/ArrayList;
    invoke-static/range {v18 .. v18}, Lcom/android/server/NotificationManagerService;->access$100(Lcom/android/server/NotificationManagerService;)Ljava/util/ArrayList;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/util/ArrayList;->size()I

    move-result v4

    .local v4, N:I
    add-int/lit8 v8, v4, -0x1

    .local v8, i:I
    :goto_5
    if-ltz v8, :cond_e

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v18, v0

    #getter for: Lcom/android/server/NotificationManagerService;->mNotificationList:Ljava/util/ArrayList;
    invoke-static/range {v18 .. v18}, Lcom/android/server/NotificationManagerService;->access$100(Lcom/android/server/NotificationManagerService;)Ljava/util/ArrayList;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/android/server/NotificationManagerService$NotificationRecord;

    .local v16, r:Lcom/android/server/NotificationManagerService$NotificationRecord;
    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$NotificationRecord;->notification:Landroid/app/Notification;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Landroid/app/Notification;->flags:I

    move/from16 v18, v0

    and-int/lit8 v18, v18, 0x6

    if-eqz v18, :cond_9

    const-string v18, "android"

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$NotificationRecord;->pkg:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_9

    const-string v18, "system"

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$NotificationRecord;->pkg:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_9

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v18, v0

    #getter for: Lcom/android/server/NotificationManagerService;->mNotificationList:Ljava/util/ArrayList;
    invoke-static/range {v18 .. v18}, Lcom/android/server/NotificationManagerService;->access$100(Lcom/android/server/NotificationManagerService;)Ljava/util/ArrayList;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v18, v0

    const/16 v20, 0x1

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    move/from16 v2, v20

    #calls: Lcom/android/server/NotificationManagerService;->cancelNotificationLocked(Lcom/android/server/NotificationManagerService$NotificationRecord;Z)V
    invoke-static {v0, v1, v2}, Lcom/android/server/NotificationManagerService;->access$1500(Lcom/android/server/NotificationManagerService;Lcom/android/server/NotificationManagerService$NotificationRecord;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_9
    add-int/lit8 v8, v8, -0x1

    goto :goto_5

    .end local v4           #N:I
    .end local v8           #i:I
    .end local v16           #r:Lcom/android/server/NotificationManagerService$NotificationRecord;
    :cond_a
    const-string v18, "android.intent.action.SCREEN_OFF"

    move-object/from16 v0, v18

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_b

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    #setter for: Lcom/android/server/NotificationManagerService;->mScreenOn:Z
    invoke-static/range {v18 .. v19}, Lcom/android/server/NotificationManagerService;->access$1102(Lcom/android/server/NotificationManagerService;Z)Z

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v18, v0

    #calls: Lcom/android/server/NotificationManagerService;->updateNotificationPulse()V
    invoke-static/range {v18 .. v18}, Lcom/android/server/NotificationManagerService;->access$1200(Lcom/android/server/NotificationManagerService;)V

    goto/16 :goto_4

    :cond_b
    const-string v18, "android.intent.action.PHONE_STATE"

    move-object/from16 v0, v18

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_c

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v18, v0

    const-string v19, "state"

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    sget-object v20, Landroid/telephony/TelephonyManager;->EXTRA_STATE_OFFHOOK:Ljava/lang/String;

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    #setter for: Lcom/android/server/NotificationManagerService;->mInCall:Z
    invoke-static/range {v18 .. v19}, Lcom/android/server/NotificationManagerService;->access$1302(Lcom/android/server/NotificationManagerService;Z)Z

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v18, v0

    #calls: Lcom/android/server/NotificationManagerService;->updateNotificationPulse()V
    invoke-static/range {v18 .. v18}, Lcom/android/server/NotificationManagerService;->access$1200(Lcom/android/server/NotificationManagerService;)V

    goto/16 :goto_4

    :cond_c
    const-string v18, "android.intent.action.USER_PRESENT"

    move-object/from16 v0, v18

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_d

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v18, v0

    #getter for: Lcom/android/server/NotificationManagerService;->mScreenOn:Z
    invoke-static/range {v18 .. v18}, Lcom/android/server/NotificationManagerService;->access$1100(Lcom/android/server/NotificationManagerService;)Z

    move-result v18

    const/16 v19, 0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v18, v0

    #getter for: Lcom/android/server/NotificationManagerService;->mNotificationLight:Lcom/android/server/LightsService$Light;
    invoke-static/range {v18 .. v18}, Lcom/android/server/NotificationManagerService;->access$1400(Lcom/android/server/NotificationManagerService;)Lcom/android/server/LightsService$Light;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lcom/android/server/LightsService$Light;->turnOff()V

    goto/16 :goto_4

    :cond_d
    const-string v18, "android.intent.action.ACTION_POWER_DISCONNECTED"

    move-object/from16 v0, v18

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v18, v0

    #getter for: Lcom/android/server/NotificationManagerService;->mScreenOn:Z
    invoke-static/range {v18 .. v18}, Lcom/android/server/NotificationManagerService;->access$1100(Lcom/android/server/NotificationManagerService;)Z

    move-result v18

    if-nez v18, :cond_8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v18, v0

    #getter for: Lcom/android/server/NotificationManagerService;->mNotificationLight:Lcom/android/server/LightsService$Light;
    invoke-static/range {v18 .. v18}, Lcom/android/server/NotificationManagerService;->access$1400(Lcom/android/server/NotificationManagerService;)Lcom/android/server/LightsService$Light;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lcom/android/server/LightsService$Light;->turnOff()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v18, v0

    #calls: Lcom/android/server/NotificationManagerService;->updateNotificationPulse()V
    invoke-static/range {v18 .. v18}, Lcom/android/server/NotificationManagerService;->access$1200(Lcom/android/server/NotificationManagerService;)V

    goto/16 :goto_4

    .restart local v4       #N:I
    .restart local v8       #i:I
    :cond_e
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v18, v0

    #calls: Lcom/android/server/NotificationManagerService;->updateLightsLocked()V
    invoke-static/range {v18 .. v18}, Lcom/android/server/NotificationManagerService;->access$1000(Lcom/android/server/NotificationManagerService;)V

    monitor-exit v19

    goto/16 :goto_3

    .end local v4           #N:I
    .end local v8           #i:I
    :catchall_0
    move-exception v18

    monitor-exit v19
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v18
.end method
