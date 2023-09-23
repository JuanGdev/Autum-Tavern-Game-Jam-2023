extends Area2D

@onready var timer = $Timer
@onready var sprite = $Cocacola

func _on_body_entered(body):
	if body.name == "Daredevil":
		Game.SCORECURRENT += 500
		Game.ADREN += 200
		Game.SLOWED = false
		Game.BOOSTED = true
		sprite.hide()
		timer.start()


func _on_timer_timeout():
	Game.BOOSTED = false
	queue_free()
