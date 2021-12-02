extends AnimatedSprite


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	_moveWithKeyboard()

	if Input.is_action_pressed("ui_right"):
		self.play("run")
		self.set_animation("Right")
	elif Input.is_action_pressed("ui_left"):
		self.play("run")
		self.set_animation("Left")
	else:
		self.stop()
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
	
	move_and_slide(v1)
	
func_ physics
	

	
