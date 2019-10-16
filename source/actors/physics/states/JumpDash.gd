extends "res://actors/physics/State.gd"

func _enter():
	actor.velocity.y = 0.0


func _on_command_started(command):
	match command:
		"Stop":
			get_parent().change_state_to("DashFall")
		"Bump":
			get_parent().change_state_to("DashFall")
		"DistanceStop":
			get_parent().change_state_to("DashFall")
