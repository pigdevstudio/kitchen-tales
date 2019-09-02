extends "res://actors/physics/State.gd"

func _on_command_started(command):
	match command:
		"Stop":
			get_parent().change_state_to("Idle")
		"Bump":
			get_parent().change_state_to("Idle")
		"Jump":
			get_parent().change_state_to("DashJump")
		"DistanceStop":
			get_parent().change_state_to("Idle")


func _on_command_finished(command):
	match command:
		"Jump":
			get_parent().change_state_to("DashJumpFall")
