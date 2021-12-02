extends KinematicBody2D

export (int)var speed = 200
export (float)var rotation_speed = 1.5
var velocity = Vector2()
var rotation_dir = 0
func get_input():
	
	look_at(get_global_mouse_position())
	velocity = Vector2()
	
	
	
	if Input.is_action_pressed("ui_down"):
		velocity  = Vector2(-speed,0).rotated(rotation)
	elif Input.is_action_pressed("ui_up"):
		velocity  = Vector2(speed,0).rotated(rotation)

#everything requires for physics need to be under here.
func _physics_process(delta):
	get_input()

	#move
	move_and_slide(velocity)

	
