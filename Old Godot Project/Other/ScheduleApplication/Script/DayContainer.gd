extends Control

export var DayNumber = ""
export var IfDay     = false
export var IsToday   = false

onready var Text = $Label
onready var Default = $Default
onready var Today = $Today

func _ready():
	if IfDay:
		Text.text = str(DayNumber)
	if IsToday:
		Today.visible = true
	else:
		Default.visible = true
