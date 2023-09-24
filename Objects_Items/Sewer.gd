extends Area2D

@onready var anim = get_node("Alcantarilla")

func _ready():
	get_node("Alcantarilla").play("Closed")

func _on_body_entered(body):
	if body.name == "Daredevil":
		Game.DEATHFALL = true
		print(Game.DEATHFALL)
		anim.play("Open")


func _on_body_exited(body):
	if body.name == "Daredevil":
		Game.DEATHFALL = false
		anim.play("Open")
