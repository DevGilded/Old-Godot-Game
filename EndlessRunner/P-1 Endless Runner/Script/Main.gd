extends Node2D

#var StartSection = preload("res://Scene/Obstacle/Section/(Test)ObsStartingS.tscn")
var Sections = list_files_in_directory("res://Scene/Obstacle/Section/")
var FirstPoint = 0

func _ready() -> void:
#	var LoadScene = StartSection.instance()
#	add_child_below_node($Section, LoadScene)
	SpawnRandSect()
	SpawnRandSect()

# warning-ignore:unused_argument
func _process(delta) -> void:
	FirstPoint += 3
	if FirstPoint == 0:
		FirstPoint -= FirstPoint
		SpawnRandSect()

func SpawnRandSect() -> void:
	var RandScene = Sections[randi() % Sections.size()]
	var LoadScene = RandScene.instantiate()
	var SP = LoadScene.SpawnPoint
	LoadScene.position.y = -FirstPoint + -SP
	FirstPoint = -FirstPoint + -SP
	add_sibling($Section, LoadScene)

# warning-ignore:unused_argument
func _input(event) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		FirstPoint -= FirstPoint
		SpawnRandSect()

func list_files_in_directory(path):
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
