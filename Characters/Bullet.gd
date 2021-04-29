extends Area2D

var speed = 750

onready var play_area_size = get_viewport().get_visible_rect().size

func _physics_process(delta):
	position += transform.x * speed * delta

	# lets be responsible and clean up our bullets
	if position.y <= 0:
		queue_free()
	

func _on_Bullet_body_entered(body):
	if body.is_in_group("alien"):
		if body.has_method('die'):
			body.die()
			queue_free()
