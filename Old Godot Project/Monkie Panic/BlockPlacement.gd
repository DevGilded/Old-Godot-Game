extends TileMap

var tileSize : Vector2 = self.cell_size

onready var sprite = $Sprite

func _process(_delta):
	var mousePosition = GlobalVariable.grid_mousePosition(get_global_mouse_position(), tileSize)
	if get_cellv(mousePosition) >= 0:
		sprite.modulate = "ff0000"
	else:
		sprite.modulate = "ffffff"
	sprite.position = mousePosition * tileSize

func _input(_event):
	if Input.is_mouse_button_pressed(2):
		set_cellv(GlobalVariable.grid_mousePosition(get_global_mouse_position(), tileSize), -1)
	if Input.is_mouse_button_pressed(1):
		if get_cellv(GlobalVariable.grid_mousePosition(get_global_mouse_position(), tileSize)) == 0:
			set_cellv(GlobalVariable.grid_mousePosition(get_global_mouse_position(), tileSize), 1)
