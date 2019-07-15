extends "res://actors/combat/CombatAction.gd"

"""
A set of Attacks that are executed in an indexed order.
---
Notes:
	A combo is designed using the SceneTree, having Attacks as its
	children.
"""

signal increased
signal reset

var _current_attack_index = 0

func _ready():
	connect_hitboxes()
	connect_attacks()


func execute():
	if not enabled:
		return
	
	var attack = get_child(_current_attack_index)
	attack.execute()
	if _current_attack_index == 0:
		emit_signal("started")


func cancel():
	emit_signal("finished")


func increase():
	if _current_attack_index + 1 < get_child_count():
		_current_attack_index += 1
		emit_signal("increased")
	else:
		emit_signal("reset")
		reset()


func reset():
	_current_attack_index = 0


func connect_hitboxes():
	for attack in get_children():
		if not attack.has_node("HitBox"):
			continue
		var hitbox = attack.get_node("HitBox")
		hitbox.connect("landed", self, "increase")
		hitbox.connect("missed", self, "reset")
		attack.connect("started", hitbox, "enable")
		attack.connect("finished", hitbox, "disable")
		if attack.has_node("HitLag"):
			var hitlag = attack.get_node("HitLag")
			hitbox.connect("landed", hitlag, "start")


func connect_attacks():
	for attack in get_children():
		attack.connect("started", self, "set_enabled", [false])
		attack.connect("finished", self, "set_enabled", [true])
		if attack.has_node("HitLag"):
			var hitlag = attack.get_node("HitLag")
#			hitlag.wait_time = attack.duration
			attack.connect("finished", hitlag, "stop")
			
