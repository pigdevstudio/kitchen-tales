extends Node2D

signal spawned
export (PackedScene) var spawnling_scene

func spawn():
	var spawnling = spawnling_scene.instance()
	spawnling.global_position = global_position
	find_parent("Level").call_deferred("add_child", spawnling)
	emit_signal("spawned")
