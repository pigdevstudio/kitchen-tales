extends Control

onready var highscore_list = $"Panel/MarginContainer/HighScoreList"
onready var new_highscore_interface = $"NewHighScoreInterface"

func _ready():
	new_highscore_interface.visible = highscore_list.is_new_highscore()


func _on_LineEdit_text_entered(new_text):
	highscore_list.add_entry(new_text, PlayerData.score)
	highscore_list.sort_entries()
	highscore_list.remove_remainder()
	highscore_list.save_highscores()
