extends "res://actors/Walk.gd"

signal finished

export (float) var distance = 300.0

var initial_position = Vector2(0, 0)


func _physics_process(delta):
	if plaform_actor.is_on_floor():
		if (initial_position.distance_to(plaform_actor.position) 
				> distance):
			emit_signal("finished")
			set_physics_process(false)


func set_physics_process(enable):
	if enable:
		initial_position = plaform_actor.position
	.set_physics_process(enable)
