extends Control

export (PackedScene) var next_scene

func load_next_scene():
	get_tree().change_scene_to(next_scene)
