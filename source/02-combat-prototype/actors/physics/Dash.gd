extends "res://actors/physics/Walk.gd"


func execute():
	if not enabled:
		return
	actor.velocity = movement_direction * speed
	emit_signal("started")


func cancel():
	emit_signal("finished")
