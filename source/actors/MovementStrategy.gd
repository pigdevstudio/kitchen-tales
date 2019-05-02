extends Node

onready var walk = get_node("Walk")
onready var dash = get_node("Dash")
onready var current_strategy = walk setget set_current_strategy

func _ready():
	for strategy in get_children():
		strategy.set_physics_process(false)
	current_strategy.set_physics_process(true)


func _unhandled_input(event):
	if event.is_action_pressed(dash.action):
		dash.initial_position = dash.kinematic_body2d.position
		set_current_strategy(dash)
	elif event.is_action_released(dash.action):
		set_current_strategy(walk)


func set_current_strategy(new_strategy):
	current_strategy.set_physics_process(false)
	current_strategy = new_strategy
	current_strategy.set_physics_process(true)


func _on_Dash_finished():
	set_current_strategy(walk)
