extends Area2D

class_name Bullet

onready var player = get_node("/root/World_mj/Player_mj")
var enemyName = ["bullet"]
onready var timer = $Timer

var speed = 750

func _ready():
	connect("body_entered",player,"_on_Enemies_body_entered",enemyName)
	timer.connect("timeout",self,"_on_Timer_timeout")
	timer.set_wait_time(1)
	timer.start()

func _physics_process(delta):
	# move the bullet
	position += transform.x * speed * delta


func _on_VisibilityNotifier2D_screen_exited():
	#print("Bullet's out of bound")
	queue_free()


func _on_Enemies_body_entered(body):
	#if body is Player_Dh:
	#print("Hits player")
	queue_free()


func _on_Timer_timeout():
	queue_free()
