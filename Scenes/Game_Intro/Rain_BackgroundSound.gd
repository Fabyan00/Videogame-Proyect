extends AudioStreamPlayer

func backgroundRainEffect(effect):
	self.stream = effect
	self.volume_db = -15
	self.play()

