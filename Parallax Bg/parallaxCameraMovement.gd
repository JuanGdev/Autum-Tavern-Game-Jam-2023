xtends CharacterBody2D
@onready var playerCamera = $Camera2D

func _physics_process(delta):
	# Handle Jump.
	if Input.is_action_pressed("jump"):
		playerCamera.position.x += delta * 100
		
