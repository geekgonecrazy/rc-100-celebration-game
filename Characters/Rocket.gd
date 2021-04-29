extends KinematicBody2D

var Bullet = preload("res://Characters/Bullet.tscn")

var speed = 50
var velocity = Vector2.ZERO

func _physics_process(_delta):
	if Input.is_action_pressed("right"):
		velocity.x = speed
	elif Input.is_action_pressed("left"):
		velocity.x = -speed
	else:
		velocity.x = 0
		
	move_and_slide(velocity)
	
	if Input.is_action_just_pressed("shot"):
		shoot()

func shoot():
	print('shooting')
	$Shot.play()
	# "Muzzle" is a Position2D placed at the barrel of the gun.
	var b = Bullet.instance()
	owner.add_child(b)
	b.transform = $Muzzle.global_transform
