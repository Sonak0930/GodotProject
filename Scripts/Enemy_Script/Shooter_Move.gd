extends Area2D

export (PackedScene) var Bullet
var speed = 100
# get a reference to the sprite
onready var animated_sprite = $AnimatedSprite # animation: run, shoot
var player
onready var world_node = get_tree().get_current_scene()
var enemyName = ["shooter_move"]
var sec = 0.0

var speed = 90

func _ready():
	animated_sprite.play("run")

	#connect("body_entered",player,"_on_Enemies_body_entered",enemyName)
	
	
	

	if world_node != null:
		for child in world_node.get_children():
			if child is Player_mj:
				player = child
				connect("body_entered",player,"_on_Enemies_body_entered",enemyName)


func _process(delta):
	sec += delta
	if sec >= 3: # Starts to attack
		animated_sprite.play("shoot")
		sec = 0.0

	get_parent().offset += speed * delta

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "shoot":
		animated_sprite.play("run")

func toggle_h():
	scale.x = -scale.x



func _on_AnimatedSprite_frame_changed():
	if $AnimatedSprite.animation == "shoot":
		shoot()
		

func shoot():
		# create bullet node
	var bullet = Bullet.instance()
	
	# add it to the scene tree (World)
	#add_child(bullet)
	$"/root/".add_child(bullet)
	
	# move the bullet to the muzzle of the gun
	bullet.transform = $Muzzle.global_transform
	
	
