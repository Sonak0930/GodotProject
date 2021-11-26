extends Node2D
var player

func _ready():
	var sprite = Sprite.new()
	sprite.texture = load("res://icon.png")
	sprite.position= Vector2(400,400)

	add_child(sprite)
	
	
	player  = load("res://Week10.tscn")
	
	
	
func _process(delta):
	if Input.is_action_pressed("summon_clone"):
		create_player()
func create_player():
	
	var node = player.instance()
	
	var size = get_viewport().size
	
	node.position = Vector2(randi()%int(size.x)+1,randi()%int(size.y)+1)
	
	add_child(node)
	

