extends KinematicBody2D

class_name Player

var velocity = Vector2()
var rotation_dir = 0

var speed = 200
var rotation_speed = 1.5

var health = 10
var point = 0
signal food_taken(new_health)
signal add_point(new_point)

func _ready():
	health = randi()%int(50)

func get_Input():
	velocity = Vector2()
	rotation_dir = 0
	if Input.is_action_pressed("right"):
		rotation_dir += 1
	if Input.is_action_pressed("left"):
		rotation_dir += -1
	if Input.is_action_pressed("up"):
		velocity = Vector2(0,-speed).rotated(rotation)
	if Input.is_action_pressed("down"):
		velocity = Vector2(0,speed).rotated(rotation)

func _physics_process(delta):
	get_Input()
	rotation += rotation_dir * rotation_speed *delta
	move_and_slide(velocity)

func _on_Food_body_entered():
	health += 1
	point += 1
	emit_signal("food_taken",health)
	emit_signal("add_point",point)
