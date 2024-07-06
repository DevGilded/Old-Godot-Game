extends Node2D

var number = 47
var temp = 1
var OLD = 1
var NEW = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in number:
		OLD = temp
		temp = NEW
		NEW = OLD + NEW
		print(str(i + 1) + ".) " + str(NEW))
