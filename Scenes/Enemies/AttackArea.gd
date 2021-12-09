extends Area2D

onready var player = get_node("/root/World_mj/Player_mj")

var enemyName = ["melee_attack area"]

func _ready():
	connect("body_entered",player,"_on_Enemies_body_entered",enemyName)
