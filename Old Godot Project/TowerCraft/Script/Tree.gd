extends StaticBody2D

var treehealth = 3

func _on_Area2D_area_entered(area):
	if area:
		treehealth -= 1
	if treehealth == 0:
		$Sprite.frame = 7
		$CollisionShape2D.call_deferred("queue_free")
		$Area2D/CollisionShape2D.call_deferred("queue_free")
