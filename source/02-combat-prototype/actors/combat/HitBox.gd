extends Area2D

signal started
signal finished
signal landed
signal missed

enum HitShapes{RIGHT, LEFT, UP, DOWN}
export (Resource) var hit

var current_hit_box_index = 0
var last_horizontal_hit = 0

func set_current_hit_box_index(new_hit_box_index):
	new_hit_box_index = new_hit_box_index


func activate_hit_box():
	disable_hit_boxes()
	if current_hit_box_index == -1:
		return

	var current_hit_box = get_child(current_hit_box_index)
	current_hit_box.disabled = false
	current_hit_box.visible = true
	emit_signal("started")
	if get_overlapping_areas().size() < 1:
		emit_signal("missed")


func disable_hit_boxes():
	for shape in get_children():
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


func _on_area_entered(hurtbox):
	if not hurtbox.is_in_group(hit.team) and not hurtbox.is_invincible:
		emit_signal("landed")
