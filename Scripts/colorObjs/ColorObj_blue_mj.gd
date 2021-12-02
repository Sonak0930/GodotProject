extends Area2D

class_name ColorObj_blue_mj

var defaultVal = 55 
var colorObj_R = defaultVal
var colorObj_G = defaultVal
var colorObj_B = defaultVal +200

func _ready():
	connect("body_entered",self,"_on_ColorObj_blue_body_entered")
	var world = get_node("/root/World_mj")
	print(world)
	connect("body_entered",world,"_on_ColorObj_blue_body_entered")
	set_color()

func _on_ColorObj_blue_body_entered(body):
	if body is Player_mj:
		queue_free()

func set_color():
	var sprite = $Sprite
	sprite.modulate.r8 = colorObj_R
	sprite.modulate.g8 = colorObj_G
	sprite.modulate.b8 = colorObj_B