extends Node

signal direction_calculated(direction)

func _ready():
	calculate_movement_direction()


func calculate_movement_direction():
	var direction = 1
	if get_parent().global_position.x > get_viewport().size.x * 0.5:
		direction = -1
	emit_signal("direction_calculated", Vector2(direction, 0))
