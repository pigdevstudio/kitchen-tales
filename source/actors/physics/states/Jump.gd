extends "res://actors/physics/State.gd"

func _on_command_started(command):
	match command:
		"Move":
			is_moving = true
		"Stop":
			is_moving = false
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
			if is_moving:
				get_parent().change_state_to("Walk")
			else:
				get_parent().change_state_to("Idle")
		"Dash":
			get_parent().change_state_to("DashJump")
