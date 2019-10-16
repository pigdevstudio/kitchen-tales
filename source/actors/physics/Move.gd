extends "res://actors/physics/PlatformCommand.gd"

export (float) var speed = 400.0
export (Vector2) var direction = Vector2.ZERO setget set_direction

func execute():
	if not enabled:
		return
	actor.velocity.x = direction.x * speed
	emit_signal("started")


func set_direction(new_direction):
	if not new_direction == Vector2.ZERO:
		direction = new_direction


func cancel():
	emit_signal("finished")
