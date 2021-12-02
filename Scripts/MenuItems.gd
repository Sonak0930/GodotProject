extends Node2D


var speed = 750

func _process(delta):
	if position.y > 0:
		position.y -= speed * delta
	else:
		position.y = 0
	
