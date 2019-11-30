extends Node

"""
Description:
	
"""

func _ready():
	PlayerData.connect("updated", self, "_on_PlayerData_updated")
	_on_PlayerData_updated()


func _on_PlayerData_updated():
	$ScoreLabel.text = "Score: %s" % PlayerData.score
