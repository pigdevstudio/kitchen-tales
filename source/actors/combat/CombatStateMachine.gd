extends "res://actors/physics/StateMachine.gd"

func set_direction(direction):
	.set_direction(direction)
	set("scale", Vector2(-1 if direction.x < 0 else 1, 1))


func _on_MovementMachine_state_changed(new_state):
	if has_node(new_state + "State"):
		change_state_to(new_state)

