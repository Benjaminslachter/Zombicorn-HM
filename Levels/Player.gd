extends CharacterBody2D

@export var move_speed : float = 100
@export var starting_direction : Vector2 = Vector2(0,1)
@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

func _ready():
	update_animation_parameters(starting_direction)

func _physics_process(_delta):
	#Get movement imput
	var input_direction = Vector2(
		Input.get_action_strength("Right") - Input.get_action_strength("Left"), 
		Input.get_action_strength("Down") - Input.get_action_strength("Up")
	)
	
	update_animation_parameters(input_direction)
	
	#Get velocity
	velocity = input_direction * move_speed
	
	#Move and slide func
	move_and_slide()
	
	pick_new_state()

func update_animation_parameters(move_input : Vector2):
	#Don't change animation parameters if there is no move input.
	if(move_input != Vector2.ZERO):
		animation_tree.set("parameters/Walk/blend_position", move_input)
		animation_tree.set("parameters/Idle/blend_position", move_input)

func pick_new_state():
	#Choose new state based on player input.
	if(velocity != Vector2.ZERO):
		state_machine.travel("Walk")
	else:
		state_machine.travel("Idle")
