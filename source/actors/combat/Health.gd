extends Node

signal changed(new_health)
signal died


var current = max_health setget set_current, get_current

export (int) var max_health = 10

func _ready():
	self.current = max_health


func set_current(new_value):
	current = max(0, new_value)
	emit_signal("changed", current)
	is_dead()


func get_current():
	return current


func damage(amount):
	set_current(current - amount)


func heal(amount):
	set_current(current + amount)


func is_dead():
	if current == 0:
		emit_signal("died")
	return current == 0
