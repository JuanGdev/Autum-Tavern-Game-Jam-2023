extends Node2D

@onready var camera = $Camera2D
@onready var character = $Daredevil

func _ready():
	$Camera2D/AudioStreamPlayer2D.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	camera.position.x = character.position.x + 375
	camera.position.y = character.position.y - 50
	Game.ADREN -= 1
	if Game.ADREN > 1100:
		Game.ADREN = 1100

