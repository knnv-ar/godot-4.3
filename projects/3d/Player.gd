extends CharacterBody3D

# Se emite cuando el jugador es golpeado por un mob.
# Pon esto en la parte superior del script.
signal hit

# Qué tan rápido se mueve el jugador en metros por segundo.
@export var speed = 14
# La aceleración de caída cuando está en el aire, en metros por segundo al cuadrado.
@export var fall_acceleration = 75
# Impulso vertical aplicado al personaje al saltar, en metros por segundo.
@export var jump_impulse = 20
# Impulso vertical aplicado al personaje al rebotar sobre un mob en
# metros por segundo.
@export var bounce_impulse = 16

var target_velocity = Vector3.ZERO


func _physics_process(delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_back"):
		direction.z += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1

	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.basis = Basis.looking_at(direction)
		$AnimationPlayer.speed_scale = 4
	else:
		$AnimationPlayer.speed_scale = 1

	# Velocidad en el suelo
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed

	# Velocidad vertical
	if not is_on_floor(): # Si está en el aire, cae hacia el suelo. Literalmente, gravedad
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)

	# Salto.
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		target_velocity.y = jump_impulse
	
	# Iteramos a través de todas las colisiones que ocurrieron en este fotograma
	for index in range(get_slide_collision_count()):
		# Obtenemos una de las colisiones con el jugador
		var collision = get_slide_collision(index)
		
		# Si la colisión es con el suelo:
		if collision.get_collider() == null:
			continue
			
		# Si colisión es con un mob:
		if collision.get_collider().is_in_group("mob"):
			var mob = collision.get_collider()
			# Comprobamos que lo estemos golpeando desde arriba:
			if Vector3.UP.dot(collision.get_normal()) > 0.1:
				# Si es así, lo aplastamos y rebotamos
				mob.squash()
				target_velocity.y = bounce_impulse
				# Prevenimos más llamadas duplicadas
				break
				
	
	# Mover al personaje
	velocity = target_velocity
	move_and_slide()
	
	$Pivot.rotation.x = PI / 6 * velocity.y / jump_impulse

# Y esta función en la parte inferior.
func die():
	hit.emit()
	queue_free()

func _on_mob_detector_body_entered(_body):
	die()
