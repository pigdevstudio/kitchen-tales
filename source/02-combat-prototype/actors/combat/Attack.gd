extends CombatAction

onready var duration_timer = $Duration
onready var cooldown_timer = $Cooldown

export (float) var duration = 0.1
export (float) var cooldown = 0.1

func execute():
	if not enabled:
		return
	if not cooldown_timer.is_stopped():
		return
	cooldown_timer.start(cooldown)
	duration_timer.start(duration)
	emit_signal("started")


func cancel():
	if not enabled:
		return
	if duration_timer.is_stopped():
		return
	duration_timer.stop()
	emit_signal("finished")


func _on_Duration_timeout():
	if not enabled:
		return
	emit_signal("finished")
