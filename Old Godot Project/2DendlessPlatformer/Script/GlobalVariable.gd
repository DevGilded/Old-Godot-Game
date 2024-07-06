extends Node

var speed = 100
var score = 0

func _process(delta):
	score += 2.5 * delta
