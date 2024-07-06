extends Area2D

func _ready():
	var NewCollision = CollisionShape2D.new()
	var NewRectShape2D = RectangleShape2D.new()
	NewRectShape2D.extents = Vector2(288,36)
	NewCollision.shape = NewRectShape2D
	NewCollision.position = Vector2(288,204)
	call_deferred("add_child", NewCollision)
