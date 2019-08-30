extends "res://objects/pickups/Pickup.gd"

func _on_area_entered(area):
	player_data.health += modifier
	queue_free()
