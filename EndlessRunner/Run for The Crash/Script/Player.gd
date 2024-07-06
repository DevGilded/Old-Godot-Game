extends KinematicBody2D

var   vel:   Vector2 = Vector2();
const speed: float   =     150.0;

func _ready():
	$AnimationPlayer.play("Idle")

func input():
	if Input.is_action_pressed("Left"):
		vel.x = -speed
	if Input.is_action_pressed("Right"):
		vel.x =  speed

func _physics_process(delta):
	vel.y = -speed + delta
	input()
	vel = move_and_slide(vel) * delta
