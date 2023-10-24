extends Area2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_body_entered(body):
	if body.has_method("takedamage"):
		body.takedamage()
