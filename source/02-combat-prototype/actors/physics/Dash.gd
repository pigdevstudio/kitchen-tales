extends "res://actors/physics/Walk.gd"

export (float) var distance = 300.0
export (bool) var air_dash = true setget set_air_dash

var initial_position = Vector2(0, 0)
var air_dash_available = true

func apply():
	if not enabled:
		return
	if not platform_actor.is_on_floor():
		if not air_dash:
			return
		elif not air_dash_available:
			return
	initial_position = platform_actor.position
	set_physics_process(true)
	emit_signal("started")
	
	check_distance()
	check_walls()


func move():
	if not enabled:
		return
	platform_actor.velocity = movement_direction * speed
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
	platform_actor.velocity.x = 0.0
	set_physics_process(false)
	emit_signal("finished")


func set_air_dash(enable):
	air_dash = enable
	if enable:
		air_dash_available = true
