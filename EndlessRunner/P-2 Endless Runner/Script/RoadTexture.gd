extends Node2D

@onready var Road = $Road
@onready var MidObs = $Node2D/MiddleObstacle
@onready var MidObsBarrier = $Barrier/Middle
@onready var MidTopObsBarrier = $Barrier/MiddleTop
@onready var AreaMiddle = $Area2D/Middle

var Blockage = preload("res://Scene/Blockage.tscn")
var MiddleObstacleName : String
var IsSpawnable        : bool = false
var IsSpawnableWithObs : bool = false

var RoadList = [
	preload("res://Resource/Sprite/Road/Ver1Road/Road/Road1.png"),
	preload("res://Resource/Sprite/Road/Ver1Road/Road/Road2.png"),
	preload("res://Resource/Sprite/Road/Ver1Road/Road/Road3.png"),
	preload("res://Resource/Sprite/Road/Ver1Road/Road/Road4.png"),
	preload("res://Resource/Sprite/Road/Ver1Road/Road/Road5.png"),
	preload("res://Resource/Sprite/Road/Ver1Road/Road/Road6.png")
]

var MiddleObstacleList = [
	preload("res://Resource/Sprite/Road/Ver1Road/MiddleObstacle/Middle1.png"),
	preload("res://Resource/Sprite/Road/Ver1Road/MiddleObstacle/Middle2.png"),
	preload("res://Resource/Sprite/Road/Ver1Road/MiddleObstacle/Middle3.png")
]

func _ready() -> void:
	randomize()
	var i : int = randi() % 5
	Road.texture = RoadList[i]
	MidObsBarrier.disabled = true
	MidTopObsBarrier.disabled = true
	match MiddleObstacleName:
		"TopMidObs":
			MidObs.texture = MiddleObstacleList[0]
			MidObsBarrier.call_deferred("queue_free")
			MidTopObsBarrier.disabled = false
			AreaMiddle.disabled = false
			IsSpawnableWithObs = true
		"CenterMidObs":
			MidObs.texture = MiddleObstacleList[1]
			MidTopObsBarrier.call_deferred("queue_free")
			MidObsBarrier.disabled = false
			AreaMiddle.disabled = false
			IsSpawnableWithObs = true
		"BottomMidObs":
			MidObs.texture = MiddleObstacleList[2]
			MidTopObsBarrier.call_deferred("queue_free")
			MidObsBarrier.disabled = false
			AreaMiddle.disabled = false
			IsSpawnableWithObs = true
		_:
			MidTopObsBarrier.call_deferred("queue_free")
			MidObsBarrier.call_deferred("queue_free")
			IsSpawnableWithObs = false
