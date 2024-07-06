extends Node2D

export var collision_shape_2D := @""; onready var collision := get_node(collision_shape_2D) as CollisionShape2D
export var grid_size : int

onready var area_size = collision.shape.extents
onready var area_pivot_point = -area_size

func generate_buildplot():
	pass

func _ready():
#	print(area_size)
#	print(area_pivot_point)
	pass # Replace with function body.
