extends GridContainer

var inventory = preload("res://Inventory.tres")

func _ready():
	inventory.connect("Item_Change", self, "_OnItemsChanged")
	update_inventory_display()

func update_inventory_display():
	for item_index in inventory.Items.size():
		update_inventory_slot_display(item_index)

func update_inventory_slot_display(item_index):
	var inventorySlotDisplay = get_child(item_index)
	var item = inventory.Items[item_index]
	inventorySlotDisplay.display_item(item)

func _OnItemsChanged(indexes):
	for item_index in indexes:
		update_inventory_slot_display(item_index)

func _unhandled_input(event):
	if event.is_action_pressed("ui_left_click"):
		if inventory.drag_data is Dictionary:
			inventory.set_item(inventory.drag_data.item_index, inventory.drag_data.item)
