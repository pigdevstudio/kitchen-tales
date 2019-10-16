extends Node

export(int) var index = 0 setget set_index
export(float) var weak_vibration_strength = 1.0
export(float) var strong_vibration_strength = 1.0
export(float) var vibration_duration = 1.0

var enabled = true setget set_enabled

func _ready():
	assert(index >= 0.0)
	assert(weak_vibration_strength >= 0.0)
	assert(strong_vibration_strength >= 0.0)
	assert(vibration_duration > 0.0)


func set_index(value):
	index = max(0, value)
	if not is_inside_tree():
		yield(self, "ready")
		set_index(value)
		return
	update_actions_index()


func set_enabled(value):
	enabled = value
	for action_notifier in get_children():
		action_notifier.set_process_unhandled_input(enabled)


func vibrate(weak_strength = weak_vibration_strength,
		strong_strength = strong_vibration_strength, duration = vibration_duration):
	Input.start_joy_vibration(index, weak_strength, strong_strength,
			duration)


func stop_vibrate():
	Input.stop_joy_vibration(index)


func update_actions_index(indexing_character = "_"):
	for action_notifier in get_children():
		if not action_notifier.get("action"):
			continue
		var action = action_notifier.action
		var previous_index = action.to_int()
		if not previous_index == null:
			action_notifier.action = action.replace(previous_index, str(index))
		else:
			action_notifier.action = "%s%s%s" % [action, indexing_character,
					index]
