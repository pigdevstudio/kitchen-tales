extends "res://actors/physics/State.gd"


func _on_command_started(command):
	match command:
		"Fall":
			state_machine.change_state_to("SingleFall")
		"Dash":
			state_machine.change_state_to("JumpDash")


func _on_command_finished(command):
	match command:
		"Jump":
			state_machine.change_state_to("SingleFall")
		"Fall":
			state_machine.change_state_to("Idle")
		"Dash":
			state_machine.change_state_to("DashJump")
