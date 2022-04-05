extends Node2D
var cover = preload("res://Scenes/Final/Seasson2_Cover.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	$"ALONE IN THE DARK 2".hide()
	$Message.hide()
	$Seasson2.hide()
	$Control.hide()

func _on_ShowCover_timeout():
	$"ALONE IN THE DARK 2".show()

func _on_Show_Labels_timeout():
	$Sound_Background.play()
	$Message.show()

func _on_Show_CommingSoon_timeout():
	$Seasson2.show()

func _on_Show_Controls_timeout():
	$Control.show()

func _on_Quit_pressed():
	get_tree().quit()
