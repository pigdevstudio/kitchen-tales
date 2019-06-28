extends Node

"""
Manages and signalize Action input events
"""

signal dash_released
signal dash_pressed
signal jump_pressed
signal jump_released
signal walk_pressed(direction)
signal walk_released

export (String) var jump = "jump"
export (String) var dash = "dash"
export (String) var walk_left = "left"
export (String) var walk_right = "right"

func _unhandled_input(event):
	if not event.is_action_type():
		return
	if event.is_echo():
		return
	filter_event_action(event)


func filter_event_action(event):
	if event.is_action(jump):
		handle_jump_action(event)
		
	if event.is_action(walk_left) or event.is_action(walk_right):
		handle_walk_action(event)
	
	if event.is_action(dash):
		handle_dash_action(event)


func handle_dash_action(event):
	if event.is_action_pressed(dash):
		emit_signal("dash_pressed")
	elif event.is_action_released(dash):
		emit_signal("dash_released")


func handle_jump_action(event):
	if event.is_action_pressed(jump):
		emit_signal("jump_pressed")
	elif event.is_action_released(jump):
		emit_signal("jump_released")


func handle_walk_action(event):
	var direction = Vector2.ZERO
	if event.is_action_pressed(walk_left):
		direction = Vector2.LEFT
	elif event.is_action_pressed(walk_right):
		direction = Vector2.RIGHT
	elif event.is_action_released(walk_left):
		if not Input.is_action_pressed(walk_right):
			emit_signal("walk_released")
		else:
			direction = Vector2.RIGHT
	elif event.is_action_released(walk_right):
		if not Input.is_action_pressed(walk_left):
			emit_signal("walk_released")
		else:
			direction = Vector2.LEFT
	
	if not direction == Vector2.ZERO:
		emit_signal("walk_pressed", direction)
