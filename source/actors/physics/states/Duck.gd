extends "res://actors/physics/State.gd"

func _on_command_started(command):
	match command:
		"Move":
			transition.is_moving = true
			state_machine.change_state_to("Walk")
		"Stop":
			transition.is_moving = false
		"Jump":
			state_machine.change_state_to("Jump")
		"Fall":
			state_machine.change_state_to("SingleFall")
		"Dash":
			state_machine.change_state_to("Dash")
		"Stand":
			if transition.is_moving:
				execute("Move")
			else:
				state_machine.change_state_to("Idle")


func _on_command_finished(command):
	pass