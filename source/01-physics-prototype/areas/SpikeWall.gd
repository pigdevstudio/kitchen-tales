extends Node2D

func _on_TriggingArea_body_exited(body):
	if body.is_in_group("player"):
		$AnimationPlayer.play("Push")
