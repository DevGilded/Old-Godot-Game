extends StaticBody2D

func _on_Area2D_area_entered(area):
	call_deferred("queue_free")
