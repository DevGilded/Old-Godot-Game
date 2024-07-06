extends KinematicBody2D

var      vel: Vector2 = Vector2(0,0)
const  speed:     int =  300
const   jump:     int = -800
const   grav:     int =  35

func input():
	if Input.is_action_pressed("right"):
		$Sprite.flip_h = false
		vel.x =  speed
	if Input.is_action_pressed("left"):
		$Sprite.flip_h = true
		vel.x = -speed
	if Input.is_action_pressed("jump") and is_on_floor():
		vel.y =  jump

func _physics_process(delta):
	input()

	vel.y += grav

	vel = move_and_slide(vel,Vector2.UP)
	vel.x = lerp(vel.x,0,0.2)
