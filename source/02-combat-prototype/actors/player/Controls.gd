extends Node

func enable(action_name = "all"):
	if action_name == "all":
		for action in get_children():
			action.set_process_unhandled_input(true)
	elif has_node(action_name):
		var action = get_node(action_name)
		action.set_process_unhandled_input(true)


func disable(action_name = "all"):
	if action_name == "all":
		for action in get_children():
			action.set_process_unhandled_input(false)
	elif has_node(action_name):
		var action = get_node(action_name)
		action.set_process_unhandled_input(false)
