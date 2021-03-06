extends Node2D

var Alien = preload("res://Characters/Alien.tscn")

var spawnpoint = Vector2(10, 30)

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Score.text = str(score)
	
	spawn_alien()
	
	$SpawnTimer.start()
	
func increment_score():
	print("incrementing score!")
	$PointSound.play()
	score = score+5
	$Score.text = str(score)
	
	if score >= 100:
		get_tree().change_scene("res://Scenes/Win.tscn")

func _on_SpawnTimer_timeout():
	print("spawn timeout hit!")
	spawn_alien()
	
func spawn_alien():
	var b = Alien.instance()

	b.speed = rand_range(50, 200)
	$SpawnTimer.wait_time = rand_range(1, 3)
	b.position = spawnpoint
	b.connect("score", self, "increment_score")
	
	add_child(b)
