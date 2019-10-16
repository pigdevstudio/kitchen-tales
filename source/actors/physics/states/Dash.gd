extends "res://actors/physics/State.gd"

func _enter():
	actor.velocity.y = 0.0


func _on_command_started(command):
	var state_based_on_move = "Move" if is_moving else "Idle"
	match command:
		"Stop":
			is_moving = false
			get_parent().change_state_to(state_based_on_move)
		"Bump":
			get_parent().change_state_to(state_based_on_move)
		"Jump":
			get_parent().change_state_to("DashJump")
		"DistanceStop":
			get_parent().change_state_to(state_based_on_move)


func _on_command_finished(command):
	match command:
		"Jump":
			get_parent().change_state_to("DashJumpFall")
