extends Node2D

var bat_speed = 100
var melee_speed = 100

var is_m1_Flipped = false

var is_m2_Flipped = false

func _process(delta):
	$Enemies/BatPath/PathFollow2D.offset += bat_speed * delta
	
	# Handling melee 1
	$Enemies/MeleePath/PathFollow2D.offset += melee_speed * delta
	
	if $Enemies/MeleePath/PathFollow2D.offset >= 117 and !is_m1_Flipped:
		$Enemies/MeleePath/PathFollow2D/MeleeBot.toggle_h()
		is_m1_Flipped = true
	if $Enemies/MeleePath/PathFollow2D.offset < 117 and is_m1_Flipped:
		$Enemies/MeleePath/PathFollow2D/MeleeBot.toggle_h()
		is_m1_Flipped = false
	
	# Handling melee 2
	$Enemies/MeleePath2/PathFollow2D.offset += melee_speed * delta
	
	if $Enemies/MeleePath2/PathFollow2D.offset >= 117 and !is_m2_Flipped:
		$Enemies/MeleePath2/PathFollow2D/MeleeBot.toggle_h()
		is_m2_Flipped = true
	if $Enemies/MeleePath2/PathFollow2D.offset < 117 and is_m2_Flipped:
		$Enemies/MeleePath2/PathFollow2D/MeleeBot.toggle_h()
		is_m2_Flipped = false


