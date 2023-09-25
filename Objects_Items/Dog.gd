extends Area2D
# adds SPEED, decreases ADRENALINE
@onready var timer = $Timer
@onready var sprite = $AnimatedSprite2D

func _ready():
	sprite.play("default")

func _on_body_entered(body):
	if body.name == "Daredevil":
		Game.SCORECURRENT += 500
		Game.ADREN -= 100
		Game.SLOWED = false
		Game.BOOSTED = true
		sprite.play("pet")
		timer.start()

func _on_timer_timeout():
	Game.BOOSTED = false
	queue_free()

