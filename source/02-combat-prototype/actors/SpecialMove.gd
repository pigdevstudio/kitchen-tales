extends Node

signal special_move_casted(special_move_name)

onready var solve_timer = $Timer
export (Resource) var special_move_data
var _unsolved_actions = []

func _unhandled_input(event):
	if not event.is_action_type():
		return
	if event.is_echo():
		return
	if not event.is_pressed():
		return
	
	var action = get_event_action(event)
	if action:
		_unsolved_actions.append(action)
		solve_timer.start()


func resolve_actions():
	var special_move = ""
	var moves_list = special_move_data.moves_list
	
	for move in moves_list:
		var has_all_action = true
		if moves_list[move] == PoolStringArray(_unsolved_actions):
			special_move = move
			break
		else:
			continue
	_unsolved_actions = []
	
	if special_move:
		emit_signal("special_move_casted", special_move)


func get_event_action(event):
	var action_name = ""
	for action in InputMap.get_actions():
		if InputMap.action_has_event(action, event):
			if "walk" in action or "ui" in action:
				continue
			action_name = action
	
	return action_name
