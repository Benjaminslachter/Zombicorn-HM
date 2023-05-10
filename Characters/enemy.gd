extends CharacterBody2D

var SPEED = 30

var player 

var randomnum

var target

enum {
	SURROUND,
	ATTACK,
	HIT,
}

var state = SURROUND

func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	randomnum = rng.randf()

func physics_process(delta):
	match state:
		SURROUND:
			move(get_circle_position(randomnum), delta)

func move(target, delta):
	var directon = (target - global_position).normalized()
	var desired_volocity = directon * SPEED
	var steering = (desired_volocity - velocity) * delta * 2.5
	velocity += steering
	move_and_slide()
	

func get_circle_position(random):
	var kill_circle_center = player.global_position
	var radius = 40
	var angle = random * 2;
	var x = kill_circle_center.x + cos(angle) * radius;
	var y = kill_circle_center.y + sin(angle) * radius;
	
	return Vector2(x, y)
