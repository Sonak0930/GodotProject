extends Node
 
var connectingScene = preload("res://Jaemin/ScenesJaemin/ConnectingScene_jm.tscn")

var stage = -1
var drawingName = ""
onready var drawing

# Called when the node enters the scene tree for the first time.
func _ready():
	print("started")


func advanceStage():
	stage += 1
	drawing = connectingScene.instance().get_child(stage)
	

	drawing = connectingScene.instance().get_child(stage)
	drawing.visible = true
	

	#drawing.set_visible(true)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenes/World_mj.tscn")



