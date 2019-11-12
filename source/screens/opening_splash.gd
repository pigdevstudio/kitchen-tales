extends "res://screens/splash_template.gd"

export (String) var new_anim

func _on_animator_animation_finished(anim_name):
	if anim_name == "fade":
		$animator.play(new_anim)
		yield($animator, "animation_finished")
		change_scene()
	pass # Replace with function body.
