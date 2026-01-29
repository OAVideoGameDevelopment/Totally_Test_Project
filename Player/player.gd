extends CharacterBody2D

#If you stumbled upon this file, this is for the advance programmers. 
#please look away pretty please; this is far later
#Also advance programmers: Hello!!! 
#I'm only taking the most optimal answer: GLGL

func _physics_process(_delta: float) -> void:
	#this is your only hint and also use docs
	if (Input.is_anything_pressed()):
		print("help")
		position.x += 1
