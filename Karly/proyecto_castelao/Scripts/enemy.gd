extends Area2D

var player

var speed

func _ready():
	speed = randf_range(50., 200.0)
	
func _process(delta):
	var direction_to_player = (player.global_position - global_position).normalized()
	
if direction_to_player.length() > 0:
	$AnimatedSpride.play()
else 
	$AnimatedSpride.stop()
	
position = position + direction_to_player * speed * delta
