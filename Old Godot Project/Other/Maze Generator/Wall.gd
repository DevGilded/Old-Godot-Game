extends Node2D

var YPos = 0
var XPos = 0

func _ready():
	self.position = Vector2(XPos, YPos)


func _on_Area2D_area_entered(area):
	if area:
		self.queue_free()
