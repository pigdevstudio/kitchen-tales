extends ActionNotifier

"""
Description:
	An ActionNotifier that detects and notifies JoySticks' axies data
Notes:
	The pressed signal is emitted at the very moment the strength is
	beyond zero, the released signal is emitted only at the very moment
	the strength comes back to zero, i.e. only if the axis was pressed
	before.
"""

signal strength_changed(strength)
signal value_changed(value)
signal direction_changed(direction)
var strength = 0.0
var value = 0.0
var direction = Vector2.ZERO


func handle(event):
	update_value(event)
	update_strength(event)
	update_direction(event)
	if strength > 0.0:
		if not pressed:
			pressed = true
			emit_signal("pressed")
			get_tree().set_input_as_handled()
	elif pressed:
		pressed = false
		emit_signal("released")
		get_tree().set_input_as_handled()


func update_value(event):
	if not event.has_method("get_axis_value"):
		return
	value = event.axis_value
	emit_signal("value_changed", value)


func update_strength(event):
	strength = event.get_action_strength(action)
	emit_signal("strength_changed", strength)


func update_direction(event):
	if not event.has_method("get_axis"):
		return
	if event.axis == JOY_AXIS_0 or event.axis == JOY_AXIS_2:
		direction.x = event.axis_value
	elif event.axis == JOY_AXIS_1 or event.axis == JOY_AXIS_3:
		direction.y = event.axis_value
	emit_signal("direction_changed", direction)
