extends Node2D

export (PackedScene) var spawnling_scene

func spawn():
	var spawnling = spawnling_scene.instance()
	spawnling.set_as_toplevel(true)
	spawnling.global_position = global_position
	add_child(spawnling)
