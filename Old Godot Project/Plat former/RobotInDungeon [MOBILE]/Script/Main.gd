extends Node2D

func _physics_process(delta):
	VisualServer.set_default_clear_color(Color.lightblue)
	if Input.is_action_pressed("Exit"):
		get_tree().quit()
	if Input.is_action_pressed("Reset"):
		get_tree().change_scene("res://Scene/Main.tscn")
