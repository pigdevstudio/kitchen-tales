extends Control

func _ready():
	get_node("Level/Buccerino/Health").connect("died", self, "_on_player_died")


func _on_player_died():
	$InterfaceLayer/Interface/AnimationPlayer.play("dead")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade":
		$InterfaceLayer/Interface/AnimationPlayer.play("wave_started")


func _input(event):
	if event.is_action_pressed("restart"):
		PlayerData.reset()
		get_tree().change_scene("res://screens/splash_screen/SplashScreen.tscn")
