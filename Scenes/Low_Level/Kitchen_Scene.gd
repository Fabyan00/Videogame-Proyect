extends Node2D


func _ready():
	$Dialog.hide()

#INTERACTION WITH OBJECTS
#Table
func _on_Table_body_entered(body):
	$Dialog.text = str("No time for snacks")
	$Dialog.show()
	$Show_Dialogs.start()
#Stove
func _on_Stove_body_entered(body):
	$Dialog.text = str("Just a stand of plates")
	$Dialog.show()
	$Show_Dialogs.start()

func _on_Show_Dialogs_timeout():
	$Dialog.hide()
