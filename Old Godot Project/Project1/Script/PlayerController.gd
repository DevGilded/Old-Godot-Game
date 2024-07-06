extends KinematicBody2D

var min_speed : int = 50
var max_speed : int = 65
var acceleration : int
var Velocity : Vector2 = Vector2.ZERO

func _ready():
#	$AnimationPlayer.play("Idle")
	pass

func _physics_process(delta):
	Velocity = move_and_slide(Velocity * delta)
	input()

func input():
	Velocity = Vector2.ZERO
	var speed
	if Input.is_action_pressed("Up"):
		Velocity.y -= 1
	if Input.is_action_pressed("Down"):
		Velocity.y += 1
	if Input.is_action_pressed("Left"):
		Velocity.x -= 1
		$Sprite.flip_h = true
	if Input.is_action_pressed("Right"):
		Velocity.x += 1
		$Sprite.flip_h = false
	if Input.is_action_pressed("Sprint"):
		speed = max_speed * 100
	else:
		speed = min_speed * 100
	Velocity = Velocity.normalized() * speed
