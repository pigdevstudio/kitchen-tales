extends Node

"""
Description:
	A button that once pressed changes the current to its `scene`
"""

export (PackedScene) var scene

func change_scene():
	get_tree().change_scene_to(scene)
