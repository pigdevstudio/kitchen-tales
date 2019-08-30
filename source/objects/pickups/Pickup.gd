extends Node

export (String) var attribute = ""
export (int) var modifier = 0

func get_picked():
	queue_free()
