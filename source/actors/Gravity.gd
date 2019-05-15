extends PlaformPhysics

export (float) var strength = 1200.0
export (Vector2) var direction = Vector2.DOWN

func _physics_process(delta):
	if platform_actor.is_on_floor():
		return
	platform_actor.velocity += (direction * strength) * delta
