extends CenterContainer

var inventory = preload("res://Inventory.tres")

onready var ItemTextureRect = $ItemTextureRect
var EmptySlotTexture = preload("res://SlotTexture.png")

func display_item(item):
	if item is Item:
		ItemTextureRect.texture = item.texture
	else:
		ItemTextureRect.texture = EmptySlotTexture

func get_drag_data(_position):
	var item_index = get_index()
	var item = inventory.remove_item(item_index)
	if item is Item:
		var data = {}
		data.item = item
		data.item_index = item_index
		var dragPrev = TextureRect.new()
		dragPrev.texture = item.texture
		set_drag_preview(dragPrev)
		inventory.drag_data = data
		return data

func can_drop_data(_position, data):
	return data is Dictionary and data.has("item")

func drop_data(_position, data):
	var my_item_index = get_index()
	var my_item = inventory.Items[my_item_index]
	inventory.swap_item(my_item_index, data.item_index)
	inventory.set_item(my_item_index, data.item)
	inventory.drag_data = null
