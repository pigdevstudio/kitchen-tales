extends Node

signal entered
signal exited

var active = false setget set_active

func _ready():
	connect_commands()


func connect_commands():
	for child in get_children():
		if not child.has_method("execute"):
			continue
		child.connect("started", self, "_on_command_started",
				[child.name])
		child.connect("finished", self, "_on_command_finished",
				[child.name])


func _on_command_started(command):
	pass


func _on_command_finished(command):
	pass


func set_active(activate):
	active = activate
	for command in get_children():
		command.enabled = active
	if active:
		emit_signal("entered")
	else:
		emit_signal("exited")


func execute(command_name):
	if has_node(command_name):
		get_node(command_name).execute()


func cancel(command_name):
	if has_node(command_name):
		get_node(command_name).cancel()


func set_direction(direction):
	for command in get_children():
		if command.has_method("set_direction"):
			command.set_direction(direction)
