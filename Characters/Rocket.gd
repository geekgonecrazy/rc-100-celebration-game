extends KinematicBody2D

var speed = 30
var velocity = Vector2.ZERO

func _physics_process(_delta):
    if Input.is_action_pressed("right"):
        velocity.x = speed
    elif Input.is_action_pressed("left"):
        velocity.x = -speed
    else:
        velocity.x = 0
        
    move_and_slide(velocity)
