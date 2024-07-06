extends Control

onready var UiState = $BarUi/TopBar/ButtonTextur
onready var Anim = $AnimPlayer
onready var Layer = $BarUi/Layer
var UiButton = preload("res://Scene/ScnButton.tscn")

export(Array, String, FILE, "*tscn") var ButtonAmount = []
export(Array, String) var ButtonName = []

func _ready():
	var BA = ButtonAmount.size()
	var BN = ButtonName.size()
	if ButtonAmount:
		if ButtonName > ButtonAmount:
			for ButtonAmount in BA:
				var NwBttn = UiButton.instance()
				NwBttn.SetButtonName = ButtonName[ButtonAmount]
				Layer.add_child(NwBttn)
		else:
			print("Some Button Dont Have A Name")
			return
	UiState.pressed = true
	Anim.play("RESET")

func _on_MenuBttn_pressed():
	if UiState.pressed:
		Anim.play("Open")
	else:
		Anim.play("Close")
