extends Area2D

signal  hit

@export var speed = 400
@export var player_life = 10

var can_move = true

var level = 0
var xp = 0

func _ready():
	pass # Replace with function body.
	
func _process(delta):
	player_move(delta)
	
func player_hit(damage):
	print("[Player:HIT]", "Damage: ", damage)
	if(player_life > 0): 
		player_life -= damage
	
	if(player_life <= 0): 
		player_life = 0
		can_move = false
		print("Game-over")

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
	var IsEnemy = body.get_meta("IsEnemy")
	
	if IsEnemy:
		collision_on_enemy(body)

func earn_xp(earn):
	xp += earn
	
	print("[Player:XP]", "Ganhou: ", earn)
	
	match level:
		0:
			if xp >= 100:
				level_up()
		1:
			if xp >= 250:
				level_up()
		2:
			if xp >= 500:
				level_up()
		3:
			if xp >= 750:
				level_up()
		4:
			if xp >= 1000:
				level_up()
		5:
			if xp >= 1500:
				level_up()
		6:
			if xp >= 2000:
				level_up()
		7:
			if xp >= 2500:
				level_up()
		8:
			if xp >= 3000:
				level_up()
		9:
			if xp >= 4000:
				level_up()
				
	print("[Player:XP]", "level: ", level)
	print("[Player:XP]", "XP: ", xp)
	print("[Player:XP] ", "---")

func level_up():
	level += 1
	xp = 0

func collision_on_enemy(enemy):
	player_hit(enemy.damage)
	# earn_xp(enemy.xp) Faz com que o Player Ganhe XP ao eliminar o inimigo
	enemy.queue_free()
