extends Node2D

var PlainFourRoad = preload("res://Scene/Road/FourLaneZeroObstacle.tscn")
var FourLane = dir("res://Scene/Road/FourLane/")

var Vel = Vector2(0, 5)
var Roaded : bool = false
var Obstacled : bool = false

func _ready():
	_spawnRoad()
	pass

func _process(delta) -> void:
	position.y += 5
	if position.y >= 1024:
		position.y = position.y + -1536
		_spawnRoad()

func _spawnRoad() -> void:
	var Layer = 0
	var NewGroup = Node2D.new()
	add_child(NewGroup)
	if Roaded:
		NewGroup.queue_free()
		Roaded = false
	else:
		var tile = 8
		while tile > 0:
			if Obstacled:
				var rnd = randf_range(0,2)
				var RND = FourLane[randi() % FourLane.size()]
				for t in rnd:
					var n = RND.instantiate()
					add_sibling(NewGroup, n)
					n.position.y = Layer
					Layer = Layer + 48
					tile -= 1
				Obstacled = false 
			else:
				for j in 6:
					var n = PlainFourRoad.instantiate()
					add_sibling(NewGroup, n)
					n.position.y = Layer
					Layer = Layer + 48
					tile -= 1
				Obstacled = true
#		var rObs = FourLane[randi() % FourLane.size()]
#		var rNum = rand_range(0,2)
#		for i in 1:
#			var r = PlainFourRoad.instance()
#			add_child_below_node(NewGroup, r)
#			r.position.y = Layer
#			Layer = Layer + 48
#		for obs in [1,2]:
#			var r = rObs.instance()
#			add_child_below_node(NewGroup, r)
#			r.position.y = Layer
#			Layer = Layer + 48
#		for Gap in 2:
#			var r = PlainFourRoad.instance()
#			add_child_below_node(NewGroup, r)
#			r.position.y = Layer
#			Layer = Layer + 48
		Roaded = true

func dir(path):
	var files = []
	var dir = DirAccess.new()
	dir.open(path)
	dir.list_dir_begin() # TODOConverter3To4 fill missing arguments https://github.com/godotengine/godot/pull/40547
	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif !file.begins_with("."):
			files.append(load(path + "/" + file))
	dir.list_dir_end()
	return files
