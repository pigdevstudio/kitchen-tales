extends Node2D

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		$FallDelay.start()
		yield($FallDelay, "timeout")
		$StaticBody2D.set_physics_process(true)
