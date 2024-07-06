extends Node

var Ypos = -32
var Sctp = preload("res://Script/[Script]RoadMovement.gd")

var Roads = [
	preload("res://Resource/Sprite/Road/Road1.png"),
	preload("res://Resource/Sprite/Road/Road2.png"),
	preload("res://Resource/Sprite/Road/Road3.png"),
	preload("res://Resource/Sprite/Road/Road4.png"),
	preload("res://Resource/Sprite/Road/Road5.png"),
	preload("res://Resource/Sprite/Road/Road6.png")
]

func _ready():
	randomize()
	for i in 16:
		var Rnd = randi() % 5
		var N = Sprite2D.new()
		N.centered   = false
		N.position.y = Ypos
		N.texture    = Roads[Rnd]
		Ypos         = Ypos + 32
		N.set_script(Sctp)
		call_deferred("add_child", N)
