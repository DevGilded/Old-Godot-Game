extends KinematicBody2D

var speed = 60
var vel = Vector2(0,0)

onready var character = $Character

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
# Anim Player
	if vel.length() == 0:
#		IdleAnimState()
		pass
	if vel.length() > 0:
#		WalkAnimState()
		pass

#func IdleAnimState():
#	state_machine.travel("Idle")
#func WalkAnimState():
#	state_machine.travel("Walk")
#func AttackAnimState():
#	state_machine.travel("Attack")
