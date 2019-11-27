extends "res://actors/physics/State.gd"

func _enter():
	actor.velocity.y = 0.0


func _on_command_started(command):
	match command:
		"Stop":
			state_machine.change_state_to("DashFall")
		"Bump":
			state_machine.change_state_to("DashFall")
		"DistanceStop":
			state_machine.change_state_to("DashFall")


func _on_command_finished(command):
	match command:
		"Dash":
			state_machine.change_state_to("DashFall")
