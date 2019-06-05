extends PlaformPhysics

signal available_jumps_depleted
signal available_jumps_replenished
export (String) var action = "jump"

export (float) var strength = 600.0
export (int) var max_jumps = 2
onready var _available_jumps = max_jumps


func _physics_process(delta):
	if platform_actor.is_on_floor():
		_available_jumps = max_jumps
		platform_actor.snap_normal = Vector2.DOWN
		emit_signal("available_jumps_replenished")
		set_physics_process(false)


func apply():
	if not platform_actor.is_on_floor():
		_available_jumps -= 1
	
	if _available_jumps > 0 or max_jumps == -1:
		platform_actor.velocity.y = -strength
		_available_jumps -= 1
		_available_jumps = clamp(_available_jumps, -1, max_jumps)
		platform_actor.snap_normal = Vector2.ZERO
		set_physics_process(true)
		if _available_jumps < 1 and max_jumps > -1:
			deplete()


func cancel():
	if platform_actor.velocity.y < 0.0:
		platform_actor.velocity.y = 0.0


func deplete():
	_available_jumps = 0
	emit_signal("available_jumps_depleted")
	set_physics_process(true)
