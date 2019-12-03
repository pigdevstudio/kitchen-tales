extends "res://levels/Level.gd"

"""
Description:
	Spawns waves of enemies
"""

signal wave_started(wave_name)
signal wave_finished(wave_name)
export(PoolStringArray) var waves_scenes

var _current_wave = 0
var wave_count = 1
var difficulty = 1

func spawn_wave():
	var wave = load(waves_scenes[_current_wave]).instance()
	emit_signal("wave_started", "Wave %s" % wave_count)
	add_child(wave)
	wave.connect("tree_exited", self, "_on_Wave_tree_exited", [wave.name])
	wave_count += 1
	update_enemies_status()


func _on_Wave_tree_exited(wave_name):
	emit_signal("wave_finished", wave_name)
	increase_difficulty()
	_current_wave += 1
	_current_wave = clamp(_current_wave, 0, waves_scenes.size() -1)
	$Timer.start()


func increase_difficulty():
	difficulty += 1
	difficulty = min(difficulty, 5.0)


func update_enemies_status():
	for score in get_tree().get_nodes_in_group("score"):
		score.value *= difficulty
	for health in get_tree().get_nodes_in_group("health"):
		if health.is_in_group("player"):
			continue
		health.max_health *= difficulty
		health.set_current(health.max_health)
#	for hitbox in get_tree().get_nodes_in_group("hitbox"):
#		if hitbox.is_in_group("player"):
#			continue
#		hitbox.hit.damage *= difficulty
