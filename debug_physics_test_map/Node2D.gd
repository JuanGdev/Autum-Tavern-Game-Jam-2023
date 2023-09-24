extends Node2D

@onready var camera = $Camera2D
@onready var character = $Daredevil

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	camera.position.x = character.position.x + 375
	camera.position.y = character.position.y - 50
	Game.ADREN -= 1
