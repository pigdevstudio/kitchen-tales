extends Node

"""
Manages and signalize Action input events.
"""

signal pressed
signal held
signal released
signal handling

export (String) var action = ""

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
	else:
		emit_signal("released")


func is_holding():
	var is_holding = false
	if Input.is_action_pressed(action):
		is_holding = true
		emit_signal("handling")
		emit_signal("pressed")
		emit_signal("held")
	return is_holding
