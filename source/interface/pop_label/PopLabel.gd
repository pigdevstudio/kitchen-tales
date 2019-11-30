extends Label

"""
Description:
	A label that pops on the screen then fades away
"""

onready var _tween = $Tween

export (Vector2) var final_scale = Vector2(1.2, 1.2)
export (Vector2) var fading_position_offset = Vector2.ZERO
export (float) var duration_in_seconds = 1.0

func _ready():
	pop()


func pop():
	rect_position -= rect_pivot_offset
	var initial_scale = rect_scale
	_tween.interpolate_property(self, "rect_scale", initial_scale, final_scale,
			duration_in_seconds * 0.5, Tween.TRANS_BACK, Tween.EASE_IN_OUT)
	_tween.start()
	yield(_tween, "tween_completed")
	fade()


func fade():
	var transparent = modulate
	transparent.a = 0.0
	_tween.interpolate_property(self, "modulate",
			modulate, transparent, duration_in_seconds * 0.5, Tween.TRANS_LINEAR,
			Tween.EASE_IN)
	var target_position = rect_position + fading_position_offset
	_tween.interpolate_property(self, "rect_position", rect_position,
			target_position, duration_in_seconds * 0.5, Tween.TRANS_BACK,
			Tween.EASE_IN)
	_tween.start()
	yield(_tween, "tween_completed")
	queue_free()
