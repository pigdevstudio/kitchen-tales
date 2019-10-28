extends "res://actors/physics/State.gd"

func _enter():
	execute("Stop")


func _on_command_started(command):
	match command:
		"Move":
			state_machine.change_state_to("Walk")
		"Chase":
			state_machine.change_state_to("Chase")
			

func _on_command_finished(command):
	pass
