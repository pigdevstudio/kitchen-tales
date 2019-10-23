extends Position2D

var look_direction = 1 setget set_look_direction

func set_look_direction(value):
	look_direction = value
	scale.x = abs(scale.x) * look_direction


func play(animation):
	if animation == "walk":
		pass
	var blend = -1
	if $AnimationPlayer.current_animation == "spin":
		blend = 0.0
		if animation == "fall":
			return
	if $AnimationPlayer.has_animation(animation):
		$AnimationPlayer.play(animation, blend)


func _on_AnimationPlayer_animation_started(anim_name):
	if anim_name == "wall":
		$Pivot.scale.x = -1.0
	else:
		$Pivot.scale.x = 1.0
	if not anim_name == "charge":
		$Pivot/Body/ArmLeft/RemoteTransform2D.update_position = true
		$Pivot/Body/ArmLeft/RemoteTransform2D.update_rotation = true
