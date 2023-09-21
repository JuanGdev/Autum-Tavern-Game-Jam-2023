extends CharacterBody2D


enum States {IDLE, TWEEN}

@export var tween_time := 0.2
@export var grid_size := Vector2(128.0, 128.0)
@export var can_move_diagonally := true

var state := States.IDLE


func _physics_process(_delta: float) -> void:
	match state:
		States.IDLE:
			var input := Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
			if not can_move_diagonally and input.x != 0.0 and input.y != 0.0:
				input.y = 0.0 # Favors x over y
			if input:
				state = States.TWEEN
				var tween := get_tree().create_tween()
				tween.finished.connect(tween_finished)
				tween.tween_property(self, "position", position + input * grid_size, tween_time)
		

func tween_finished() -> void:
	state = States.IDLE
