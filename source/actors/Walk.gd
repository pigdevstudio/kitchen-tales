extends PlaformPhysics

export (float) var speed = 400.0
var movement_direction = 0 setget set_movement_direction

func _physics_process(delta):
	kinematic_body2d.velocity.x = movement_direction * speed


func set_movement_direction(new_direction):
	movement_direction = new_direction


func stop():
	movement_direction = 0
