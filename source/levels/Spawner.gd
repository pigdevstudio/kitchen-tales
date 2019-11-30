extends Node2D

signal spawned

export(PackedScene) var spawnling_scene
export(String) var container = "."

func spawn():
	var spawnling = spawnling_scene.instance()
	spawnling.set_global_position(global_position)
	find_parent(container).call_deferred("add_child", spawnling)
	emit_signal("spawned")
