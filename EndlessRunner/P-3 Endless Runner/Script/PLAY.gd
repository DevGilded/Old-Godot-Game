extends Button

func _OnPressedCall():
	self.disabled = true
	get_tree().change_scene_to_file("res://Scene/GamePlay.tscn")
