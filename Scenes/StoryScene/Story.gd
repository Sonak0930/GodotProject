"""
Scene owner: DongHyun
"""


extends Node2D

"""
0/Talk1 animation play
1/Talk1 hide and Talk2 animation play
2/Talk2 hide and Talk3 animation play

story hide

3/instruction1 show
4/instruction2
5/instuction3
6/change scene
"""
onready var idx = 0

func _ready():
	show_iterative(0)


"""Buttons"""
func _on_NextButton_pressed():
	idx += 1
	show_iterative(idx)


func _on_SkipButton_pressed():
	get_tree().change_scene("res://Scenes/Levels/L1.tscn")


func show_iterative(idx):
	match idx:
		0:
			$Story/Texts/Talk1/AnimationPlayer.play("textAnim")
		1:
			$Story/Texts/Talk1.visible = false
			$Story/Texts/Talk2/AnimationPlayer.play("textAnim")
		2:
			$Story/Texts/Talk2.visible = false
			$Story/Texts/Talk3/AnimationPlayer.play("textAnim")
		3:
			$Story/Texts.visible = false
			$Instuction/Instruction1.visible = true
		4:
			$Instuction/Instruction2.visible = true
		5:
			$Instuction/Instruction3.visible = true
		6:
			get_tree().change_scene("res://Scenes/Levels/L1.tscn")

