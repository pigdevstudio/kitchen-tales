extends Node

func _ready():
	for action in get_children():
		add_to_buffer(action)


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


func add_to_buffer(player_action):
	if not has_node("ActionBuffer"):
		return
	if not player_action.has_method("handle_input"):
		return
	player_action.connect("pressed", $ActionBuffer, "stack_action",
			[player_action.action])