extends "res://actors/physics/StateMachine.gd"

func setup_commands():
	pass


func execute(command_name):
	if command_name == "Attack":
		command_name = get_with_direction_suffix(command_name)
	.execute(command_name)


func cancel(command_name):
	if command_name == "Attack":
		command_name = get_with_direction_suffix(command_name)
	.cancel(command_name)


func get_with_direction_suffix(text):
	match direction:
			Vector2.RIGHT:
				text += "Right"
			Vector2.LEFT:
				text += "Left"
	return text
