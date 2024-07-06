extends Control

var IsScene = "res://Scene/LoginMenu.tscn"
onready var Account = preload("res://Script/RegisterPersonel.gd")
onready var InputUserName = ""
onready var InputPassword = ""

func _ready():
	$Loading.visible = false
	$UI.visible = false
	$AnimationPlayer.play("WhenEnter")

func _on_Button_pressed():
	if InputUserName ==  Account.AccountInfo[0][0]:
		if InputPassword == Account.AccountInfo[1][0]:
			$UI.visible = false
			$AnimationPlayer.play("WhenExit")
		elif InputPassword == Account.AccountInfo[1][1]:
			$UI.visible = false
			$AnimationPlayer.play("WhenExit")
		else:
			print("Invaled Account")
			$UI/UserName.clear()
			$UI/Password.clear()
	elif InputUserName ==  Account.AccountInfo[0][1]:
		if InputPassword == Account.AccountInfo[1][0]:
			$UI.visible = false
			$AnimationPlayer.play("WhenExit")
		if InputPassword == Account.AccountInfo[1][1]:
			$UI.visible = false
			$AnimationPlayer.play("WhenExit")
		else:
			print("Invaled Account")
			$UI/UserName.clear()
			$UI/Password.clear()
	else:
		print("Invaled Account")
		$UI/UserName.clear()
		$UI/Password.clear()

func _on_UserName_text_changed(new_text):
	InputUserName = new_text


func _on_Password_text_changed(new_text):
	InputPassword = new_text


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "WhenEnter":
		$UI.visible = true
	elif anim_name == "WhenExit":
		IsScene = true
		$Loading.visible = true
		$Loading/AnimationPlayer.play("Loading")
	else:
		pass
