extends Sprite2D

var Roads = [
	preload("res://Resource/Sprite/Road/Road1.png"),
	preload("res://Resource/Sprite/Road/Road2.png"),
	preload("res://Resource/Sprite/Road/Road3.png"),
	preload("res://Resource/Sprite/Road/Road4.png"),
	preload("res://Resource/Sprite/Road/Road5.png"),
	preload("res://Resource/Sprite/Road/Road6.png")
]

func _process(delta):
	self.position.y += 1
	if self.position.y >= 480:
		ChangeTexture()
		self.position.y = -32

func ChangeTexture():
	randomize()
	var Rnd = randi() % 5
	self.texture = Roads[Rnd]
