.class public Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;
.super Ljava/lang/Object;
.source "IccCardApplicationStatus.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;,
        Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;,
        Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;
    }
.end annotation


# instance fields
.field public aid:Ljava/lang/String;

.field public app_label:Ljava/lang/String;

.field public app_state:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;

.field public app_type:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

.field public perso_substate:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

.field public pin1:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

.field public pin1_replaced:I

.field public pin2:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static AppStateFromRILInt(I)Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;
    .locals 4
    .parameter "state"

    .prologue
    packed-switch p0, :pswitch_data_0

    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unrecognized RIL_AppState: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    :pswitch_0
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;->APPSTATE_UNKNOWN:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;

    .local v0, newState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;
    :goto_0
    return-object v0

    .end local v0           #newState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;
    :pswitch_1
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;->APPSTATE_DETECTED:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;

    .restart local v0       #newState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;
    goto :goto_0

    .end local v0           #newState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;
    :pswitch_2
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;->APPSTATE_PIN:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;

    .restart local v0       #newState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;
    goto :goto_0

    .end local v0           #newState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;
    :pswitch_3
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;->APPSTATE_PUK:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;

    .restart local v0       #newState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;
    goto :goto_0

    .end local v0           #newState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;
    :pswitch_4
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;->APPSTATE_SUBSCRIPTION_PERSO:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;

    .restart local v0       #newState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;
    goto :goto_0

    .end local v0           #newState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;
    :pswitch_5
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;->APPSTATE_READY:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;

    .restart local v0       #newState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;
    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method public static AppTypeFromRILInt(I)Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;
    .locals 4
    .parameter "type"

    .prologue
    packed-switch p0, :pswitch_data_0

    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unrecognized RIL_AppType: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    :pswitch_0
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;->APPTYPE_UNKNOWN:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    .local v0, newType:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;
    :goto_0
    return-object v0

    .end local v0           #newType:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;
    :pswitch_1
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;->APPTYPE_SIM:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    .restart local v0       #newType:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;
    goto :goto_0

    .end local v0           #newType:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;
    :pswitch_2
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;->APPTYPE_USIM:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    .restart local v0       #newType:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;
    goto :goto_0

    .end local v0           #newType:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;
    :pswitch_3
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;->APPTYPE_RUIM:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    .restart local v0       #newType:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;
    goto :goto_0

    .end local v0           #newType:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;
    :pswitch_4
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;->APPTYPE_CSIM:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    .restart local v0       #newType:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;
    goto :goto_0

    .end local v0           #newType:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;
    :pswitch_5
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;->APPTYPE_ISIM:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    .restart local v0       #newType:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;
    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method public static PersoSubstateFromRILInt(I)Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    .locals 4
    .parameter "substate"

    .prologue
    packed-switch p0, :pswitch_data_0

    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unrecognized RIL_PersoSubstate: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    :pswitch_0
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;->PERSOSUBSTATE_UNKNOWN:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .local v0, newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    :goto_0
    return-object v0

    .end local v0           #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    :pswitch_1
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;->PERSOSUBSTATE_IN_PROGRESS:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .restart local v0       #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    goto :goto_0

    .end local v0           #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    :pswitch_2
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;->PERSOSUBSTATE_READY:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .restart local v0       #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    goto :goto_0

    .end local v0           #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    :pswitch_3
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;->PERSOSUBSTATE_SIM_NETWORK:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .restart local v0       #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    goto :goto_0

    .end local v0           #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    :pswitch_4
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;->PERSOSUBSTATE_SIM_NETWORK_SUBSET:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .restart local v0       #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    goto :goto_0

    .end local v0           #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    :pswitch_5
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;->PERSOSUBSTATE_SIM_CORPORATE:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .restart local v0       #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    goto :goto_0

    .end local v0           #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    :pswitch_6
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;->PERSOSUBSTATE_SIM_SERVICE_PROVIDER:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .restart local v0       #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    goto :goto_0

    .end local v0           #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    :pswitch_7
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;->PERSOSUBSTATE_SIM_SIM:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .restart local v0       #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    goto :goto_0

    .end local v0           #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    :pswitch_8
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;->PERSOSUBSTATE_SIM_NETWORK_PUK:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .restart local v0       #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    goto :goto_0

    .end local v0           #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    :pswitch_9
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;->PERSOSUBSTATE_SIM_NETWORK_SUBSET_PUK:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .restart local v0       #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    goto :goto_0

    .end local v0           #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    :pswitch_a
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;->PERSOSUBSTATE_SIM_CORPORATE_PUK:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .restart local v0       #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    goto :goto_0

    .end local v0           #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    :pswitch_b
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;->PERSOSUBSTATE_SIM_SERVICE_PROVIDER_PUK:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .restart local v0       #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    goto :goto_0

    .end local v0           #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    :pswitch_c
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;->PERSOSUBSTATE_SIM_SIM_PUK:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .restart local v0       #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    goto :goto_0

    .end local v0           #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    :pswitch_d
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;->PERSOSUBSTATE_RUIM_NETWORK1:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .restart local v0       #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    goto :goto_0

    .end local v0           #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    :pswitch_e
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;->PERSOSUBSTATE_RUIM_NETWORK2:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .restart local v0       #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    goto :goto_0

    .end local v0           #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    :pswitch_f
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;->PERSOSUBSTATE_RUIM_HRPD:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .restart local v0       #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    goto :goto_0

    .end local v0           #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    :pswitch_10
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;->PERSOSUBSTATE_RUIM_CORPORATE:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .restart local v0       #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    goto :goto_0

    .end local v0           #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    :pswitch_11
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;->PERSOSUBSTATE_RUIM_SERVICE_PROVIDER:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .restart local v0       #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    goto :goto_0

    .end local v0           #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    :pswitch_12
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;->PERSOSUBSTATE_RUIM_RUIM:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .restart local v0       #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    goto :goto_0

    .end local v0           #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    :pswitch_13
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;->PERSOSUBSTATE_RUIM_NETWORK1_PUK:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .restart local v0       #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    goto :goto_0

    .end local v0           #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    :pswitch_14
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;->PERSOSUBSTATE_RUIM_NETWORK2_PUK:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .restart local v0       #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    goto :goto_0

    .end local v0           #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    :pswitch_15
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;->PERSOSUBSTATE_RUIM_HRPD_PUK:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .restart local v0       #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    goto :goto_0

    .end local v0           #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    :pswitch_16
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;->PERSOSUBSTATE_RUIM_CORPORATE_PUK:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .restart local v0       #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    goto :goto_0

    .end local v0           #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    :pswitch_17
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;->PERSOSUBSTATE_RUIM_SERVICE_PROVIDER_PUK:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .restart local v0       #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    goto :goto_0

    .end local v0           #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    :pswitch_18
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;->PERSOSUBSTATE_RUIM_RUIM_PUK:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .restart local v0       #newSubState:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;
    goto :goto_0

    nop

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
        :pswitch_11
        :pswitch_12
        :pswitch_13
        :pswitch_14
        :pswitch_15
        :pswitch_16
        :pswitch_17
        :pswitch_18
    .end packed-switch
.end method

.method public static PinStateFromRILInt(I)Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;
    .locals 4
    .parameter "state"

    .prologue
    packed-switch p0, :pswitch_data_0

    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unrecognized RIL_PinState: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    :pswitch_0
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;->PINSTATE_UNKNOWN:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    .local v0, newPinState:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;
    :goto_0
    return-object v0

    .end local v0           #newPinState:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;
    :pswitch_1
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;->PINSTATE_ENABLED_NOT_VERIFIED:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    .restart local v0       #newPinState:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;
    goto :goto_0

    .end local v0           #newPinState:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;
    :pswitch_2
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;->PINSTATE_ENABLED_VERIFIED:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    .restart local v0       #newPinState:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;
    goto :goto_0

    .end local v0           #newPinState:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;
    :pswitch_3
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;->PINSTATE_DISABLED:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    .restart local v0       #newPinState:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;
    goto :goto_0

    .end local v0           #newPinState:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;
    :pswitch_4
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;->PINSTATE_ENABLED_BLOCKED:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    .restart local v0       #newPinState:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;
    goto :goto_0

    .end local v0           #newPinState:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;
    :pswitch_5
    sget-object v0, Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;->PINSTATE_ENABLED_PERM_BLOCKED:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    .restart local v0       #newPinState:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;
    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .local v0, sb:Ljava/lang/StringBuilder;
    const-string v1, "{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_type:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_state:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_state:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;

    sget-object v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;->APPSTATE_SUBSCRIPTION_PERSO:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;

    if-ne v1, v2, :cond_0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->perso_substate:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    :cond_0
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_type:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    sget-object v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;->APPTYPE_CSIM:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    if-eq v1, v2, :cond_1

    iget-object v1, p0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_type:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    sget-object v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;->APPTYPE_USIM:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    if-eq v1, v2, :cond_1

    iget-object v1, p0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_type:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    sget-object v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;->APPTYPE_ISIM:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    if-ne v1, v2, :cond_2

    :cond_1
    const-string v1, ",pin1="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin1:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ",pin2="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin2:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    :cond_2
    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
