extends Area2D

"""
Description:
	An area that once in contact with an actor's KinematicBody, depletes
	its Health.
"""



func _on_body_entered(body):
	var health = body.find_node("Health")
	
	if health:
		health.set_current(0)
