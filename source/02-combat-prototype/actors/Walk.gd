extends PlaformPhysics

export (float) var speed = 400.0
var movement_direction = Vector2.ZERO setget set_movement_direction

func _physics_process(delta):
	apply()


func apply():
	platform_actor.velocity.x = movement_direction.x * speed


func set_movement_direction(new_direction):
	movement_direction = new_direction


func stop():
	movement_direction = Vector2.ZERO
