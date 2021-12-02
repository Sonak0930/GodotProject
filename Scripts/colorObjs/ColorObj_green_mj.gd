extends Area2D

class_name ColorObj_green_mj

# set the color of paintBukkit to green
var defaultVal = 55 
var colorObj_R = defaultVal
var colorObj_G = defaultVal + 200
var colorObj_B = defaultVal

# connect body_entered signal to self and ui(currentColor circle)
func _ready():
	connect("body_entered",self,"_on_ColorObj_green_body_entered")
	var world = get_node("/root/World_mj")
	print(world)
	connect("body_entered",world,"_on_ColorObj_green_body_entered")
	set_color()

# when player entered to colorObj_green -> remove the colorObj_green
func _on_ColorObj_green_body_entered(body):
	if body is Player_mj:
		queue_free()

# set the color of paintBukkit to green
func set_color():
	var sprite = $Sprite
	sprite.modulate.r8 = colorObj_R
	sprite.modulate.g8 = colorObj_G
	sprite.modulate.b8 = colorObj_B
