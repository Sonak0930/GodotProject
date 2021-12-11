extends KinematicBody2D

class_name Player_mj

onready var anima = $AnimatedSprite
#var speed = 120.0
var speed = 150

signal attacked(body, enemyName)
signal collected(colorObjName)

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
	
# Normalize update
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


func _on_ColorObj_body_entered(body,colorObjName):
	if body != self:
		return
	emit_signal("collected",colorObjName)
	print("player said: I took ",colorObjName)

func _on_Enemies_body_entered(body, enemyName):
	if body != self:
		return
	emit_signal("attacked",enemyName)
	print("player said: I've just attacked by ",enemyName)
