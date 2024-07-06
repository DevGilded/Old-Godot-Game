extends Node2D

signal SpawnNew()

var PerBlockage : int = 2
var SpawnedAmount : int

func _ready() -> void:
	randomize()
	var pos = 0
	for i in 5:
		var l = round(randf_range(1, PerBlockage))
		if l == 1:
			Spawner(pos)
			SpawnedAmount = SpawnedAmount + 1
		pos = pos + 16

func _process(delta) -> void:
	self.position.y += 1
	if self.position.y >= 288:
		self.call_deferred("queue_free")
	if self.position.y >= 64 and self.position.y <= 64.1:
		if SpawnedAmount >= 5:
			self.call_deferred("queue_free")
			emit_signal("SpawnNew")
		else:
			emit_signal("SpawnNew")

func Spawner(j : int) -> void:
	var i = preload("res://Scene/Blockage.tscn").instantiate()
	i.position.x += j
	call_deferred("add_child", i)
