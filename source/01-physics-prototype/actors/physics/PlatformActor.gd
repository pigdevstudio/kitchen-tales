extends KinematicBody2D
class_name PlatformActor

const FLOOR_NORMAL = Vector2.UP

var velocity = Vector2(0, 0) setget set_velocity
var snap_normal = Vector2.DOWN setget set_snap_normal

func _physics_process(delta):
	velocity = move_and_slide_with_snap(velocity, snap_normal * 50,
			FLOOR_NORMAL)
	if is_on_floor():
		velocity.y = 0


func set_snap_normal(new_snap_normal):
	snap_normal = new_snap_normal


func set_velocity(new_velocity):
	velocity = new_velocity
