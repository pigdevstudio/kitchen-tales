extends "res://actors/combat/Attack.gd"

signal direction_changed(new_direction)

var direction = Vector2.RIGHT setget set_direction

func set_direction(new_direction):
	direction = new_direction
	direction.x = sign(direction.x)
	emit_signal("direction_changed", direction)
