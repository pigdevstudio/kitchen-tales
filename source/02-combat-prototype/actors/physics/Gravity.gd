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
	if platform_actor.is_on_floor():
		return 
	platform_actor.velocity += (direction * strength) * delta


func set_enabled(enable):
	.set_enabled(enable)
	if not is_inside_tree():
		return
	
	if enable:
		emit_signal("started")
		platform_actor.velocity = Vector2.ZERO
	else:
		emit_signal("finished")
