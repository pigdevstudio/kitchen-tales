extends "res://actors/Walk.gd"

signal finished

export (float) var distance = 300.0

var initial_position = Vector2(0, 0)

func set_physics_process(enable):
	if enable:
		initial_position = kinematic_body2d.position
	.set_physics_process(enable)


func _physics_process(delta):
	if kinematic_body2d.is_on_floor():
		if (initial_position.distance_to(kinematic_body2d.position) 
				> distance):
			emit_signal("finished")
			set_physics_process(false)
