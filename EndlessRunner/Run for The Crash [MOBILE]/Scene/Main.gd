extends Node2D

var obst = [
	preload("res://Scene/Obstacle/A.tscn"),
	preload("res://Scene/Obstacle/B.tscn")
]
const speed: int = 500

func _ready():
	randomize()
	spawn_inst(0, 0)
	spawn_inst(0, 1600)

func _physics_process(delta):
	for obstacle in $Obstacle.get_children():
		obstacle.position.y += speed*delta
		if obstacle.position.y < -1600:
			spawn_inst(0, obstacle.position.y - 3200)
			obstacle.queue_free()

func spawn_inst(x, y):
	var inst = obst[randi() % len(obst)].instance()
	inst.position = Vector2(x, y)
	$Obstacle.add_child(inst)
