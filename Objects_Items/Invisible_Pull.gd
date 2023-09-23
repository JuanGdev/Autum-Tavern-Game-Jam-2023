extends Area2D



func _on_body_entered(body):
	if body.name == "Daredevil":
			Game.CURRENT_SPEED.y += Game.gravity * 10
		
