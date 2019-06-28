extends Node2D

signal hurt()

onready var health = get_node(health_path)
export (NodePath) var health_path = "../Health"

func get_hurt(amount):
	health.damage(amount)
	emit_signal("hurt")


func _on_Area2D_area_shape_entered(area_id, area, area_shape, self_shape):
	if is_in_group(area.get_parent().team):
		return
	get_hurt(area.get_parent().damage)
	area.get_parent().emit_signal("hit")

