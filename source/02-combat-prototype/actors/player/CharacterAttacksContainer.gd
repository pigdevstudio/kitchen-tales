extends "res://actors/combat/AttackContainer.gd"

func set_attack_direction(direction):
	for attack in get_children():
		if attack.has_method("set_attack_direction"):
			attack.set_attack_direction(direction)
