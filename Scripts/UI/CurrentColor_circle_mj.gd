extends Sprite

class_name CurrentColor_circle_mj
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func reset_color():
	modulate=Color(0,0,0)

func update_color(color):
	modulate.r8 = color.r
	modulate.g8 = color.g
	modulate.b8 = color.b

#func get_color() -> Array:
#	var colors = Array()
#	colors = [ modulate.r8,modulate.g8,modulate.b8 ]
#	return colors
