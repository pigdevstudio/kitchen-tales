extends PlaformPhysics

export (float) var strength = 1200.0
export (Vector2) var direction = Vector2.DOWN

func _physics_process(delta):
	if kinematic_body2d.is_on_floor():
		return
	kinematic_body2d.velocity += (direction * strength) * delta
