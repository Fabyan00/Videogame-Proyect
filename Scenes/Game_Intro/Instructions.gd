extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Game_Intro/Menu.tscn")
	$".".queue_free()
