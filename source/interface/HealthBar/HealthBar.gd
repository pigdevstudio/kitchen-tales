extends ProgressBar

"""
Description:
	A bar that displays the values of a `Health` node
"""

export(NodePath) var health_path
onready var health = get_node(health_path) setget set_health

func _ready():
	set_health(health)


func update_health():
	max_value = health.max_health
	value = health.get_current()


func set_health(new_health):
	health = new_health
	health.connect("changed", self, "_on_Health_changed")
	update_health()


func _on_Health_changed(new_health):
	value = health.current
	max_value = health.max_health
