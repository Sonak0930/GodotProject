extends Node2D


var stage = GameManagerJm.stage
onready var drawing
# Called when the node enters the scene tree for the first time.
func _ready():
	print("started")
	advanceStage()
		#advanceStage() # Replace with function body.



func advanceStage():
	stage += 1
	drawing = get_child(stage)
	drawing.visible = true
	

	#drawing.set_visible(true)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenes/World_mj.tscn")
