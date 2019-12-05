extends Control

func _ready():
	get_node("Level/Buccerino/Health").connect("died", self, "_on_player_died")


func _on_player_died():
	$InterfaceLayer/Interface/AnimationPlayer.play("dead")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade":
		$Level.spawn_wave()
