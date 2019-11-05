extends "res://actors/physics/State.gd"

func _enter():
	if transition.is_moving:
		execute("Move")
	else:
		execute("Stop")


func _on_command_started(command):
	match command:
		"Stop":
			transition.is_moving = false
			state_machine.change_state_to("Idle")
		"Jump":
			state_machine.change_state_to("Jump")
		"Fall":
			state_machine.change_state_to("SingleFall")
		"Dash":
			state_machine.change_state_to("Dash")
		"Move":
			transition.is_moving = true
		"Duck":
			state_machine.change_state_to("Duck")
			


func _on_command_finished(command):
	pass
