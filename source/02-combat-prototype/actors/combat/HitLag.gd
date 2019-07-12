extends Timer

export (NodePath) var actor_path = ".."
onready var actor = get_node(actor_path)

func _physics_process(delta):
	if not is_stopped():
		lag_actor()


func lag_actor():
	actor.velocity = Vector2.ZERO
