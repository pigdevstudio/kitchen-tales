extends PlatformPhysics

export (float) var speed = 400.0
var movement_direction = Vector2.ZERO setget set_movement_direction

func _physics_process(delta):
	move()


func apply():
	if not enabled:
		return
	emit_signal("started")
	set_physics_process(true)


func move():
	if not enabled:
		return
	platform_actor.velocity.x = movement_direction.x * speed


func set_movement_direction(new_direction):
	movement_direction = new_direction


func stop():
	platform_actor.velocity.x = 0.0
	set_physics_process(false)
	emit_signal("finished")
