extends Node

#self.position = Vector2((WallSize * SpriteSize), (WallSize * SpriteSize))
#yield(get_tree(), "idle_frame")

onready var MazeAtlas = preload("res://Assets/Texture/Maze_Algorithm_Atlas.png")

export var Height : int;
export var Width  : int;

var WallSize = 1
var PathSize = 2
var CellSize = PathSize + WallSize
var SpriteSize = 8
var unvisited = []
var stack = []
var cardinal = Vector2(0,0)
var current
var cell_walls = {
	Vector2( 0, -1): N, 
	Vector2( 1,  0): E, 
	Vector2( 0,  1): S, 
	Vector2(-1,  0): W
}
enum {
	N = 1
	E = 2
	S = 4
	W = 8
}

func _ready():
	randomize()
	current = Vector2(randi() % Width,randi() % Height)
	for Y in Height:
		for X in Width:
			for y in CellSize:
				for x in CellSize:
					var i = (x + (X * CellSize)) * SpriteSize
					var j = (y + (Y * CellSize)) * SpriteSize
					if y < PathSize and x < PathSize:
						SpawnMAA(Vector2(i,j),"Connect")

func _input(_event):
	if Input.is_action_just_pressed("ui_accept"):
		DrawMaze(Height, Width)

func CheckNeighbour(CELL, UNVISITED):
	var list = []
	for n in cell_walls.keys():
		if CELL + n in UNVISITED:
			list.append(CELL + n)
	return list
func DrawMaze(height : int, width : int):
	for y in height:
		for x in width:
			unvisited.append(Vector2(x,y))
	unvisited.erase(current)
	while unvisited:
		var neighbours = CheckNeighbour(current, unvisited)
		if neighbours.size() > 0:
			var nextcell = neighbours[randi() % neighbours.size()]
			stack.append(current)
			CELLBLOCK(current, cardinal)
			CELLBLOCK(nextcell, cardinal)
			cardinal = nextcell - current
			current = nextcell
			unvisited.erase(current)
		elif stack:
			current = stack.pop_back()
		yield(get_tree(), "idle_frame")

func CELLBLOCK(POSITION : Vector2, CARDINAL : Vector2):
	var offset = POSITION * CellSize
	for y in CellSize:
		for x in CellSize:
			var X = (x + offset[0]) * SpriteSize
			var Y = (y + offset[1]) * SpriteSize
			if x != (CellSize - WallSize) or y != (CellSize - WallSize):
				if CARDINAL == Vector2( 0,  1) and y == (CellSize - WallSize) and POSITION[0] <= Height:
					SpawnMAA(Vector2(X,Y),"Connect")
					print("East")
				if CARDINAL == Vector2( 1,  0) and x == (CellSize - WallSize) and POSITION[1] <= Width:
					SpawnMAA(Vector2(X,Y),"Connect")
					print("South")
				
				if CARDINAL == Vector2( 0, -1) and y == (CellSize - WallSize) and POSITION[0] >= 0:
					SpawnMAA(Vector2(X,Y),"Connect")
					print("North")
				if CARDINAL == Vector2(-1,  0) and x == (CellSize - WallSize) and POSITION[1] >= 0:
					SpawnMAA(Vector2(X,Y),"Connect")
					print("West")
func SpawnMAA(POSITION : Vector2, Atlas : String):
	var N = Sprite.new()
	N.texture = MazeAtlas
	N.centered = false
	N.hframes = 5
	match Atlas:
		"Wall":
			N.frame = 4
		"Path":
			N.frame = 3
		"Connect":
			N.frame = 2
		"BackTrack":
			N.frame = 1
		"Goal":
			N.frame = 0
		_:
			"Invaled Atlas"
	N.position = POSITION
	call_deferred("add_child", N)
