extends Control

var IfBack = false
var IsLogin = false

func _ready():
	IsLogin = true
	$Button.visible = false
	$Button2.visible = false
	$AnimationPlayer.play("WhenLogin")


func _on_AnimationPlayer_animation_finished(anim_name):
	if IsLogin:
		$Button.visible = true
		$Button2.visible = true
		IsLogin = false
	elif IfBack:
		get_tree().change_scene("res://Scene/LoginMenu.tscn")
	else:
		pass

func _on_Button2_pressed():
	$Button.visible = false
	$Button2.visible = false
	$AnimationPlayer.play_backwards("WhenLogin")
	IfBack = true
