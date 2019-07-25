extends Node

"""
Manages and signalize Action input events to a Command
"""

signal pressed
signal released
signal handling

export (String) var action = ""
export (NodePath) var command_path = ""
onready var command = get_node(command_path)

func _ready():
	connect_to_command()


func connect_to_command():
	if not command:
		return
	if command.has_method("execute"):
		connect("pressed", command, "execute")
		connect("released", command, "cancel")
	elif command.has_method("execute"):
		connect("pressed", command, "execute")
		connect("released", command, "stop")


func _unhandled_input(event):
	if not event.is_action_type():
		return
	if event.is_echo():
		return
	if not event.is_action(action):
		return
	handle_input(event)


func handle_input(event):
	emit_signal("handling")
	if event.is_pressed():
		emit_signal("pressed")
		get_tree().set_input_as_handled()
	else:
		emit_signal("released")
		get_tree().set_input_as_handled()


func is_holding():
	if Input.is_action_pressed(action):
		emit_signal("handling")
		emit_signal("pressed")
