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
	if not player_action.get("action"):
		return
	player_action.connect("pressed", $ActionBuffer, "stack_action",
			[player_action.action])


func add_multiplayer_support(player_index = 1):
	for player_action in get_children():
		if player_action.get("action"):
			player_action.action = "%s_%s" % [player_action.action, player_index + 1]


func _on_MovementStateMachine_state_changed(new_state):
	get_node("MoveNotifier").update_pressed()
	get_node("JoyLeftNotifier2").update_pressed()
	get_node("JoyRightNotifier2").update_pressed()
