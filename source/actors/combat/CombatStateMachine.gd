extends "res://actors/physics/StateMachine.gd"

func set_direction(direction):
	.set_direction(direction)
	set("scale", Vector2(-1 if direction.x < 0 else 1, 1))


func _on_MovementMachine_state_changed(new_state):
	change_state_to(new_state)
	for hitbox in get_tree().get_nodes_in_group("player"):
		if hitbox.is_in_group("hitbox"):
			hitbox.disable()
