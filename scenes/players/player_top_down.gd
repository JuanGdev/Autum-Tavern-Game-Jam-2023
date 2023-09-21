extends CharacterBody2D


@export var speed := 200.0
@export var has_acceleration := false
@export var acceleration := 1_000
@export var deacceleration := 1_000


func _physics_process(delta: float) -> void:
	var input := Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	if has_acceleration:
		if input.length() == 0.0:
			velocity = velocity.move_toward(Vector2.ZERO, deacceleration * delta)
		else:
			velocity = velocity.move_toward(input * speed, acceleration * delta)
	else:
		velocity = input * speed
	move_and_slide()
