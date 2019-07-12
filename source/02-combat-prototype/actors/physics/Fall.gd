extends PlatformPhysics

export (float) var FALL_THRESHOLD = 100.0

func _physics_process(delta):
	check_for_fall()


func apply():
	emit_signal("started")


func stop():
	emit_signal("finished")


func check_for_fall():
	if not enabled:
		return
	if platform_actor.is_on_floor():
		stop()
	elif platform_actor.velocity.y > FALL_THRESHOLD:
		apply()
	