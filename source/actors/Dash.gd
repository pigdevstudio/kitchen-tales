extends "res://actors/Walk.gd"

signal started
signal finished

export (float) var distance = 300.0
export (bool) var air_dash = true setget set_air_dash

var initial_position = Vector2(0, 0)

func _physics_process(delta):
	apply()


func apply():
	platform_actor.velocity.x = movement_direction.x * speed
	platform_actor.velocity.y = movement_direction.y * speed
		
	if (initial_position.distance_to(platform_actor.position) 
			> distance or platform_actor.is_on_wall()):
		stop()


func stop():
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
