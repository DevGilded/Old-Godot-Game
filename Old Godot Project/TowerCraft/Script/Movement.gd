extends Camera2D

func _input(event):
	if event and Input.is_action_pressed("w"):
		self.position.y -= 50
	if event and Input.is_action_pressed("a"):
		self.position.x -= 50
	if event and Input.is_action_pressed("s"):
		self.position.y += 50
	if event and Input.is_action_pressed("d"):
		self.position.x += 50
