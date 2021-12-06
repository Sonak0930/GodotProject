extends Area2D

class_name WaterObj_mj

func _ready():
	connect("body_entered",self,"_on_WaterObj_mj_body_entered")
	var world = get_node("/root/World_mj")
	print(world)
	connect("body_entered",world,"_on_WaterObj_mj_body_entered")

func _on_WaterObj_mj_body_entered(body):
	if body is Player_mj:
		queue_free()
