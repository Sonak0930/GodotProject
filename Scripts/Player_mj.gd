"""
Scene owner: JaeMin
Support: Myungji, DongHyun
"""


extends KinematicBody2D

class_name Player_mj

enum State {RUN_RIGHT, RUN_LEFT}
var run_state = State.RUN_RIGHT

onready var anima = $AnimatedSprite
onready var animaPlayer = $AnimationPlayer

var speed = 150

var sec_cur = 0.0

var is_collided = false

signal attacked(body, enemyName)
signal collected(colorObjName)

func _ready():
	anima.play("IdleRight")


func _process(delta):
	if is_collided:
		sec_cur += delta
		if sec_cur > 2:
			is_collided = false
			sec_cur = 0
	
	_moveWithKeyboard()
	
	# Animation updated
	if Input.is_action_pressed("ui_right"):
		anima.set_animation("Right")
		run_state = State.RUN_RIGHT
	elif Input.is_action_pressed("ui_left"):
		anima.set_animation("Left")
		run_state = State.RUN_LEFT
	elif Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down"):
		if run_state == State.RUN_RIGHT:
			anima.set_animation("Right")
		else:
			anima.set_animation("Left")
	else:
		if run_state == State.RUN_RIGHT:
			anima.set_animation("IdleRight")
		else:
			anima.set_animation("IdleLeft")
	
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
	if is_collided:
		return
	
	is_collided = true
	
	emit_signal("attacked",enemyName)
	animaPlayer.play("ouch")
	$Player_OuchSound.play()
	print("player said: I've just attacked by ",enemyName)
