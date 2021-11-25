extends Node2D

class_name currColor_cir

var mission_color_r = 0
var mission_color_g = 0
var mission_color_b = 0

var circle_position = position

func _draw():
	draw_circle(
		Vector2(position.x+80,position.y+55),38,Color(0.6,0.6,0.4)
	)
	draw_circle(
		Vector2(position.x+80,position.y+60),35,Color(mission_color_r,mission_color_g,mission_color_b)
	)
	circle_position  = Vector2(position.x+80,position.y+55)

func get_circle_Position()->Vector2:
	return circle_position
