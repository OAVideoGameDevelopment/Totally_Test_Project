extends CharacterBody2D

# Movement speed in pixels per second
@export var speed: float = 200.0

func _physics_process(delta: float) -> void:
	var input_vector := Vector2.ZERO

	# Read input from Input Map
	input_vector.x = Input.get_action_strength("Move Right") - Input.get_action_strength("Move Left")
	input_vector.y = Input.get_action_strength("Move Down") - Input.get_action_strength("Move Up")

	# Normalize to prevent faster diagonal movement
	if input_vector != Vector2.ZERO:
		input_vector = input_vector.normalized()

	# Apply movement
	velocity = input_vector * speed
	move_and_slide()
