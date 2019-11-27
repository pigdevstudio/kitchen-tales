extends "res://actors/physics/PlatformCommand.gd"


export (float) var strength = 600.0


func execute():
	if not enabled:
		return
	actor.snap_normal = Vector2.ZERO
	actor.velocity.y = -strength
	emit_signal("started")


func cancel():
	if actor.velocity.y < 0.0:
		actor.velocity.y = 0.0
		emit_signal("finished")
