.class public Landroid/hardware/gesturedev/GestureParameters$CoordinateRange;
.super Ljava/lang/Object;
.source "GestureParameters.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/hardware/gesturedev/GestureParameters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CoordinateRange"
.end annotation


# instance fields
.field public x_max:F

.field public x_min:F

.field public y_max:F

.field public y_min:F

.field public z_max:F

.field public z_min:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    iput v0, p0, Landroid/hardware/gesturedev/GestureParameters$CoordinateRange;->x_min:F

    iput v0, p0, Landroid/hardware/gesturedev/GestureParameters$CoordinateRange;->x_max:F

    iput v0, p0, Landroid/hardware/gesturedev/GestureParameters$CoordinateRange;->y_min:F

    iput v0, p0, Landroid/hardware/gesturedev/GestureParameters$CoordinateRange;->y_max:F

    iput v0, p0, Landroid/hardware/gesturedev/GestureParameters$CoordinateRange;->z_min:F

    iput v0, p0, Landroid/hardware/gesturedev/GestureParameters$CoordinateRange;->z_max:F

    return-void
.end method

.method public constructor <init>(FFFFFF)V
    .locals 1
    .parameter "x_min"
    .parameter "x_max"
    .parameter "y_min"
    .parameter "y_max"
    .parameter "z_min"
    .parameter "z_max"

    .prologue
    const/4 v0, 0x0

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    iput v0, p0, Landroid/hardware/gesturedev/GestureParameters$CoordinateRange;->x_min:F

    iput v0, p0, Landroid/hardware/gesturedev/GestureParameters$CoordinateRange;->x_max:F

    iput v0, p0, Landroid/hardware/gesturedev/GestureParameters$CoordinateRange;->y_min:F

    iput v0, p0, Landroid/hardware/gesturedev/GestureParameters$CoordinateRange;->y_max:F

    iput v0, p0, Landroid/hardware/gesturedev/GestureParameters$CoordinateRange;->z_min:F

    iput v0, p0, Landroid/hardware/gesturedev/GestureParameters$CoordinateRange;->z_max:F

    iput p1, p0, Landroid/hardware/gesturedev/GestureParameters$CoordinateRange;->x_min:F

    iput p2, p0, Landroid/hardware/gesturedev/GestureParameters$CoordinateRange;->x_max:F

    iput p3, p0, Landroid/hardware/gesturedev/GestureParameters$CoordinateRange;->y_min:F

    iput p4, p0, Landroid/hardware/gesturedev/GestureParameters$CoordinateRange;->y_max:F

    iput p5, p0, Landroid/hardware/gesturedev/GestureParameters$CoordinateRange;->z_min:F

    iput p6, p0, Landroid/hardware/gesturedev/GestureParameters$CoordinateRange;->z_max:F

    return-void
.end method
