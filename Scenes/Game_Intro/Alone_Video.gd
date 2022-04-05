extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_VideoPlayer_finished():
	get_tree().change_scene("res://Scenes/Game_Intro/Menu.tscn")
	$".".queue_free()
