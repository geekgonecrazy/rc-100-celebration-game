extends KinematicBody2D

signal health_change(change)

var Bullet = preload("res://Characters/Bullet.tscn")

var health = 100

var speed = 400
var velocity = Vector2.ZERO
onready var vp_size = get_viewport().size
onready var play_area_size = get_viewport().get_visible_rect().size

func _ready():
	pass

func _physics_process(_delta):
	if Input.is_action_pressed("right"):
		velocity.x = speed
	elif Input.is_action_pressed("left"):
		velocity.x = -speed
	else:
		velocity.x = lerp(velocity.x, 0, 0.2)

	move_and_slide(velocity)
	
	if Input.is_action_just_pressed("shot"):
		shoot()

func shoot():
	print('shooting')
	$ShotSound.play()
	# "Muzzle" is a Position2D placed at the barrel of the gun.
	var b = Bullet.instance()
	owner.add_child(b)
	b.transform = $Muzzle.global_transform
	
func hit():
	print('ouch')
	
	health = health - 10
	emit_signal("health_change", health)
	
	if health <= 0:
		print('dead!')
		queue_free()
		get_tree().change_scene("res://Scenes/Died.tscn")
