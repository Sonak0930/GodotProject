extends Node2D

# Default animations
onready var color_animation = $ColorParent/ColorObj/Animations/Item_default_anim
onready var water_animation = $WaterParent/WaterObj/Animations/Item_default_anim

# Collected animations
onready var color_collect_animation = $ColorParent/ColorObj/Animations/Collect_anim
onready var water_collect_animation = $WaterParent/WaterObj/Animations/Collect_anim

func _ready():
	var start_pos = 0.0
	color_animation.play("item_default_anim")
	water_animation.play("item_default_anim")

func _process(delta):
	# Just example
	if Input.is_action_pressed("ui_up"): # If collide with player...
		color_collect_animation.play("Collect_anim")
		water_collect_animation.play("Collect_anim")
		# queue free the object
