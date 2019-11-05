extends Node2D

export(float) var speed = 200.0
export(Vector2) var direction = Vector2.RIGHT

onready var _velocity = speed * direction

func _physics_process(delta):
	move(delta)


func move(delta):
	_velocity = speed * direction
	translate(_velocity * delta)
	rotation = _velocity.angle()
