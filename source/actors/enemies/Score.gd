extends Node

"""
Description:
	A data representation of the monster's value
"""

export(int) var value = 100


func score():
	PlayerData.score += value
