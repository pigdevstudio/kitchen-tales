extends VBoxContainer

const MAX_ENTRIES = 9
const HIGHSCORE_USER_PATH = "user://highscore_entries.json"

export(PackedScene) var score_entry_scene = preload("res://screens/highscore_screen/HighScoreEntry.tscn")

func _ready():
	load_highscores()
	sort_entries()


func is_new_highscore():
	var lower_score = 0
	if get_child_count() > 0:
		var last_index = get_child_count() -1
		var last_entry = get_child(last_index)
		lower_score = last_entry.get_score()
	return PlayerData.score > lower_score


func add_entry(entry_name, entry_score):
	var new_score_entry = score_entry_scene.instance()
	add_child(new_score_entry)
	new_score_entry.set_entry_name(entry_name)
	new_score_entry.set_score(entry_score)


func remove_remainder():
	var score_entries = get_children()
	score_entries.invert()
	for entry in score_entries:
		if entry.get_index() > MAX_ENTRIES:
			entry.queue_free()
		else:
			break


func sort_entries():
	var score_entries = get_children()
	score_entries.sort_custom(self, "sort_by_score")
	for i in range(score_entries.size()):
		var score_entry = score_entries[i]
		score_entry.get_parent().move_child(score_entry, i)


func sort_by_score(a, b):
	return a.get_score() > b.get_score()


func save_highscores():
	var entries = []
	for entry in get_children():
		var entry_data = {"name": "name", "score": 0}
		entry_data["name"] = entry.get_entry_name()
		entry_data["score"] = entry.get_score()
		entries.append(entry_data)
	entries = to_json(entries)
	
	var file = File.new()
	file.open(HIGHSCORE_USER_PATH, File.WRITE)
	file.store_string(entries)
	file.close()


func load_highscores():
	var file = File.new()
	if not file.file_exists(HIGHSCORE_USER_PATH):
		return
	var entries = []
	file.open(HIGHSCORE_USER_PATH, File.READ)
	entries = parse_json(file.get_as_text())
	for entry in entries:
		add_entry(entry["name"], entry["score"])
