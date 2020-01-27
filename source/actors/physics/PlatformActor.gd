extends KinematicBody2D
class_name PlatformActor

const FLOOR_NORMAL = Vector2.UP
const SNAP_LENGTH = 64

var velocity = Vector2(0, 0) setget set_velocity
var snap_normal = Vector2.DOWN setget set_snap_normal

func _physics_process(delta):
	velocity.y = move_and_slide_with_snap(velocity, snap_normal * SNAP_LENGTH,
			FLOOR_NORMAL, true, 4, deg2rad(46), true).y


func set_snap_normal(new_snap_normal):
	snap_normal = new_snap_normal


func set_velocity(new_velocity):
	velocity = new_velocity
