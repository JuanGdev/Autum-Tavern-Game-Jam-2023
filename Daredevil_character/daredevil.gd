extends CharacterBody2D
class_name Daredevil





# Get the gravity from the project settings to be synced with RigidBody nodes.

@onready var anim = get_node("AnimatedSprite2D")
	
func _physics_process(delta):
	####-----------------jump and fall-----------------####
	if not is_on_floor():
		if  Game.CURRENT_SPEED.y < Game.MAX_FALLING_SPEED:
			Game.CURRENT_SPEED.y += Game.gravity * delta
		else:
			if Game.DEATHFALL == false:
				Game.CURRENT_SPEED.y = Game.MAX_FALLING_SPEED
			else:
				Game.CURRENT_SPEED.y += 250.0
		
	else:
		Game.CURRENT_SPEED.y = 0

	if Input.is_action_just_pressed("jump") and is_on_floor():
		Game.CURRENT_SPEED.y = Game.JUMP_VELOCITY  

	####---Walking into running, slowing and boost---####
	if Game.BOOSTED:
		if Game.CURRENT_SPEED.x < Game.SPEED_CAP:
			Game.CURRENT_SPEED.x += 200.0 * delta
		else:
			Game.CURRENT_SPEED.x = Game.SPEED_CAP
	elif Game.SLOWED:
		if Game.CURRENT_SPEED.x < Game.SLOW_SPEED:
			Game.CURRENT_SPEED.x -= 50.0 * delta
		else:
			Game.CURRENT_SPEED.x = Game.SLOW_SPEED	
	elif Game.CURRENT_SPEED.x < Game.RUNNING_SPEED:
		Game.CURRENT_SPEED.x += 100.0 * delta
	else:
		Game.CURRENT_SPEED.x = Game.RUNNING_SPEED
	
	

	####-----------------ANIMATION-----------------####
	if Game.CURRENT_SPEED.x < 0:
		get_node("AnimatedSprite2D").flip_h = true
	else:
		get_node("AnimatedSprite2D").flip_h = false
	
	if Game.CURRENT_SPEED.x == 0 && Game.CURRENT_SPEED.y == 0:
		anim.play("idle")
	elif Game.CURRENT_SPEED.x == Game.RUNNING_SPEED:
		anim.play("run")
	else:
		anim.play("walk")
	if Game.CURRENT_SPEED.y < 0:
		anim.play("jump")
	if Game.CURRENT_SPEED.y > 0:
		anim.play("jump")
		
	#use global variable to move character
	velocity = Game.CURRENT_SPEED
	move_and_slide()

