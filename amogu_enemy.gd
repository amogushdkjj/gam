extends CharacterBody2D

var amoghp = 20

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var _animation_player = $AnimationPlayer

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	var amoghealth = $ProgressBar
	amoghealth.value = amoghp * 5
	
	var coin = $coin
	coin.visible = false

	if amoghp == 0 or amoghp < 0:
		coin.visible = true
		_animation_player.play("die")
	
		
	move_and_slide()
	
	
	
func damage():
	amoghp -= Global.atk
	print(amoghp)





func _on_coin_body_entered(body):
	if body.has_method("joe"):
		body.joe()
		queue_free()

