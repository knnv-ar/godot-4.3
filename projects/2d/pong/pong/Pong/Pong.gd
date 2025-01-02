extends Node2D

"""
Determino center como el centro del viewport
desde donde sale la pelota y es constante
porque el centro del viewport nunca va a cambiar
durante el juego.
"""
const CENTER = Vector2(640, 360)
var player_score = 0
var computer_score = 0

# Area izquierda
func _on_goal_left_body_entered(body):
	computer_score += 1
	# computer_score contiene un dato int, por lo tanto
	# lo envolvemos con un str() para que text lo acepte
	$ComputerScore.text = str(computer_score)
	reset()

# Area derecha
func _on_goal_right_body_entered(body):
	player_score += 1
	# computer_score contiene un dato int, por lo tanto
	# lo envolvemos con un str() para que text lo acepte
	$PlayerScore.text = str(player_score)
	reset()

func reset():
	# Asigno el valor de CENTER a la posición de
	# la hija Ball a partir de una referencia.
	$Ball.position = CENTER
	# LLamo a una funcion creada en el script de Ball
	$Ball.call("set_ball_velocity")
	$Player.position.y = CENTER.y
	$Computer.position.y = CENTER.y
