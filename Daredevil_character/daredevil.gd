extends CharacterBody2D
class_name Daredevil


const RUNNING_SPEED = 500.0
const SPEED_CAP = 800.0
const SLOW_SPEED = 250.0
const MAX_FALLING_SPEED = 400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.

@onready var anim = get_node("AnimatedSprite2D")
	
func _physics_process(delta):

	if Game.ADREN == 0:
		Game.HEALTH = Game.HEALTH+1
		Game.ADREN = 1000
	if Game.HEALTH == 1:
		
		####-----------------jump and fall-----------------####
		if not is_on_floor():
			if  Game.CURRENT_SPEED.y < MAX_FALLING_SPEED:
				Game.CURRENT_SPEED.y += Game.gravity * delta
			else:
				$AudioStreamPlayer2D.play()
				if Game.DEATHFALL == false:
					Game.CURRENT_SPEED.y = MAX_FALLING_SPEED
				else:
					Game.CURRENT_SPEED.y += 10000
			
		else:
			Game.CURRENT_SPEED.y = 0

		if Input.is_action_just_pressed("jump") and is_on_floor():
			$jump.play()
			Game.CURRENT_SPEED.y = Game.JUMP_VELOCITY  

		####---Walking into running, slowing and boost---####
		if Game.BOOSTED:
			if Game.CURRENT_SPEED.x < SPEED_CAP:
				Game.CURRENT_SPEED.x += 200.0 * delta
			else:
				Game.CURRENT_SPEED.x = SPEED_CAP
		elif Game.SLOWED:
			if Game.CURRENT_SPEED.x < SLOW_SPEED:
				Game.CURRENT_SPEED.x -= 50.0 * delta
			else:
				Game.CURRENT_SPEED.x = SLOW_SPEED	
		elif Game.CURRENT_SPEED.x < RUNNING_SPEED:
			Game.CURRENT_SPEED.x += 100.0 * delta
		else:
			Game.CURRENT_SPEED.x = RUNNING_SPEED
		
		

		####-----------------ANIMATION-----------------####
		if Game.CURRENT_SPEED.x < 0:
			get_node("AnimatedSprite2D").flip_h = true
		else:
			get_node("AnimatedSprite2D").flip_h = false
		
		if Game.CURRENT_SPEED.x == 0 && Game.CURRENT_SPEED.y == 0:
			anim.play("idle")
		elif Game.CURRENT_SPEED.x == RUNNING_SPEED:
				anim.play("run")
		elif Game.CURRENT_SPEED.y < 0:
			anim.play("jump")
		elif Game.CURRENT_SPEED.y > 0:
			anim.play("fall")
		else:
			anim.play("walk")
			
		#use global variable to move character
		velocity = Game.CURRENT_SPEED
		move_and_slide()

	if Game.HEALTH == 2:
				####-----------------jump and fall-----------------####
		if not is_on_floor():
			if  Game.CURRENT_SPEED.y < MAX_FALLING_SPEED:
				Game.CURRENT_SPEED.y += Game.gravity * delta
			else:
				if Game.DEATHFALL == false:
					Game.CURRENT_SPEED.y = MAX_FALLING_SPEED
				else:
					Game.CURRENT_SPEED.y += 600.0
			
		else:
			Game.CURRENT_SPEED.y = 0

		if Input.is_action_just_pressed("jump") and is_on_floor():
			Game.CURRENT_SPEED.y = Game.JUMP_VELOCITY  

		####---Walking into running, slowing and boost---####
		if Game.BOOSTED:
			if Game.CURRENT_SPEED.x < SPEED_CAP*2:
				Game.CURRENT_SPEED.x += 200.0 * delta
			else:
				Game.CURRENT_SPEED.x = SPEED_CAP*2
		elif Game.SLOWED:
			if Game.CURRENT_SPEED.x < SLOW_SPEED:
				Game.CURRENT_SPEED.x -= 50.0 * delta
			else:
				Game.CURRENT_SPEED.x = SLOW_SPEED*5
		elif Game.CURRENT_SPEED.x < RUNNING_SPEED*2:
			Game.CURRENT_SPEED.x += 100.0 * delta
		else:
			Game.CURRENT_SPEED.x = RUNNING_SPEED*2
		
		

		####-----------------ANIMATION-----------------####
		if Game.CURRENT_SPEED.x < 0:
			get_node("AnimatedSprite2D").flip_h = true
		else:
			get_node("AnimatedSprite2D").flip_h = false
		
		if Game.CURRENT_SPEED.x == 0 && Game.CURRENT_SPEED.y == 0:
			anim.play("idle")
		elif Game.CURRENT_SPEED.x == RUNNING_SPEED:
				anim.play("run")
		elif Game.CURRENT_SPEED.y < 0:
			anim.play("jump")
		elif Game.CURRENT_SPEED.y > 0:
			anim.play("fall")
		else:
			anim.play("walk")
			
		#use global variable to move character
		velocity = Game.CURRENT_SPEED
		move_and_slide()

	if Game.HEALTH == 3:
	####-----------------jump and fall-----------------####
	
		if not is_on_floor():
			if  Game.CURRENT_SPEED.y < MAX_FALLING_SPEED:
				Game.CURRENT_SPEED.y += Game.gravity * delta
			else:
				if Game.DEATHFALL == false:
					Game.CURRENT_SPEED.y = MAX_FALLING_SPEED
				else:
					Game.CURRENT_SPEED.y += 600.0
			
		else:
			Game.CURRENT_SPEED.y = 0

		if Input.is_action_just_pressed("jump") and is_on_floor():
			Game.CURRENT_SPEED.y = Game.JUMP_VELOCITY  

		####---Walking into running, slowing and boost---####
		if Game.BOOSTED:
			if Game.CURRENT_SPEED.x < SPEED_CAP/2:
				Game.CURRENT_SPEED.x += 200.0 * delta
			else:
				Game.CURRENT_SPEED.x = SPEED_CAP/2
		elif Game.SLOWED:
			if Game.CURRENT_SPEED.x < SLOW_SPEED/2:
				Game.CURRENT_SPEED.x -= 50.0 * delta
			else:
				Game.CURRENT_SPEED.x = SLOW_SPEED/2
		elif Game.CURRENT_SPEED.x < RUNNING_SPEED/2:
			Game.CURRENT_SPEED.x += 100.0 * delta
		else:
			Game.CURRENT_SPEED.x = RUNNING_SPEED/2
		
		

		####-----------------ANIMATION-----------------####
		if Game.CURRENT_SPEED.x < 0:
			get_node("AnimatedSprite2D").flip_h = true
		else:
			get_node("AnimatedSprite2D").flip_h = false
		
		if Game.CURRENT_SPEED.x == 0 && Game.CURRENT_SPEED.y == 0:
			anim.play("idle")
		elif Game.CURRENT_SPEED.x == RUNNING_SPEED:
				anim.play("run")
		elif Game.CURRENT_SPEED.y < 0:
			anim.play("jump")
		elif Game.CURRENT_SPEED.y > 0:
			anim.play("fall")
		else:
			anim.play("walk")
			
		#use global variable to move character
		velocity = Game.CURRENT_SPEED
		move_and_slide()
