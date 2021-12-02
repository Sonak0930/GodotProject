extends KinematicBody2D

onready var direction = randi()%4
onready var moveleft = false
onready var moveright = false
onready var moveup = false
onready var movedown = false
onready var speed = 100
onready var timer= $
onready var anim = get_node("AnimatedSprite")

func _initTimer():
	timer.set_wait_time(5)
	timer.start()
	
func _ready():
	randomize()
	_initTimer()
	
	
	
func _move():
	var v1 = Vector2.ZERO
	var v2 = Vector2.ZERO

	if direction == 0:
		moveleft = true
		moveright = false
		
	elif direction == 1:
		moveleft = false
		moveright = true
	
	if direction == 2:
		moveup = true
		movedown = false
	
	elif direction == 3:
		moveup = false
		movedown = true
		
	if moveright:
		anim.play("run")
		anim.set_animation("Right")
		v1 = Vector2.RIGHT
	elif moveleft:
		anim.play("run")
		anim.set_animation("Left")
		v1 = Vector2.LEFT
	else:
		anim.stop()
		
	if moveup:
		v2 = Vector2.UP
	elif movedown:
		v2 = Vector2.DOWN
		
	v1 += v2
	v1*speed
	move_and_slide(v1)
	

func _physics_process(delta):
	_move()
	
func _on_Timer_timeout():
	print(direction)
	direction = randi()%4
	_initTimer()
	
