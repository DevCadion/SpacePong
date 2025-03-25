extends Node2D

@onready var  ball= $Ball

@onready var label_pongs = $Pongs

func _process(delta): 
	label_pongs.text = str(ball.pongs)
