extends CharacterBody2D

@export var damage = 1
@export var speed = 100
var player

func _ready():
	player = get_node("%Player")

func _process(delta):
	var velocity = position.direction_to(player.position)
	
	velocity = velocity.normalized() * speed
	
	position += velocity * delta
