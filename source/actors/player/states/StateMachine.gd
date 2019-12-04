extends "res://actors/physics/StateMachine.gd"

var can_execute_command = true

func execute(command_name):
#	if command_name == "Attack":
#		can_execute_command = false
	
	if can_execute_command:
		_current_state.execute(command_name)


func cancel(command_name):
	if command_name == "Attack":
		can_execute_command = true
	
	if can_execute_command:
		_current_state.cancel(command_name)
