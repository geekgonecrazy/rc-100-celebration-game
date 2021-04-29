extends KinematicBody2D
class_name Mob

signal removed
signal score

var Bullet = preload("res://Characters/Alien_Bullet.tscn")

var speed = 50
var velocity = Vector2()
	
func _ready():
	add_to_group("alien")
	
	$FireTimer.start()
	#rotation = rand_range(0, 2*PI)
	
	
func _physics_process(delta):
	velocity = transform.x * speed
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal).rotated(rand_range(-PI/4, PI/4))
	rotation = velocity.angle()

func die():
	print("hit!")
	
	$FireTimer.stop()
	
	emit_signal("score")
	queue_free()


func _on_FireTimer_timeout():
	fire()
	
func fire():
	print('firing')
	var b = Bullet.instance()
	get_tree().get_root().add_child(b)
	b.transform = $Muzzle.global_transform
