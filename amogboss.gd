extends CharacterBody2D

var hp = 500
var dir = "l"

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var _animation_player = $AnimationPlayer

func _physics_process(delta):

	if not is_on_floor():
		velocity.y += gravity * delta

	var bosshealth = $ProgressBar
	bosshealth.value = hp/5
	
	var amoghit = $Area2D2

	move_and_slide()
	
	if hp == 0 or hp < 0:
		_animation_player.play("die")
	
func damage():
	hp -= Global.atk
	print(hp)

