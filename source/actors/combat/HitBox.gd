extends Area2D

signal started
signal finished
signal landed
signal missed

export (Resource) var hit

var _is_hit_landed = false
var _active = false

func enable():
	_is_hit_landed = false
	emit_signal("started")
	for shape in get_children():
		shape.call_deferred("set_disabled", false)
	_active = true


func disable():
	if not _is_hit_landed:
		emit_signal("missed")
	for shape in get_children():
		shape.call_deferred("set_disabled", true)
	_active = false


func _on_area_entered(area):
	if not area.has_method("get_hurt"):
		return
	if not area.is_in_group(hit.team) and not area.is_invincible:
		emit_signal("landed")
		_is_hit_landed = true
