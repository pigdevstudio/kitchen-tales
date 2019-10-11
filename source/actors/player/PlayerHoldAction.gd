extends "res://actors/player/PlayerAction.gd"

onready var timer = $ThresholdTimer

var held = false

func handle_input(event):
	if event.is_pressed():
		timer.start()
	else:
		timer.stop()
		if held:
			held = false
			emit_signal("released")


func _on_Threshold_timeout():
	held = true
	emit_signal("pressed")
