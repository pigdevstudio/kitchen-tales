extends "res://actors/physics/State.gd"

func _on_command_started(command):
	match command:
		"Move":
			get_parent().change_state_to("Walk")
		"Jump":
			get_parent().change_state_to("SecondJump")
		"Fall":
			get_parent().change_state_to("SingleFall")
		"Dash":
			get_parent().change_state_to("Dash")


func _on_command_finished(command):
	match command:
		"Jump":
			get_parent().change_state_to("SingleFall")
		"Fall":
			get_parent().change_state_to("Idle")
		"Dash":
			get_parent().change_state_to("DashJump")
