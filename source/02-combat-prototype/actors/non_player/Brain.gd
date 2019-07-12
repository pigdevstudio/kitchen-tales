extends Node

onready var walk = get_node(walk_path)
export (NodePath) var walk_path = "../Walk" 

func _ready():
	calculate_movement_direction()


func calculate_movement_direction():
	var direction = 1
	if get_parent().global_position.x > get_viewport().size.x * 0.5:
		direction = -1
	walk.set_movement_direction(Vector2(direction, 0))
	walk.apply()
