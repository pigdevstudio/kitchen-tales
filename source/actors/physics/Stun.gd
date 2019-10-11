extends "res://actors/physics/State.gd"

func _on_command_started(command):
	match command:
		"Stop":
			get_parent().actor.velocity.y = 0.0
