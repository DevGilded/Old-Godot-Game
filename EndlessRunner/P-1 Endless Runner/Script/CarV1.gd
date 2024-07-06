extends CharacterBody2D

var speed = 48

func _process(delta):
	if Input.is_action_just_pressed("ui_right"):
		position.x += speed
	if Input.is_action_just_pressed("ui_left"):
		position.x -= speed
