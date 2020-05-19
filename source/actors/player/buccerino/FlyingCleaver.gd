extends Node2D

signal returned
export(float) var speed = 1600.0
var direction = Vector2.RIGHT
var duration = 1.0 setget set_duration
var return_target = Node2D.new()

onready var duration_timer = $Duration
onready var return_timer = $ReturnDuration
onready var velocity = Vector2.ZERO
onready var trail = $Sprite/Trail

func _physics_process(delta):
	if duration_timer.is_stopped():
		direction = global_position.direction_to(return_target.global_position)
	velocity = direction * speed
	translate(velocity * delta)


func set_duration(new_duration):
	if new_duration <= 0.0:
		return
	duration = new_duration
	duration_timer.wait_time = duration
	trail.lifetime = duration_timer.wait_time * 0.5
	duration_timer.start()


func _on_Duration_timeout():
	var return_distance = global_position.distance_to(return_target.global_position)
	return_timer.wait_time = return_distance / speed
	return_timer.start()
	trail.lifetime = return_timer.wait_time * 0.5


func _on_ReturnDuration_timeout():
	emit_signal("returned")
	queue_free()
