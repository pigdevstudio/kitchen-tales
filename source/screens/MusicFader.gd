extends AudioStreamPlayer

"""
Description:
	An AudioStreamPlayer with the ability of fading between two 
	AudioStreams
"""

export(float) var fade_time = 1.0
export(float, 0.0, 1.0) var fade_floor = 0.1

onready var tween = $Tween


func play(from_position = 0.0):
	.play(from_position)
	
	if tween.is_active():
		return
	var current_volume = volume_db
	tween.interpolate_property(self, "volume_db", linear2db(fade_floor),
			current_volume, fade_time, tween.TRANS_LINEAR,
			tween.EASE_IN)
	tween.start()


func fade_to(audio_stream):
	if tween.is_active():
		return
	var current_volume = volume_db
	tween.interpolate_property(self, "volume_db", current_volume,
			linear2db(fade_floor), fade_time, tween.TRANS_LINEAR,
			tween.EASE_IN)
	tween.start()
	
	yield(tween, "tween_completed")
	stream = audio_stream
	play()
	tween.interpolate_property(self, "volume_db", linear2db(fade_floor),
			current_volume, fade_time, tween.TRANS_LINEAR,
			tween.EASE_IN)
	tween.start()
