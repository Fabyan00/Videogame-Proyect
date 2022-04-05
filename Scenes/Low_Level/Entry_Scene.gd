extends Node2D

#Load the resourse using preload
const MySmokeResource = preload("res://Assets/enemy/Enemy.tscn")

func _ready():
	$Dialog.hide()
	if Global.bul == false: 
		print("Llave")
		#Make instance
		var GrabedInstance= MySmokeResource.instance()
		#Attach it to the tree
		GrabedInstance.position = Vector2(830,450)
		self.add_child(GrabedInstance)

#OBJECT INTERACTION
#Entry Door
func _on_Object_Int_body_entered(body):
	if Global.key == true:
		$Dialog.text = str("Hmm, seems to be locked, maybe I need a key...")
		$Dialog.show()
		$Hide_Dialog.start()
	if Global.key == false:
		get_tree().change_scene("res://Scenes/Game_Intro/Video_Credits.tscn")
	
	
func _on_Hide_Dialog_timeout():
	$Dialog.hide()
#Dekstop
func _on_Desktop_Int_body_entered(body):
	$Dialog.text = str("I need to clean up this mess...")
	$Dialog.show()
	$Hide_Dialog.start()
#Door
func _on_Area2D_body_entered(body):
	$Dialog.text = str("Locked.")
	$Dialog.show()
	$Hide_Dialog.start()
