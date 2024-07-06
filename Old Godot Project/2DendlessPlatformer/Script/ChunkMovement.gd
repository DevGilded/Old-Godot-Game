extends Node2D

func _process(delta):
	self.position.x -= GlobalVariable.speed * delta
