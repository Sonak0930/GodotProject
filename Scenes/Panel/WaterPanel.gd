extends Node2D

onready var world_node = $"./".owner

onready var red_label = $UI_colorBucket_buttons/colorBucket_red_label
onready var green_label = $UI_colorBucket_buttons/colorBucket_green_label
onready var blue_label = $UI_colorBucket_buttons/colorBucket_blue_label
onready var water_label = $UI_colorBucket_buttons/waterBucket_label

func update_panel():
	if world_node == null:
		return
		
	#Update panel ui
	red_label.text = "X" + str(world_node.colorbucket_red_num)
	green_label.text = "X" + str(world_node.colorbucket_green_num)
	blue_label.text = "X" + str(world_node.colorbucket_blue_num)
	water_label.text = "X" + str(world_node.Waterbucket_num)
	

func _on_ExitBtn_pressed():
	self.visible = false


func _on_colorBucket_red_button_pressed():
	if world_node == null:
		return
	if world_node.colorbucket_red_num > 0 and world_node.Waterbucket_num > 0:
		world_node.CurrentColor = Color(world_node.CurrentColor) - Color(50, 0, 0, 0)
		world_node.Waterbucket_num -= 1
		world_node.update_ui()
		world_node.compare_color()
		world_node.life_is_color()
		update_panel()
		print(world_node.colorbucket_red_num)


func _on_colorBucket_green_button_pressed():
	if world_node == null:
		return
	if world_node.colorbucket_green_num > 0 and world_node.Waterbucket_num > 0:
		world_node.CurrentColor = Color(world_node.CurrentColor) - Color(0, 50, 0, 0)
		world_node.Waterbucket_num -= 1
		world_node.update_ui()
		world_node.compare_color()
		world_node.life_is_color()
		update_panel()


func _on_colorBucket_blue_button_pressed():
	if world_node == null:
		return
	if world_node.colorbucket_blue_num > 0 and world_node.Waterbucket_num > 0:
		world_node.CurrentColor = Color(world_node.CurrentColor) - Color(0, 0, 50, 0)
		world_node.Waterbucket_num -= 1
		world_node.update_ui()
		world_node.compare_color()
		world_node.life_is_color()
		update_panel()


func _on_WaterPanel_visibility_changed():
	update_panel()
