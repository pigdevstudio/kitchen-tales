extends "res://actors/physics/State.gd"

func _enter():
	actor.velocity = Vector2.ZERO


func _exit():
	state_machine.change_state_to("Idle")
