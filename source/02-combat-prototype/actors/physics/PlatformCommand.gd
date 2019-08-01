extends Command

export (NodePath) var actor_path = ".."
onready var actor = get_node_or_null(actor_path)
