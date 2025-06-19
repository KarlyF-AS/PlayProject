extends Node2D

@export var enemy_scene : PackedScene
@export var time_to_spawn = 1
@export var spawn_limit = 10

var enemy_spawn = 0
var cooldown_spawn = 0

@export var offset = 50

func _ready():
	randomize()
	$Player.posicion_inicial = $StartPos.position
	$Enemy.player = $Player
	
func _porcess(delta):
	cooldown_spawn += delta
	if enemy_spawn < spawn_limit and cooldown_spawn >= time_to_spawn:
		cooldown_spawn = 0 
		spawn()

func spawn():
	var enemy = enemy_scene.instance()
	
	enemy.player = $Player
	enemy.scale.x = 3
	enemy.scale.y = 3
	
	var spawn_x = 0
	var spawn_y = 0
	
	if randi() % 2:
		if randi() % 2:
			spawn_x = randi_range(0 - offset, get_viewport_rect().size.x + offset)
			spawn_y = randi_range(- get_viewport_rect().size.y/2, 0 + offset)
		else:
			spawn_x = randi_range(get_viewport_rect().size.x/2, 0 - offset)
			spawn_y = randi_range(0 - offset, get_viewport_rect().size.y + offset)
			
	else:
		if randi() % 2:
			spawn_x = randi_range(get_viewport_rect().size.x, get_viewport_rect().size.y + offset)
			spawn_x = randi_range(get_viewport_rect().size.y, get_viewport_rect().size.y * 2)
			
	enemy.pisition = Vector2(spawn_x, spawn_y)
	enemy_spawn = enemy_spawn + 1
			
			
			
			
			
			
			
			
			
			
			
			
