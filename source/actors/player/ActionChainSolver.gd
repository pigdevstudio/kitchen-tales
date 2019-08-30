extends Node
"""
Checks for the presence of a special move combination in an ActionChain
"""

signal action_chain_solved

export (Resource) var special_move
onready var special_move_action_chain = special_move.action_chain

func _ready():
	special_move_action_chain = get_action_chain_as_string(special_move_action_chain)
	

func get_action_chain_as_string(action_chain):
	var string = String(action_chain)
	string = get_without_brackets(string)
	return string


func resolve_action_chain(action_chain):
	action_chain = action_chain.duplicate()
	action_chain = get_treated_action_chain(action_chain)
	if special_move_action_chain in action_chain:
		emit_signal("action_chain_solved")


func get_without_brackets(string):
	string = string.trim_prefix("[")
	string = string.trim_suffix("]")
	return string


func get_without_indexing_characters(string):
	var number = string.to_int()
	string = string.replace(str(number), "")
	string = string.trim_suffix("_")
	string = string.trim_suffix("-")
	return string


func get_treated_action_chain(action_chain):
	var treated_action_chain = action_chain
	
	for index in range(0, treated_action_chain.size()):
		var action = treated_action_chain[index]
		action = get_without_indexing_characters(action)
		treated_action_chain[index] = action
	
	return get_action_chain_as_string(treated_action_chain)
