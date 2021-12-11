extends Node2D


var menu_scene = preload("res://Scenes/Menu.tscn")

func _ready():
	pass

func _on_ExitGameButton_pressed():
	get_tree().change_scene_to(menu_scene)


func _on_PlayAgainButton_pressed():
	get_tree().reload_current_scene()
