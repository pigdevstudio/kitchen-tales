extends CombatAction

export (Resource) var weakness_hit

var is_blocking = false

func execute():
	if not enabled:
		return
	is_blocking = true
	emit_signal("started")


func cancel():
	if not enabled:
		return
	is_blocking = false
	emit_signal("finished")


func check_for_weakness(hit):
	if not enabled:
		return
	if not is_blocking:
		return
	if hit == weakness_hit:
		cancel()
