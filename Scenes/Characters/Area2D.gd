extends Area2D

var velocidad = 250 #Velocidad del personaje
var movimiento = Vector2() #Vector de movimiento de la velocidad
var con_slide = true #Variable para cambiar entre move_and_slide() y move_and_collide()

func _ready():
	self.global_position = Global.player_initial_map_position

func get_input():
	movimiento = Vector2()
	if Input.is_action_pressed('ui_right'):
		$AnimatedSprite.flip_h = false #Si el personaje gira a la derecha
		movimiento.x += 1
	if Input.is_action_pressed('ui_left'):
		$AnimatedSprite.flip_h = true #Si el personaje gira a la izquierda
		movimiento.x -= 1
	if Input.is_action_pressed('ui_down'):
		movimiento.y += 1
	if Input.is_action_pressed('ui_up'):
		movimiento.y -= 1
	movimiento = movimiento.normalized() * velocidad
	
	if movimiento.x != 0 || movimiento.y != 0:
		$AnimatedSprite.animation = "Main_Character_Walking"
		#$KinematicBody2D.flip_h = movimiento.x < 0

	else:
		$AnimatedSprite.animation = "Main_Character_Idle"
		$AudioStreamPlayer2D.pitch_scale = rand_range(0.8, 1.2)
		$AudioStreamPlayer2D.play()

func _physics_process(delta):
	get_input()
	if con_slide:
		move_and_slide(movimiento)
	else:
		move_and_collide(movimiento * delta)
