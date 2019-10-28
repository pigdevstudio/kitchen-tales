extends "res://actors/physics/State.gd"

func _enter():
	execute("Move")


func _on_command_started(command):
	match command:
		"Stop":
			state_machine.change_state_to("Idle")


func _on_command_finished(command):
	pass