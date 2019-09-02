extends "res://actors/physics/State.gd"

var moving = false

func _on_command_started(command):
	match command:
		"Jump":
			get_parent().change_state_to("SecondJump") 
		"Dash":
			get_parent().change_state_to("Dash") 
		"Move":
			moving = true
		"Stop":
			moving = false


func _on_command_finished(command):
	match command:
		"Fall":
			if moving:
				get_parent().change_state_to("Walk")
			else:
				get_parent().change_state_to("Idle")
		"Jump":
			get_parent().change_state_to("SecondFall")
