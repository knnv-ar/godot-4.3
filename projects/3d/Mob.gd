extends CharacterBody3D

# Señal emitida cuando el jugador salta sobre el mob.
signal squashed

# Velocidad mínima de la criatura en metros por segundo.
@export var min_speed = 10
# Velocidad máxima de la criatura en metros por segundo.
@export var max_speed = 18


func _physics_process(_delta):
	move_and_slide()

# Esta función se llamará desde la escena principal.
func initialize(start_position, player_position):
	# Posicionamos al mob colocándolo en start_position
	# y lo rotamos hacia player_position, de modo que mire al jugador.
	look_at_from_position(start_position, player_position, Vector3.UP)
	# Rotamos este monstruo aleatoriamente dentro del rango de -45 y +45 grados,
	# para que no se mueva directamente hacia el jugador.
	rotate_y(randf_range(-PI / 4, PI / 4))
	
	# Calculamos una velocidad aleatoria (entero)
	var random_speed = randi_range(min_speed, max_speed)
	# Calculamos una velocidad hacia adelante (forward velocity) que representa la velocidad.
	velocity = Vector3.FORWARD * random_speed
	# We then rotate the velocity vector based on the mob's Y rotation
	# in order to move in the direction the mob is looking.
	# Luego rotamos el vector de velocidad en función de la rotación del eje Y del mob
	# para moverlo en la dirección en la que mira.
	velocity = velocity.rotated(Vector3.UP, rotation.y)
	$AnimationPlayer.speed_scale = random_speed / min_speed


func _on_visible_on_screen_notifier_3d_screen_exited():
	queue_free()

func squash():
	squashed.emit()
	queue_free()
