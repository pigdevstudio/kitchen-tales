extends "res://actors/physics/PlatformCommand.gd"

func execute():
	actor.velocity.x = 0.0
	emit_signal("started")
#	print("%s Stop executed" % get_parent().name) 


func cancel():
	emit_signal("finished")
