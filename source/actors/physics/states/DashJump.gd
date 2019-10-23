extends "res://actors/physics/State.gd"


func _on_command_started(command):
	var state_based_on_move = "Move" if transition.is_moving else "Idle"
	match command:
		"Stop":
			state_machine.change_state_to(state_based_on_move)
		"Bump":
			transition.is_moving = false
			state_machine.change_state_to(state_based_on_move)
		"DistanceStop":
			state_machine.change_state_to(state_based_on_move)
		"Fall":
			state_machine.change_state_to("DashJumpFall") 
