extends Area2D

var bat_speed = 100

# get a reference to the sprite
onready var _animated_sprite = $AnimatedSprite
onready var player = get_node("/root/World_mj/Player_mj")
var enemyName = ["bat"]

func _ready():
	_animated_sprite.play("fly")
	connect("body_entered",player,"_on_Enemies_body_entered",enemyName)


func _process(delta):
	get_parent().offset += bat_speed * delta

