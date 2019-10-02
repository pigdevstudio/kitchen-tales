extends "res://actors/physics/State.gd"

func _on_command_started(command):
	match command:
		"Move":
			is_moving = true
		"Stop":
			is_moving = false
		"WallSlide":
			if is_moving:
				get_parent().change_state_to("WallSlide")


func _on_command_finished(command):
	match command:
		"Fall":
			if is_moving:
				get_parent().change_state_to("Walk")
			else:
				get_parent().change_state_to("Idle")

