extends Node
class_name ActionNotifier

"""
Description:
	A Node that notifies when an event matches a given InputAction
"""
  
signal pressed
signal released

export(String) var action
var pressed = false

func _unhandled_input(event):
	if event.is_echo():
		return
	if not event.is_action(action):
		return
	handle(event)


func handle(event):
	pressed = event.is_pressed()
	if pressed:
		emit_signal("pressed")
	else:
		emit_signal("released")
