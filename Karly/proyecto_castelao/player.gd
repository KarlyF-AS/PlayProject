extends Area2D

#Variables del jugador
@export var speed = 200 #Velocidad del jugador

var velocity = Vector2.ZERO #Dirección del jugador

#La función ready se llama cuando el obejto se crea por primera vez en la escena
func _ready():
	pass
	
	#La funcion process delta se llama en ada frame. "delta" es ele tiempo que a estado desde el ultimo frame
func _process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("Arriba"):
		velocity.y -= 1
	if Input.is_action_pressed("Abajo"):
		velocity.y += 1
	if Input.is_action_pressed("Derecha"):
		velocity.x += 1
	if Input.is_action_pressed("Izquierda"):
		velocity.x -= 1
		
	velocity = velocity.normalized() * speed
	position = position + velocity * delta
	
	position.x = clamp(position.x, 0, get_viewport_rect().size.x)
	position.y = clamp(position.y, 0, get_viewport_rect().size.y)
	if velocity.length() > 0:
		if abs(velocity.x) > abs(velocity.y):
			if velocity.x > 0:
				$AnimatedSprite2D.animation = "Side_R"
			else: 
				$AnimatedSprite2D.animation = "Side_L"
		else:
			if velocity.y > 0:
				$AnimatedSprite2D.animation = "Front"
			else:
				$AnimatedSprite2D.animation = "Back"
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.frame = 0
		$AnimatedSprite2D.stop()
