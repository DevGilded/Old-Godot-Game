extends Control

var UserN : String = "Admin"
var UserP : String  = "123"

onready var InputN = $UiPos/HPos/UiPos/Ui/LnEdtName
onready var InputP = $UiPos/HPos/UiPos/Ui/LnEdtPass
onready var EnterU = $UiPos/HPos/UiPos/Ui/LoginUi/Button
onready var AnimPy = $AnimPlayer

func _ready():
	AnimPy.play("RESET")

func _on_Anim_Done(anim_name):
	if anim_name == "Fade":
		$UiPos.visible = false

func _on_Button_pressed():
	if EnterU.pressed:
		if InputN.text == UserN:
			if InputP.text == UserP:
				AnimPy.play("Fade")
			else:
				print("Fail Pass")
		else:
			print("Fail Name")
