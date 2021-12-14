"""
Scene owner: JaeMin
Game Logic and example level first built by MyungJi all rights reserved
"""


extends Node2D

class_name world_mj2

#player
onready var player = $Player_mj
# color comparison judge
var is_same
# color var
var TargetColor 
var CurrentColor
# colorbukkits
var colorbucket_red_num
var colorbucket_green_num
var colorbucket_blue_num
var Waterbucket_num

# var for UI
# var contain UI color circle node
onready var targetCol_cir = get_node("UI_mj/TargetColor_circle")
onready var currentCol_cir = get_node("UI_mj/CurrentColor_circle")
# var contain UI label node 
onready var targetCol_label = get_node("UI_mj/TargetColor_RGB")
onready var currentCol_label = get_node("UI_mj/CurrentColor_RGB")
# colorbukkit button 
onready var colorbucket_red_button = get_node("UI_mj/UI_colorBucket_buttons/colorBucket_red_button")
onready var colorbucket_green_button = get_node("UI_mj/UI_colorBucket_buttons/colorBucket_green_button")
onready var colorbucket_blue_button = get_node("UI_mj/UI_colorBucket_buttons/colorBucket_blue_button")
onready var Waterbucket_button = get_node("UI_mj/UI_colorBucket_buttons/waterBucket_button")
# colorbukkits_num_label
onready var colorbucket_red_label = get_node("UI_mj/UI_colorBucket_buttons/colorBucket_red_label")
onready var colorbucket_green_label = get_node("UI_mj/UI_colorBucket_buttons/colorBucket_green_label")
onready var colorbucket_blue_label = get_node("UI_mj/UI_colorBucket_buttons/colorBucket_blue_label")
onready var Waterbucket_label = get_node("UI_mj/UI_colorBucket_buttons/waterBucket_label")
onready var Waterbukkit_label = get_node("UI_mj/UI_bukkits/waterBukkit_label")

onready var GameManager = $"/root/GameManagerJm"
# game judgement var
var is_complited


func _ready():
	GameManager.stage = 5
	get_node("UI_mj/LvText").text = "Lv. 5"
  
	#connect with player
	player.connect("attacked",self,"_on_attacked")
	player.connect("collected",self,"_on_collected")
	# reset game judgement var
	is_same = false
	#set TargetCol and  reset CurrentCol
	TargetColor = Color(250,200,100,1)
	CurrentColor = Color(50,50,50,1)
	# set colorBukkit num
	colorbucket_red_num = 1
	colorbucket_green_num = 1
	colorbucket_blue_num = 1
	Waterbucket_num = 0
	
	#reset UI
	#reset UI circle color
	targetCol_cir.set_color(TargetColor)
	currentCol_cir.reset_color()
	# set UI CurrentColor_label and TargetColor_label
	targetCol_label.text = str(TargetColor[0])+"\n"+str(TargetColor[1])+"\n"+str(TargetColor[2])
	currentCol_label.text = str(CurrentColor[0])+"\n"+str(CurrentColor[1])+"\n"+str(CurrentColor[2])
	# connect colorbukkit_button
	colorbucket_red_button.connect("pressed",self,"_on_colorBukkit_red_pressed")
	colorbucket_green_button.connect("pressed",self,"_on_colorBukkit_green_pressed")
	colorbucket_blue_button.connect("pressed",self,"_on_colorBukkit_blue_pressed")
	Waterbucket_button.connect("pressed",self,"_on_Waterbukkit_pressed")
	update_ui()
	

var bat_speed = 100
var melee_speed = 100
# Enemy movment control
func _process(delta):
	"""Just for test"""
	if Input.is_action_pressed("ui_accept"):
		CurrentColor = TargetColor
		compare_color()
	
	# Update bat offset
	if $Enemies/BatPath/PathFollow2D != null:
		$Enemies/BatPath/PathFollow2D.offset += bat_speed * delta
	
	# Update Meleebot offset
	if $Enemies/MeleePath/MeleePathFollow2D != null:
		$Enemies/MeleePath/MeleePathFollow2D.offset += melee_speed * delta
	
	if $Enemies/MeleePath2/MeleePathFollow2D != null:
		$Enemies/MeleePath2/MeleePathFollow2D.offset += melee_speed * delta
	# Update Shooter offset
	if $Enemies/ShooterPath/ShooterPathFollow2D != null:
		$Enemies/ShooterPath/ShooterPathFollow2D.offset += melee_speed * delta
	



# color calulation
func compare_color():
	if(Color(TargetColor) == Color(CurrentColor)):
		is_same = true
		print("congrates!! you win!!")


		GameManager.advanceStage()
		get_tree().change_scene("res://Jaemin/ScenesJaemin/ConnectingScene_jm.tscn")

	else:
		print("cheer up!!")

func life_is_color():
	var sum = colorbucket_red_num + colorbucket_green_num + colorbucket_blue_num
	if(CurrentColor[0]+CurrentColor[1]+CurrentColor[2]==0):
		print("you lose!")
		$"./Panels/GameOverPanel".visible = true
		$"Panels/GameOverPanel/gameover_sound".play()
		get_tree().paused = true
		
	elif sum==0 && (!is_same) && Waterbucket_num == 0:
		print("Left color obj num:",sum)
		print("you lose!")
		$"./Panels/GameOverPanel".visible = true
		$"Panels/GameOverPanel/gameover_sound".play()
		get_tree().paused = true
	elif (CurrentColor[0]<TargetColor[0]||CurrentColor[1]<TargetColor[1]||CurrentColor[2]<TargetColor[2])&& sum==0:
		print("you lose")
		$"./Panels/GameOverPanel".visible = true
		$"Panels/GameOverPanel/gameover_sound".play()
		get_tree().paused = true



# reaction to "ememies" coillision
func _on_attacked(enemyName): 
		var subtractiveColor = set_random_color(1) 
		CurrentColor = Color(CurrentColor) - Color(subtractiveColor)
		update_ui()
		compare_color()
		life_is_color()

func set_random_color(colBitrange)->Color:
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	var rnum = rng.randi_range(0,2)
	var resultColor = Color(0,0,0,0)
	
	if CurrentColor[0]+CurrentColor[1]+CurrentColor[2]==50:
		return CurrentColor
	
	while true:
		if rnum == 0 and CurrentColor[0] != 0:
			return Color(50, 0, 0, 0)
		elif rnum == 1 and CurrentColor[1] != 0:
			return Color(0, 50, 0, 0)
		elif rnum == 2 and CurrentColor[2] != 0:
			return Color(0, 0, 50, 0)
		else:
			rnum = rng.randi_range(0, 2)
	
	return resultColor # Dummy return



# reaction to "bukkits" coillision
var bucketNames = {
	"redBucket":Color(50,0,0,0),
	"greenBucket":Color(0,50,0,0),
	"blueBucket":Color(0,0,50,0),
	"waterBucket":0}

func _on_collected(colorBucketName):
	for key in bucketNames:
		if colorBucketName == key:
			if key == "waterBucket":
				Waterbucket_num += 1
				break
			#print("dict works, current colorBukkit is ",key, bukkitNames[key])
			CurrentColor = Color(CurrentColor) + Color(bucketNames[key])
			break
	update_ui()
	compare_color()
	life_is_color()

func update_ui():
	#color circle
	currentCol_cir.update_color(CurrentColor)
	for i in [0,1,2]:
		if CurrentColor[i]<0:
			CurrentColor[i] = 0
	currentCol_label.text = str(CurrentColor[0])+"\n"+str(CurrentColor[1])+"\n"+str(CurrentColor[2])
	# bukkits labels
	colorbucket_red_num = CurrentColor[0]/50
	colorbucket_green_num = CurrentColor[1]/50
	colorbucket_blue_num = CurrentColor[2]/50
	colorbucket_red_label.text = "X" + str(colorbucket_red_num)
	colorbucket_green_label.text = "X" + str(colorbucket_green_num)
	colorbucket_blue_label.text = "X" + str(colorbucket_blue_num)
	Waterbucket_label.text = "X" + str(Waterbucket_num)



# reaction to button_pressed
"""
var is_Waterbucket_pressed = false
func _on_colorBukkit_red_pressed():
	if is_Waterbucket_pressed:
		if colorbucket_red_num >0:
			CurrentColor = Color(CurrentColor)-Color(50,0,0,0)
			update_ui()
			compare_color()
			life_is_color()
			is_Waterbucket_pressed = false

func _on_colorBukkit_green_pressed():
	if is_Waterbucket_pressed:
		if colorbucket_green_num >0:
			CurrentColor = Color(CurrentColor)-Color(0,50,0,0)
			update_ui()
			compare_color()
			life_is_color()
			is_Waterbucket_pressed = false

func _on_colorBukkit_blue_pressed():
	if is_Waterbucket_pressed:
		if colorbucket_blue_num >0:
			CurrentColor = Color(CurrentColor)-Color(0,0,50,0)
			update_ui()
			compare_color()
			life_is_color()
			is_Waterbucket_pressed = false

func _on_Waterbukkit_pressed():
	if is_Waterbucket_pressed:
		pass
	else:
		if Waterbucket_num >0:
			Waterbucket_num -= 1
			update_ui()
			compare_color()
			life_is_color()
			is_Waterbucket_pressed = true
"""

func _on_Waterbukkit_pressed():
	""" Updated """
	var sum = colorbucket_red_num + colorbucket_green_num + colorbucket_blue_num
	if sum > 1 and Waterbucket_num > 0:
		$"./Panels/WaterPanel".visible = true
	



