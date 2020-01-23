extends Command

signal cooled
signal heated

onready var cooldown_timer = $Cooldown
export (float) var cooldown = 0.1

var _executed = false

func execute():
	if not enabled:
		return
	if not cooldown_timer.is_stopped():
		emit_signal("heated")
		return
	_executed = true
	emit_signal("started")


func cancel():
	if _executed:
		start_cooldown()


func start_cooldown():
	emit_signal("finished")
	cooldown_timer.start(cooldown)
	for child in get_children():
		if child.has_method("disable"):
			child.disable()


func _on_Cooldown_timeout():
	_executed = false
	emit_signal("cooled")
