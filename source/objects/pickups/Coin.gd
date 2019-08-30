extends "res://objects/pickups/Pickup.gd"

func _on_area_entered(area):
	player_data.score += modifier
	queue_free()
