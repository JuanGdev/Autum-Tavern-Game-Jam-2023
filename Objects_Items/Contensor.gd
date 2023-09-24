extends Area2D

@onready var timer = $Timer
@onready var sprite = $Contensor

func _on_body_entered(body):
	if body.name == "Daredevil":
		Game.SCORECURRENT += 500
		Game.ADREN += 200
		Game.BOOSTED = false
		Game.SLOWED = true
		sprite.hide()
		timer.start()


func _on_timer_timeout():
	Game.SLOWED = false
	queue_free()
