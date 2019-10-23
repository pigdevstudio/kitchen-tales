extends "res://actors/physics/State.gd"

func _physics_process(delta):
	if transition.is_moving and abs(actor.velocity.x) < 10.0:
		execute("Move")


func _on_command_started(command):
	match command:
		"Fall":
			state_machine.change_state_to("SecondFall") 
		"Move":
			transition.is_moving = true
		"Stop":
			transition.is_moving = false


func _on_command_finished(command):
	match command:
		"Fall":
			state_machine.change_state_to("Idle") 
