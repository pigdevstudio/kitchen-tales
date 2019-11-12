extends Node2D

export (PackedScene) var spawnling_scene

func spawn():
	var spawnling = spawnling_scene.instance()
	spawnling.global_position = global_position
	find_parent("Level").add_child(spawnling)
