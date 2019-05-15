extends "res://actors/Walk.gd"

signal started
signal finished

export (float) var distance = 300.0
export (bool) var air_dash = true setget set_air_dash

var initial_position = Vector2(0, 0)

func _physics_process(delta):
	platform_actor.velocity.y = 0
	if (initial_position.distance_to(platform_actor.position) 
			> distance or platform_actor.is_on_wall()):
		emit_signal("finished")
		set_physics_process(false)


func set_physics_process(enable):
	if enable:
		if not platform_actor.is_on_floor() and not air_dash:
			return
		emit_signal("started")
		initial_position = platform_actor.position
	else:
		emit_signal("finished")
	.set_physics_process(enable)


func set_air_dash(enabled):
	air_dash = enabled
