extends Area2D




func _on_body_entered(body):
	if body.name == "Daredevil":
		Game.DEATHFALL = true


func _on_body_exited(body):
	if body.name == "Daredevil":
		Game.DEATHFALL = false
