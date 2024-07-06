extends StaticBody2D



func _on_Blockage_body_entered(body):
	if body is CharacterBody2D:
		body.call_deferred("queue_free")
