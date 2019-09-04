extends Position2D

var look_direction = 1 setget set_look_direction

func set_look_direction(value):
	look_direction = value
	scale.x = abs(scale.x) * look_direction


func play(animation):
	$AnimationPlayer.play(animation)
