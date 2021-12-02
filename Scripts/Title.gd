extends Node2D


var speed = 300

func _process(delta):
	if position.y < 0:
		position.y += speed * delta
	
