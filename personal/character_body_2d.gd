extends CharacterBody2D
@onready var animated_sprite = $AnimatedSprite2D
const SPEED = 200
const JUMP_VELOCITY = -400

func _ready() -> void:
	position = Vector2(400,170)
	
func _physics_process(delta: float) -> void:
	var velocity = Vector2.ZERO
	
	# Mou a la dreta
	if Input.is_action_pressed("dreta"):
		velocity.x += SPEED
		animated_sprite.flip_h = false
		animated_sprite.play("walk")
	# Mou a l'esquerra
	elif Input.is_action_pressed("esquerra"):
		velocity.x -= SPEED
		animated_sprite.flip_h = true
		animated_sprite.play("walk")
	# No es mou horitzontalment
	else:
		velocity.x = 0
		animated_sprite.play("idle")
	# Salt
	if Input.is_action_pressed("salt"):
		animated_sprite.play("jump")
		
	self.velocity = velocity
	move_and_slide()
