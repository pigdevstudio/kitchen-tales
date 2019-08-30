extends Command

export (NodePath) var default_attack_path
var default setget set_default
var current setget set_current

func _ready():
	for attack in get_children():
		attack.connect("started", self, "_on_attack_started")
		attack.connect("finished", self, "_on_attack_finished")
	set_default(default_attack_path)
	set_current(default_attack_path)


func _on_attack_started():
	emit_signal("started")


func _on_attack_finished():
	emit_signal("finished")


func execute():
	current.execute()
	emit_signal("started")


func cancel():
	current.cancel()
	emit_signal("finished")


func set_default(new_default_path):
	if has_node(new_default_path):
		default_attack_path = new_default_path
		default = get_node(default_attack_path)


func reset_to_default():
	set_current(get_path_to(default))


func set_current(new_attack_path):
	if has_node(new_attack_path):
		current = get_node(new_attack_path)


func set_attack_direction(direction):
	match direction:
		Vector2.UP:
			set_current("AttackUp")
		Vector2.DOWN:
			set_current("AttackDown")
		Vector2.LEFT:
			set_current("AttackLeft")
			set_default("AttackLeft")
		Vector2.RIGHT:
			set_current("AttackRight")
			set_default("AttackRight")
