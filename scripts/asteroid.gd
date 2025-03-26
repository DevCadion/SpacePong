extends Area2D

@export var speed = 140
@export var rotation_speed = 1.3
var start_side

func _ready():
	if (global_position.x > 540):
		start_side = "right"
	else:
		start_side = "left"

func _process(delta):
	if (start_side == "right"):
		global_position.x -= speed * delta
		rotation -= rotation_speed * delta
	elif (start_side == "left"):
		global_position.x += speed * delta 
		rotation += rotation_speed * delta
