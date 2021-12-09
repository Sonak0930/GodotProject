extends Area2D

# get a reference to the sprite
onready var animated_sprite = $AnimatedSprite # animation: idle, run, attack
onready var player = get_node("/root/World_mj/Player_mj")

var sec = 0.0
var enemyName = ["melee_move"]

func _ready():
	animated_sprite.play("run")
	connect("body_entered",player,"_on_Enemies_body_entered",enemyName)

func _process(delta):
	sec += delta
	if sec >= 3: # Starts to attack
		animated_sprite.play("attack")
		$AttackArea/CollisionShape2D.disabled = false
		sec = 0.0
	
func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "attack":
		# disable attacking area collision
		$AttackArea/CollisionShape2D.disabled = true
		animated_sprite.play("run")

func toggle_h():
	scale.x = -1 * scale.x
