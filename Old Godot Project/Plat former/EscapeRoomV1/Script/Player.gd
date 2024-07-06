extends KinematicBody2D

var speed = 100  # speed in pixels/sec
var velocity = Vector2.ZERO

func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed('Right'):
		velocity.x += 1
		$Sprite.flip_h = false
		$AnimPlayer.play("Walk")
	if Input.is_action_pressed('Left'):
		velocity.x -= 1
		$Sprite.flip_h = true
		$AnimPlayer.play("Walk")
	if Input.is_action_pressed('Down'):
		velocity.y += 1
		$AnimPlayer.play("Walk")
	if Input.is_action_pressed('Up'):
		velocity.y -= 1
		$AnimPlayer.play("Walk")
	# Make sure diagonal movement isn't faster
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	if velocity.x == 0:
		if velocity.y == 0:
			$AnimPlayer.play("Idle")
	velocity = move_and_slide(velocity)
