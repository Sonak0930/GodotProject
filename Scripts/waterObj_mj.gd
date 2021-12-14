"""
Scene owner: DongHyun
Support: MyungJi
"""


extends Area2D

onready var default_anim = $Animations/Item_default_anim
onready var collect_anim = $Animations/Collect_anim
var player
onready var world_node = get_tree().get_current_scene()

var colorObjtName = ["waterBucket"]

func _ready():
	if world_node != null:
		for child in world_node.get_children():
			if child is Player_mj:
				player = child
				connect("body_entered",self,"_on_ColorObj_body_entered")
				connect("body_entered",player,"_on_ColorObj_body_entered",colorObjtName)
				
	default_anim.play("item_default_anim")

func _on_ColorObj_body_entered(body):
	if body is Player_mj:
		# Make sure to collect only once
		disconnect("body_entered", player, "_on_ColorObj_body_entered")
		collect_anim.play("Collect_anim")
		$collectable_takenSound.play()
		

func _on_Collect_anim_animation_finished(anim_name):
	queue_free()
