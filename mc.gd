extends CharacterBody2D
@onready var _animation_player = $AnimationPlayer

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
		
	if direction == 1:
		Global.playerdirection = "r"
	if direction == -1:
		Global.playerdirection = "l"
	if direction == 0:
		Global.playerdirection = "r"
		
	if not is_on_floor():
		Global.Attack = 0
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
		Global.Attack = 0
		_animation_player.play("walk_r")
		
	if Input.is_action_pressed("ui_left") and is_on_floor():
		Global.Attack = 0
		_animation_player.play("walk_l")
		
	if direction == 0 and is_on_floor():
		Global.Attack = 0
		_animation_player.play("idl")
	move_and_slide()
	
	if Input.is_action_pressed("punch"):
		Global.Attack = "punch"
		if direction == 1:
			_animation_player.play("punch_r")
		if direction == -1:
			_animation_player.play("punch_l")
		if direction == 0:
			_animation_player.play("punch_r")

	if Input.is_action_pressed("kick"):
		Global.Attack = "kick"
		if direction == 1:
			_animation_player.play("kick_r")
		if direction == -1:
			_animation_player.play("kick_l")
		if direction == 0:
			_animation_player.play("kick_r")
			
	if Input.is_action_pressed("shoot"):
		Global.Attack = "shoot"
		if direction == 1:
			_animation_player.play("shoot_r")
		if direction == -1:
			_animation_player.play("shoot_l")
		if direction == 0:
			_animation_player.play("shoot_r")

func joe():
	Global.money += 5
	print(Global.money)
	
func takedamage():
	Global.hp -= Global.Amogboss_hit_damage
	print(Global.hp)
	
