extends Node2D

onready var animator = $AnimationPlayer


func _on_LifeTime_timeout():
	animator.play("vanish")
