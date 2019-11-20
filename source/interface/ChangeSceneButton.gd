extends Node

"""
Description:
	A button that once pressed changes the current to its `scene_path`
"""

export(String, FILE, "*.tscn") var scene_path

func change_scene():
	get_tree().change_scene(scene_path)
