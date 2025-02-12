extends Sprite2D

@onready var parent: Node2D = $".."

var pressing = false

@export var maxLength = 56
@export var deadZone = 5

func _ready() -> void:
	maxLength *= parent.scale.x

func _process(_delta):
	if pressing:
		var pos_y = get_global_mouse_position().y
		var parent_y = parent.global_position.y
		var distance = abs(pos_y - parent_y)
		
		if distance <= maxLength:
			global_position.y = pos_y
		else:
			global_position.y = parent_y + (maxLength if pos_y > parent_y else -maxLength)
		calculateVector()
	else:
		global_position.y = lerp(global_position.y, parent.global_position.y, _delta * 20)
		parent.posVector = Vector2(0,0)
	print(parent.posVector)

func calculateVector():
	if abs((global_position.y - parent.global_position.y)) >= deadZone:
		parent.posVector.y = (global_position.y - parent.global_position.y) / maxLength

func _on_button_button_down() -> void:
	pressing = true

func _on_button_button_up() -> void:
	pressing = false
