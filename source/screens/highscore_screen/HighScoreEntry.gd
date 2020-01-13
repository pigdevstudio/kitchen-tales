extends HBoxContainer

onready var name_label = $Name
onready var score_label = $Score

func set_score(score):
	score_label.text = str(score)


func get_score():
	return score_label.text.to_int()


func get_entry_name():
	return name_label.text


func set_entry_name(name_text):
	name_label.text = str(name_text)
