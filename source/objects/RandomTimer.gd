extends Timer

"""
Description:
	A Timer that automatically randomizes its `wait_time` between its
	`min_wait_time` and `max_wait_time`
"""

export(float) var min_wait_time = 0.5
export(float) var max_wait_time = 2.0

func _ready():
	if autostart:
		start()


func start(time_sec = -1):
	wait_time = rand_range(min_wait_time, max_wait_time)
	.start(time_sec)
	print(wait_time)


func _on_timeout():
	if not one_shot:
		start()
