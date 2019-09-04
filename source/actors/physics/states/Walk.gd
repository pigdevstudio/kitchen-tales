extends "res://actors/physics/State.gd"

func _on_command_started(command):
	match command:
		"Stop":
			is_moving = false
			get_parent().change_state_to("Idle")
		"Jump":
			get_parent().change_state_to("Jump")
		"Fall":
			get_parent().change_state_to("SingleFall")
		"Dash":
			get_parent().change_state_to("Dash")
		"Move":
			is_moving = true


func _on_command_finished(command):
	pass
