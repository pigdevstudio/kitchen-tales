class_name PlatformPhysics
extends Node

export (NodePath) var actor_path = ".."
onready var actor = get_node(actor_path) setget set_actor

export (bool) var enabled = false setget set_enabled

func _ready():
	set_physics_process(enabled)


func apply():
	pass


func stop():
	pass


func set_actor(new_actor):
	if new_actor.has_method("set_velocity"):
		actor = new_actor


func set_enabled(enable):
	enabled = enable
	set_physics_process(enabled)
