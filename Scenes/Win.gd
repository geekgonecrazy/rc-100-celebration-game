extends Node2D

func _ready():
	pass

func _on_Replay_pressed():
	get_tree().change_scene("res://Scenes/Main.tscn")
