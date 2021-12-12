extends Area2D

class_name Bullet

var player
onready var world_node = get_tree().get_current_scene()
var enemyName = ["bullet"]
onready var visNotifier = $VisibilityNotifier2D

var speed = 750

func _ready():
	if world_node != null:
		for child in world_node.get_children():
			if child is Player_mj:
				player = child
				connect("body_entered",player,"_on_Enemies_body_entered",enemyName)
	connect("body_entered", self,"_on_Enemies_body_entered")
	visNotifier.connect("screen_exited",self,"_on_VisibilityNotifier2D_screen_exited")



func _physics_process(delta):
	# move the bullet
	position += transform.x * speed * delta


func _on_VisibilityNotifier2D_screen_exited():
	#print("Bullet's out of bound(screen)"
	queue_free()


func _on_Enemies_body_entered(body):
	if body is Player_mj:
		$bullet_attackSound.play()
	queue_free()
