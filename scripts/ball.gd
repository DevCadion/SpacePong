extends CharacterBody2D


var started = false
var start_speed = 500
var incremental_speed = 1.02
var angle = [-250, 250]

func _physics_process(delta):
	if Input.is_action_pressed("vai") and started == false:
		start_game()
	if started:
		var collisions = move_and_collide(velocity * delta)
		if collisions != null:
			velocity = velocity.bounce(collisions.get_normal()) * incremental_speed

func start_game():
	started = true
	velocity.y = - start_speed
	velocity.x = angle.pick_random()
