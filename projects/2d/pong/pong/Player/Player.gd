extends CharacterBody2D

@onready var vjoystick: Node2D = $"../vjoystick"

var speed = 500

func _process(delta):
	var direction_y = vjoystick.posVector.y
	
	if Input.is_action_pressed("ui_up"):
		direction_y = -1
	elif Input.is_action_pressed("ui_down"):
		direction_y = 1
	
	velocity.y = direction_y * speed
	move_and_collide(velocity * delta)
