extends Area2D

var bat_speed = 100

# get a reference to the sprite
onready var _animated_sprite = $AnimatedSprite
var player
onready var world_node = get_tree().get_current_scene()

var speed = 90

var enemyName = ["bat"]

func _ready():
	_animated_sprite.play("fly")
	if world_node != null:
		for child in world_node.get_children():
			if child is Player_mj:
				player = child
				connect("body_entered",player,"_on_Enemies_body_entered",enemyName)



func _process(delta):
	get_parent().offset += bat_speed * delta

