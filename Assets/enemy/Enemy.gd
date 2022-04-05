extends KinematicBody2D

var Main_Character_Animation = null
var move = Vector2.ZERO
var lives = 2

func _ready():
	$EnemyScream.play()

func _physics_process(delta):
	move = Vector2.ZERO
	if Main_Character_Animation != null:
		move = position.direction_to(Main_Character_Animation.position) 
		$AnimatedSprite.playing = true
		if move.x < 0:
			$AnimatedSprite.flip_h = true 
		else:
			$AnimatedSprite.flip_h = false 
	else: 
		move = Vector2.ZERO
	
	move = move.normalized() * 1.5
	move = move_and_collide(move)
	
	#Mario es pendejo y no sabe diferenciar pero esta es para bajar vida al mounstro

func _on_Area2D_body_entered(body):
	if body != self:
		Main_Character_Animation = body

func _on_Area2D_body_exited(body):
	Main_Character_Animation = null

func _on_Area2D2_body_entered(body):
	Livescounter.lives -= 1

func _on_Area2D3_body_entered(body):
	lives -= 1
	if lives == 0:
		self.queue_free()
