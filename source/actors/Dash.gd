extends "res://actors/Walk.gd"

signal finished

export (String) var action = "dash"
export (float) var distance = 300.0

var initial_position = Vector2(0, 0)

func _physics_process(delta):
	if kinematic_body2d.is_on_floor():
		if (initial_position.distance_to(kinematic_body2d.position) 
				> distance):
			emit_signal("finished")
