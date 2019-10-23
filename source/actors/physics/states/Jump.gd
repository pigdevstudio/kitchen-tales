extends "res://actors/physics/State.gd"

func _physics_process(delta):
	if transition.is_moving and abs(actor.velocity.x) < 10.0:
		execute("Move")


func _on_command_started(command):
	match command:
		"Move":
			transition.is_moving = true
		"Stop":
			transition.is_moving = false
		"Jump":
			state_machine.change_state_to("SecondJump")
		"Fall":
			state_machine.change_state_to("SingleFall")
		"Dash":
			transition.is_moving = true
			state_machine.change_state_to("JumpDash")


func _on_command_finished(command):
	match command:
		"Jump":
			state_machine.change_state_to("SingleFall")
		"Fall":
			if transition.is_moving:
				state_machine.change_state_to("Walk")
			else:
				state_machine.change_state_to("Idle")
		"Dash":
			state_machine.change_state_to("DashJump")
