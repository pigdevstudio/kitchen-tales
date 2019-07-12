extends Node

signal attack_pressed
signal defend_pressed
signal attack_released
signal defend_released
signal direction_changed(direction)

export (String) var attack = "attack"
export (String) var defend = "defend"
export (String) var up = "up"
export (String) var left = "left"
export (String) var right = "right"
export (String) var down = "down"

var _direction = Vector2.ZERO

func _unhandled_input(event):
	if not event.is_action_type():
		return
	if event.is_echo():
		return
	filter_event_action(event)


func filter_event_action(event):
	if event.is_action(attack):
		handle_attack_action(event)
	elif event.is_action(defend):
		handle_defend_action(event)
	elif (event.is_action(up) or event.is_action(down) or
			event.is_action(left) or event.is_action(right)):
		handle_direction_action(event)


func handle_attack_action(event):
	if event.is_pressed():
		emit_signal("attack_pressed")
	else:
		emit_signal("attack_released")
	get_tree().set_input_as_handled()


func handle_defend_action(event):
	if event.is_pressed():
		emit_signal("defend_pressed")
	else:
		emit_signal("defend_released")
	get_tree().set_input_as_handled()


func handle_direction_action(event):
	if event.is_pressed():
		handle_direction_pressed(event)
	else:
		handle_direction_released(event)


func handle_direction_pressed(event):
	if event.is_action(up):
		_direction.y = -1
	elif event.is_action(left):
		_direction.x = -1
	elif event.is_action(right):
		_direction.x = 1
	elif event.is_action(down):
		_direction.y = 1
	emit_signal("direction_changed", _direction)


func handle_direction_released(event):
	if event.is_action(up):
		_direction.y = 0
	elif event.is_action(left):
		_direction.x = 0
	elif event.is_action(right):
		_direction.x = 0
	elif event.is_action(down):
		_direction.y = 0
	emit_signal("direction_changed", _direction)
