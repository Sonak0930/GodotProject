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
	var velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed
	move_and_slide(velocity)
