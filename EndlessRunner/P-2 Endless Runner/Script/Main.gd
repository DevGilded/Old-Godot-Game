extends Node2D

var RoadSection = preload("res://Scene/RoadLoader.tscn")

var FirstPoint : bool = true
var CurrentRoad : String
var BlkAmount   : int = 2

func _ready() -> void:
	SpawnRoadLane(35, "FiveLane")

func SpawnRoadLane(RoadAmount : int,RoadType : String) -> void:
	var i = RoadSection.instantiate()
	match RoadType:
		"TwoLane":
			i.RoadInput = "TwoLane"
			BlkAmount = 3
		"FiveLane":
			i.RoadInput = "FiveLane"
			BlkAmount = 2
		_:
			print("Invaled Input In RoadType")
	i.IsFirst = FirstPoint
	i.RoadAmount = RoadAmount
	call_deferred("add_sibling",$Road, i)
	CurrentRoad = RoadType

func _onEnterSpawnRoad(area) -> void:
	randomize()
	var rnd : int = randi() % 33 + 32
	FirstPoint = false
	if area is Area2D:
		if CurrentRoad != "FiveLane":
			SpawnRoadLane(rnd, "FiveLane")
		elif CurrentRoad != "TwoLane":
			SpawnRoadLane(rnd, "TwoLane")
		else:
			print("All Road Is the Current?")


func _on_BlockageSpawner_SpawnNew():
	var i = preload("res://Scene/BlockageSpawner.tscn").instantiate()
	i.position.x = 16
	i.position.y = -16
	i.PerBlockage = BlkAmount
	i.connect("SpawnNew", Callable(self, "_on_BlockageSpawner_SpawnNew"))
	call_deferred("add_child", i)
