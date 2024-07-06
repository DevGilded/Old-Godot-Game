extends KinematicBody2D

var vel = Vector2(0,0)
var speed = 150

onready var camera = $Camera2D
onready var canvasL = get_parent()

func _physics_process(delta):
	User_Input()
	vel = move_and_slide(vel * delta)

func User_Input():
	vel = Vector2(0,0)
# Up and Down Movement
	if Input.is_action_pressed("w"):
		vel.y -= 1
	if Input.is_action_pressed("s"):
		vel.y += 1
# Left to Right Movement
	if Input.is_action_pressed("a"):
		vel.x -= 1
	if Input.is_action_pressed("d"):
		vel.x += 1
# Movement Optimize Calculation
	vel = vel.normalized() * (speed * 100)

func _input(_event):
	if camera.zoom >= Vector2(0.3, 0.3) and Input.is_action_pressed("ctrl") and Input.is_mouse_button_pressed(4):
		camera.zoom -= Vector2(0.1, 0.1)
		canvasL.follow_viewport_scale -= 0.1
	if camera.zoom <= Vector2(2, 2) and Input.is_action_pressed("ctrl") and Input.is_mouse_button_pressed(5):
		camera.zoom += Vector2(0.1, 0.1)
		canvasL.follow_viewport_scale += 0.1
