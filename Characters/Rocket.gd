extends KinematicBody2D

var speed = 300
var velocity = Vector2.ZERO
onready var vp_size = get_viewport().size

func _physics_process(delta):
    if Input.is_action_pressed("right"):
        velocity.x = speed * delta * 100
    elif Input.is_action_pressed("left"):
        velocity.x = -speed * delta * 100
    else:
        velocity.x = lerp(velocity.x, 0, 0.2)

    position.x = clamp(position.x, 30, vp_size.x - 30)

    move_and_slide(velocity)
