extends Area2D

var bat_speed = 90

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
				connect("body_entered",self,"_on_Enemies_body_entered")

func _on_Enemies_body_entered(body):
	if body is Player_mj:
		$bat_wingSound.stop()
		$bat_attackSound.play()
		$bat_wingSound.play()

func _process(delta):
	if get_parent() is PathFollow2D:
		get_parent().offset += bat_speed * delta

