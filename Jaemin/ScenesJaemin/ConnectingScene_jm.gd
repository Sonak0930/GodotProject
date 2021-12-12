extends Node2D


onready var drawing

func _ready():
	get_child(GameManagerJm.stage - 1).visible = true
	
	# File save
	GameManagerJm.save_game()
	
	# Text handling
	$LvText.text = "Lv." + str(GameManagerJm.stage - 1)
	if GameManagerJm.stage == 7: # All level finished
		$Text.text = "            Complete!\nCongratulations!\nYou have collected all the colors!"
	else:
		$Text.text = "            Complete!\nThis is the drawing so far\n"
	
	# Colors handling
	match GameManagerJm.stage - 1:
		1: 
			$L1AllColors.visible = true
		2:
			$L2AllColors.visible = true
		3:
			$L3AllColors.visible = true
		4:
			$L4AllColors.visible = true
		5:
			$L5AllColors.visible = true
		6:  # All level finished
			$L6AllColors.visible = true
	
	
func _on_ExitGameButton_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")




func _on_NextLevelButton_pressed():
	match GameManagerJm.stage:
		2: # go to lv 2...
			get_tree().change_scene("res://Jaemin/ScenesJaemin/World1_jm.tscn")
		3:
			get_tree().change_scene("res://Scenes/Levels/L3.tscn")
		4:
			get_tree().change_scene("res://Scenes/Levels/L4.tscn")
		5:
			get_tree().change_scene("res://Jaemin/ScenesJaemin/World2_jm.tscn")
		6:
			get_tree().change_scene("res://Scenes/Levels/L6.tscn")
		7:  # All level finished
			get_tree().change_scene("res://Jaemin/ScenesJaemin/Credit.tscn")


