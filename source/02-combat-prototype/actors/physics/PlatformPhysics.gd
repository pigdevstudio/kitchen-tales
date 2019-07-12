class_name PlatformPhysics
extends Node

signal started
signal finished

export (NodePath) var platform_actor_path = ".."
onready var platform_actor = get_node(platform_actor_path)

export (bool) var enabled = false setget set_enabled

func _ready():
	set_physics_process(false)


func apply(): #virtual method
	pass


func stop(): #virtual method
	pass


func set_enabled(enable):
	enabled = enable
