extends Button

var tutorial = 0



func _on_pressed():
	tutorial = tutorial + 1
	if tutorial == 1:
		text = str("Use the arrow key to move!!!!!!!!!")
	if tutorial == 2:
		text = str("Press space to jump you can do it twice!!!!")
	if tutorial == 3:
		text = str("press Z to punch, X to kick, C to shoot")
	if tutorial == 4:
		visible = false
