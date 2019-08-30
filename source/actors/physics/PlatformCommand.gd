extends Command

export (NodePath) var actor_path = ".."
onready var actor = get_node_or_null(actor_path) setget set_actor

func set_actor(new_actor):
	if new_actor.has_method("set_velocity"):
		actor = new_actor
