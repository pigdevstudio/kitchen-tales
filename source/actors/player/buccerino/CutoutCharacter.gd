extends Position2D

signal look_direction_changed(new_direction)
var look_direction = 1 setget set_look_direction

onready var animator = $AnimationPlayer
onready var pivot = $Pivot
onready var remote_transform = $Pivot/Body/ArmLeft/RemoteTransform2D

func set_look_direction(value):
	look_direction = value
	scale.x = abs(scale.x) * look_direction
	emit_signal("look_direction_changed", look_direction)


func play(animation):
	var blend = -1
	if animator.current_animation == "spin":
		blend = 0.0
		if animation == "fall":
			return
	if animator.has_animation(animation):
		animator.play(animation, blend)
