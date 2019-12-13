extends Node

"""
Description:
	
"""

onready var animator = $AnimationPlayer

func _ready():
	PlayerData.connect("updated", self, "_on_PlayerData_updated")
	_on_PlayerData_updated()
	_on_Level_wave_finished("Wave 1")


func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		if animator.is_playing():
			return
		if get_tree().paused:
			animator.play("unpause")
		else:
			animator.play("pause")


func _on_PlayerData_updated():
	$ScoreLabel.text = "Score: %s" % PlayerData.score


func pause_tree():
	get_tree().paused = true


func unpause_tree():
	get_tree().paused = false


func reload_current():
	PlayerData.reset()
	if get_tree().paused:
		unpause_tree()
	get_tree().reload_current_scene()


func _on_Level_wave_finished(wave_name):
	$NewWaveLabel.text = wave_name.capitalize()
	$AnimationPlayer.play("wave_started")
