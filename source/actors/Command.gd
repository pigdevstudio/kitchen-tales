extends Node
class_name Command

signal started
signal finished

export (bool) var enabled = true setget set_enabled

func _ready():
	set_physics_process(false)


func set_enabled(enable):
	enabled = enable
	if is_inside_tree():
		set_physics_process(enable)


func execute():
	emit_signal("started")


func cancel():
	emit_signal("finished")
