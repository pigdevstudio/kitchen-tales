extends Node

export(NodePath) var actor_path
onready var actor = get_node_or_null(actor_path)

export(NodePath) var receiver_path
onready var receiver = get_node_or_null(receiver_path)

func _ready():
	update_actor(receiver)


func update_actor(actor_dependent):
	if actor_dependent.has_method("set_actor"):
		actor_dependent.set_actor(actor)
	if actor_dependent.get_child_count() > 0:
		for child in actor_dependent.get_children():
			update_actor(child)
