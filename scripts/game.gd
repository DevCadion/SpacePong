extends Node2D

@onready var  ball= $Ball
@onready var label_pongs = $Pongs
@onready var label_tutorial =$Tutorial
@onready var positions = $Positions
var asteroid_scen = preload("res://scens/asteroid.tscn")
var lest_positions 

func _process(delta): 
	if ball.started:
		label_pongs.visible = true
		label_tutorial.visible = false
	label_pongs.text = str(ball.pongs)

 
func _on_full_body_entered(body):
	call_deferred("reload_scens")

func reload_scens():
	get_tree().reload_current_scene()


func _on_timer_timeout():
	spawn_asteroid()

func spawn_asteroid():
	if (ball.started):
		var positions_list = positions.get_children()
		var spawn_position = positions_list.pick_random()
		
		if (spawn_position != lest_positions):
			var asteroid_instance = asteroid_scen.instantiate()
			asteroid_instance.global_position = spawn_position.position
			add_child(asteroid_instance)
			lest_positions = spawn_position
		else:
			spawn_asteroid()
