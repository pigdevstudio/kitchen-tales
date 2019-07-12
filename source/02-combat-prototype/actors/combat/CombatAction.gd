extends Node
class_name CombatAction

signal started
signal finished

export (bool) var enabled = true setget set_enabled

func set_enabled(enable):
	enabled = enable


func execute():
	pass


func cancel():
	pass

