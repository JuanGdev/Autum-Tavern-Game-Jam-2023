extends Area2D



func _on_body_entered(body):
	if body.name == "Daredevil":
		print("Onpad")
		Game.CURRENT_SPEED.y = (Game.JUMP_VELOCITY)*2.5

	
