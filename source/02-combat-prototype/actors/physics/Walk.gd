extends "res://actors/physics/PlatformCommand.gd"

export (float) var speed = 400.0
export (Vector2) var movement_direction = Vector2.ZERO setget set_movement_direction

func _physics_process(delta):
	move()


func execute():
	if not enabled:
		return
	set_physics_process(true)
	emit_signal("started")


func move():
	if not enabled:
		return
	actor.velocity.x = movement_direction.x * speed


func set_movement_direction(new_direction):
	movement_direction = new_direction


func cancel():
	actor.velocity.x = 0.0
	set_physics_process(false)
	emit_signal("finished")
