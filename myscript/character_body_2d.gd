extends CharacterBody2D


const SPEED = 80.0
const JUMP_VELOCITY = -200.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var jumpingnoise: AudioStreamPlayer2D = $jumpingnoise



func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jumpingnoise.play()

	var direction := Input.get_axis("goleft", "goright")
	
	if direction > 0 :
		animated_sprite_2d.flip_h = false
	elif direction < 0 :
		animated_sprite_2d.flip_h = true
		
	if direction == 0 :
		animated_sprite_2d.play("idleright")
	else :
		animated_sprite_2d.play("walkright")
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

		
	move_and_slide()
