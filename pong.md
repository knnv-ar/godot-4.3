# Pong

## Preliminares

1. Creo un proyecto nuevo.
2. Arrastro la carpeta `assets` a la ventana `FileSystem`.
3. Cambio el tamaño del `Viewport`:
	- Display > Window > Size > Viewport Width: 1280
	- Display > Window > Size > Viewport Height: 720 (valores originales: 1152 x 648)

## Agrego la escena `Player`

> **TIP:**
>
> Color de nodos:
>
> - azul: 2D
> - rojo: 3D
> - verde: interfaz de usuario

1. Creo el nodo raiz **Player**:
	- Scene > Other Node > Node > Node2D > CollisionObject2D > `CharacterBody2D` > Create
	- Cambio el nombre del nodo de _CharacterBody2D_ a **Player**.
2. Creo el nodo hijo **CollisionShape2D**:
	- Scene > Other Node > Node > Node2D > `CollisionShape2D` > Create
	- Inspector > CollisionShape2D > Shape > `CapsuleShape2D`
3. Creo el nodo hijo **Sprite2D** con la textura `paddle-blue.png` y la rotación de 90 grados:
	- Scene > Other Node > Node > Node2D > `Sprite2D` > Create (permite renderizar un sprite 2D)
	- Arrastro el archivo `paddle-blue.png` a la caja: Inspector > Sprite2D > Texture
	- En la pestaña _Escena_ selecciono `Sprite2D` y luego aplico Inspector > Sprite2D > Node2D > Transform > `Rotation: 90 grados`

> **TIP:**
>
> Relación parent / child de nodos

El arbol de nodos nos tiene que quedar de la siguiente manera:

- Player (_CharacterBody2D_)
	- _Sprite2D_
	- _CollisionShape2D_

4. Rearreglo el arbol de nodos: _CollisionShape2D_ debe quedar como último nodo para poder adaptar su forma al del Sprite.
5. Selecciono el _CollisionShape2D_ y modifico el ancho y/o alto del mismo para que se adapte a las dimensiones del Sprite.
6. Cambio la posición relativa de _Player_ en el viewport: Inspector > Player > Node2D > Transform > `Position: x = 100, y = 360`.

> **TIP:**
>
> Para mover a todos los elementos de una escena tengo que agrupar sus elementos. Para ello, selecciono el parent (por ejemplo: Player) y luego clico en _Group Selected Node(s)_ o `Ctrl + G`.

7. Guardo la escena: Scene > Save Scene > `Ctrl + S`. Creo una carpeta `Player` y guardo el archivo allí dentro como `Player.tscn`
8. Pruebo la escena `Player` con la tecla `F6`: _Run Current Scene_.

## Doy movimiento a la escena `Player`

1. Selecciono el nodo Scene > `Player` y hago clic en Scene > `Attach a new or existing script to the selected node`.
2. Configuro la siguiente ventana:
	- Language: `GDScript`
	- Inherits: `CharacterBody2D`
	- Template: `Empty`
	- Built-in Script: `Off`
	- Path: `res://Player/Player.gd`
3. Escribo el siguiente script para probar la ejecucion de un script en la escena `Player`:

```
extends CharacterBody2D

func _ready():
	print("Hola mundo 2D")
```

4. Borro el contenido del script y escribo lo siguiente:

```
extends CharacterBody2D

var speed = 500

func _process(delta):
	velocity.y = 0
	
	if Input.is_action_pressed("ui_up"):
		velocity.y = -1
	elif Input.is_action_pressed("ui_down"):
		velocity.y = 1
	
	velocity.y *= speed
	
	move_and_slide()
```

## Agrego la escena `Computer`

1. Creo una nueva escena con clic en `+` al lado de la escena `Player`.
2. Copio la escena `Player` y la pego en la nueva escena haciendo clic en Scene > `Paste from Clipboard`.
3. Renombro el nodo raiz de la nueva escena de `Player` a `Computer`.
4. Elimino el script asociado al nodo raiz de `Computer` mediante clic en Inspector > Computer > Node > Sript > `Clear`.
5. Cambio la posición horizontal del nodo raiz de `Computer` en el viewport: Inspector > Computer > Node2D > Transform > `Position: x = 1180`.
6. Selecciono el nodo `Sprite2D` y cambio la textura a `paddle-red.png` arrastrando encima de la paleta azul dicho archivo a la caja: Inspector > Sprite2D > Texture.
7. Guardo la escena: Scene > Save Scene > `Ctrl + S`. Creo una carpeta `Computer`, donde estaba la carpeta `Player`, y guardo el archivo allí dentro como `Computer.tscn`
8. Pruebo la escena `Player` con la tecla `F6`: _Run Current Scene_.

## Agrego la escena `Ball`
1. Creo una nueva escena con clic en `+` al lado de la escena `Computer`.
2. Para el nodo raiz, hago clic en `Scene > Other Node` y selecciono `CharacterBody2D`.
3. Renombro el nodo raiz de la nueva escena de `CharacterBody2D` a `Ball`.
4. Agrego un nodo hijo de tipo `Sprite2D` y le arrastro la textura `ball.png`.
5. Agrego otro nodo hijo al raiz de tipo `CollisionShape2D` y selecciono una forma: `CircleShape2D`.
6. Agrupo y coloco la escena en el medio del viewport: Inspector > Ball > Node2D > Transform > `Position: x = 640, y = 360`.
7. Guardo la escena: Scene > Save Scene > `Ctrl + S`. Creo una carpeta `Ball`, donde estaba la carpeta `Player`, y guardo el archivo allí dentro como `Ball.tscn`
8. Pruebo la escena `Player` con la tecla `F6`: _Run Current Scene_.

## Agrego la escena principal `Pong`
1. Creo una nueva escena con clic en `+` al lado de la escena `Ball`.
2. Para el nodo raiz, hago clic en `Scene > Create Root Node > 2D Scene`.
3. Renombro el nodo raiz de la nueva como `Pong`.
4. Instanciamos las escenas que hemos creado hasta ahora: Scene > Instantiate Child Scenes (Ctrl + Shift + A) > `Player`. Deseleccionamos cualquier escena que tengamos seleccionada y repetimos el procedimiento con `Computer` y por último con `Ball`.
5. Guardo la escena: Scene > Save Scene > `Ctrl + S`. Creo una carpeta `Pong`, donde estaba la carpeta `Player`, y guardo el archivo allí dentro como `Pong.tscn`
6. Ahora que ya tengo la escena parent del proyecto lo pruebo con la tecla la tecla `F5`: _Run Project_. Se abrirá una ventana que nos preguntará que confirmemos cuál es la escena principal del proyecto. En este caso, la escena `Pong` es la principal por lo tanto seleccionamos `Select Current`.

## Agrego la pared superior a la escena principal `Pong`

1. Agrego un nuevo nodo hijo al nodo `Pong` seleccionando el nodo raiz, clic derecho sobre el mismo y `Add Child Node (Ctrl + A)`.
2. Selecciono el tipo de nodo `StaticBody2D` y le cambio el nombre a `TopWall`.
3. Mientras mantengo seleccionado el nodo `TopWall` agrego un nodo hijo de tipo `Sprite2D` y arrastro la textura `wall-horizontal.png` a la caja: Inspector > Sprite2D > Texture.
4. Agrego al nodo `TopWall` otro nodo hijo de tipo `CollisionShape2D`, selecciono la forma `RectangleShape2D` y adapto su forma al sprite.
5. Selecciono el nodo `TopWall` y le cambio la posición vertical: Inspector > TopWall > Node2D > Transform > `Position: x = 640, y = 40`.
6. Pruebo la escena `Pong` con la tecla `F5`: _Run Project_ y verifico que ahora sí `TopWall` limita el movimiento de `Player`.

## Agrego las paredes inferior a la escena principal `Pong`
1. Selecciono el nodo `TopWall` y lo duplico con `Ctrl + D`. Se creará un nodo `TopWall2`.
2. Renombro el nodo `TopWall2` a `BottomWall`.
3. Selecciono el nodo `BottomWall` y le cambio la posición vertical: Inspector > BottomWall > Node2D > Transform > `Position: y = 680`.
4. Pruebo la escena `Pong` con la tecla `F5`: _Run Project_ y verifico que ahora sí `BottomWall` limita el movimiento de `Player`.

## Agrego movimiento a `Ball`
1. Selecciono la escena `Ball` y le agrego un script con `Attach a new or existing script to the selected node`.
2. Configuro la siguiente ventana:
	- Language: `GDScript`
	- Inherits: `CharacterBody2D`
	- Template: `Empty`
	- Built-in Script: `Off`
	- Path: `res://Ball/Ball.gd`
3. Escribo el siguiente script para probar la ejecucion de un script en la escena `Ball`:

```
extends CharacterBody2D

var speed = 500

func _ready():
	if randi() % 2 == 0:
		velocity.x = 1
	else:
		velocity.x = -1
	
	velocity *= speed

func _physics_process(delta):
	move_and_collide(velocity * delta)
```

4. Pruebo la escena `Pong` con la tecla `F5`: _Run Project_ y verifico que ahora `Ball` se mueve.
5. Borro el contenido del script y escribo lo siguiente:

```
extends CharacterBody2D

var speed = 500

func _ready():
	if randi() % 2 == 0:
		velocity.x = 1
	else:
		velocity.x = -1

	if randi() % 2 == 0:
		velocity.y = 1
	else:
		velocity.y = -1
	
	velocity *= speed

func _physics_process(delta):
	move_and_collide(velocity * delta)
```

## Agrego movimiento de rebote a `Ball` cuando colisione con paredes y paletas

1. Presionamos F1 > Search Help y buscamos el método `move_and_collide()`. Este método devuelve un objeto de tipo `KinematicCollision2D` que contiene **información sobre la colision** cuando esta ocurra.
2. Investigo también los métodos `bounce()` y `get_normal()` 
3. Borro el contenido del script y escribo lo siguiente:

```
extends CharacterBody2D

var speed = 500

func _ready():
	if randi() % 2 == 0:
		velocity.x = 1
	else:
		velocity.x = -1
	
	if randi() % 2 == 0:
		velocity.y = 1
	else:
		velocity.y = -1
	
	velocity *= speed

func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		# Obtiene el valor del vector normal de collision_info
		# cuando Ball rebota en un cuerpo y calcula la velocidad
		# correspondiente.
		velocity = velocity.bounce(collision_info.get_normal())
```
4. Pruebo la escena `Pong` con la tecla `F5`: _Run Project_ y verifico que ahora `Ball` rebota contra las paredes y paletas.

## Programo movimiento del oponente `Computer`

> **Lógica de mecánica:** si la pelota está más arriba de la paleta, esta se mueve para arriba, de lo contrario, se mueve para abajo.

1. Selecciono la escena `Computer` y a continuación selecciono el nodo raiz`Computer`.
2. Le agrego un script con `Attach a new or existing script to the selected node`.
3. Configuro la siguiente ventana:
	- Language: `GDScript`
	- Inherits: `CharacterBody2D`
	- Template: `Empty`
	- Built-in Script: `Off`
	- Path: `res://Computer/Computer.gd`
4. Escribo el siguiente script para probar la ejecucion de un script en la escena `Computer`:

```
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
	# de la pelota a partir de una referencia a la misma:
	ball = get_parent().get_node("Ball")
	
func _physics_process(delta):
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
```

## Creo las paredes verticales que contendrán los triggers (`Area2D`) para el puntaje y reseteo de `Ball`
1. Selecciono la escena `Pong` y a continuación le agrego un nodo hijo de tipo `Area2D`.
2. Renombro este nuevo nodo como `GoalLeft`.
3. Al nodo `GoalLeft` le agrego un nuevo nodo hijo de tipo `Sprite2D`.
4. Le asigno la textura `wall-vertical.png`.
5. Selecciono el nodo `GoalLeft` y le agrego un nuevo nodo hijo de tipo `CollisionShape2D` y le asigno la forma `RectangleShape2D`.
6. Selecciono el nodo `GoalLeft` y le cambio la posición horizontal: Inspector > GoalLeft > Node2D > Transform > `Position: x = 56, y = 360`.
7. Adapto la forma del shape del nodo `CollisionShape2D` al sprite ***PERO SIN TOCAR LOS BORDES DE LOS SHAPES DE LAS PAREDES SUPERIOR E INFERIOR*** para evitar problemas de colisión.
8. Duplico la escena `GoalLeft` y le renombro a `GoalRight`.
9. Selecciono el nodo `GoalRight` y le cambio la posición horizontal: Inspector > GoalRight > Node2D > Transform > `Position: x = 1224, y = 360`.

## Creo el script de la escena principal `Pong`
1. Selecciono la escena `Pong` y le agrego un script con `Attach a new or existing script to the selected node`.
2. Configuro la siguiente ventana:
	- Language: `GDScript`
	- Inherits: `Node2D`
	- Template: `Empty`
	- Built-in Script: `Off`	
	- Path: `res://Pong/Pong.gd`

## Conecto una señal con un señales (events)
1. Selecciono la escena `GoalLeft` y clico sobre la pestaña `Node` (a la derecha de `Inspector`) lo siguiente: `Signals > Area2D > body_entered(body: Node2D) > Connect...`.
2. Me aparece una ventana `Connect a Signal to a Method` y tengo que elegir con qué nodo quiero conectar esta señal: selecciono el nodo raiz `Pong`.
3. Clic en `Connect`.
4. Escribo el siguiente script en la escena `Pong`:
5. Aplico el mismo proceso de este paso para la escena `GoalRight`.

```
extends Node2D

func _on_goal_left_body_entered(body):
	print("La pelota entró en el área.")
```

5. Pruebo la escena `Pong` con la tecla `F5`: _Run Project_ y verifico que cuando `Ball` toca las `Area2D` me aparece el mensaje impreso en la consola.

## Reseteo la posición de `Ball`

1. Selecciono la escena `Pong` y luego selecciono el script asociado `Pong.gd`.
2. Escribo el siguiente script en la escena `Pong`:

```
extends Node2D

"""
Determino center como el centro del viewport
desde donde sale la pelota y es constante
porque el centro del viewport nunca va a cambiar
durante el juego.
"""
const CENTER = Vector2(640, 360)

# Area izquierda
func _on_goal_left_body_entered(body):
	# Asigno el valor de CENTER a la posición de
	# la hija Ball a partir de una referencia.
	$Ball.position = CENTER

# Area derecha
func _on_goal_right_body_entered(body):
	# Asigno el valor de CENTER a la posición de
	# la hija Ball a partir de una referencia.
	$Ball.position = CENTER
```

## Reseteo la posición de las paletas `Player` y `Computer`

1. Selecciono la escena `Pong` y luego selecciono el script asociado `Pong.gd`.
2. Escribo el siguiente script en la escena `Pong`:

```
extends Node2D

"""
Determino center como el centro del viewport
desde donde sale la pelota y es constante
porque el centro del viewport nunca va a cambiar
durante el juego.
"""
const CENTER = Vector2(640, 360)

# Area izquierda
func _on_goal_left_body_entered(body):
	# Asigno el valor de center a la posición de
	# la hija Ball a partir de una referencia.
	$Ball.position = CENTER
	$Player.position.y = CENTER.y
	$Computer.position.y = CENTER.y

# Area derecha
func _on_goal_right_body_entered(body):
	# Asigno el valor de center a la posición de
	# la hija Ball a partir de una referencia.
	$Ball.position = CENTER
	$Player.position.y = CENTER.y
	$Computer.position.y = CENTER.y
```

3. Ahora, como podemos observar, estamos repitiendo código. Esto no es una buena práctica. Por lo tanto vamos a factorizar el código. Rescribo el script en la escena `Pong`:

```
extends Node2D

"""
Determino center como el centro del viewport
desde donde sale la pelota y es constante
porque el centro del viewport nunca va a cambiar
durante el juego.
"""
const CENTER = Vector2(640, 360)

# Area izquierda
func _on_goal_left_body_entered(body):
	reset()

# Area derecha
func _on_goal_right_body_entered(body):
	reset()

func reset():
	# Asigno el valor de CENTER a la posición de
	# la hija Ball a partir de una referencia.
	$Ball.position = CENTER
	$Player.position.y = CENTER.y
	$Computer.position.y = CENTER.y
```

## Reseteo la velocidad de `Ball`

1. Selecciono la escena `Ball` y luego selecciono el script asociado `Ball.gd`.
2. Refactorizo el script de la escena `Ball`:

```
extends CharacterBody2D

var speed = 500

func _ready():
	set_ball_velocity()

func set_ball_velocity():
	if randi() % 2 == 0:
		velocity.x = 1
	else:
		velocity.x = -1
	
	if randi() % 2 == 0:
		velocity.y = 1
	else:
		velocity.y = -1
	
	velocity *= speed

func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		# Obtiene el valor del vector normal de collision_info
		# cuando Ball rebota en un cuerpo y calcula la velocidad
		# correspondiente.
		velocity = velocity.bounce(collision_info.get_normal())
```

3. Selecciono la escena `Pong` y luego selecciono el script asociado `Pong.gd`.
2. Agrego una llamada a la función `set_ball_velocity` de la escena `Ball` con la instrucción `$Ball.call("set_ball_velocity")`:

```
extends Node2D

"""
Determino center como el centro del viewport
desde donde sale la pelota y es constante
porque el centro del viewport nunca va a cambiar
durante el juego.
"""
const CENTER = Vector2(640, 360)

# Area izquierda
func _on_goal_left_body_entered(body):
	reset()

# Area derecha
func _on_goal_right_body_entered(body):
	reset()

func reset():
	# Asigno el valor de CENTER a la posición de
	# la hija Ball a partir de una referencia.
	$Ball.position = CENTER
	# LLamo a una funcion creada en el script de Ball
	$Ball.call("set_ball_velocity")
	$Player.position.y = CENTER.y
	$Computer.position.y = CENTER.y
```

## Agrego la red
1. Selecciono la escena `Pong` y la vista `2D`, luego agrego la red arrastrando el archivo `middle-line.png` directamente al viewport. Se creará un nodo hijo de tipo `Sprite2D` con el nombre `Middle-line` y debemos corroborar que sea hijo de la escena `Pong`.
2. Selecciono la escena `Middle-line` y luego determino la posición del mismo con Inspector > Middle-line > Node2D > Transform > `Position: x = 640, y = 354`.

## Agrego display de puntaje

1. Selecciono la escena `Pong` y luego agrego un nodo hijo de interfaz de usuario de tipo `Label` y lo renombro como `PlayerScore`.
2. Selecciono la herramienta `Move Mode (W)` y desplazo el nodo `PlayerScore` a la posición `(558, 78)`.
3. Escribo en Inspector > PlayerScore > Label:
	- Text: `0`
	- Horizontal Alignment: `Center`
	- Vertical Alignment: `Center`
	- Label Settings:  `New LabelSettings`
	- Clic en `LabelSettings`
	- Clic en `Font`
	- Arrantos el archivo `alarm-clock.ttf` a la caja Font > `<empty>`.
	- Size: `60`
4. Selecciono la escena `PlayerScore` y la duplico con `Ctrl + D`.
5. Renombro el archivo `PlayerScore2` a `ComputerScore`.
6. Selecciono la herramienta `Move Mode (W)` y desplazo el nodo `ComputerScore` a la posición x relativa: `(130)`.

## Agrego script de puntaje

1. Selecciono la escena `Pong` y luego hago clic en el script asociado `Pong.gd`.
2. Agrego al script de la escena `Pong`:

```
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
```

3. Antes de probar la escena `Pong` con la tecla `F5`, cambiamos momentaneamente el valor de speed de `450` a `375` del nodo `Computer` para que nos sea más fácil derrotar al oponente de forma tal que podamos ver si el sistema de puntajes funciona rápidamente.

## Disminuyo el jittering del oponente cuando la pelota cambia de forma muy lenta en el eje y

1. Selecciono la escena `Computer` y luego hago clic en el script asociado `Computer.gd`.
2. Agrego al script de la escena `Computer`:

```
extends CharacterBody2D

var speed = 450
var ball

func _ready():
	ball = get_parent().get_node("Ball")
	
func _physics_process(delta):
	if abs(ball.position.y - position.y) < 20:
		# Si la distancia absoluta vertical entre la pelota
		# y la paleta es menor a 20 entonces salimos de la
		# función y la paleta no se mueve.	
		return
	
	if ball.position.y < position.y:
		velocity.y = -1
	else:
		velocity.y = 1
	
	velocity *= speed
	
	move_and_collide(velocity * delta)
```

---

# ver a continuación:
- DELTATIME e independencia de FRAMERATE (https://youtu.be/IpPYrfsKeCQ?si=0hHoyUtMbqw69qzI)
- VECTORES en el DESARROLLO de VIDEOJUEGOS (https://youtu.be/Sjmb52qFkJo?si=ZFkNBweYYiLYf-Uo)

---

## Shortcuts
F5 > inicia la reproducción del proyecto
F8 > detiene la reproducción del proyecto
F1 > Search Help
F2 > Rename

W > Move mode (para mover nodos en el viewport)
Ctrl + A > Add Child Node
Ctrl + D > Duplicate

## Code

### Método de Precisión Programática para determinar el tamaño y posición del CollisionShape2D

Si necesitas establecer los valores programáticamente, puedes hacerlo en un script:

```
# Asumiendo que el CollisionShape está en el nodo "CollisionShape2D"
func set_collision_shape():
    var collision_shape = $CollisionShape2D
    if collision_shape.shape is RectangleShape2D:
        collision_shape.shape.extents = Vector2(50, 25)  # Ancho: 100, Alto: 50
    collision_shape.position = Vector2(100, 150)  # XY Offset
```

## Code

### Visualización en Tiempo Real

- Activa el modo de depuración en Godot para ver las formas de colisión mientras ejecutas el juego. Esto te ayuda a asegurarte de que los ajustes son correctos.
- Para activarlo, ve a `Debug > Visible Collision Shapes`.

### Referencia

Si la escena no es hija:
```
ball = get_parent().get_node("Ball")
```

Si la escena es hija:
```
$Ball
```
