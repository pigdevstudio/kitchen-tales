extends "res://actors/physics/State.gd"


func _on_command_started(command):
	match command:
		"Stop":
			state_machine.change_state_to("Idle")
		"Jump":
			state_machine.change_state_to("Jump")
		"Fall":
			state_machine.change_state_to("SingleFall")
		"Dash":
			state_machine.change_state_to("Dash")
		"Duck":
			state_machine.change_state_to("Duck")
			


func _on_command_finished(command):
	pass
