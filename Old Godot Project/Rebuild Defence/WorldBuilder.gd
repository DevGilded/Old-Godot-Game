extends Node2D

export var tilesetTexture : Texture
export var tileAmount : int = 1
export var tileSize : Vector2
export var tileHframes : int = 1
export var tileVframes : int = 1

onready var UI = $CanvasLayer/User/UI
onready var tilemap = $TileMap
onready var sprite = $Sprite

func _ready():
	setTileset()
	setVariable()

func _process(_delta):
	UI.mousePosition = get_global_mouse_position()
	var mousePosition = GlobalVariable.grid_mousePosition(get_global_mouse_position(), tileSize)
	if tilemap.get_cellv(mousePosition) >= 0:
		sprite.modulate = "ff0000"
	else:
		sprite.modulate = "ffffff"
	sprite.position = mousePosition * tileSize

func _input(_event):
	if Input.is_mouse_button_pressed(2):
		tilemap.set_cellv(GlobalVariable.grid_mousePosition(get_global_mouse_position(), tileSize), -1)
	if Input.is_mouse_button_pressed(1):
		if tilemap.get_cellv(GlobalVariable.grid_mousePosition(get_global_mouse_position(), tileSize)) != 0:
			tilemap.set_cellv(GlobalVariable.grid_mousePosition(get_global_mouse_position(), tileSize), 0)

func _draw():
	draw_line(Vector2(-999999999,0), Vector2(999999999,0), "99ff00")
	draw_line(Vector2(0, -999999999), Vector2(0, 999999999), "99ff00")
	draw_line(Vector2(0, 0), Vector2(1048,0), "0099ff")
	draw_line(Vector2(0, 0), Vector2(0, 600), "0099ff")
	draw_line(Vector2(1048, 0), Vector2(1048, 600), "0099ff")
	draw_line(Vector2(0, 600), Vector2(1048, 600), "0099ff")

func setTileset():
	var newTileset = TileSet.new()
	for x in tileHframes:
		for y in tileVframes:
			var tileID = newTileset.get_last_unused_tile_id()
			newTileset.create_tile(tileID)
			newTileset.tile_set_texture(tileID, tilesetTexture)
			newTileset.tile_set_region(tileID, Rect2(Vector2(x, y), tileSize))
	$TileMap.tile_set = newTileset

func setVariable():
	UI.gridSize = tileSize
	tilemap.cell_size = tileSize
	sprite.texture = tilesetTexture
	sprite.hframes = tileHframes
	sprite.vframes = tileVframes
