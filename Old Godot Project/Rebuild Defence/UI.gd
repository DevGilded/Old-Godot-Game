extends Control

var gridSize : Vector2 = Vector2(1,1)
var mousePosition : Vector2

func _process(_delta):
	var MP = GlobalVariable.grid_mousePosition(mousePosition, gridSize)
	$VBoxContainer/HBoxContainer/Label.text = " " + str(MP.x) + " , " + str(MP.y) + " "
