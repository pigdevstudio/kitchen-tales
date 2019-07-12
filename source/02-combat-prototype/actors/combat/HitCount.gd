extends Node

signal changed(hit_count)

export (float) var reset_duration = 1.0

var _hit_count = 0 setget set_hit_count

func set_hit_count(value):
	_hit_count = value
	emit_signal("changed", _hit_count)


func increase():
	set_hit_count(_hit_count + 1)
	$ResetTimer.start(reset_duration)


func reset():
	set_hit_count(0)
