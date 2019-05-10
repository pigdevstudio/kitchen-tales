extends PlaformPhysics

export (String) var action = "jump"

export (float) var strength = 600.0
export (int) var max_jumps = 2
onready var _available_jumps = max_jumps


func _physics_process(delta):
	if plaform_actor.is_on_floor():
		_available_jumps = max_jumps


func apply():
	if _available_jumps > 0:
		plaform_actor.velocity.y = -strength
		_available_jumps -= 1


func cancel():
	if plaform_actor.velocity.y < 0.0:
		plaform_actor.velocity.y = 0.0
