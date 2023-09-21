extends Node2D

@onready var camera = $Camera2D
@onready var character = $Daredevil
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	camera.position.x = character.position.x + 750
	camera.position.y = character.position.y - 350
	pass
