extends KinematicBody2D

var velocity = Vector2(0, 0)

func _physics_process(delta):
	translate(velocity * delta)


func stop():
	velocity = Vector2(0, 0)
