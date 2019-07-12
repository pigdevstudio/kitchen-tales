extends Node
class_name SignalConnector

"""
Automatically connects signals from sources to targets, making sure signal
connections happen and are persistent when refactoring
---
Notes:

I had to make this class due to Godot's lack of persistency of signal 
connections when saving branches as scenes or when merging nodes from 
other scenes 
"""

func _ready():
	connect_signals()


func connect_signals(): #virtual method
	pass
