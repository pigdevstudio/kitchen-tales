extends Command

onready var actor setget set_actor

func set_actor(new_actor):
	if new_actor.has_method("set_velocity"):
		actor = new_actor
