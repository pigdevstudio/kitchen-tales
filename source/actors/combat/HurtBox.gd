extends Node2D

signal damage_inflicted(amount)
signal hurt()
signal hit_landed(hit)

export(float) var recover_time = 0.25

onready var recover_timer = $RecoverTimer
var is_invincible = false setget set_invincible

func get_hurt(hit):
	if is_invincible:
		return
	if not recover_timer.is_stopped():
		return
	recover_timer.start(recover_time)
	disable()
	emit_signal("hurt")
	emit_signal("damage_inflicted", hit.damage)


func _on_area_shape_entered(area_id, area, area_shape, self_shape):
	var hit = area.hit
	if not is_in_group(hit.team):
		emit_signal("hit_landed", hit)
		get_hurt(hit)


func set_invincible(enable):
	is_invincible = enable


func disable():
	for child in get_children():
		if not child is CollisionShape2D or not child is CollisionPolygon2D:
			continue
		child.disabled = true


func enable():
	for child in get_children():
		if not child is CollisionShape2D or not child is CollisionPolygon2D:
			continue
		child.disabled = false
