extends Node2D

signal hit_started
signal hit_finished
onready var duration_timer = $Duration
onready var area = $Area2D

enum HitShapes{RIGHT, LEFT, UP, DOWN}
export (float) var hit_duration = 0.1
export (int) var damage = 1

var current_hit_box_index = 0
var last_horizontal_hit = 0

func set_current_hit_box_index(new_hit_box_index):
	new_hit_box_index = new_hit_box_index


func activate_hit_box():
	disable_hit_boxes()
	if current_hit_box_index == -1:
		return
	var current_hit_box = area.get_child(current_hit_box_index)
	current_hit_box.disabled = false
	current_hit_box.visible = true
	duration_timer.start(hit_duration)
	emit_signal("hit_started")


func disable_hit_boxes():
	for shape in area.get_children():
		shape.disabled = true
		shape.visible = false


func set_hit_direction(direction):
	match direction:
		Vector2.RIGHT:
			current_hit_box_index = HitShapes.RIGHT
			last_horizontal_hit = current_hit_box_index
		Vector2.LEFT:
			current_hit_box_index = HitShapes.LEFT
			last_horizontal_hit = current_hit_box_index
		Vector2.DOWN:
			current_hit_box_index = HitShapes.DOWN
		Vector2.UP:
			current_hit_box_index = HitShapes.UP
		Vector2.ZERO:
			if current_hit_box_index == HitShapes.UP or current_hit_box_index == HitShapes.DOWN:
				current_hit_box_index = last_horizontal_hit


func _on_Area2D_area_shape_entered(area_id, area, area_shape, self_shape):
	area.get_parent().get_hurt(damage)


func _on_Duration_timeout():
	emit_signal("hit_finished")
	disable_hit_boxes()
