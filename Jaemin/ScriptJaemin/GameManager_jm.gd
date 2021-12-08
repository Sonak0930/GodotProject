extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var stage = -1
var drawingName = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	
	advanceStage() # Replace with function body.

func advanceStage():
	stage += 1
	
	print(self.get_child_count())
	var drawing = self.get_child(stage)
	drawing.set_visible(true)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenes/World_mj.tscn")
