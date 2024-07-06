extends Camera2D

export var background_texture := @""; onready var t = get_node(background_texture) as Sprite

onready var bgtexture = t.texture.get_size() / 1.8
onready var mouse_state = {
	Normal = preload("res://texture/HandCursorPixel.png"),
	Hold = preload("res://texture/HandCursorPixelHold.png")
}

var camera_speed = 0.3

func _ready():
	set_limit(MARGIN_BOTTOM, bgtexture.y)
	set_limit(MARGIN_RIGHT, bgtexture.x)
	set_limit(MARGIN_TOP, -bgtexture.y)
	set_limit(MARGIN_LEFT, -bgtexture.x)

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		if event.button_mask == BUTTON_MASK_LEFT:
			position -= (event.relative * camera_speed) * zoom
			Input.set_custom_mouse_cursor(mouse_state.Hold)
		else:
			Input.set_custom_mouse_cursor(mouse_state.Normal)
