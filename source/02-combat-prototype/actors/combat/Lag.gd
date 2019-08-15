extends Timer

export (NodePath) var actor_path = ".."
onready var actor = get_node(actor_path)

func start(time_sec = -1):
	actor.set_physics_process(false)
	.start(time_sec)


func stop():
	actor.set_physics_process(true)
	.stop()


func _on_timeout():
	if not is_stopped() or one_shot:
		actor.set_physics_process(not actor.is_physics_processing())
