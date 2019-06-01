extends Area2D

func _on_body_entered(body):
	if body.is_in_group("player"):
		get_tree().reload_current_scene()
