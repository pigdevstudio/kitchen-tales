extends Node
"""
Transits between States preventing multiple States from being
active at the same time
"""
signal state_changed(new_state)

export (NodePath) var actor_path = ".."
onready var actor = get_node(actor_path)

onready var _current_state = get_child(0)
onready var _previous_state = _current_state

func _ready():
	for state in get_children():
		for command in state.get_children():
			command.actor = actor
	initialize_current_state()


func change_state_to(new_state_name):
	var new_state = get_node(new_state_name + "State")
	_previous_state = _current_state
	_current_state = new_state
	initialize_current_state()
	emit_signal("state_changed", new_state_name)


func initialize_current_state():
	_previous_state.active = false
	_current_state.active = true


func execute(command_name):
	_current_state.execute_command(command_name)


func cancel(command_name):
	_current_state.cancel_command(command_name)


func set_movement_direction(direction):
	for state in get_children():
		state.set_movement_direction(direction)
