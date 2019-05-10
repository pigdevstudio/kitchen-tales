class_name PlatformActor
extends KinematicBody2D

const FLOOR_NORMAL = Vector2(0, -1)

var velocity = Vector2(0, 0)

func _physics_process(delta):
	velocity = move_and_slide(velocity, FLOOR_NORMAL, true)
