extends "res://actors/PlatformPhysics.gd"

export (String) var action_left = "walk_left"
export (String) var action_right = "walk_right"
export (float) var speed = 400.0

func _physics_process(delta):
	var movement_direction = (-int(Input.is_action_pressed(action_left)) 
			+ int(Input.is_action_pressed(action_right)))
	kinematic_body2d.velocity.x = movement_direction * speed
