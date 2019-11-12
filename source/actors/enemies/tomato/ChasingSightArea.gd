extends "res://actors/enemies/carrot/Sight.gd"

signal chase_direction_changed(new_direction)
signal missed

var spotted = false
var target
var chase_direction = Vector2.ZERO

func _ready():
	set_process(false)


func _process(delta):
	chase_direction = (target.global_position - global_position).normalized()
	emit_signal("chase_direction_changed", chase_direction)


func _on_ChasingSightArea_area_exited(area):
	if spotted:
		spotted = false
		set_process(false)
		emit_signal("missed")


func _on_area_shape_entered(area_id, area, area_shape, self_shape):
	if not area.is_in_group(target_group):
		return
	var area_position = area.get_child(area_shape).global_position
	ray.cast_to = ray.to_local(area_position)
	if not ray.is_colliding():
		var direction = global_position.direction_to(area_position)
		target = area
		spotted = true
		set_process(true)
		emit_signal("spotted", direction)
