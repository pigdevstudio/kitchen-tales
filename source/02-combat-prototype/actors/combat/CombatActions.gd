extends Command

export (NodePath) var default = "" setget set_default
onready var _combat_action = get_node(default)
var current setget set_current

func execute():
	_combat_action.execute()


func cancel():
	_combat_action.cancel()
	reset_to_default()


func set_current(new_combat_action_name):
	if has_node(new_combat_action_name):
		_combat_action.cancel()
		disable_all()
		current = new_combat_action_name
		_combat_action = get_node(current)
		enable_current()


func disable_all():
	for combat_action in get_children():
		combat_action.enabled = false


func enable_current():
	_combat_action.enabled = true


func disable_current():
	_combat_action.enabled = false


func set_default(new_default):
	default = new_default


func reset_to_default():
	set_current(default)
