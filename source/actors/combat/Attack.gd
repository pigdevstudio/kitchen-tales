extends Command

signal cooled
signal heated

onready var cooldown_timer = $Cooldown
export (float) var cooldown = 0.1

func execute():
	if not enabled:
		return
	if not cooldown_timer.is_stopped():
		emit_signal("heated")
		return
	emit_signal("started")


func cancel():
	for child in get_children():
		if child.has_method("disabled"):
			child.disable()
	start_cooldown()


func start_cooldown():
	emit_signal("finished")
	cooldown_timer.start(cooldown)


func _on_Cooldown_timeout():
	emit_signal("cooled")
