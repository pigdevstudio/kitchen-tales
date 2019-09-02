extends "res://actors/physics/State.gd"

func _on_command_started(command):
	match command:
		"Fall":
			get_parent().change_state_to("DashJumpFall") 


func _on_command_finished(command):
	pass
