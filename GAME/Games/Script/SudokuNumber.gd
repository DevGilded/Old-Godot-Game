extends Control

signal ChangeNumber

@export var Number = 0

func _ready():
	if Number <= 9:
		$NumberSprite.frame = Number

func _ChangeNumber(num : int):
	if num <= 9:
		$NumberSprite.frame = num
