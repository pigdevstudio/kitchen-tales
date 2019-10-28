extends "res://actors/physics/State.gd"

func _enter():
	execute("Stop")


func _on_command_started(command):
	match command:
		"Stop":
			pass


func _on_command_finished(command):
	pass