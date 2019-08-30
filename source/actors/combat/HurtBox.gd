extends Node2D

signal damage_inflicted(amount)
signal hurt()
signal hit_landed(hit)

var is_invincible = false setget set_invincible

func get_hurt(hit):
	if is_invincible:
		return
	emit_signal("hurt")
	emit_signal("damage_inflicted", hit.damage)


func _on_area_shape_entered(area_id, area, area_shape, self_shape):
	var hit = area.hit
	if not is_in_group(hit.team):
		emit_signal("hit_landed", hit)
		get_hurt(hit)


func set_invincible(enable):
	is_invincible = enable
