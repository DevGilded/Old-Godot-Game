extends Node2D

# when the new chunk leave the area load again
# dont need to use the area property
func on_loadChunk_leave(area):
	if area:
		var newChunk = randScene().instance()
		newChunk.position.x = $loadChunk.position.x - 2
		call_deferred("add_child_below_node", $loadedChunk, newChunk)

# when the chunk leave from this area it no longer need so it will be deleted
# the area is needed to know what chunk need to be delete
func on_unloadChunk_leave(area):
	area.call_deferred("queue_free")

# chose random chunk scene
func randScene():
	randomize()
	var scene = [
		preload("res://Scene/PrototypeChunkScene/PrototypeChunk_A0.tscn"),
		preload("res://Scene/PrototypeChunkScene/PrototypeChunk_A1.tscn")
	]
	return scene[randi() % scene.size()]
