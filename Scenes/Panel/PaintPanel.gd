extends Node2D


func show_drawing():
	self.visible = true
	$Panel.visible = true
	if GameManagerJm.stage - 1 == 0:
		return
	
	var target_paint = "L"+str(GameManagerJm.stage - 1)
	var color_node = "L"+str(GameManagerJm.stage - 1)+"AllColors"
	
	get_node(target_paint).visible = true
	get_node(color_node).visible = true

func hide_drawing():
	self.visible = false
	$Panel.visible = false
	if GameManagerJm.stage - 1 == 0:
		return
	
	var target_paint = "L"+str(GameManagerJm.stage - 1)
	var color_node = "L"+str(GameManagerJm.stage - 1)+"AllColors"

	get_node(target_paint).visible = false
	get_node(color_node).visible = false
