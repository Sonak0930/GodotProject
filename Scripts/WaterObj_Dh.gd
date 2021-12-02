extends Area2D

class_name WaterObj_Dh

onready var default_anim = $Animations/Item_default_anim
onready var collect_anim = $Animations/Collect_anim

var is_collided = false

func _ready():
	default_anim.play("item_default_anim")
	

func _process(delta):
	if is_collided and !collect_anim.is_playing():
		queue_free()
	

func _on_WaterObj_body_entered(body):
	if body is Player_Dh:
		collect_anim.play("Collect_anim")
		is_collided = true
