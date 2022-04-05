extends Node2D

#VARIABLES
var ambientSound = preload("res://Assets/Audio/Background_Scenes_Sound.ogg")
var rainSound = preload("res://Assets/Audio/rain-thunder.ogg")
# Called when the node enters the scene tree for the first time.

func _ready():
	$BackgroundAudio.play()
	$Mouse_Pointer.emitting = true

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Top_Level/Room_Scene.tscn")
	AmbientationBackground.backgroundMusic(ambientSound)
	RainBackgroundSound.backgroundRainEffect(rainSound)

func _on_Exit_pressed():
	$".".get_tree().quit()

func _on_Instructions_pressed():
	get_tree().change_scene("res://Scenes/Game_Intro/Instructions.tscn")

#func _on_BackgroundAudio_finished():
#	$BackgroundAudio.play()

func _input(event):
   # Mouse in viewport coordinates.
	if event is InputEventMouseMotion:
		$Mouse_Pointer.global_position = event.position

func botones():
	if !$Control/Start.is_hovered():
		$Control/Start.flat = true
	else:
		$Control/Start.flat = false
	
	if !$Control/Instructions.is_hovered():
		$Control/Instructions.flat = true
	else:
		$Control/Instructions.flat = false
	
	if !$Control/Exit.is_hovered():
		$Control/Exit.flat = true
	else:
		$Control/Exit.flat = false

func _physics_process(delta):
	botones()
