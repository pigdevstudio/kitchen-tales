extends Node2D

func cast_special_action(special_action_name):
	match special_action_name:
		"fireball_left":
			$"LeftFireballSpawner".spawn()
		"fireball_right":
			$"RightFireballSpawner".spawn()
