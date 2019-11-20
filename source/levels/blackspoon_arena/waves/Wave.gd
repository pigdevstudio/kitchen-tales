extends Node

"""
Description:
	Container for enemies, once empty, frees itself
"""

func _ready():
	for child in get_children():
		child.connect("tree_exited", self, "_on_child_tree_exited")


func _on_child_tree_exited():
	if get_child_count() < 1:
		queue_free()
