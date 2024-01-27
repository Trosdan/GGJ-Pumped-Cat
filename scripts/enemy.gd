extends CharacterBody2D

@export var damage = 1
@export var speed = 100
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("%Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = position.direction_to(player.position)
	
	velocity = velocity.normalized() * speed
	
	position += velocity * delta
