extends Node2D

const DegreeOffset = 180

@onready var HourHand = $HOUR
@onready var MinuteHand = $MINUTE
@onready var SecondHand = $SECOND

func _physics_process(_delta):
	var TIME = Time.get_datetime_dict_from_system()
	SecondHand.rotation_degrees = DegreeOffset + (6 * TIME.second)
	MinuteHand.rotation_degrees = DegreeOffset + (6 * TIME.minute) + (0.1 * TIME.second)
	HourHand.rotation_degrees = DegreeOffset + (30 * TIME.hour) + (0.5 * TIME.minute)+ (0.01 * TIME.second)
	pass
