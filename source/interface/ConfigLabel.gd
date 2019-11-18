extends Label

"""
Description:
	
"""

export(NodePath) var progress_bar_path
onready var progress_bar = get_node(progress_bar_path)

var focus_rect = preload("res://interface/theme/focus_rect.tres")
var empty_rect = preload("res://interface/theme/empty_rect.tres")

var amount = 0

func _ready():
	set_process_input(false)
	set_process(false)


func _process(delta):
	progress_bar.value += (100 * amount) * delta


func _input(event):
	if event.is_echo():
		return
	
	if event.is_action_pressed("ui_right"):
		amount = 1
		set_process(true)
	if event.is_action_released("ui_right"):
		set_process(false)
	if event.is_action("ui_left"):
		set_process(true)
		amount = -1
	if event.is_action_released("ui_left"):
		set_process(false)


func _on_focus_entered():
	set("custom_styles/normal", focus_rect)
	set_process_input(true)


func _on_focus_exited():
	set("custom_styles/normal", empty_rect)
	set_process_input(false)
