extends KinematicBody2D

var velocidad = 250 #Velocidad del personaje
var movimiento = Vector2() #Vector de movimiento de la velocidad
var con_slide = true #Variable para cambiar entre move_and_slide() y move_and_collide()
var arma = false #Variable que nos permite poner y quitar sprite de personaje con arma
#Cargamos escena de vala para instanciarla
var dispara_bala = preload("res://Scenes/Objects/Gun_Bullet.tscn")
var dir = false

func _ready():
	self.global_position = Global.player_initial_map_position

#Funcion para escuchar eventos del teclado
func get_input():
	movimiento = Vector2() #Asignamos vector de movimiento
	if Input.is_action_pressed('ui_right'):
			dir = false
			$Player.flip_h = false #Si el personaje gira a la derecha
			movimiento.x += 1
	if Input.is_action_pressed('ui_left'):
			dir = true
			$Player.flip_h = true #Si el personaje gira a la izquierda
			movimiento.x -= 1
	if Input.is_action_pressed('ui_down'): #Si el personaje va hacia abajo
			movimiento.y += 1
	if Input.is_action_pressed('ui_up'): #Si el personaje va hacia arriba
			movimiento.y -= 1

	#Normalizamos velocidad para desplazamiento en diagonal
	movimiento = movimiento.normalized() * velocidad

	#Verificamos si el jugador porta o guarda el arma, cuando la consiga
	if Input.is_action_just_pressed("TakeGun"):
		arma = !arma

	#Verificamos que el personaje este en movimiento
	if movimiento.x != 0 || movimiento.y != 0:
		$Player.playing = true #Iniciamos las animaciones
		if arma: #Verificamos que el personaje tenga o no arma para cambiar al sprite correspondiente
			$Player.animation = "Main_Character_Gun_Walking"#Sprite del personaje cuando esta moviendose y tiene arma
		else:
			$Player.animation = "Main_Character_Walking" #Sprite del personaje cuando esta moviendose y no tiene arma
	else: #Si no está en movimiento verificamos que tenga o no arma
		if arma:
			$Player.animation = "Main_Character_Shooting" #Sprite del personaje cuando está quieto y tiene arma
			#Verificamos que tenga arma y que se haya presionado F (disparo)
			if Input.is_action_just_pressed("Shoot"):
				$Player.animation = "Main_Character_Shooting"
				
				shoot() #Funcion que genera la bala y realiza el disparo
		else:
			$Player.animation = "Main_Character_Idle" #Sprite del personaje cuando está quieto y no tiene arma
			#$Shoot_SoundEffect.volume_db = -80
		$Steps_SoundEffect.pitch_scale = rand_range(0.8, 1.2) #Modulacion del sonido de los efectos de pasos del personaje
		$Steps_SoundEffect.play() #Efecto de sonido de pasos del personaje

#Funcion para generar la bala y animar el disparo del arma del personaje
func shoot():
	var bala = dispara_bala.instance() #Instanciamos la bala
	$AudioStreamPlayer.play()
	if($Player.flip_h == true):
		bala.inicio($Player/Gun_Flipped.global_position, dir)
	else:
		bala.inicio($Player/Gun_Sight.global_position, dir) #Iniciamos valores de posicion para generar el disparo
	get_parent().add_child(bala) #Agregamos la escena de la bala

func _physics_process(delta):
	get_input()
	if con_slide:
		move_and_slide(movimiento)
	else:
		move_and_collide(movimiento * delta)
