extends Node2D

signal hurt()

onready var health = get_node(health_path)
export (NodePath) var health_path = "../Health"

func get_hurt(amount):
	health.damage(amount)
	emit_signal("hurt")
