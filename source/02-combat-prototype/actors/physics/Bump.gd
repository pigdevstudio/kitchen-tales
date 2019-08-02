extends "res://actors/physics/PlatformCommand.gd"

func _physics_process(delta):
	check_for_wall()


func check_for_wall():
	if actor.is_on_wall():
		execute()


func execute():
	actor.velocity.x = 0.0
	emit_signal("started")
