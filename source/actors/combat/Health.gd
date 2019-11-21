extends Node

signal changed(new_health)
signal died


var _current = max_health setget set_current

export (int) var max_health = 10

func _ready():
	set_current(max_health)


func set_current(new_value):
	_current = max(0, new_value)
	emit_signal("changed", _current)
	is_dead()


func damage(amount):
	set_current(_current - amount)


func heal(amount):
	set_current(_current + amount)


func is_dead():
	if _current == 0:
		emit_signal("died")
	return _current == 0
