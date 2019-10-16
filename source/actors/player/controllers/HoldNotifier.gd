extends ActionNotifier

"""
Description:
	An ActionNotifier that detects when an InputAction was held based
	on a hold_threshold
"""

onready var _threshold_timer = $Timer
export(float) var hold_threshold = 0.5

var held = false

func handle(event):
	pressed = event.pressed
	if pressed:
		_threshold_timer.start(hold_threshold)
	else:
		if held:
			emit_signal("released")
			held = false
		_threshold_timer.stop()


func _on_ThresholdTimer_timeout():
	held = true
	emit_signal("pressed")
