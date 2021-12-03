extends Sprite

class_name Player
var angular_speed = PI

var speed = 200
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var health = 10


signal damage_taken(old_value,new_value)
# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = get_node("Timer")
	timer.connect("timeout",self,"_on_Timer_Timeout")
 # Replace with function body.

func _on_Timer_Timeout():
	visible = not visible
	print("time out")
	
func test():
	print("test")
func _circularMove(delta):
	rotation += angular_speed * delta
	var v = Vector2.UP.rotated(rotation) * speed
	position += v * delta
	
func _moveWithKeyboard():
	var v1 = Vector2.ZERO
	var v2 = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		v1 = Vector2.LEFT
	if Input.is_action_pressed("ui_right"):
		v1 = Vector2.RIGHT
	if Input.is_action_pressed("ui_up"):
		v2 = Vector2.UP
	if Input.is_action_pressed("ui_down"):
		v2 = Vector2.DOWN
		
	v1 += v2
	
	position += v1
	
func _process(delta):
	_moveWithKeyboard()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func take_damage(amount):
	var prevHealth= health;
	health -= amount
	
	if health < 0:
		print("Dead")
		health = 0
		
	#emit signal to notify label.
	emit_signal("damage_taken",prevHealth,health)
	
