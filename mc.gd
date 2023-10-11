extends CharacterBody2D
@onready var _animation_player = $AnimationPlayer

var lives = 3
var hp = 100
var maxhp = 100
var atk = 3
var spd = 3

const SPEED = 150.0 
const JUMP_VELOCITY = -600.0
var jumps = 0
var direction = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and jumps == 0:
		jumps = 1
		velocity.y = JUMP_VELOCITY
		
	if not is_on_floor():
		if direction == 1:
			_animation_player.play("jump_r")
		if direction == -1:
			_animation_player.play("jump")
		if direction == 0:
			_animation_player.play("jump_r")
		
	if is_on_floor():
		jumps = 0
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED * spd
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if Input.is_action_pressed("ui_right") and is_on_floor():
		_animation_player.play("walk_r")
		
	if Input.is_action_pressed("ui_left") and is_on_floor():
		_animation_player.play("walk_l")
		
	if direction == 0 and is_on_floor():
		_animation_player.play("idl")
	move_and_slide()
	
	if Input.is_action_pressed("punch"):
		if direction == 1:
			_animation_player.play("punch_r")
		if direction == -1:
			_animation_player.play("punch_l")
		if direction == 0:
			_animation_player.play("punch_r")

	if Input.is_action_pressed("kick"):
		if direction == 1:
			_animation_player.play("kick_r")
		if direction == -1:
			_animation_player.play("kick_l")
		if direction == 0:
			_animation_player.play("kick_r")
			
	if Input.is_action_pressed("shoot"):
		if direction == 1:
			_animation_player.play("shoot_r")
		if direction == -1:
			_animation_player.play("shoot_l")
		if direction == 0:
			_animation_player.play("shoot_r")

	
