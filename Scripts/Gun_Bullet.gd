extends KinematicBody2D

#Declaracion de variables
var velocidad = 350 #Velocidad de la bala
var movimiento = Vector2() #Vector de movimiento de la bala

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func inicio(posicion_inicial, move):
	if move == true:
		position = posicion_inicial
		movimiento = Vector2(-velocidad, 0)
	else:
		position = posicion_inicial
		movimiento = Vector2(velocidad, 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_and_collide(movimiento * delta)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()



