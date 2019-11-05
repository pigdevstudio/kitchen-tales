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
	pressed = is_pressed()
	if pressed:
		emit_signal("pressed")
	else:
		emit_signal("released")


func update_pressed():
	if pressed:
		emit_signal("pressed")
	else:
		emit_signal("released")


func is_pressed():
	var is_pressed = false
	for event in InputMap.get_action_list(action):
		if event is InputEventKey:
			is_pressed = Input.is_key_pressed(event.scancode)
		elif event is InputEventJoypadButton:
			is_pressed = Input.is_joy_button_pressed(event.device, event.button_index)
		elif event is InputEventMouseButton:
			is_pressed = Input.is_mouse_button_pressed(event.button_index)
		elif event is InputEventJoypadMotion:
			is_pressed = Input.get_action_strength(action)
		else:
			continue
		
		if is_pressed:
			break
	return is_pressed
