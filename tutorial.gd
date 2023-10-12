extends Button

var tutorial = 0



func _on_pressed():
	tutorial = tutorial + 1
	if tutorial == 1:
		text = str("Use the arrow key to move or wasd!!!!!!!!!")
	if tutorial == 2:
		text = str("Press space or w to jump you can do it twice!!!!")
	if tutorial == 3:
		text = str("press Z to punch, X to kick, C to shoot")
	if tutorial == 4:
		text = str("the health bar is to the right")
	if tutorial == 5:
		visible = false
