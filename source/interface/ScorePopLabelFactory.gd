extends Node

"""
Description:
	
"""

export(PackedScene) var pop_label_scene = preload("res://interface/pop_label/PopLabel.tscn")

func _ready():
	get_tree().connect("node_removed", self, "_on_SceneTree_node_removed")


func _on_SceneTree_node_removed(node):
	var score = 0
	var position = Vector2.ZERO
	if node.has_node("Score") and node.has_node("Character"):
		score = node.get_node("Score").value
		position = node.get_node("Character/Pivot/Body").global_position
		create_pop_label(position, str(score))


func create_pop_label(position, text):
	var pop_label_instance = pop_label_scene.instance()
	pop_label_instance.text = text
	pop_label_instance.rect_global_position = position
	find_parent("Interface").add_child(pop_label_instance)
