extends Area2D

var player
onready var world_node = get_tree().get_current_scene()
var enemyName = ["melee_attack area"]

func _ready():
	if world_node != null:
		for child in world_node.get_children():
			if child is Player_mj:
				player = child
				connect("body_entered",player,"_on_Enemies_body_entered",enemyName)
