class_name PlaformPhysics
extends Node

onready var platform_actor = get_node(platform_actor_path)

export (bool) var enabled = true setget set_enabled
export (NodePath) var platform_actor_path = ".."


func apply(): #virtual method
	pass

func set_enabled(enable):
	enabled = enable
	set_physics_process(enabled)
