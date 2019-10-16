extends Node

signal entered
signal exited

var active = false setget set_active
var is_moving = false

onready var actor = get_parent().actor setget set_actor

func _ready():
	connect_commands()


func _enter():
	pass


func _exit():
	pass


func set_actor(new_actor):
	actor = new_actor
	for command in get_children():
		if not command.has_method("set_actor"):
			continue
		command.set_actor(actor)


func connect_commands():
	for child in get_children():
		if not child.has_method("execute"):
			continue
		child.connect("started", self, "_on_command_started",
				[child.name])
		child.connect("finished", self, "_on_command_finished",
				[child.name])


func _on_command_started(command):
	pass


func _on_command_finished(command):
	pass


func set_active(activate):
	active = activate
	set_physics_process(active)
	set_process(active)
	for command in get_children():
		command.enabled = active
	if active:
		_enter()
		emit_signal("entered")
	else:
		_exit()
		emit_signal("exited")


func execute(command_name):
	if has_node(command_name):
		get_node(command_name).execute()


func cancel(command_name):
	if has_node(command_name):
		get_node(command_name).cancel()


func set_direction(direction):
	for command in get_children():
		if command.has_method("set_direction"):
			command.set_direction(direction)
