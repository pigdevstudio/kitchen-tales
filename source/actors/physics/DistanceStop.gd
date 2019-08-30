extends "res://actors/physics/Stop.gd"

export (float) var max_distance = 400.0
var initial_position = Vector2(0, 0)

func _physics_process(delta):
	check_distance()


func check_distance():
	if (initial_position.distance_to(actor.position) 
			> max_distance):
		execute()


func set_enabled(enable):
	if is_inside_tree():
		initial_position = actor.position
	.set_enabled(enable)
	