extends Node2D

var bat_speed = 100
var melee_speed = 100


func _process(delta):
	# Update bat offset
	$Enemies/BatPath/PathFollow2D.offset += bat_speed * delta
	
	# Update Meleebot offset
	$Enemies/MeleePath/MeleePathFollow2D.offset += melee_speed * delta
	$Enemies/MeleePath2/MeleePathFollow2D.offset += melee_speed * delta
	
	# Update Shooter offset
	$Enemies/ShooterPath/ShooterPathFollow2D.offset += melee_speed * delta

	
