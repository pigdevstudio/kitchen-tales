extends Node2D

export (String, FILE, "*.tscn") var next_scene


func go_to_next_scene():
	get_tree().change_scene(next_scene)


func _unhandled_input(event):
	if event.is_echo():
		return
	if not event is InputEventKey:
		return
	if event.unicode == KEY_1 and event.is_pressed():
		go_to_next_scene()
