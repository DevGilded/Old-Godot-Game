extends Node2D

func _input(_event):
	if Input.is_action_just_pressed("ui_right"):
		self.position.x += 16
	if Input.is_action_just_pressed("ui_left"):
		self.position.x -= 16
	if Input.is_action_just_pressed("ui_up"):
		self.position.y -= 16
	if Input.is_action_just_pressed("ui_down"):
		self.position.y += 16
