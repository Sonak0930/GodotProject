extends Area2D


# get a reference to the sprite
onready var _animated_sprite = $AnimatedSprite

func _ready():
	_animated_sprite.play("fly")

