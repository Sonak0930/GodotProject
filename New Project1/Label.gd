extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Health : 10"
	
	var player = get_node("../Week10")
	player.connect("damage_taken",self,"_on_Hero_damage_taken")
	
func _on_Hero_damage_taken(oldValue , newValue):
	print(""+ str(oldValue))
	text = "Health" + str(newValue)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
