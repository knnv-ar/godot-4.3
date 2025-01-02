extends CharacterBody2D

var speed = 450
var ball

func _ready():
	# Obtengo una referencia a la escena Ball
	# recorriendo el arbol de escenas:
	# desde el script de Computer tomo el parent
	# que en este caso es la escena Pong
	# y desde allí la escena Ball.
	# El resultado de esto es que obtengo la posición
	# de la pelota.
	ball = get_parent().get_node("Ball")
	
func _physics_process(delta):
	if abs(ball.position.y - position.y) < 20:
		# Si la distancia absoluta vertical entre la pelota
		# y la paleta es menor a 20 entonces salimos de la
		# función y la paleta no se mueve.	
		return
	
	if ball.position.y < position.y:
		# Si la posicion de la pelota es menor a la
		# posicion y de la computadora entonces cambio
		# la velocidad y de la paleta de la computadora
		# hacia arriba.
		velocity.y = -1
	else:
		# De lo contrario cambio hacia abajo.
		velocity.y = 1
	
	velocity *= speed
	
	move_and_collide(velocity * delta)
