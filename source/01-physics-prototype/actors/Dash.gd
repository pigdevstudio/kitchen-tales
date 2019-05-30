extends "res://actors/Walk.gd"

signal started
signal finished

export (float) var distance = 300.0
export (bool) var air_dash = true setget set_air_dash

var initial_position = Vector2(0, 0)
var air_dash_available = true

func apply():
	if not enabled:
		return
	platform_actor.velocity.x = movement_direction.x * speed
	platform_actor.velocity.y = movement_direction.y * speed
		
	check_distance()
	check_walls()


func check_distance():
	if (initial_position.distance_to(platform_actor.position) 
			> distance):
		stop()


func check_walls():
	if platform_actor.is_on_wall():
		stop()


func stop():
	if not platform_actor.is_on_floor():
		air_dash_available = false
	emit_signal("finished")
	set_enabled(false)


func set_enabled(enable):
	if enable:
		if not platform_actor.is_on_floor() and not air_dash:
			return
		if not platform_actor.is_on_floor() and air_dash:
			if not air_dash_available:
				return
		emit_signal("started")
		initial_position = platform_actor.position
	else:
		emit_signal("finished")
	set_physics_process(enable)


func set_air_dash(enable):
	air_dash = enable
	if enable:
		air_dash_available = true
