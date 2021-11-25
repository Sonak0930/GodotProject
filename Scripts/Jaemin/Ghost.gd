extends AnimatedSprite

onready var direction = randi()%4
onready var moveleft = false
onready var moveright = false
onready var moveup = false
onready var movedown = false

onready var timer= get_node("Timer")

func _initTimer():
	timer.set_wait_time(5)
	timer.start()
	
func _ready():
	randomize()
	_initTimer()
	
	
	
func _process(delta):
	
	

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
		self.play("run")
		self.set_animation("Right")
		v1 = Vector2.RIGHT
	elif moveleft:
		self.play("run")
		self.set_animation("Left")
		v1 = Vector2.LEFT
	else:
		self.stop()
		
	if moveup:
		v2 = Vector2.UP
	elif movedown:
		v2 = Vector2.DOWN
		
	v1 += v2
	
	position += v1
	

	
	


func _on_Timer_timeout():
	print(direction)
	direction = randi()%4
	_initTimer()
	
