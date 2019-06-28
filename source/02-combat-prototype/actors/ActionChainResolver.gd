extends Node
"""
Checks for the presence of special moves in an ActionChain
"""

signal action_chain_solved
signal special_action_executed(special_action)

export (Resource) var moves_list_container
onready var moves_list = moves_list_container.moves_list

func _ready():
	render_move_strings(moves_list)
	

func render_move_strings(pool_string_array_dictionary):
	for key in pool_string_array_dictionary:
		var value = pool_string_array_dictionary[key]
		pool_string_array_dictionary[key] = String(value)
		


func resolve_action_chain(action_chain):
	action_chain = get_treated_action_chain(action_chain)
	
	for special_move in moves_list:
		var move = moves_list[special_move]
		move = move.trim_prefix("[")
		move = move.trim_suffix("]")
		if move in action_chain:
			emit_signal("action_chain_solved")
			emit_signal("special_action_executed", special_move)
			break


func get_treated_action_chain(action_chain):
	var treated_action_chain = action_chain
	
	for index in range(0, treated_action_chain.size()):
		var action = treated_action_chain[index]
		var number = action.to_int()
		action = action.replace(str(number), "")
		action = action.trim_suffix("_")
		action = action.trim_suffix("-")
		treated_action_chain[index]  = action
	return String(treated_action_chain)
