extends KinematicBody2D
class_name Player

export(int) var Max_Skin    : int =  2   ;
export(int) var Skins_num   : int =  0   ;

export(Resource) var moveD

var Yellow_Skin = preload("res://Sprite/Perfect-Robot-Yellow-Sheet.png") ;
var Orange_Skin = preload("res://Sprite/Perfect-Robot-Orange-Sheet.png") ;
var Purple_Skin = preload("res://Sprite/Perfect-Robot-Purple-Sheet.png") ;
var vel         = Vector2.ZERO                                           ;
var multi       = 0                                                      ;

onready var AnimPlayer = $AnimationPlayer

func _ready():
	moveD.JUMP *= -1
	moveD.JUMP_ACCEL *= -1

func _physics_process(delta):
	change_skin(Skins_num)
	move_input          () ;
	grav                () ;
	change_skin_input   () ;
	vel   = move_and_slide(vel,Vector2.UP);

func move_input():
############################  -- WALK INPUT --  ################################
	var input = Vector2.ZERO
	input.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	if input.x == 0:
		friction()
		AnimPlayer.play("Idle")
	else:
		accel(input.x)
		AnimPlayer.play("Walk")
		$Sprite.flip_h = input.x < 0;
################################################################################

#############################  -- DASH INPUT --  ###############################
	if input.x < 0:
		multi = -moveD.DASH
	elif input.x > 0:
		multi = moveD.DASH
	if Input.is_action_just_pressed("Dash"):
		vel.x = moveD.SPEED * multi;
################################################################################

#############################  -- JUMP INPUT --  ###############################
	if moveD.JUMP_AMOUNT > 0  :
		if Input.is_action_just_pressed("Jump"):
			vel.y = moveD.JUMP;
			moveD.JUMP_AMOUNT   =    moveD.JUMP_AMOUNT - 1 ;
	if is_on_floor():
		moveD.JUMP_AMOUNT = 1 ;
	else:
		if Input.is_action_just_released("Jump") and vel.y < moveD.JUMP_ACCEL:
			vel.y = moveD.JUMP_ACCEL
################################################################################

func change_skin_input():
	if Input.is_action_just_pressed("Change-Skin-Right") and Skins_num < Max_Skin:
		Skins_num = Skins_num + 1
	elif Input.is_action_just_pressed("Change-Skin-Left") and Skins_num > 0:
		Skins_num = Skins_num - 1

func grav():
	vel.y += moveD.GRAVITY;
	vel.y = min(vel.y, 500)
	if vel.y > 1:
		vel.y += 6

func friction():
	vel.x = move_toward(vel.x, 0, moveD.SPEED)

func accel(input_amount):
	vel.x = move_toward(vel.x, moveD.SPEED * input_amount, 100)

func change_skin(skin_num):
	if (skin_num == 0):
		$Sprite.texture = Orange_Skin
	elif (skin_num == 1):
		$Sprite.texture = Yellow_Skin
	elif (skin_num == 2):
		$Sprite.texture = Purple_Skin
