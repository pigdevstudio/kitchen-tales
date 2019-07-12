extends "res://levels/Spawner.gd"

export (Vector2) var cast_direction = Vector2.RIGHT

func spawn():
	var spawnling = .spawn()
	
	spawnling.fly(cast_direction)
