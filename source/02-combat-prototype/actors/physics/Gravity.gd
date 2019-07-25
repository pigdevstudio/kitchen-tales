extends PlatformPhysics

export (float) var strength = 1200.0
export (Vector2) var direction = Vector2.DOWN

var velocity = Vector2.ZERO

func _physics_process(delta):
	apply()


func apply():
	if not enabled:
		return

	var delta = get_physics_process_delta_time()
	if actor.is_on_floor() or not actor.is_physics_processing():
		return
	actor.velocity += (direction * strength) * delta


func set_enabled(enable):
	.set_enabled(enable)
	set_physics_process(enable)
	if not is_inside_tree():
		return

	if enable:
		emit_signal("started")
		velocity = Vector2.ZERO
		actor.velocity = Vector2.ZERO
	else:
		emit_signal("finished")
