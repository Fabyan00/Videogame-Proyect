extends Node2D

func _ready():
	$Dialog.hide()
	$AudioStreamPlayer.play()
	$AudioStreamPlayer.stop()


func _on_gun_body_entered(body):
	$Dialog.show()
	$Hide_Dialog.start()

func _on_Hide_Dialog_timeout():
	$Dialog.hide()
	$gun.queue_free()
	$Gun.queue_free()
