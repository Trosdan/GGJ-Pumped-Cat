extends RigidBody2D

@export var damage = 1
@export var speed = 100
@export var xp = 50

var player

func _ready():
	player = get_node("%Player")
  
func _process(delta):
	pass
	#var enemy_velocity = position.direction_to(player.position)
	
	#enemy_velocity = enemy_velocity.normalized() * speed
	
	#position += enemy_velocity * delta
