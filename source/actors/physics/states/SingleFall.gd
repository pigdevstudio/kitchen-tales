extends "res://actors/physics/State.gd"

func _on_command_started(command):
	match command:
		"Jump":
			state_machine.change_state_to("SecondJump") 
		"Dash":
			state_machine.change_state_to("Dash") 
		"WallSlide":
			state_machine.change_state_to("WallSlide")


func _on_command_finished(command):
	match command:
		"Fall":
			state_machine.change_state_to("Idle")
		"Jump":
			state_machine.change_state_to("SecondFall")
