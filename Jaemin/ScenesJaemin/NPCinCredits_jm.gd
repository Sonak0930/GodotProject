extends Node2D

export var speed = 5
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	position.x = position.x + speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
