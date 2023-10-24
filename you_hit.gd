extends Area2D

@onready var _animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _process(delta):
	if int(Global.Attack) == 0:
		visible = false
		_animation_player.play("RESET")
	if str(Global.Attack) == "punch":
		visible = true
		if str(Global.playerdirection) == "l":
			_animation_player.play("punch_l")
		if str(Global.playerdirection) == "r":
			_animation_player.play("punch_r")
	
	if str(Global.Attack) == "kick":
		visible = true
		if str(Global.playerdirection) == "l":
			_animation_player.play("kick_l")
		if str(Global.playerdirection) == "r":
			_animation_player.play("kick_r")
		

func _on_body_entered(body):
		if body.has_method("damage"):
			body.damage()



