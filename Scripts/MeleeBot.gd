extends Area2D


# get a reference to the sprite
onready var animated_sprite = $AnimatedSprite # animation: idle, run, attack
var sec = 0.0

func _ready():
	animated_sprite.play("run")


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
