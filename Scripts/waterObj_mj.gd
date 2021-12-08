extends Area2D

onready var default_anim = $Animations/Item_default_anim
onready var collect_anim = $Animations/Collect_anim
onready var player = get_node("/root/World_mj/Player_mj")
var colorObjtName = ["waterBucket"]

func _ready():
	connect("body_entered",self,"_on_ColorObj_body_entered")
	connect("body_entered",player,"_on_ColorObj_body_entered",colorObjtName)
	default_anim.play("item_default_anim")

func _on_ColorObj_body_entered(body):
	if body is Player_mj:
		collect_anim.play("Collect_anim")

func _on_Collect_anim_animation_finished(anim_name):
	queue_free()
