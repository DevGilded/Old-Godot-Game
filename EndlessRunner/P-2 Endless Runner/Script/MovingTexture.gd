extends Sprite2D

signal Spawn()

func Load():
	var N = Sprite2D.new()
	N.texture = preload("res://Resource/Sprite/ParallaxTree.png")
	N.position.y = -64

func _process(delta):
	self.position.y += 1
	if self.position.y >= 272:
		call_deferred("queue_free")
	elif self.position.y >= 0 and self.position.y <= 0.01:
		emit_signal("Spawn")
