extends "res://objects/SpaceKinematicBody.gd"

"""
A flying body that fly towards a given speed at a given direction
"""

export (float) var flying_speed = 300.0

func fly(direction):
	if direction.length() > 0:
		velocity = flying_speed * direction
		rotation = direction.angle()


func explode():
	$Shape.disabled = true
	hide()
	queue_free()
