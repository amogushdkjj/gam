extends CharacterBody2D


const SPEED = 150.0 
const JUMP_VELOCITY = -600.0
var jumps = 0
var spd = 3

var direction2 = 0

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
		
		
		
	if is_on_floor():
		jumps = 0
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED * spd
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if direction == 1:
		direction2 = "r"
	else:
		direction2 = "l"
	move_and_slide()
	
