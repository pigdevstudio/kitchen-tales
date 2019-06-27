extends Node2D

func cast_special_action(special_action):
	match special_action:
		"fireball_left":
			$LeftFireBallSpawner.spawn()
		"fireball_right":
			$RightFireBallSpawner.spawn()
