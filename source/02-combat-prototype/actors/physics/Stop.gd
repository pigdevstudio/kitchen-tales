extends "res://actors/physics/PlatformCommand.gd"

func execute():
	actor.velocity.x = 0.0
	emit_signal("started")


func cancel():
	emit_signal("finished")
