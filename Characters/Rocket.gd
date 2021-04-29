extends KinematicBody2D

var speed = 400
var velocity = Vector2.ZERO
onready var vp_size = get_viewport().size

func _physics_process(_delta):
    if Input.is_action_pressed("right"):
        velocity.x = speed
    elif Input.is_action_pressed("left"):
        velocity.x = -speed
    else:
        velocity.x = lerp(velocity.x, 0, 0.2)

    position.x = clamp(position.x, 30, vp_size.x - 30)

    move_and_slide(velocity)
