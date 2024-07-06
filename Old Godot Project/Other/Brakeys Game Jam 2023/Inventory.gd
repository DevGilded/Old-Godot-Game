extends Resource
class_name Inventory

signal Item_Change(indexes)

var drag_data = null

export (Array, Resource) var Items = [
	null, null, null, null, null,
	null, null, null, null, null,
]

func set_item(item_index, item):
	var prevItem = Items[item_index]
	Items[item_index] = item
	emit_signal("Item_Change", [item_index])
	return prevItem

func swap_item(item_index, target_item_index):
	var targetItem = Items[target_item_index]
	var item = Items[item_index]
	Items[target_item_index] = item
	Items[item_index] = targetItem
	emit_signal("Item_Change", [item_index, target_item_index])

func remove_item(item_index):
	var prevItem = Items[item_index]
	Items[item_index] = null
	emit_signal("Item_Change", [item_index])
	return prevItem
