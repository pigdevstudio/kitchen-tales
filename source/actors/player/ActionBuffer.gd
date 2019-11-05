extends Node

"""
Stores a chain of actions within a timespam
"""

signal actions_chain_changed(action_chain)
signal actions_chain_cleared

onready var solve_timer = $Timer
export (float) var clear_time = 0.5

var _unsolved_action_chain = []

func stack_action(action):
	_unsolved_action_chain.append(action)
	solve_timer.start(clear_time)
	emit_signal("actions_chain_changed", _unsolved_action_chain)


func clear_unsolved_actions():
	_unsolved_action_chain.clear()
	emit_signal("actions_chain_cleared")
