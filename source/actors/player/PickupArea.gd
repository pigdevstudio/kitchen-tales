extends Area2D

export (Resource) var player_data

func _on_area_entered(pickup):
	var property = pickup.attribute
	var property_value = player_data.get(property)
	player_data.set(property, property_value + pickup.modifier)
	pickup.get_picked()
	
