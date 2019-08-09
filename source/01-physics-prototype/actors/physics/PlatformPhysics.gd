class_name PlatformPhysics
extends Node

export (NodePath) var actor_path = ".."
onready var actor = get_node(actor_path)

export (bool) var enabled = false setget set_enabled

func _ready():
	set_physics_process(enabled)


func apply():
	pass


func stop():
	pass


func set_enabled(enable):
	enabled = enable
	set_physics_process(enabled)
