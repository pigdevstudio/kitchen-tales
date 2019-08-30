extends Resource

signal updated

export (int) var score = 0 setget set_score
export (int) var max_health = 10
var health = max_health setget set_health

func set_score(new_score):
	score = new_score
	emit_signal("updated")


func set_health(new_health):
	health = new_health
	emit_signal("updated")


func save_data():
	ResourceSaver.save("user://save.tres", self, 2)


func load_data():
	var data = load("user://save.tres")
	if not data:
		return
	set_score(data.score)
	set_health(data.health)
