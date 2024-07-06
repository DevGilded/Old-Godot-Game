extends Node2D

export var Height : int;
export var Width  : int;

var SptSize = 8
var CellBlock = 3
var stack = []
var visited = 0
var maze = []

enum{
	CELL_PATH_N = 0x01,
	CELL_PATH_E = 0x02,
	CELL_PATH_S = 0x04,
	CELL_PATH_W = 0x08,
	CELL_VISITED = 0x10,
	}

# Texture
onready var MazeAtlas = preload("res://Assets/Texture/Maze_Algorithm_Atlas.png")
onready var Wall = preload("res://Wall.tscn")

func _ready():
	randomize()
	maze.resize(Height * Width)
	maze.fill(0x00)
	
	RandoStart()
#	while visited <= (Height * Width):
	CheckNeighbour()
	DrawMaze()
	print(maze)
	print(stack)
	print(visited)

func RandoStart():
	var y = Height # randi() %
	var x = Width
	stack.push_front(Vector2(x,y))
	maze[(y * (Width - 1)) + (x - 1)] = CELL_VISITED
	visited += 1

func CheckStack(x : int, y : int):
	return ((stack.front()[1] + y) * (Width - 1)) + ((stack.front()[0] + x) - 1)
func Position(x : int, y : int):
	return Vector2((stack.front()[0] + x), (stack.front()[1] + y))

func CheckNeighbour():
	var neighbours = []
	
	# North Neighbour
	if stack.front()[1] > 0 && (maze[CheckStack(0, -1)] & CELL_VISITED) == 0:
		neighbours.push_back(0)
	# East Neighbour
	if stack.front()[0] < Width && (maze[CheckStack(1, 0)] & CELL_VISITED) == 0:
		neighbours.push_back(1)
	# South Neighbour
	if stack.front()[1] < Height && (maze[CheckStack(0, 1)] & CELL_VISITED) == 0:
		neighbours.push_back(2)
	# West Neighbour
	if stack.front()[0] > 0 && (maze[CheckStack(-1, 0)] & CELL_VISITED) == 0:
		neighbours.push_back(3)
	
	if !neighbours.empty():
		var Cardinal = neighbours[randi() % neighbours.size()]
		
		match Cardinal:
			#North
			0:
				maze[CheckStack(0, -1)] |= CELL_VISITED | CELL_PATH_S
				maze[CheckStack(0, 0)] |= CELL_PATH_N
				stack.push_front(Position(0,-1))
			#East
			1:
				maze[CheckStack(1, 0)] |= CELL_VISITED | CELL_PATH_W
				maze[CheckStack(0, 0)] |= CELL_PATH_E
				stack.push_front(Position(1,0))
			#South
			2:
				maze[CheckStack(0, 1)] |= CELL_VISITED | CELL_PATH_N
				maze[CheckStack(0, 0)] |= CELL_PATH_S
				stack.push_front(Position(0,1))
			#West
			3:
				maze[CheckStack(-1, 0)] |= CELL_VISITED | CELL_PATH_E
				maze[CheckStack(0, 0)] |= CELL_PATH_W
				stack.push_front(Position(-1,0))
		print(Cardinal)
		visited += 1
	else:
		stack.pop_front()

func DrawMaze():
	for y in Width:
		var i = y * CellBlock
		for x in Height:
			var j = x * CellBlock
			for py in CellBlock:
				sleep(5)
				var pi = (py + i) * SptSize
				for px in CellBlock:
					var pj = (px + j) * SptSize
					if px == 2 or py == 2:
						pass
					elif maze[y * Width + x] & CELL_VISITED:
						SpawnMAA(pi,pj,"Connect")
					else:
						SpawnMAA(pi,pj,"Path")

# Spawn what type of Maze Algorithm in the Atlas
func SpawnMAA(XPosition : int, YPosition : int, Algorithm : String):
	var N = Sprite.new()
	N.texture = MazeAtlas
	N.centered = false
	N.hframes = 5
	match Algorithm:
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
	N.position = Vector2(XPosition, YPosition)
	call_deferred("add_child", N)

func sleep(SetTime : int):
	var t = Timer.new()
	t.set_wait_time(SetTime)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
