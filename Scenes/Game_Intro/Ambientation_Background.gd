extends AudioStreamPlayer

func backgroundMusic(music):
	self.stream = music
	self.volume_db = -10
	self.play()
