extends "res://actors/physics/PlatformCommand.gd"

export (float) var speed = 400.0
export (Vector2) var movement_direction = Vector2.ZERO setget set_movement_direction

func execute():
	if not enabled:
		return
	actor.velocity.x = movement_direction.x * speed
	emit_signal("started")


func set_movement_direction(new_direction):
	movement_direction = new_direction


func cancel():
	actor.velocity.x = 0.0
	emit_signal("finished")
