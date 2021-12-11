extends PathFollow2D

var last_position
var direction_flag = true  # F = left / T = right
var mel_speed = 100
func _ready():
	last_position = global_position
	
func _process(delta):
	update_toggle_h(global_position - last_position)
	last_position = global_position
	
	
	
	offset += mel_speed * delta
	
func update_toggle_h(direction: Vector2):
	# moving left
	if direction.x < 0:
		if direction_flag == true:
			$MeleeBot_Move.toggle_h()
			direction_flag = false

	# moving right
	if direction.x > 0:
		if direction_flag == false:
			$MeleeBot_Move.toggle_h()
			direction_flag = true
		
