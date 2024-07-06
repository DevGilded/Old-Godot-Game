extends TileMap

var SpawnPoint = calculate_bounds(self).size.y
var Vel = Vector2.ZERO
var ObsSize = self.get_used_rect()

@export var ObstacleMoveSpeed : int = 3

func _ready():
	print(SpawnPoint)
	pass
#	print(calculate_bounds(self))

func _process(delta):
	position += Vector2(0, ObstacleMoveSpeed)
	if position >= Vector2(0, 1024):
		print("Self Destroyed")
		self.queue_free()

func calculate_bounds(tilemap):
	var cell_bounds = tilemap.get_used_rect()
	# create transform
	var cell_to_pixel = Transform2D(Vector2(tilemap.cell_size.x * tilemap.scale.x, 0), Vector2(0, tilemap.cell_size.y * tilemap.scale.y), Vector2())
	# apply transform
	return Rect2(cell_to_pixel * cell_bounds.position, cell_to_pixel * cell_bounds.size)
