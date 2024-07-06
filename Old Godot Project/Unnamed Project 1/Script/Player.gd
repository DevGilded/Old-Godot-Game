extends KinematicCollision2D

enum {
	unhidden,
	hidden
}

@export var roomLimit = 0 # Input by the tilemap size
@export var defaultSpeed = 125

var state = unhidden
var velocity = Vector2.ZERO
var characterSprite = 50
var CanInteract = false
var areaObject

@onready var collision = $C
@onready var playerTexture = $Sprite
@onready var ceilingCheckLeft = $RayCastLeft
@onready var ceilingCheckRight = $RayCastRight

func _ready():
	# Multiply by the Tile size which is 16
	roomLimit = roomLimit * 16
	$Camera2D.limit_right = roomLimit
	$Camera2D.limit_left = 0
	$Camera2D.limit_bottom = 270

func _physics_process(_delta):
	match state:
		hidden:
			$Area2D/CanInteract.position = Vector2.ZERO
			if Input.is_action_just_pressed("Interact"):
				state = unhidden
			playerTexture.visible = false
		unhidden:
			$Area2D/CanInteract.position.y = -12
			if Input.is_action_just_pressed("Interact") and CanInteract:
				self.position = areaObject.parentPosition
				state = hidden
			playerTexture.visible = true
			var gravity = 65
			UserMovement()
			velocity.y += gravity
			velocity = move_and_slide(velocity, Vector2.UP, true)

func UserMovement():
	# Reset Velocity to normal which is 0
	velocity.x = 0
	# Reset Speed to normal which is the DefaultSpeed
	var speed = defaultSpeed
	
	# Reset to normal setting
	playerTexture.frame = characterSprite + 0
	collision.shape.extents.y = 8
	collision.position.y = 0
	
	# Crounch Movement
	if Input.is_action_pressed("Crouch") or ceilingCheckLeft.is_colliding() or ceilingCheckRight.is_colliding():
		playerTexture.frame = characterSprite + 1
		collision.shape.extents.y = 3.5
		collision.position.y = 4.5
		speed = speed / 2
	
	if Input.is_action_just_pressed("Jump") and !Input.is_action_pressed("Crouch"):
		velocity.y -= speed * 2.5
	
	# Moving Movement
	if Input.is_action_pressed("Right"):
		velocity.x += speed
		playerTexture.flip_h = false
	if Input.is_action_pressed("Left"):
		velocity.x -= speed
		playerTexture.flip_h = true


func _onInteractableEnter(area):
	$Area2D/CanInteract.visible = true
	areaObject = area
	CanInteract = true


func _onInteractableExit(area):
	$Area2D/CanInteract.visible = false
	areaObject = null
	CanInteract = false
