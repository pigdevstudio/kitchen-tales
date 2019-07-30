extends Area2D

signal started
signal finished
signal landed
signal missed

export (Resource) var hit

var _is_hit_landed = false
var _active = false

func _ready():
	for shape in get_children():
		shape.disabled = true
		shape.visible = false


func toggle():
	if _active:
		disable()
	else:
		enable()


func enable():
	for shape in get_children():
		shape.disabled = false
		shape.visible = true
	_is_hit_landed = false
	emit_signal("started")
	_active = true


func disable():
	for shape in get_children():
		shape.disabled = true
		shape.visible = false
	if not _is_hit_landed:
		emit_signal("missed")
	_active = false


func _on_area_entered(hurtbox):
	if not hurtbox.is_in_group(hit.team) and not hurtbox.is_invincible:
		emit_signal("landed")
		_is_hit_landed = true
