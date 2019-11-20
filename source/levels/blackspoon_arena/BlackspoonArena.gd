extends Node2D

"""
Description:
	Spawns waves of enemies
"""

signal wave_started(wave_name)
signal wave_finished(wave_name)
export(PoolStringArray) var waves_scenes

var _current_wave = 0

func spawn_wave():
	var wave= load(waves_scenes[_current_wave]).instance()
	add_child(wave)
	wave.connect("tree_exited", self, "_on_Wave_tree_exited", [wave.name])
	emit_signal("wave_started", wave.name)


func _on_Wave_tree_exited(wave_name):
	emit_signal("wave_started", wave_name)
	_current_wave += 1
	_current_wave = clamp(_current_wave, 0, waves_scenes.size() -1)
	$Timer.start()
