extends Node

"""
Description:
	
"""

func _ready():
	PlayerData.connect("updated", self, "_on_PlayerData_updated")
	_on_PlayerData_updated()


func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		if get_tree().paused:
			$AnimationPlayer.play("unpause")
		else:
			$AnimationPlayer.play("pause")
			
		
func _on_PlayerData_updated():
	$ScoreLabel.text = "Score: %s" % PlayerData.score


func _on_Level_wave_started(wave_name):
	$NewWaveLabel.text = wave_name.capitalize()
	$AnimationPlayer.play("wave_started")


func pause_tree():
	get_tree().paused = true


func unpause_tree():
	get_tree().paused = false

