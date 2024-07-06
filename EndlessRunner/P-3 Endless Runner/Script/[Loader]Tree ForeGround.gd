extends Node2D

var Ypos = -160
var Ture = preload("res://Resource/Sprite/ParallaxTree.png")
var Sctp = preload("res://Script/[Script]TreeMoveMent.gd")

func _ready():
	for i in 5:
		var N = Sprite2D.new()
		N.centered   = false
		N.position.y = Ypos
		N.texture    = Ture
		Ypos         = Ypos + 128
		N.set_script(Sctp)
		call_deferred("add_child", N)
