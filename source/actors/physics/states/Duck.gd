extends "res://actors/physics/State.gd"

func _on_command_started(command):
	match command:
		"Move":
			is_moving = true
			get_parent().change_state_to("Walk")
		"Stop":
			is_moving = false
		"Jump":
			get_parent().change_state_to("Jump")
		"Fall":
			get_parent().change_state_to("SingleFall")
		"Dash":
			get_parent().change_state_to("Dash")
		"Stand":
			if is_moving:
				execute("Move")
			else:
				get_parent().change_state_to("Idle")


func _on_command_finished(command):
	pass