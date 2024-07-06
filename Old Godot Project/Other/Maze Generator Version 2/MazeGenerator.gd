extends Node2D

export var Height : int
export var Widht  : int

enum {
	N = 1,
	E = 2,
	S = 4,
	W = 8
}
var cell_walls = {
	Vector2(0, -1): N, 
	Vector2(1, 0): E, 
	Vector2(0, 1): S,
	Vector2(-1, 0): W}
var SpriteSize = 8
var PathSize = 3
var WallSize = 2
var StartingPosition = Vector2(0,0)

onready var PROTOTYPESPRITE = preload("res://PrototypeBlock.png")

func _ready():
	MakeMaze()

func check_neighbors(cell, unvisited):
	# returns an array of cell's unvisited neighbors
	var list = []
	for n in cell_walls.keys():
		if cell + n in unvisited:
			list.append(cell + n)
	return list

func MakeMaze():
	var list = []
	for y in Height:
		for x in Widht:
			list.append(Vector2(x,y))
	var current = list.front()
	while list:
		BuildPath(current)
		print(current)
		list.erase(current)
		current = list.front()
		yield(get_tree(), "idle_frame")

func BuildPath(POSITION : Vector2):
	for celly in (PathSize + WallSize):
		for cellx in (PathSize + WallSize):
			var X = (cellx+(POSITION[0] * (PathSize + WallSize))) * SpriteSize
			var Y = (celly+(POSITION[1] * (PathSize + WallSize))) * SpriteSize
			if cellx <= WallSize or celly <= WallSize:
				if cellx >= PathSize:
					CreateSprite(Vector2(X,Y), "White")
				if celly >= PathSize:
					CreateSprite(Vector2(X,Y), "White")

func CreateSprite(POSITION : Vector2, SPRITETYPE : String) -> void:
	var S = Sprite.new()
	S.centered = false
	S.hframes = 5
	S.texture = PROTOTYPESPRITE
	S.position = POSITION
	match SPRITETYPE:
		"White":
			S.frame = 3
			call_deferred("add_child", S)
		"Black":
			S.frame = 4
			call_deferred("add_child", S)
		"Green":
			S.frame = 1
			call_deferred("add_child", S)
		"Blue":
			S.frame = 2
			call_deferred("add_child", S)
		"Gold":
			S.frame = 0
			call_deferred("add_child", S)
		_:
			print("Invalid Sprite Type Chose Between [ White | Black | Green | Blue | Gold ]")
