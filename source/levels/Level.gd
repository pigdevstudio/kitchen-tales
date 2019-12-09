extends Node

func _ready():
	if not BGM.is_playing():
		BGM.play()


func _unhandled_input(event):
	if event.is_action_pressed("reset"):
		PlayerData.reset()
		get_tree().reload_current_scene()
