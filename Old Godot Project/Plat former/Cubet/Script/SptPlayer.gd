extends KinematicBody2D

var Vell = Vector2.ZERO
var Speed = 85
var Jump = -500
var Grav = 25

func _process(delta) -> void:
	Vell.y =+ Grav
	_UserInput()
	Vell = move_and_slide(Vell, Vector2.UP)

func _UserInput() -> void:
	Vell.x = 0
	if Input.is_action_just_pressed("J") and is_on_floor():
		Vell.y = Jump
	if Input.is_action_pressed("R") and Input.is_action_pressed("L"):
		$Anim.play("RESET")
	else:
		if Input.is_action_pressed("R"):
			Vell.x =+ Speed
			$Texture.flip_h = false
			$Anim.play("Walk")
		elif Input.is_action_pressed("L"):
			Vell.x =- Speed
			$Texture.flip_h = true
			$Anim.play("Walk")
		else:
			$Anim.play("RESET")
