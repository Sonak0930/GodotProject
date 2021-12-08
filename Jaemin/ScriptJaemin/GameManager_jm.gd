extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var stage = 0
var drawingName = ""
var drawing
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func advanceStage():
	stage += 1
	drawingName = "TextureRect" + str(stage)
	drawing = 
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
