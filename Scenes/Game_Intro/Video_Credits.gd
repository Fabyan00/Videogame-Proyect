extends Control

func _on_Credits_finished():
	$Read_Credits.start()

func _on_Read_Credits_timeout():
	get_tree().change_scene("res://Scenes/Final/Final_Credits.tscn")
	$".".queue_free()
