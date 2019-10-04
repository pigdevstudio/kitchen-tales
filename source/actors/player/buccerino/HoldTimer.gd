extends Timer

signal stopped

func stop():
	emit_signal("stopped")
	.stop()
