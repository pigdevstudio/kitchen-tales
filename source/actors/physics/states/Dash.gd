extends "res://actors/physics/State.gd"

func _enter():
	actor.velocity.y = 0.0


func _on_command_started(command):
	match command:
		"Stop":
			state_machine.change_state_to("Idle")
		"Bump":
			state_machine.change_state_to("Idle")
		"Jump":
			state_machine.change_state_to("DashJump")
		"DistanceStop":
			state_machine.change_state_to("Idle")


func _on_command_finished(command):
	match command:
		"Jump":
			state_machine.change_state_to("DashJumpFall")
		"Dash":
			state_machine.change_state_to("Idle")
			
