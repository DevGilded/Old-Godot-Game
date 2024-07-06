extends KinematicBody2D

export var Speed : int        = 100
export var Gravity : int      = 50
export var JumpVelocity : int = 1000

var Velocity = Vector2.ZERO
var IsWalking = false

func _physics_process(_delta):
	Velocity = Vector2.ZERO
	$AnimationTree["parameters/conditions/Walk"] = Velocity.x <= 1 or Velocity.x >= 1 and IsWalking
	$AnimationTree["parameters/conditions/Return"] = !IsWalking
	
	if Input.is_action_pressed("Right"):
		Velocity.x += Speed
		$"PlayerSpriteV1-Sheet".flip_h = false
		IsWalking = true
	else:
		IsWalking = false
	if Input.is_action_pressed("Left"):
		Velocity.x -= Speed
		$"PlayerSpriteV1-Sheet".flip_h = true
		IsWalking = true
	else:
		IsWalking = false
	
	if !is_on_floor():
		Velocity.y += Gravity
	
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		Velocity.y -= JumpVelocity
	
	Velocity = move_and_slide(Velocity, Vector2.UP, true)
