extends Node2D

onready var Map = $Map

var MapSize_X = 16
var MapSize_Y = 16

func _ready():
	VisualServer.set_default_clear_color("090a14")
	LoadChunk()

func LoadChunk():
	for y in MapSize_Y:
		for x in MapSize_X:
			yield(get_tree(),"idle_frame")
			Map.set_cell(x,y,0,false,false,false,Vector2(1,1))
			Map.update_bitmask_area(Vector2(x,y))

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		MapSize_X = MapSize_X + 16
		LoadChunk()
