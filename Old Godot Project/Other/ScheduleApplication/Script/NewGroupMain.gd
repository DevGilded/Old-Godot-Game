extends Control

func OnOpenUI():
	$OnHover.play()
	$UI.visible = true
	$Button/Button.disabled = true

func OnCloseUI():
	$OnHover.play()
	$UI.visible = false
	$Button/Button.disabled = false
	$Button/Button.rect_position.y -= 4


func Onhover():
	if !$UI.visible:
		$Button/Button.rect_position.y += 4


func OnHoverExit():
	if !$UI.visible:
		$Button/Button.rect_position.y -= 4
