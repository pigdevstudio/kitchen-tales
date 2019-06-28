extends Position2D

export (PackedScene) var spawnling_scene = preload("res://actors/DummyEnemy.tscn")
export (NodePath) var container_path = ".."

func spawn():
	var spawnling = spawnling_scene.instance()
	spawnling.global_position = global_position
	get_node(container_path).add_child(spawnling)
	return spawnling
