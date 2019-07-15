extends Timer

export (NodePath) var actor_path = ".."
onready var actor = get_node(actor_path)

func start(time_sec = -1):
	actor.set_physics_process(false)
	.start(time_sec)


func stop():
	actor.set_physics_process(true)


func _on_timeout():
	actor.set_physics_process(true)
