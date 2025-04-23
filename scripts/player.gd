extends CharacterBody2D


const SPEED = 140.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	var input_vector = Vector2.ZERO

	# Get input for both horizontal and vertical directions
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	input_vector = input_vector.normalized()  # Prevent faster diagonal movement
	
	# Flip sprite horizontally (optional, based on direction)
	if input_vector.x > 0:
		animated_sprite.flip_h = false
	elif input_vector.x < 0:
		animated_sprite.flip_h = true
	
	if input_vector.x == 0 and input_vector.y == 0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("run")
	
	# Set velocity
	velocity = input_vector * SPEED
	
	# Apply movement
	move_and_slide()
