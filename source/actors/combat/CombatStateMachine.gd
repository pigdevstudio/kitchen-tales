extends "res://actors/physics/StateMachine.gd"

func set_direction(direction):
	.set_direction(direction)
	set("scale", Vector2(-1 if direction.x < 0 else 1, 1))
