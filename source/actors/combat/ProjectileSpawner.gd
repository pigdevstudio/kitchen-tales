extends "res://objects/Spawner.gd"

export (Vector2) var direction = Vector2.RIGHT setget set_direction

func set_direction(new_direction):
	direction = new_direction


func spawn():
	var spawnling = spawnling_scene.instance()
	spawnling.direction.x = direction.x
	spawnling.global_position = global_position
	spawnling.set_as_toplevel(true)
	add_child(spawnling)
