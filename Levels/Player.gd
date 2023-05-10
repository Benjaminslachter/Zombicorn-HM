extends CharacterBody2D

@export var move_speed : float = 100
@export var starting_direction : Vector2 = Vector2(0,1)


func _physics_process(_delta):
	#Get movement imput
	var input_direction = Vector2(
		Input.get_action_strength("Right") - Input.get_action_strength("Left"), 
		Input.get_action_strength("Down") - Input.get_action_strength("Up"))
	
	velocity = input_direction * move_speed
	move_and_slide()


