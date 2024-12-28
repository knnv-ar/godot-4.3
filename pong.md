nodos 2D: azul
nodos 3D: rojo
nodos interfaz de usuario: verde

nodo Sprite2D (para renderizar un sprite 2D)

Pong ()
Player:
Nodo raiz: CharacterBody2D
Nodo hijo: Sprite 2D > Texture: paddle-blue.png
Nodo hijo: CollisionShape2D > Shape: CapsuleShape2D


Script:
```
extends CharacterBody2D

func _ready():
	print("Hola mundo")
```

```
extends CharacterBody2D

var speed = 500

func _physics_process(delta):
	velocity.y = 0

	if Input.is_action_pressed("ui_up):
		velocity.y = -1
	elif Input.is_action_pressed("ui_down):
		velocity.y = 1

	velocity.y *= speed

	move_and_collide(velocity * delta)
```



RigidBody2D le afecta la gravedad: podría ser una pelota


Ball:
Nodo raiz: CharacterBody2D
Nodo hijo: Sprite 2D > Texture: paddle-blue.png
Nodo hijo: CollisionShape2D > Shape: CircleShape2D

Pong:
Nodo raiz: 2D Scene (Node2D)


Nodo hijo: StaticBody2D (topwall



Viewport size: 1280 x 720
CharacterBody2D



Shortcuts:
F5 > reproduce el proyecto