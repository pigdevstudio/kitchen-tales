extends "res://actors/physics/State.gd"


func _on_command_started(command):
	match command:
		"Stop":
			state_machine.change_state_to("DashFall")
		"Bump":
			state_machine.change_state_to("DashFall")
		"DistanceStop":
			state_machine.change_state_to("DashFall")
		"Fall":
			state_machine.change_state_to("DashJumpFall")
