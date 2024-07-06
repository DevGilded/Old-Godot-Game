extends KinematicBody2D

const GRID_SIZE := 1
var speed_factor := 1.0

var velocity := Vector2.ZERO
var currentDirection := ""
var direction := [
	"down",
	"up",
	"right",
	"left"
	]

func _ready():
	randomize()
	pass

func _physics_process(delta):
	moveDirection(currentDirection,delta)
	if velocity == Vector2.ZERO:
		currentDirection = direction[randi() % 4]

func moveDirection(currentState : String, delta):
	velocity = Vector2.ZERO
	match currentState:
		"right":
			velocity.x += 1
			$Sprite.frame = 1
			$Sprite.flip_h = false
		"left":
			velocity.x -= 1
			$Sprite.frame = 1
			$Sprite.flip_h = true
		"down":
			velocity.y += 1
			$Sprite.frame = 0
			$Sprite.flip_v = true
		"up":
			velocity.y -= 1
			$Sprite.frame = 0
			$Sprite.flip_v = false
		_:
			pass

	if velocity.length_squared() > 1:
		velocity = velocity.normalized()
	var desired_position = position + velocity * GRID_SIZE * speed_factor
	desired_position = Vector2(
		round(desired_position.x / GRID_SIZE) * GRID_SIZE,
		round(desired_position.y / GRID_SIZE) * GRID_SIZE
	)
	velocity = (desired_position - position) / delta
	velocity = move_and_slide(velocity)
