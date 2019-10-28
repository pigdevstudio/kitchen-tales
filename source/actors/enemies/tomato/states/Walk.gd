extends "res://actors/physics/State.gd"

func _on_command_started(command):
	match command:
		"Stop":
			state_machine.change_state_to("Idle")
		"Chase":
			state_machine.change_state_to("Chase")


func _on_command_finished(command):
	pass
