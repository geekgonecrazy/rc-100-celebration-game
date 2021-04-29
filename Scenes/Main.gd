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
	score = score+1
	$Score.text = str(score)

func _on_SpawnTimer_timeout():
	print("spawn timeout hit!")
	spawn_alien()
	
func spawn_alien():
	var b = Alien.instance()

	b.position = spawnpoint
	b.connect("score", self, "increment_score")
	
	add_child(b)
