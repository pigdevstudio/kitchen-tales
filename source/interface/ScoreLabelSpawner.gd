extends Node2D

"""
Description:
	
"""

export(PackedScene) var label_scene = preload("res://interface/pop_label/PopLabel.tscn")


func spawn():
	var label = label_scene.instance()
	label.rect_global_position = global_position
	label.text = str($Score.value)
	find_parent("Level").add_child(label)
