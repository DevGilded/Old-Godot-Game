extends Node2D

var map = []
var height : int = 10
var weight : int = 10

func _ready():
	randomize()
	for y in height:
		map.append([])
		for x in weight:
			map.back().append(randi_range(0,1))
	print(map)
