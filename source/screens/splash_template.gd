extends Control

export (String, FILE, "*.tscn") var next_scene

func _ready():
	get_tree().set_pause(false)
	$animator.play("fade")
	
func change_scene(to = next_scene):
	$animator.play_backwards("fade")
	yield($animator, "animation_finished")
	get_tree().change_scene(to)