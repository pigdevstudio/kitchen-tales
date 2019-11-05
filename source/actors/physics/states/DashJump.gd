extends "res://actors/physics/State.gd"


func _on_command_started(command):
	match command:
		"Stop":
			transition.is_moving = false
			state_machine.change_state_to("DashFall")
		"Bump":
			transition.is_moving = false
			state_machine.change_state_to("DashFall")
		"DistanceStop":
			transition.is_moving = true
			state_machine.change_state_to("DashFall")
		"Fall":
			state_machine.change_state_to("DashJumpFall")
