extends CharacterBody2D

var hp = 500
var dir = "l"
var chase = false
var player = null
var speed = 100

const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var _animation_player = $AnimationPlayer

func _physics_process(delta):

	#if _animation_player.current_animation == "punch" or "punch_r":
		#return

	if chase == true:
		
		if (player.position.x - position.x) < 0:
			_animation_player.play("walk_l")
			dir = "l"
		else:
			_animation_player.play("walk_r")
			dir = "r"
		move()
		
	if not is_on_floor():
		velocity.y += gravity * delta

	var bosshealth = $ProgressBar
	bosshealth.value = hp/5
	
	var amoghit = $Area2D2
	var coin = $Area2D

	
	if hp == 0 or hp < 0:
		_animation_player.play("die")
		chase = false
	
func damage():
	hp -= Global.atk
	print(hp)


func move():
	position += (player.position - position)/speed
	move_and_slide()
	

func _on_area_2d_body_entered(body):
		if body.has_method("joe"):
			body.joe()
			Global.money += 10
			$Area2D.queue_free()
			


func _on_detectionarea_body_entered(body):
	player = body
	chase = true
	

func _on_detectionarea_body_exited(body):
	chase = false
	
	


func _on_attackarea_body_entered(body):
	if body.has_method("takedamage"):
		print("atak")
		chase = false
		if dir == "l":
			_animation_player.play("punch")
		else:
			_animation_player.play("punch_r")
		await(get_tree().create_timer(1).timeout)
		chase = true
