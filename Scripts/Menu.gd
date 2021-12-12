extends Node2D

""" Volume ref """
onready var prev_volume = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))
var muted_sprite = preload("res://assets/UIButtonsVideogames/72ppp/Buttons-152.png")
var on_sprite = preload("res://assets/UIButtonsVideogames/72ppp/Buttons-156.png")

""" Key ref """
onready var prev_keys = [InputMap.get_action_list("ui_up")[0], InputMap.get_action_list("ui_down")[0],
InputMap.get_action_list("ui_left")[0], InputMap.get_action_list("ui_right")[0]]

onready var keyButtons = [$OptionsPanel/KeyOptions/HBoxContainer/UpBtn,
 $OptionsPanel/KeyOptions/HBoxContainer/DownBtn,
 $OptionsPanel/KeyOptions/HBoxContainer/LeftBtn,
 $OptionsPanel/KeyOptions/HBoxContainer/RightBtn]

onready var key_panel = $OptionsPanel/KeyOptions/panel
var is_ready_to_change = false
	

func _ready():
	print(prev_keys)
	
func _on_PlayButton_pressed():
	""" Menu play button """
	$MenuItems.visible = false
	$PlayPanel.visible = true

func _on_OptionsButton_pressed():
	""" Menu options button """
	$MenuItems.visible = false
	$OptionsPanel.visible = true
	
func _on_ExitButton_pressed():
	""" Menu exit button """
	get_tree().quit()

func _on_CreditButton_pressed():
	get_tree().change_scene("res://Jaemin/ScenesJaemin/Credit.tscn")
	
func _on_HSlider_value_changed(value):
	""" Options panel slider """
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
	if value == -80: # muted
		$OptionsPanel/VolumeOptions/vol_sprite.set_texture(muted_sprite)
	else:
		$OptionsPanel/VolumeOptions/vol_sprite.set_texture(on_sprite)
		
		
func _on_AcceptBtn_pressed():
	""" Options panel accept button """
	# Set current value as prev value and exit
	prev_volume = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))
	
	prev_keys.clear()
	prev_keys.append(InputMap.get_action_list("ui_up")[0])
	prev_keys.append(InputMap.get_action_list("ui_down")[0])
	prev_keys.append(InputMap.get_action_list("ui_left")[0])
	prev_keys.append(InputMap.get_action_list("ui_right")[0])
	
	$MenuItems.visible = true
	$OptionsPanel.visible = false


func _on_ExitBtn_pressed():
	""" Options panel exit button """
	# Reset to previous data
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), prev_volume)
	$OptionsPanel/VolumeOptions/HSlider.value = prev_volume
	
	update_action_key("ui_up", prev_keys[0])
	update_action_key("ui_down", prev_keys[1])
	update_action_key("ui_left", prev_keys[2])
	update_action_key("ui_right", prev_keys[3])
	
	
	$MenuItems.visible = true
	$OptionsPanel.visible = false

""" Key button events """

"""
Updating key flow
1. disable other buttons
2. show panel
3. get input
4. set InputMap
5. enable other buttons
"""

func _on_UpBtn_pressed():
	""" Option panel up arrow button """
	update_keyPanel(0)

func _on_DownBtn_pressed():
	""" Option panel down arrow button """
	update_keyPanel(1)

func _on_LeftBtn_pressed():
	""" Option panel left arrow button """
	update_keyPanel(2)

func _on_RightBtn_pressed():
	""" Option panel right arrow button """
	update_keyPanel(3)

func update_keyPanel(idx):
	"""0 ~ 3 = up, down, left, right"""
	# Disable other buttons
	$OptionsPanel/AcceptBtn.disabled = true
	$OptionsPanel/ExitBtn.disabled = true
	for i in range(keyButtons.size()):
		if i != idx:
			keyButtons[i].disabled = true
			
	# Show panel
	key_panel.visible = true
	
	# get input
	is_ready_to_change = true
	
func update_action_key(action, event):
	InputMap.action_erase_events(action) # Erase all events from action
	InputMap.action_add_event(action, event)
	
	# print("KEY INPUT UPDATED")
	
	is_ready_to_change = false
	key_panel.visible = false
	for btn in keyButtons:
		btn.pressed = false
		btn.disabled = false
	$OptionsPanel/AcceptBtn.disabled = false
	$OptionsPanel/ExitBtn.disabled = false
	
func _unhandled_input(event):
	if event is InputEventKey and is_ready_to_change:
		# Check which input map should be updated
		if !keyButtons[0].disabled:
			update_action_key("ui_up", event)
			return
		elif !keyButtons[1].disabled:
			update_action_key("ui_down", event)
			return
		elif !keyButtons[2].disabled:
			update_action_key("ui_left", event)
			return
		elif !keyButtons[3].disabled:
			update_action_key("ui_right", event)
			return

""" Play Panel buttons """
func _on_BackButton_pressed():
	$MenuItems.visible = true
	$PlayPanel.visible = false


func _on_NewGameButton_pressed():
	# save level data to level 1
	GameManagerJm.stage = 1
	GameManagerJm.save_game()
	get_tree().change_scene("res://Scenes/Levels/L1.tscn")


func _on_LoadGameButton_pressed():
	# Stage already loaded in GameManager
	print(GameManagerJm.stage)
	"""
	I don't know why this isn't working...
	match GameManagerJm.stage:
		1: # go to lv 1...
			get_tree().change_scene("res://Scenes/Levels/L1.tscn")
		2:
			get_tree().change_scene("res://Jaemin/ScenesJaemin/World1_jm.tscn")
		3:
			print("wow")
			get_tree().change_scene("res://Scenes/Levels/L3.tscn")
		4:
			get_tree().change_scene("res://Scenes/Levels/L4.tscn")
		5:
			get_tree().change_scene("res://Jaemin/ScenesJaemin/World2_jm.tscn")
		6:  
			get_tree().change_scene("res://Scenes/Levels/L6.tscn")
		7:
			get_tree().change_scene("res://Scenes/Levels/L6.tscn")
	"""
	if GameManagerJm.stage == 1:
		get_tree().change_scene("res://Scenes/Levels/L1.tscn")
	elif GameManagerJm.stage == 2:
		get_tree().change_scene("res://Jaemin/ScenesJaemin/World1_jm.tscn")
	elif GameManagerJm.stage == 3:
		get_tree().change_scene("res://Scenes/Levels/L3.tscn")
	elif GameManagerJm.stage == 4:
		get_tree().change_scene("res://Scenes/Levels/L4.tscn")
	elif GameManagerJm.stage == 5:
		get_tree().change_scene("res://Jaemin/ScenesJaemin/World2_jm.tscn")
	elif GameManagerJm.stage == 6:
		get_tree().change_scene("res://Scenes/Levels/L6.tscn")
	elif GameManagerJm.stage == 7:
		get_tree().change_scene("res://Scenes/Levels/L6.tscn")


""" Showing drawing signal """
func _on_PaintingArea_body_entered(body):
	$PaintPanel.show_drawing()
	$PaintingArea.modulate = Color(0.41, 0.41, 0.41, 1)



func _on_PaintingArea_body_exited(body):
	$PaintPanel.hide_drawing()
	$PaintingArea.modulate = Color(1, 1, 1, 1)
