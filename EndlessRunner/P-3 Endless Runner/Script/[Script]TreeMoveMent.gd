extends Sprite2D

func _process(delta):
	self.position.y += 1
	if self.position.y >= 512:
		self.position.y = -128
