extends Area2D
# adds SPEED, decreases ADRENALINE
@onready var timer = $Timer
@onready var sprite = $Sprite2D

func _on_body_entered(body):
	$AudioStreamPlayer2D.play()
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

