extends Area2D

class_name Bullet

var speed = 750

func _physics_process(delta):
	# move the bullet
	position += transform.x * speed * delta


func _on_VisibilityNotifier2D_screen_exited():
	#print("Bullet's out of bound")
	queue_free()


func _on_Bullet_body_entered(body):
	#if body is Player_Dh:
		#print("Hits player")
	queue_free()
