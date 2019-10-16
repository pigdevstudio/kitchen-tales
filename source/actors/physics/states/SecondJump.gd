extends "res://actors/physics/State.gd"

func _physics_process(delta):
	if is_moving and abs(actor.velocity.x) < 10.0:
		execute("Move")


func _on_command_started(command):
	match command:
		"Fall":
			get_parent().change_state_to("SecondFall") 
		"Move":
			is_moving = true
		"Stop":
			is_moving = false


func _on_command_finished(command):
	match command:
		"Fall":
			if is_moving:
				get_parent().change_state_to("Walk")
			else: 
				get_parent().change_state_to("Idle") 
