extends Button

func _on_Option_pressed() -> void:
	if get_tree().change_scene("res://Scene/Option.tscn") != OK:
		print("An unexpected error occured when trying to switch to the Readme scene")

func OnHoverEnter():
	self.rect_position.y += 4


func OnHoverExit():
	self.rect_position.y -= 4
