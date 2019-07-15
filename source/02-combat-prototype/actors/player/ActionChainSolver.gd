extends Node
"""
Checks for the presence of a special move combination in an ActionChain
"""

signal action_chain_solved

export (Resource) var special_move
onready var special_move_action_chain = special_move.action_chain

func _ready():
	render_special_move()
	

func render_special_move():
	var string = String(special_move_action_chain)
	string = string.trim_prefix("[")
	string = string.trim_suffix("]")
	special_move_action_chain = string


func resolve_action_chain(action_chain):
	action_chain = get_treated_action_chain(action_chain)
	if special_move_action_chain in action_chain:
		emit_signal("action_chain_solved")


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
