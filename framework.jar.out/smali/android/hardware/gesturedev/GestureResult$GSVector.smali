.class public Landroid/hardware/gesturedev/GestureResult$GSVector;
.super Ljava/lang/Object;
.source "GestureResult.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/hardware/gesturedev/GestureResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "GSVector"
.end annotation


# instance fields
.field public error:F

.field public x:F

.field public y:F

.field public z:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    iput v0, p0, Landroid/hardware/gesturedev/GestureResult$GSVector;->x:F

    iput v0, p0, Landroid/hardware/gesturedev/GestureResult$GSVector;->y:F

    iput v0, p0, Landroid/hardware/gesturedev/GestureResult$GSVector;->z:F

    iput v0, p0, Landroid/hardware/gesturedev/GestureResult$GSVector;->error:F

    return-void
.end method
