extends Control

#var CurrentScene = get_tree().get_
var LoginScene = "res://Scene/LoginMenu.tscn"
var MenuScene  = "res://Scene/MainMenu.tscn"

func _on_AnimationPlayer_animation_finished(anim_name):
	pass
#	print(CurrentScene)
#	if CurrentScene == LoginScene:
#		get_tree().change_scene("res://Scene/MainMenu.tscn")
#	elif CurrentScene == MenuScene:
#		get_tree().change_scene("res://Scene/LoginMenu.tscn")
