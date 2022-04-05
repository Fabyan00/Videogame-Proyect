extends Node2D

const loadEnemy = preload("res://Assets/enemy/Enemy.tscn")

func _ready():
	$Dialog.hide()
	if Global.bul == false: 
		#Make instance
		var GrabedInstance= loadEnemy.instance()
		#Attach it to the tree
		GrabedInstance.position = Vector2(830,450)
		self.add_child(GrabedInstance)

func _on_Picture_body_entered(body):
	$Dialog.text = str("I've always hated that painting.")
	$Dialog.show()
	$HideDialog.start()

func _on_HideDialog_timeout():
	$Dialog.hide()

func _on_Door_body_entered(body):
	$Dialog.text = str("It's locked.")
	$Dialog.show()
	$HideDialog.start()
