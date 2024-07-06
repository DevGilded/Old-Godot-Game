extends CharacterBody2D

var Vel     : Vector2 = Vector2.ZERO # Car Velocity
var Gravt   : float   = 20           # Car Drag Speed When Stop Accelarating
var Speed   : float   = 85           # Car Speed
var JumpFre : float   = 50           # JumpFre is Jump Force
var Rot     : float   = 0            # Rot is Rotation
var RotSped : float   = 1.5          # RotSped is Rotation Speed
var RotLmit : float   = 10           # RotLmit is Rotation Limit
var IsLeft  : bool    = false        # If Left Side Of the Screen Is Touch
var IsRight : bool    = false        # Disame as the IsLeft But Oposite


@onready var RayCastT  : Node = $RayCast3D/Top
@onready var RayCastR  : Node = $RayCast3D/Right
@onready var RayCastB  : Node = $RayCast3D/Bottom
@onready var RayCastL  : Node = $RayCast3D/Left
@onready var RayCastLW : Node = $RayCast3D/IfLeftWall
@onready var RayCastRW : Node = $RayCast3D/IfRightWall

func _physics_process(delta):
	Vel = Vector2.ZERO
	Rot = 0
#	if RayCastT.is_colliding():
#		get_tree().change_scene("res://Scene/MainMenu.tscn")
	if Input.is_action_pressed("CarAccelarate") or IsRight and IsLeft: # Accelarate The Car
		Vel.y -= JumpFre
	if Input.is_action_pressed("Right") and !RayCastRW.is_colliding() or IsRight and !RayCastRW.is_colliding():
		Vel.x += Speed
		ChangeRotationLimit(RayCastR)
		if self.rotation_degrees <= RotLmit:
			Rot += 2
	if Input.is_action_pressed("Left") and !RayCastLW.is_colliding() or IsLeft and !RayCastLW.is_colliding():
		Vel.x -= Speed
		ChangeRotationLimit(RayCastL)
		if self.rotation_degrees >= -RotLmit:
			Rot -= 2
	if !Input.is_action_pressed("Left") or !Input.is_action_pressed("Right"):
		if self.rotation_degrees == 0:
			self.rotation_degrees = 0
		elif self.rotation_degrees <= 0.1:
			Rot += 1
		elif self.rotation_degrees >= -0.1:
			Rot -= 1
	Vel.y += Gravt
	set_velocity(Vel)
	move_and_slide()
	Vel = velocity
	rotation += Rot * RotSped * delta
##############################################################

#############################||
func _on_Right_pressed(): #  ||
	IsRight = true
func _on_Right_released():#  ||
	IsRight = false
func _on_Left_pressed():  #  ||
	IsLeft = true
func _on_Left_released(): #  ||
	IsLeft = false
#############################||

func ChangeRotationLimit(path):
	if path.is_colliding():
		RotLmit = 2
	else:
		RotLmit = 10
