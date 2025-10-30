extends CharacterBody2D

#If you stumbled upon this file, this is for the advance programmers. 
#please look away pretty please; this is far later
#Also advance programmers: Hello!!! 
#I'm only taking the most optimal answer: GLGL
# movement by bung1r. And also chatgpt. But mostly me. 

@export var speed = 500
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	return velocity
	
func _physics_process(delta: float) -> void:
	var vel = get_input() * delta
	var collision = move_and_collide(vel)
	if collision:
		print("Collided with: ", collision.get_collider())

	#this is your only hint and also use docs ;)
