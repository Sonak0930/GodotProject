extends Area2D

class_name WaterObj_Dh

onready var default_anim = $Animations/Item_default_anim
onready var collect_anim = $Animations/Collect_anim

func _ready():
	default_anim.play("item_default_anim")
	

func _on_WaterObj_Dh_body_entered(body):
	if body is Player_Dh:
		collect_anim.play("Collect_anim")

func _on_Collect_anim_animation_finished(anim_name):
	queue_free()

