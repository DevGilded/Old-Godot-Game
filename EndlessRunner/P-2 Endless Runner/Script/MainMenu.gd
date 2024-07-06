extends Control

func _on_Button_toggled(button_pressed) -> void:
	if button_pressed:
		get_tree().change_scene_to_file("res://Scene/Main.tscn")
