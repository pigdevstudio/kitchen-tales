extends "res://actors/physics/State.gd"

func _on_command_started(command):
	var state_based_on_move = "Move" if is_moving else "Idle"
	match command:
		"Stop":
			get_parent().change_state_to(state_based_on_move)
		"Bump":
			is_moving = false
			get_parent().change_state_to(state_based_on_move)
		"DistanceStop":
			get_parent().change_state_to(state_based_on_move)
		"Fall":
			get_parent().change_state_to("DashJumpFall") 


func _on_command_finished(command):
	pass
