
extends Area2D

class_name ColorObj_Dh

onready var default_anim = $Animations/Item_default_anim
onready var collect_anim = $Animations/Collect_anim
onready var world_node = get_tree().get_current_scene()

var is_collided = false

func _ready():
	default_anim.play("item_default_anim")

func _on_Collect_anim_animation_finished(anim_name):
	queue_free()


func _on_RandomColor_body_entered(body):
	if body is Player_mj and !is_collided:
		collect_anim.play("Collect_anim")
		is_collided = true
		
		if world_node != null:
			#world_node.CurrentColor = Color(world_node.CurrentColor) + self.modulate
			var c = Color(self.modulate)
			var scaled_up = Color(int(round(c.r * 255)), int(round(c.g * 255)), int(round(c.b * 255)), 0)
			world_node.CurrentColor = Color(world_node.CurrentColor) + scaled_up
			world_node.update_ui()
			world_node.compare_color()
			world_node.life_is_color()
			
		
		
		
		
