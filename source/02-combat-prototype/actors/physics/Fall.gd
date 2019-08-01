extends "res://actors/physics/PlatformCommand.gd"

export (float) var FALL_THRESHOLD = 100.0

func _physics_process(delta):
	check_for_fall()


func execute():
	emit_signal("started")


func cancel():
	set_physics_process(false)
	emit_signal("finished")


func check_for_fall():
	if not enabled:
		return
	if actor.is_on_floor():
		cancel()
	elif actor.velocity.y > FALL_THRESHOLD:
		execute()
