extends TextureButton

func OnClick() -> void:
	if get_tree().change_scene("res://Scene/Main.tscn") != OK:
		print("An unexpected error occured when trying to switch to the Readme scene")
