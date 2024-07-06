extends Node2D

var l : int = 8
var RoadSize : int = 16

@export var RoadInput  : String
@export var RoadAmount : int  
@export var IsFirst    : bool

func _ready() -> void:
	$Area2D/CollisionShape2D2.disabled = true
	DrawRoad(RoadInput, RoadAmount)
	l = 8
	if IsFirst:
		self.position.y -= (RoadAmount * RoadSize) - 248
	else:
		self.position.y -= (RoadAmount * RoadSize) - 32
		self.position.y -= 39

func _process(delta) -> void:
	self.position.y += 1
	if self.position.y >= 256:
		self.call_deferred("queue_free")
	elif self.position.y >= -10:
		$Area2D/CollisionShape2D2.disabled = false

func DrawTwoLane(num : int) -> void:
	var n = Node2D.new()
	add_child(n)
	for i in num:
		if i == 0:
			NewNode(n, l, "TopMidObs")
			l = int(l + RoadSize)
		elif i == num - 1:
			NewNode(n, l, "BottomMidObs")
			l = int(l + RoadSize)
		else:
			NewNode(n, l, "CenterMidObs")
			l = int(l + RoadSize)

func DrawFiveLane(num : int) -> void:
	var n = Node2D.new()
	add_child(n)
	var rnd : int = num
	for i in rnd:
		NewNode(n, l, "")
		l = int (l + RoadSize)

func DrawRoad(RoadType : String, NumberRoad : int) -> void:
	match RoadType:
		"FiveLane":
			DrawFiveLane(NumberRoad)
		"TwoLane":
			DrawTwoLane(NumberRoad)
		_:
			print("!The Road Your Trying to Call Is Not Available!")

func NewNode(NewNode : Node, yPos : int, MidObsName : String) -> void:
	var RoadTexture = preload("res://Scene/RoadTexture.tscn").instantiate()
	RoadTexture.MiddleObstacleName = MidObsName
	RoadTexture.scale = Vector2(0.5, 0.5)
	add_sibling(NewNode, RoadTexture)
	RoadTexture.position = Vector2(56, yPos)
