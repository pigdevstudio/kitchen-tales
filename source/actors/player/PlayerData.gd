extends Node

signal updated

export (int) var score = 0 setget set_score

func set_score(new_score):
	score = new_score
	emit_signal("updated")


func reset():
	score = 0
