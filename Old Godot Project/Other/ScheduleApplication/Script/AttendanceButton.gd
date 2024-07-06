extends Button

func OnHoverEnter():
	self.rect_position.y += 4


func OnHoverExit():
	self.rect_position.y -= 4
