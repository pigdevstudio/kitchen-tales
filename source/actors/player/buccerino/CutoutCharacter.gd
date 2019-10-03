extends Position2D

var look_direction = 1 setget set_look_direction

func set_look_direction(value):
	look_direction = value
	scale.x = abs(scale.x) * look_direction


func play(animation):
	if $AnimationPlayer.current_animation == "spin":
		if animation == "fall":
			return
	if $AnimationPlayer.has_animation(animation):
		$AnimationPlayer.play(animation)


func _on_AnimationPlayer_animation_started(anim_name):
	if anim_name == "wall":
		$Pivot.scale.x = -1.0
	else:
		$Pivot.scale.x = 1.0
