extends "res://actors/physics/PlatformCommand.gd"

signal available_jumps_depleted
signal available_jumps_replenished

export (float) var strength = 600.0
export (int) var max_jumps = 2
onready var _available_jumps = max_jumps


func _physics_process(delta):
	replenish()


func execute():
	if not enabled:
		return
	if _available_jumps > 0 or max_jumps == -1:
		actor.velocity.y = -strength
		_available_jumps -= 1
		_available_jumps = clamp(_available_jumps, -1, max_jumps)
		actor.snap_normal = Vector2.ZERO
		set_physics_process(true)
		emit_signal("started")
		if _available_jumps < 1 and max_jumps > -1:
			deplete()


func cancel():
	if actor.velocity.y < 0.0:
		actor.velocity.y = 0.0
		emit_signal("finished")


func deplete():
	_available_jumps = 0
	emit_signal("available_jumps_depleted")
	set_physics_process(true)


func replenish():
	if actor.is_on_floor():
		_available_jumps = max_jumps
		actor.snap_normal = Vector2.DOWN
		set_physics_process(false)
		emit_signal("available_jumps_replenished")
