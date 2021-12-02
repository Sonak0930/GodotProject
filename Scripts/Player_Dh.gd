extends KinematicBody2D

class_name Player_Dh

onready var anima = $AnimatedSprite

var speed = 120.0

func _process(delta):
	
	_moveWithKeyboard()

	if Input.is_action_pressed("ui_right"):
		anima.play("run")
		anima.set_animation("Right")
	elif Input.is_action_pressed("ui_left"):
		anima.play("run")
		anima.set_animation("Left")
	else:
		anima.stop()


func _moveWithKeyboard():
	if Input.is_action_pressed("ui_left"):
		#v1 = Vector2.LEFT
		move_and_slide(Vector2(-speed,0))
	if Input.is_action_pressed("ui_right"):
		#v1 = Vector2.RIGHT
		move_and_slide(Vector2(speed,0))
	if Input.is_action_pressed("ui_up"):
		#v2 = Vector2.UP
		move_and_slide(Vector2(0,-speed))
	if Input.is_action_pressed("ui_down"):
		move_and_slide(Vector2(0,speed))
