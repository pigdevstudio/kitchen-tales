extends "res://actors/physics/State.gd"

func _on_command_started(command):
	match command:
		"Hide":
			state_machine.change_state_to("Hidden")


func _on_command_finished(command):
	pass
