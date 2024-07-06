extends Node2D

func _ready():
	print('Program Runned')

func _unhandled_key_input(event):
	if event.is_pressed():
		if event.as_text() == 'Escape':
			get_tree().quit()
