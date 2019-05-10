extends PlaformPhysics

export (float) var strength = 1200.0
export (Vector2) var direction = Vector2.DOWN

func _physics_process(delta):
	if plaform_actor.is_on_floor():
		return
	plaform_actor.velocity += (direction * strength) * delta
