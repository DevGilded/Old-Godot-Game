extends Control

var groupName = ""
var groupAmount = ""



func OnDone():
	print(groupName)
	print(groupAmount)

func _on_Amount_text_changed(new_text):
	if new_text:
		groupAmount = new_text

func _on_Name_text_changed(new_text):
	if new_text:
		groupName = new_text
