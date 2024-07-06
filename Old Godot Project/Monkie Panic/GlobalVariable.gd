extends Node

func grid_mousePosition(GlobalPosition : Vector2, Tilesize : Vector2 = Vector2(0,0), Centered : bool = true):
	var Offset = 0
	if Centered:
		Offset = Tilesize / 2
	return Vector2(round((GlobalPosition.x - Offset.x) / Tilesize.x),round((GlobalPosition.y - Offset.y) / Tilesize.y))
