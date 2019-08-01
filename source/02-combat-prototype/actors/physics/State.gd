extends Node

signal entered
signal exited

var active = false setget set_active

func set_active(activate):
	active = activate
	for command in get_children():
		command.enabled = active
	if active:
		emit_signal("entered")
	else:
		emit_signal("exited")


func execute_command(command_name):
	if has_node(command_name):
		get_node(command_name).execute()


func cancel_command(command_name):
	if has_node(command_name):
		get_node(command_name).cancel()


func set_movement_direction(direction):
	for command in get_children():
		if command.has_method("set_movement_direction"):
			command.set_movement_direction(direction)
