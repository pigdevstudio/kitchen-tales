extends Area2D

signal spotted(spot_direction)
onready var ray = $RayCast2D
export(String) var target_group = "player"


func update_sight():
	$CollisionShape2D.disabled = true
	$CollisionShape2D.disabled = false


func _on_area_shape_entered(area_id, area, area_shape, self_shape):
	if not area.is_in_group(target_group):
		return
	var area_position = area.get_child(area_shape).global_position
	ray.cast_to = ray.to_local(area_position)
	if not ray.is_colliding():
		var direction = global_position.direction_to(area_position)
		emit_signal("spotted", direction)
