extends Node2D

func _ready():
	var i = preload("res://Scene/RoadTexture.tscn").instantiate()
	add_child(i)
