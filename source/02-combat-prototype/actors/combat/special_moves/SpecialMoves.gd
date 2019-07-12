extends Resource

"""
A dictionary with String keys and PoolStringArray values.

Each key represents a special action and its value represents the
combination of actions that build up the special action
---
Notes:
This resource can represent a single character special moves, a weapon
special moves, etc...
"""

export (Dictionary) var moves_list
