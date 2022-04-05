extends Area2D


func _on_Node2D_body_entered(body):
		Global._prueba()
		_sound()


func _sound():
		$AudioStreamPlayer.play()
		$AudioStreamPlayer.stop()
		self.hide()

func _on_Timer_timeout():
	$AudioStreamPlayer.volume_db = -180
	self.queue_free()
