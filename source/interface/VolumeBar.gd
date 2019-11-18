extends Range

"""
Description:
	
"""

export(String) var audio_bus = "Master"


func _ready():
	var bus = AudioServer.get_bus_index(audio_bus)
	var volume_db = AudioServer.get_bus_volume_db(bus)
	value = db2linear(volume_db) * 100


func _on_value_changed(value):
	var bus = AudioServer.get_bus_index(audio_bus)
	AudioServer.set_bus_volume_db(bus, linear2db(value * 0.01))
