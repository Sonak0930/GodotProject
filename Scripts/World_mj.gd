extends Node2D

class_name world_mj

# color var
var TargetColor 
var CurrentColor
# var contain UI color circle node
onready var targetCol_cir = get_node("UI_mj/TargetColor_circle")
onready var currentCol_cir = get_node("UI_mj/CurrentColor_circle")
# var contain UI label node 
onready var targetCol_label = get_node("UI_mj/TargetColor_RGB")
onready var currentCol_label = get_node("UI_mj/CurrentColor_RGB")

# colorbukkits
var colorbukkit_red_num = 1
var colorbukkit_green_num = 1
var colorbukkit_blue_num = 1
# colorbukkit button 
onready var colorbukkit_red_button = get_node("UI_mj/UI_bukkits/colorBukkit_red")
onready var colorbukkit_green_button = get_node("UI_mj/UI_bukkits/colorBukkit_green")
onready var colorbukkit_blue_button = get_node("UI_mj/UI_bukkits/colorBukkit_blue")
# colorbukkits_num_label
onready var colorbukkit_red_label = get_node("UI_mj/UI_bukkits/colorBukkit_red_label")
onready var colorbukkit_green_label = get_node("UI_mj/UI_bukkits/colorBukkit_green_label")
onready var colorbukkit_blue_label = get_node("UI_mj/UI_bukkits/colorBukkit_blue_label")
#Waterbukkit
var Waterbukkit_num
#Waterbukkit_button
onready var Waterbukkit_button = get_node("UI_mj/UI_bukkits/waterBukkit")
#Waterbukkit_label
onready var Waterbukkit_label = get_node("UI_mj/UI_bukkits/waterBukkit_label")

# game judgement var
var is_complited

func _ready():
	# reset game judgement var
	is_complited = false
	
	#set TargetCol and  reset CurrentCol
	TargetColor = Color(200,150,150,1)
	CurrentColor = Color(50,50,50,1)
	
	#reset UI circle color
	targetCol_cir.set_color(TargetColor)
	currentCol_cir.reset_color()
	# set UI CurrentColor_label and TargetColor_label
	targetCol_label.text = str(TargetColor[0])+"\n"+str(TargetColor[1])+"\n"+str(TargetColor[2])
	currentCol_label.text = str(CurrentColor[0])+"\n"+str(CurrentColor[1])+"\n"+str(CurrentColor[2])
	
	# connect colorbukkit_button
	colorbukkit_red_button.connect("pressed",self,"_on_colorBukkit_red_pressed")
	colorbukkit_green_button.connect("pressed",self,"_on_colorBukkit_green_pressed")
	colorbukkit_blue_button.connect("pressed",self,"_on_colorBukkit_blue_pressed")
	colorbukkit_red_label.text = "X" + str(colorbukkit_red_num)
	colorbukkit_green_label.text = "X" + str(colorbukkit_green_num)
	colorbukkit_blue_label.text = "X" + str(colorbukkit_blue_num)
	
	#set Waterbukkit
	Waterbukkit_num = 0
	Waterbukkit_label.text = "X"+str(Waterbukkit_num)
	#connect Waterbukkit
	Waterbukkit_button.connect("pressed",self,"_on_Waterbukkit_pressed")


func compare_color():
	print(TargetColor,",",CurrentColor)
	if(Color(TargetColor) == Color(CurrentColor)):
		is_complited = true
		print("congrates!! you win!!")
		
		var gameManager = preload("res://Jaemin/ScriptJaemin/GameManager_jm.gd").new()
		get_tree().change_scene("res://Jaemin/ScenesJaemin/ConnectingScene_jm.tscn")
		#gameManager.advanceStage()
		
		print_tree_pretty()
	else:
		print("cheer up!!")

var max_Bukkit_num = 10
func life_is_color():
	var node = get_node("colorObjs_mj")
	if(colorbukkit_blue_num+colorbukkit_green_num+colorbukkit_red_num==0):
		print("you lose!")
	elif node.get_child_count()==0 && (!is_complited):
		print("node child count:",node.get_child_count())
		print("you lose!")

# when ColorObj_"red" send signal "body_entered" add R value of currentColor_circle
func _on_ColorObj_red_body_entered(body):
	#update CurrentColor
	CurrentColor = CurrentColor+Color(50,0,0,0)
	#update CurrentColor circle
	currentCol_cir.update_color(CurrentColor)
	#update CurrentColor label
	currentCol_label.text = str(CurrentColor[0])+"\n"+str(CurrentColor[1])+"\n"+str(CurrentColor[2])
	compare_color()
	colorbukkit_red_num += 1
	colorbukkit_red_label.text = "X" + str(colorbukkit_red_num)
	print("colorbukkits_red_num:",colorbukkit_red_num)
	life_is_color()

# when ColorObj_"green" send signal "body_entered" add G value of currentColor_circle
func _on_ColorObj_green_body_entered(body):
	#update CurrentColor
	CurrentColor = CurrentColor+Color(0,50,0,0)
	#update CurrentColor circle
	currentCol_cir.update_color(CurrentColor)
	#update CurrentColor label
	currentCol_label.text = str(CurrentColor[0])+"\n"+str(CurrentColor[1])+"\n"+str(CurrentColor[2])
	compare_color()
	colorbukkit_green_num += 1
	colorbukkit_green_label.text = "X" + str(colorbukkit_green_num)
	print("colorbukkits_green_num:",colorbukkit_green_num)
	life_is_color()

# when ColorObj_"blue" send signal "body_entered" add B value of currentColor_circle
func _on_ColorObj_blue_body_entered(body):
	#update CurrentColors
	CurrentColor = CurrentColor+Color(0,0,50,0)
	#update CurrentColor circle
	currentCol_cir.update_color(CurrentColor)
	#update CurrentColor label
	currentCol_label.text = str(CurrentColor[0])+"\n"+str(CurrentColor[1])+"\n"+str(CurrentColor[2])
	compare_color()
	colorbukkit_blue_num += 1
	colorbukkit_blue_label.text = "X" + str(colorbukkit_blue_num)
	print("colorbukkits_blue_num:",colorbukkit_blue_num)
	life_is_color()

func _on_WaterObj_mj_body_entered(body):
	Waterbukkit_num += 1
	Waterbukkit_label.text = "X" + str(Waterbukkit_num)
	print("Waterbukkit_num:",Waterbukkit_num)
	life_is_color()

var selectedColor = Color(0,0,50,0)
var is_Waterbukkit_pressed = false
func _on_colorBukkit_red_pressed():
	if is_Waterbukkit_pressed:
		if colorbukkit_red_num >0:
			CurrentColor = Color(CurrentColor)-Color(50,0,0,0)
			#update CurrentColor circle
			currentCol_cir.update_color(CurrentColor)
			#update CurrentColor label
			currentCol_label.text = str(CurrentColor[0])+"\n"+str(CurrentColor[1])+"\n"+str(CurrentColor[2])
			compare_color()
			colorbukkit_red_num -= 1
			colorbukkit_red_label.text = "X" + str(colorbukkit_red_num)
			is_Waterbukkit_pressed = false
			life_is_color()

func _on_colorBukkit_green_pressed():
	if is_Waterbukkit_pressed:
		if colorbukkit_green_num >0:
			CurrentColor = Color(CurrentColor)-Color(0,50,0,0)
			#update CurrentColor circle
			currentCol_cir.update_color(CurrentColor)
			#update CurrentColor label
			currentCol_label.text = str(CurrentColor[0])+"\n"+str(CurrentColor[1])+"\n"+str(CurrentColor[2])
			compare_color()
			colorbukkit_green_num -= 1
			colorbukkit_green_label.text = "X" + str(colorbukkit_green_num)
			is_Waterbukkit_pressed = false
			life_is_color()

func _on_colorBukkit_blue_pressed():
	if is_Waterbukkit_pressed:
		if colorbukkit_blue_num >0:
			CurrentColor = Color(CurrentColor)-Color(0,0,50,0)
			#update CurrentColor circle
			currentCol_cir.update_color(CurrentColor)
			#update CurrentColor label
			currentCol_label.text = str(CurrentColor[0])+"\n"+str(CurrentColor[1])+"\n"+str(CurrentColor[2])
			compare_color()
			colorbukkit_blue_num -= 1
			colorbukkit_blue_label.text = "X" + str(colorbukkit_blue_num)
			is_Waterbukkit_pressed = false
			life_is_color()

func _on_Waterbukkit_pressed():
	if Waterbukkit_num >0:
		Waterbukkit_num -= 1
		Waterbukkit_label.text = "X" + str(Waterbukkit_num)
		is_Waterbukkit_pressed = true
		life_is_color()
