extends "res://actors/physics/State.gd"

func _on_command_started(command):
	match command:
		"Jump":
			get_parent().change_state_to("SecondJump") 
		"Dash":
			get_parent().change_state_to("Dash") 
		"Move":
			is_moving = true
		"Stop":
			is_moving = false
		"WallSlide":
			get_parent().change_state_to("WallSlide")


func _on_command_finished(command):
	match command:
		"Fall":
			if is_moving:
				get_parent().change_state_to("Walk")
			else:
				get_parent().change_state_to("Idle")
		"Jump":
			get_parent().change_state_to("SecondFall")
