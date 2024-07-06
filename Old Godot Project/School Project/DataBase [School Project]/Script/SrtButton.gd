extends VBoxContainer

export var SetButtonName = ""

func _ready():
	var BttnName = $Button
	BttnName.text = SetButtonName


func _on_Button_pressed():
	pass # Replace with function body.
