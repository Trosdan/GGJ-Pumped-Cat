extends Area2D

signal  hit

@export var speed = 400
@export var player_life = 10
var can_move = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	player_move(delta)
	
func player_hit(damage):
	if(player_life > 0): 
		player_life -= damage
	
	if(player_life <= 0): 
		player_life = 0
		can_move = false
		print("Game-over")
		
	print(player_life)

func player_move(delta):
	if(!can_move): 
		return
	
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		
	velocity = velocity.normalized() * speed
	position += velocity * delta

func _on_body_entered(body):
	var tag = body.get_meta('Tag')
	
	if tag == 'enemy':
		player_hit(body.damage)
		body.queue_free()
