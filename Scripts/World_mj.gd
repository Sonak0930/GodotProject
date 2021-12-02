extends Node2D

class_name world_mj

# color var
var TargetColor 
var CurrentColor
# var contain UI color circle node
var targetCol_cir
var currentCol_cir
# var contain UI label node 
var targetCol_label
var currentCol_label
# game judgement var
var is_complited
# colorbukkit array 
var colorBukkits = Array()

func _ready():
	# reset game judgement var
	is_complited = false
	
	#set TargetCol and  reset CurrentCol
	TargetColor = Color(200,150,150,1)
	CurrentColor = Color(0,0,0,1)
	
	#reset UI circle color
	targetCol_cir = get_node("UI_mj/TargetColor_circle")
	currentCol_cir = get_node("UI_mj/CurrentColor_circle")
	targetCol_cir.set_color(TargetColor)
	currentCol_cir.reset_color()
	
	# set UI CurrentColor_label and TargetColor_label
	targetCol_label = get_node("UI_mj/TargetColor_RGB")
	currentCol_label = get_node("UI_mj/CurrentColor_RGB")
	targetCol_label.text = str(TargetColor[0])+"\n"+str(TargetColor[1])+"\n"+str(TargetColor[2])
	currentCol_label.text = str(CurrentColor[0])+"\n"+str(CurrentColor[1])+"\n"+str(CurrentColor[2])


func compare_color():
	print(TargetColor,",",CurrentColor)
	if(Color(TargetColor) == Color(CurrentColor)):
		is_complited = true
		print("congrates!!")
	else:
		print("cheer up!!")

# when ColorObj_"red" send signal "body_entered" add R value of currentColor_circle
func _on_ColorObj_red_body_entered(body):
	#update CurrentColor
	CurrentColor = CurrentColor+Color(50,0,0,0)
	#update CurrentColor circle
	currentCol_cir.update_color(CurrentColor)
	#update CurrentColor label
	currentCol_label.text = str(CurrentColor[0])+"\n"+str(CurrentColor[1])+"\n"+str(CurrentColor[2])
	compare_color()
#	var ui = get_node("UI")
#	var colorbukkit = TextureButton.new()
#	ui.add_child(colorbukkit)
#	ui.print_tree_pretty()

# when ColorObj_"green" send signal "body_entered" add G value of currentColor_circle
func _on_ColorObj_green_body_entered(body):
	#update CurrentColor
	CurrentColor = CurrentColor+Color(0,50,0,0)
	#update CurrentColor circle
	currentCol_cir.update_color(CurrentColor)
	#update CurrentColor label
	currentCol_label.text = str(CurrentColor[0])+"\n"+str(CurrentColor[1])+"\n"+str(CurrentColor[2])
	compare_color()

# when ColorObj_"blue" send signal "body_entered" add B value of currentColor_circle
func _on_ColorObj_blue_body_entered(body):
	#update CurrentColors
	CurrentColor = CurrentColor+Color(0,0,50,0)
	#update CurrentColor circle
	currentCol_cir.update_color(CurrentColor)
	#update CurrentColor label
	currentCol_label.text = str(CurrentColor[0])+"\n"+str(CurrentColor[1])+"\n"+str(CurrentColor[2])
	compare_color()


