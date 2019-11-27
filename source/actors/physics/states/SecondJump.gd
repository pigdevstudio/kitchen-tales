extends "res://actors/physics/State.gd"


func _on_command_started(command):
	match command:
		"Fall":
			state_machine.change_state_to("SecondFall") 


func _on_command_finished(command):
	match command:
		"Fall":
			state_machine.change_state_to("Idle") 
