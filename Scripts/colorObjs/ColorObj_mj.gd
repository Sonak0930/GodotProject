extends Area2D

class_name ColorObj_mj

var defaultVal = 55 
var colorObj_R = defaultVal
var colorObj_G = defaultVal
var colorObj_B = defaultVal

func _ready():
	connect("body_entered",self,"_on_ColorObj_body_entered")
	set_color()

func _on_ColorObj_body_entered(body):
	if body is Player:
		queue_free()

func set_color():
	var sprite = $Sprite
	
	var rnum = rand_range(0,255)
	if 0 <= rnum  && rnum < 85:
		colorObj_R += 200
	if 85 <= rnum && rnum < 170:
		colorObj_G += 200
	if 170 <= rnum && rnum <= 255:
		colorObj_B += 200
	
	sprite.modulate.r8 = colorObj_R
	sprite.modulate.g8 = colorObj_G
	sprite.modulate.b8 = colorObj_B
