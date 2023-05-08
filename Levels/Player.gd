extends CharacterBody2D


@export var speed = 100

func _process(delta):
	var movement_direction := Vector2.ZERO
	
	if Input.is_action_pressed("Up"):
		movement_direction.y = -1
	if Input.is_action_pressed("Down"):
		movement_direction.y = 1
	if Input.is_action_pressed("Left"):
		movement_direction.x = -1
	if Input.is_action_pressed("Right"):
		movement_direction.y = 1
	
	
	movement_direction = movement_direction.normalized()
	move_and_slide()
	
	
	

