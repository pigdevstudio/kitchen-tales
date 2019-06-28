extends Node

"""
Stores a chain of actions with a timespam
"""

signal actions_chain_changed(action_chain)
signal actions_chain_cleared
 
onready var solve_timer = $Timer
export (float) var clear_time = 0.5
export (PoolStringArray) var valid_input_actions

var _unsolved_action_chain = []

func _unhandled_input(event):
	stack_input_event(event)


func stack_input_event(event):
	if not event.is_action_type():
		return
	if event.is_echo():
		return
	if not event.is_pressed():
		return
	
	var action = get_event_action(event)
	if action:
		_unsolved_action_chain.append(action)
		emit_signal("actions_chain_changed", _unsolved_action_chain)
		solve_timer.start(clear_time)


func get_event_action(event):
	var action_name = ""
	for action in InputMap.get_actions():
		if InputMap.action_has_event(action, event):
			if action in valid_input_actions:
				action_name = action
			else:
				continue
	return action_name


func clear_unsolved_actions():
	_unsolved_action_chain.clear()
	emit_signal("actions_chain_cleared")
