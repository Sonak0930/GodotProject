extends Area2D

class_name WaterObj_mj

func _ready():
	connect("body_entered",self,"_on_WaterObj_mj_body_entered")
	var world = get_node("/root/World_mj")
	print(world)
	connect("body_entered",world,"_on_WaterObj_mj_body_entered")

func _on_WaterObj_mj_body_entered(body):
	if body is Player_mj:
<<<<<<< Updated upstream
		queue_free()
=======
		# Make sure to collect only once
		disconnect("body_entered", player, "_on_ColorObj_body_entered")
		collect_anim.play("Collect_anim")
		

func _on_Collect_anim_animation_finished(anim_name):
	queue_free()
>>>>>>> Stashed changes
