extends CharacterBody2D
class_name Daredevil

#const SPEED = 300.0
const JUMP_VELOCITY = -200.0
const RUNNING_SPEED = 300.0
const MAX_FALLING_SPEED = 200.0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anim = get_node("AnimatedSprite2D")
func _ready():
	velocity = Vector2.ZERO
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		if  velocity.y < MAX_FALLING_SPEED:
			velocity.y += gravity * delta
		else:
			velocity.y = MAX_FALLING_SPEED

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY  
	

	if velocity.x < RUNNING_SPEED:
		velocity.x += 100.0 * delta
	else:
		velocity.x = RUNNING_SPEED
		
	# Get the input direction and handle the movement/deceleration.
	var direction = 1
	if(velocity.x < 0):
		direction = -1
	#print(direction)
	if direction == -1:
		get_node("AnimatedSprite2D").flip_h = true
	elif direction == 1:
		get_node("AnimatedSprite2D").flip_h = false
	
	if velocity.x > 0 :
		if velocity.x == RUNNING_SPEED:
			anim.play("run")
		else:
			anim.play("walk")
	elif velocity.x == 0 && velocity.y == 0:
			anim.play("idle")
	if velocity.y < 0:
		anim.play("jump")
	if velocity.y > 0:
		anim.play("walk")
	print(velocity)
	move_and_slide()

