extends Node2D

export (float) var movement_playback_speed = 1.0 setget set_movement_playback_speed
export (Animation) var movement setget set_movement
export (Curve2D) var movement_curve setget set_movement_curve

func set_movement_playback_speed(new_movement_playback_speed):
	if is_inside_tree():
		$AnimationPlayer.playback_speed = new_movement_playback_speed
	else:
		yield(self, "ready")
		set_movement_playback_speed(new_movement_playback_speed)


func set_movement(new_movement_animation):
	movement = new_movement_animation
	if is_inside_tree():
		$AnimationPlayer.add_animation("movement", movement)
		$AnimationPlayer.play("movement")
	else:
		yield(self, "ready")
		set_movement(new_movement_animation)


func set_movement_curve(new_movement_curve):
	movement_curve = new_movement_curve
	if is_inside_tree():
		$Path2D.curve = movement_curve
	else:
		yield(self, "ready")
		set_movement_curve(new_movement_curve)
